
SMODS.Consumable {
    key = 'bananapeel',
    set = 'item',
    pos = { x = 3, y = 0 },
    config = { 
        extra = {
            odds = 3,
            discard_size0 = 2   
        } 
    },
    loc_txt = {
        name = 'Banana Peel',
        text = {
            [1] = '{C:green}#1# in #2#{} chance for {C:attention}+2{} Discard size',
            [2] = 'Destroys a random {C:attention}Joker{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce_bananapeel')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        local jokers_to_destroy = {}
        local deletable_jokers = {}
        
        for _, joker in pairs(G.jokers.cards) do
            if joker.ability.set == 'Joker' and not SMODS.is_eternal(joker, card) then
                deletable_jokers[#deletable_jokers + 1] = joker
            end
        end
        
        if #deletable_jokers > 0 then
            local temp_jokers = {}
            for _, joker in ipairs(deletable_jokers) do 
                temp_jokers[#temp_jokers + 1] = joker 
            end
            
            pseudoshuffle(temp_jokers, 98765)
            
            for i = 1, math.min(1, #temp_jokers) do
                jokers_to_destroy[#jokers_to_destroy + 1] = temp_jokers[i]
            end
        end
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for _, joker in pairs(jokers_to_destroy) do
                    joker:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
                return true
            end
        }))
        delay(0.6)
        if SMODS.pseudorandom_probability(card, 'group_0_b7d10ed5', 1, card.ability.extra.odds, 'j_sauce_bananapeel', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Discard Size", colour = G.C.BLUE})
                    
                    SMODS.change_discard_limit(2)
                    return true
                end
            }))
            delay(0.6)
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}