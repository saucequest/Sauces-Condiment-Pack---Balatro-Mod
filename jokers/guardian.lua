
SMODS.Joker{ --Guardian
    key = "guardian",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Guardian',
        ['text'] = {
            [1] = 'When hand {C:attention}finishes{} scoring',
            [2] = 'add 3 {C:attention}Ace{} of {C:hearts}Hearts{} to deck',
            [3] = 'Scored Aces of {C:hearts}Hearts{} will be {C:red}destroyed{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}NU{}{C:tarot,s:0.8}LL{}{C:dark_edition,s:0.8}SC{}{C:red,s:0.8}APE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 37
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_gracescape"] = true },
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            local suit_prefix = 'H'
            local rank_suffix = 'A'
            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            local suit_prefix = 'H'
            local rank_suffix = pseudorandom_element({'2','3','4','5','6','7','8','9','10','J','Q','K','A'}, "random_rank")
            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            local suit_prefix = 'H'
            local rank_suffix = 'A'
            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                end,
                message = "Added Card!",
                extra = {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end,
                    message = "Added Card!",
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                                    return true
                                end
                            }))
                            draw_card(G.play, G.deck, 90, 'up')
                            SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                        end,
                        message = "Added Card!",
                        colour = G.C.GREEN
                    }
                }
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Hearts")) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}