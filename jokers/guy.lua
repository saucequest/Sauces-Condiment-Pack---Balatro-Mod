
SMODS.Joker{ --a generic generic platformer GUY Remix
    key = "guy",
    config = {
        extra = {
            odds = 8
        }
    },
    loc_txt = {
        ['name'] = 'a generic generic platformer GUY Remix',
        ['text'] = {
            [1] = 'Replaces a random {C:attention}Joker {}with a {C:tarot}Tarot{} when',
            [2] = '{C:attention}Shop {}exited',
            [3] = '{C:green}#1# in #2#{} chance to create a {C:attention}Negative {} {C:spectral}Spectral{} as well',
            [4] = '{C:inactive,s:0.8}\"GUY\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_guy') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                return {
                    func = function()
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
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'Tarot', })                            
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
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_84a4e49f', 1, card.ability.extra.odds, 'j_sauce_guy', false) then
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
                                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
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