
SMODS.Joker{ --Doctor Robotnik
    key = "doctorrobotnik",
    config = {
        extra = {
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Doctor Robotnik',
        ['text'] = {
            [1] = 'Creates a {C:planet}Perishable {}Moto Bug when {C:attention}Blind {}selected.',
            [2] = '{C:green}#1# in #2#{} chance to create {C:attention}Metal Sonic{} when {C:attention}Boss {}Blind defeated',
            [3] = 'All cards scored become {C:attention}Steel{}',
            [4] = '{C:inactive,s:0.8}\"Get a load of this!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 8
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_motobug"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_motobug\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_steel"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_doctorrobotnik') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("egg_make")
                    
                    return true
                end,
            }))
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_motobug' })
                            if joker_card then
                                
                                joker_card:add_sticker('perishable', true)
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fd3eb8f2', 1, card.ability.extra.odds, 'j_sauce_doctorrobotnik', false) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("egg_make")
                            
                            return true
                        end,
                    }))
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_metal_sonic' })
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
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    scored_card:set_ability(G.P_CENTERS.m_steel)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("egg_sell")
                    
                    return true
                end,
            }))
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("egg_buy")
                    
                    return true
                end,
            }))
        end
    end
}