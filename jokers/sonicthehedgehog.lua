SMODS.Joker{ --Sonic the Hedgehog
    key = "sonicthehedgehog",
    config = {
        extra = {
            sonicpeelout = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sonic the Hedgehog',
        ['text'] = {
            [1] = 'When first hand played, adds 5 random {C:enhanced}Electric {}Enhanced cards to deck.',
            [2] = '{C:inactive}\"What you see is what you get! Just a guy that loves adventure!\"{}',
            [3] = '{C:inactive}Originates from{} {C:spectral}Sonic the Hedgehog{}'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 4
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
                }, G.discard, true, false, nil, true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local new_card = copy_card(base_card, nil, nil, G.playing_card)
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(new_card)
                table.insert(G.playing_cards, new_card)
                
                base_card:remove()
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        new_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card!",
                    extra = {
                        message = "Added Card!",
                        colour = G.C.GREEN,
                        extra = {
                            message = "Added Card!",
                            colour = G.C.GREEN,
                        extra = {
                            message = "Added Card!",
                            colour = G.C.GREEN,
                        extra = {
                            message = "Added Card!",
                            colour = G.C.GREEN
                        }
                        }
                        }
                        }
                }
            end
        end
    end
}