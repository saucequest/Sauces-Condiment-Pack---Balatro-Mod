
SMODS.Joker{ --The Roaring Knight
    key = "theroaringknight",
    config = {
        extra = {
            fountains = 0,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Roaring Knight',
        ['text'] = {
            [1] = 'When {C:attention}Boss{} is defeated, {C:red}destroy{}',
            [2] = 'a random {C:attention}Joker{} and add {C:dark_edition}Negative{}',
            [3] = 'cards equal to the Joker\'s{C:attention} sell value{}',
            [4] = '{C:inactive,s:0.8}\"Suddenly, the north wind blew fiercely.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}DELTARUNE{}',
            [6] = '{C:inactive,s:0.8}Texture by AbelSketch{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 29
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 29
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.fountains}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if true then
                return {
                    func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                table.insert(destructable_jokers, joker)
                            end
                        end
                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                        
                        if target_joker then
                            local joker_sell_value = target_joker.sell_cost or 0
                            local sell_value_gain = joker_sell_value * 1
                            card.ability.extra.fountains = card.ability.extra.fountains + sell_value_gain
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                    ,
                    func = function()
                        for i = 1, card.ability.extra.repetitions do
                            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                            local base_card = create_playing_card({
                                front = card_front,
                                center = G.P_CENTERS.c_base
                            }, G.discard, true, false, nil, true)
                            
                            
                            base_card:set_edition("e_negative", true)
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    base_card:start_materialize()
                                    G.play:emplace(base_card)
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                                        return true
                                    end
                                }))
                                draw_card(G.play, G.deck, 90, 'up')
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                        end
                        return true
                    end
                }
            end
        end
        if context.starting_shop  then
            return {
                func = function()
                    card.ability.extra.fountains = 0
                    return true
                end
            }
        end
    end
}