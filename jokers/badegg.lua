
SMODS.Joker{ --Bad EGG
    key = "badegg",
    config = {
        extra = {
            sell_value0_min = NaN,
            sell_value0_max = 10,
            odds = 7
        }
    },
    loc_txt = {
        ['name'] = 'Bad EGG',
        ['text'] = {
            [1] = 'All Jokers gain {C:money}$3-$10{} of {C:attention}sell value{} at end of round',
            [2] = '{C:green}1 in 7{} chance to make an {C:attention}Eternal {}{C:attention}Cursed {}Joker and',
            [3] = '{C:red}self-destruct{} instead',
            [4] = '{C:inactive,s:0.8}\"It looks like this EGG will take a long time to hatch.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Pokemon{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_badegg') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                return {
                    func = function()
                        for i, target_card in ipairs(G.jokers.cards) do
                            if target_card.set_cost then
                                target_card.ability.extra_value = (card.ability.extra_value or 0) + pseudorandom('RANGE:3|10', 3, 10)
                                target_card:set_cost()
                            end
                        end
                        return true
                    end,
                    message = "All Jokers +"..tostring(pseudorandom('RANGE:3|10', 3, 10)).." Sell Value"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3f917780', 1, card.ability.extra.odds, 'j_sauce_badegg', false) then
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                                        if joker_card then
                                            
                                            joker_card:add_sticker('eternal', true)
                                        end
                                        
                                        return true
                                    end
                                }))
                                
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                            end}, card)
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
                        return true
                    end
                }
            end
        end
    end
}