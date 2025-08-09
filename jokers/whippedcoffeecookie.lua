SMODS.Joker{ --Whipped Coffee Cookie
    key = "whippedcoffeecookie",
    config = {
        extra = {
            dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Whipped Coffee Cookie',
        ['text'] = {
            [1] = 'Prevents death, but sets your money to {C:money}$0{} when preventing',
            [2] = 'When a Blind is defeated, adds a random card to deck',
            [3] = '{C:inactive}\"Should I check my notifications?\"{}',
            [4] = '{C:inactive}Originates from{} {C:gold}Comic Studio{}'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 4
    },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    saved = true,
                    message = "Comic Studio crashed, but we brought it back up!",
                    extra = {
                        func = function()
                    local target_amount = card.ability.extra.dollars
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars), colour = G.C.MONEY})
                    return true
                end,
                        colour = G.C.MONEY,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
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
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Should I check my notifications?"
                }
        end
    end
}