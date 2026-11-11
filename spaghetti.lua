
SMODS.Joker{ --Spaghetti
    key = "spaghetti",
    config = {
        extra = {
            tomatosauce = 0,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Spaghetti',
        ['text'] = {
            [1] = 'Scored {C:red}Red {}Suit cards have a {C:green}#2# in #3#{} chance to',
            [2] = 'gain a random {C:attention}Seal{}',
            [3] = 'After 25 {C:red}Red {}Suits have been scored, {C:red}self-destruct{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_food"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_spaghetti') 
        return {vars = {card.ability.extra.tomatosauce, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                card.ability.extra.tomatosauce = (card.ability.extra.tomatosauce) + 1
                if SMODS.pseudorandom_probability(card, 'group_0_cf7b4cbc', 1, card.ability.extra.odds, 'j_sauce_spaghetti', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                            if random_seal then
                                scored_card:set_seal(random_seal, true)
                            end
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif to_big((card.ability.extra.tomatosauce or 0)) == to_big(25) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Consumed!", colour = G.C.RED})
                end
            end
        end
    end
}