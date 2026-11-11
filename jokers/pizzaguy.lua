
SMODS.Joker{ --Pizza Guy
    key = "pizzaguy",
    config = {
        extra = {
            odds = 10,
            odds2 = 10,
            odds3 = 10,
            odds4 = 10,
            odds5 = 10,
            odds6 = 10,
            odds7 = 10,
            odds8 = 10,
            odds9 = 10,
            odds10 = 10,
            odds11 = 10,
            odds12 = 10,
            odds13 = 10,
            odds14 = 10,
            odds15 = 10,
            odds16 = 10,
            odds17 = 10,
            odds18 = 10,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pizza Guy',
        ['text'] = {
            [1] = 'When Boss is {C:attention}defeated{}, {C:green}#1# in #2#{} chance to destroy',
            [2] = 'a Cursed Joker if one\'s {C:attention}owned {}and give a {C:attention}Soul{}',
            [3] = '{C:inactive,s:0.8}(the Joker, not the vanilla consumable.){}',
            [4] = 'Whenever chance {C:attention}succeeds{}, subtract {C:attention}denominator {}by {C:green}2{}',
            [5] = '{C:inactive,s:0.8}\"The legend is born.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Pizza{} {C:red,s:0.8}Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_soul"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_soul\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_pizzaguy')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_pizzaguy')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_pizzaguy')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_pizzaguy')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_sauce_pizzaguy')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_sauce_pizzaguy')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_sauce_pizzaguy')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_sauce_pizzaguy')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds9, 'j_sauce_pizzaguy')
        local new_numerator10, new_denominator10 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds10, 'j_sauce_pizzaguy')
        local new_numerator11, new_denominator11 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds11, 'j_sauce_pizzaguy')
        local new_numerator12, new_denominator12 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds12, 'j_sauce_pizzaguy')
        local new_numerator13, new_denominator13 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds13, 'j_sauce_pizzaguy')
        local new_numerator14, new_denominator14 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds14, 'j_sauce_pizzaguy')
        local new_numerator15, new_denominator15 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds15, 'j_sauce_pizzaguy')
        local new_numerator16, new_denominator16 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds16, 'j_sauce_pizzaguy')
        local new_numerator17, new_denominator17 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds17, 'j_sauce_pizzaguy')
        local new_numerator18, new_denominator18 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds18, 'j_sauce_pizzaguy')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9, new_numerator10, new_denominator10, new_numerator11, new_denominator11, new_numerator12, new_denominator12, new_numerator13, new_denominator13, new_numerator14, new_denominator14, new_numerator15, new_denominator15, new_numerator16, new_denominator16, new_numerator17, new_denominator17, new_numerator18, new_denominator18}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_cryingjoker" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_3056cbd4', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_cryingjoker" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_disappearingact" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_b5d3bcfd', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_disappearingact" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_crow" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_7109cbfb', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_crow" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_ultimatechimera" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_87dcb8f7', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_ultimatechimera" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_davidbaszucki" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_75ba8b04', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_davidbaszucki" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_alephnull" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_5be9b2c2', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_alephnull" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_mafioso" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_bd63b731', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_mafioso" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_mrnaneinf" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_6f545bd5', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_mrnaneinf" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_jax" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_f3d62d1d', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_jax" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_rewriteprime" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_53b164fe', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_rewriteprime" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_springtrap" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_8bbb65d8', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_springtrap" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_chud" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_5de222ae', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_chud" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_kookoo" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_1210b57b', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_kookoo" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_litany" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_052dd631', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_litany" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_ohungi" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_a2a02496', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_ohungi" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_papershredder" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_aa5cbfab', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_papershredder" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_asgoredreemurr" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_9f1ec8de', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_asgoredreemurr" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_mr" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_37b1ccf7', 1, card.ability.extra.odds, 'j_sauce_pizzaguy', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_sauce_mr" and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
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
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_soul' })
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
        if context.pseudorandom_result  then
            if context.result then
                return {
                    func = function()
                        card.ability.extra.denominator = math.max(0, (card.ability.extra.denominator) - 2)
                        return true
                    end
                }
            end
        end
    end
}