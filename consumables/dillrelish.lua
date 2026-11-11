
SMODS.Consumable {
    key = 'dillrelish',
    set = 'condiment',
    pos = { x = 6, y = 0 },
    config = { 
        extra = {
            odds = 7   
        } 
    },
    loc_txt = {
        name = 'Dill Relish',
        text = {
            [1] = '{C:green}#1# in #2#{} chance for {C:attention}+1{} Joker',
            [2] = 'slot'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce_dillrelish')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_dafa34ea', 1, card.ability.extra.odds, 'j_sauce_dillrelish', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
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