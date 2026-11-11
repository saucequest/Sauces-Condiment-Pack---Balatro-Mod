
SMODS.Joker{ --WD Wario
    key = "wdwario",
    config = {
        extra = {
            rounds = 0,
            repetitions = 9999
        }
    },
    loc_txt = {
        ['name'] = 'WD Wario',
        ['text'] = {
            [1] = 'Create a {C:attention}Food {}Joker when Blind selected',
            [2] = '{C:inactive}(Requires room){}',
            [3] = 'In {C:attention}3 rounds{}, something... will {C:red}happen{}.',
            [4] = '{C:inactive,s:0.8}\"OH MY GOD! WAAAAH-\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Wario dies in the bombing{}{C:money,s:0.8} of Hiroshima while eating spicy curry.mp3{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 27
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'sauce_food' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.rounds or 0)) == to_big(3) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_wario")
                        
                        return true
                    end,
                }))
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "OH MY GOD! WAAAAH-", colour = G.C.RED})
                        end
                        return true
                    end
                    ,
                    func = function()
                        for i = 1, 9999 do
                            SMODS.calculate_effect({func = function()
                                local destructable_jokers = {}
                                for i, joker in ipairs(G.jokers.cards) do
                                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                        table.insert(destructable_jokers, joker)
                                    end
                                end
                                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                                
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
            else
                return {
                    func = function()
                        card.ability.extra.rounds = (card.ability.extra.rounds) + 1
                        return true
                    end
                }
            end
        end
    end
}