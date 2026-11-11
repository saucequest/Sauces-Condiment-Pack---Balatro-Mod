
SMODS.Joker{ --Gangle
    key = "gangle",
    config = {
        extra = {
            sadorhappy = 0,
            sadcardsplayed = 0,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Gangle',
        ['text'] = {
            [1] = 'Turns all cards scored into {C:attention}Glass{}',
            [2] = 'When {C:attention}Glass{} card destroys itself, turn {C:attention}sad{}.',
            [3] = 'When sad, turns the {C:attention}next 7{} scored cards into {C:attention}Drenched{}',
            [4] = 'After those {C:attention}7 {}cards have been {C:attention}scored{}, become {C:attention}happy {}again',
            [5] = 'When a {C:attention}condiment {}is used, {C:green}#3# in #4#{} chance to become Manager Gangle',
            [6] = '{C:inactive,s:0.8}\"WE NEED TO FIND THE TOMMY GUN!\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:diamonds,s:0.8}TADC{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_gangle') 
        return {vars = {card.ability.extra.sadorhappy, card.ability.extra.sadcardsplayed, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.sadorhappy or 0)) == to_big(0) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_glass)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif to_big((card.ability.extra.sadorhappy or 0)) == to_big(1) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_drenched)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.sadcardsplayed = (card.ability.extra.sadcardsplayed) + 1
            end
        end
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if SMODS.get_enhancements(removed_card)["m_glass"] == true then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.sadorhappy = 1
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.sadcardsplayed or 0)) >= to_big(7) then
                card.ability.extra.sadorhappy = 1
            end
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'condiment' or context.consumeable.ability.set == 'condiment') then
                if SMODS.pseudorandom_probability(card, 'group_0_704ddcf6', 1, card.ability.extra.odds, 'j_sauce_gangle', false) then
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_managergangle' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}