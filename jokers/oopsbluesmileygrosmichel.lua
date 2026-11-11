
SMODS.Joker{ --Oops! Blue Smiley Gros Michel
    key = "oopsbluesmileygrosmichel",
    config = {
        extra = {
            chips0 = 2,
            mult0 = 15,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Oops! Blue Smiley Gros Michel',
        ['text'] = {
            [1] = 'Scored {C:attention}face{} cards give {C:red}+15{} Mult and {C:blue}+2{} Chips',
            [2] = '{C:green}#1# in #2#{} chance this is {C:red}destroyed{} at the end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'j_sauce_oopsbluesmileygrosmichel') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    chips = 2,
                    extra = {
                        mult = 15
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_543a7e24', 2, card.ability.extra.odds, 'j_sauce_oopsbluesmileygrosmichel', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}