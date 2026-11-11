
SMODS.Joker{ --Whatll be, fellas?
    key = "whatllbefellas",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Whatll be, fellas?',
        ['text'] = {
            [1] = 'When Blind selected, {C:green}#1# in #2#{} chance to create {C:attention}Mustard{}',
            [2] = 'Otherwise, create {C:attention}Ketchup{}',
            [3] = '{C:inactive,s:0.8}\"Mustard... or KETCHUP?!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_mustard"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_mustard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["c_sauce_ketchup"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_ketchup\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_whatllbefellas') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b1185004', 1, card.ability.extra.odds, 'j_sauce_whatllbefellas', false) then
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'condiment', edition = 'e_negative', key = 'c_sauce_mustard2'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'condiment', key = 'c_sauce_ketchup2'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            end
        end
    end
}