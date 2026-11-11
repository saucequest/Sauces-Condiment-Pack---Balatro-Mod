
SMODS.Joker{ --Orby
    key = "orby",
    config = {
        extra = {
            countdowntodoom = 0,
            repetitions = 999,
            repetitions2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Orby',
        ['text'] = {
            [1] = 'For every Boss defeated, increase {C:dark_edition}???{}',
            [2] = 'After 8 Bosses have been defeated,',
            [3] = 'cauS{C:inactive}D*&df89sD89d*(SDkf{}{C:red}sd)(Ss0*&#$)_dkSD)(3ksd)(&){}',
            [4] = '{C:inactive,s:0.7}this isn\'t food...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9999999999999,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_food"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.countdowntodoom}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.countdowntodoom = (card.ability.extra.countdowntodoom) + 1
                    return true
                end
            }
        end
        if context.starting_shop  then
            if to_big((card.ability.extra.countdowntodoom or 0)) == to_big(8) then
                return {
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
                    end
                    ,
                    func = function()
                        for i = 1, 999 do
                            SMODS.calculate_effect({func = function()
                                local destructable_jokers = {}
                                for i, joker in ipairs(G.jokers.cards) do
                                    if joker ~= card and not joker.getting_sliced then
                                        table.insert(destructable_jokers, joker)
                                    end
                                end
                                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                                
                                if target_joker then
                                    if target_joker.ability.eternal then
                                        target_joker.ability.eternal = nil
                                    end
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
                        for i = 1, 5 do
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_unnatural' })
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
                        return true
                    end
                }
            end
        end
    end
}