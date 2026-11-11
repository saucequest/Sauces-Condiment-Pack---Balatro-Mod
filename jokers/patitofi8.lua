
SMODS.Joker{ --patitofi8
    key = "patitofi8",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'patitofi8',
        ['text'] = {
            [1] = 'When {C:attention}sold{}, give a random {C:attention}Roblox {}Joker',
            [2] = '{C:green}#1# in #2#{} chance to {C:attention}flip {}and {C:attention}shuffle {}Jokers instead',
            [3] = '{C:inactive,s:0.8}https://www.roblox.com/users/3054175372/profile{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 19
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 5,
        y = 19
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_patitofi8') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_bd895151', 1, card.ability.extra.odds, 'j_sauce_patitofi8', false) then
                    if #G.jokers.cards > 0 then
                        for _, joker in ipairs(G.jokers.cards) do
                            joker:flip()
                        end
                    end
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Flip!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                end
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'sauce_roblox' })
                                if joker_card then
                                    
                                    
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
        end
    end
}