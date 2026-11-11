
SMODS.Joker{ --Fatal Error
    key = "fatalerror",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Fatal Error',
        ['text'] = {
            [1] = 'If hand {C:attention}contains {}a Red Suit,',
            [2] = 'make a {C:attention}Keyboard Shortcut{}',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive,s:0.8}\"YOUR CODE IS MINE!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Fatal{}{s:0.8}verse{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 33
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    soul_pos = {
        x = 5,
        y = 33
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'keyboard_shortcut', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            end
        end
    end
}