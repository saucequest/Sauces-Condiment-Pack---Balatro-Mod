
SMODS.Joker{ --Soul
    key = "soul",
    config = {
        extra = {
            hands0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Soul',
        ['text'] = {
            [1] = '{C:attention}+2{} Hands when bought',
            [2] = 'Prevents a loss',
            [3] = '{C:red}self-destructs{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
                    ease_hands_played(2)
                    
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over and context.main_eval  then
            return {
                saved = true,
                message = localize('k_saved_ex'),
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
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
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}