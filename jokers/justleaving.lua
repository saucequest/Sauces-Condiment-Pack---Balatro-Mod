
SMODS.Joker{ --Just Leaving
    key = "justleaving",
    config = {
        extra = {
            basediscardsperround = 0,
            discards0 = 1,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Just Leaving',
        ['text'] = {
            [1] = 'If{C:attention} no discards{} were used in {C:attention}Blind {}when',
            [2] = 'Blind ends, subtract a {C:attention}discard {}and',
            [3] = 'give {C:attention}The Fool{}',
            [4] = 'Once you have no discards, {C:red}self-destruct{}',
            [5] = 'and have a {C:green}1 in 3{} chance of spawning a',
            [6] = '{C:dark_edition}Negative{} {C:purple}Eternal {}{C:attention}Cursed {}Joker',
            [7] = '{C:inactive}(Requires room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 45
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_justleaving') 
        return {vars = {(G.GAME.round_resets.discards or 0), new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.current_round.discards_left) == to_big(G.GAME.round_resets.discards) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Discards", colour = G.C.RED})
                        
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                        ease_discard(-1)
                        
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'Tarot', key = 'c_fool'})                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                            end
                            return true
                        end,
                        colour = G.C.PURPLE
                    }
                }
            elseif to_big(G.GAME.round_resets.discards) == to_big(0) then
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
                        if SMODS.pseudorandom_probability(card, 'group_0_49b9956b', 1, card.ability.extra.odds, 'j_sauce_justleaving', false) then
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = false
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    created_joker = true
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                                            if joker_card then
                                                joker_card:set_edition("e_negative", true)
                                                joker_card:add_sticker('eternal', true)
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
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}