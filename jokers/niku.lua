
SMODS.Joker{ --NIKU
    key = "niku",
    config = {
        extra = {
            crowsofmoribund = 0
        }
    },
    loc_txt = {
        ['name'] = 'NIKU',
        ['text'] = {
            [1] = 'Prevents death {C:attention}three {}times.',
            [2] = 'Makes 2 {C:dark_edition}{}{C:tarot}Eternal {}Crows whenever {C:attention}preventing{} death.',
            [3] = 'On {C:attention}third {}prevention, creates an {C:attention}Ultimate Chimera{}',
            [4] = 'and {C:red}destroys {}itself',
            [5] = '{C:inactive,s:0.8}\"one life, just one life is enough for me.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:rare,s:0.8}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_crow"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_crow\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_sauce_ultimatechimera"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_ultimatechimera\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.crowsofmoribund}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if to_big((card.ability.extra.crowsofmoribund or 0)) < to_big(2) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                            card.ability.extra.crowsofmoribund = (card.ability.extra.crowsofmoribund) + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_crow' })
                                        if joker_card then
                                            
                                            
                                        end
                                        
                                        return true
                                    end
                                }))
                                
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                            end,
                            colour = G.C.BLUE,
                            extra = {
                                func = function()
                                    
                                    local created_joker = true
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_crow' })
                                            if joker_card then
                                                
                                                
                                            end
                                            
                                            return true
                                        end
                                    }))
                                    
                                    if created_joker then
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                    end
                                    return true
                                end,
                                colour = G.C.BLUE
                            }
                        }
                    }
                }
            elseif to_big((card.ability.extra.crowsofmoribund or 0)) == to_big(2) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_ultimatechimera' })
                                    if joker_card then
                                        
                                        
                                    end
                                    
                                    return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
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
                            end,
                            colour = G.C.RED
                        }
                    }
                }
            end
        end
    end
}