
SMODS.Joker{ --KJ
    key = "kj",
    config = {
        extra = {
            xmult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'KJ',
        ['text'] = {
            [1] = 'If hand is exactly {C:attention}three Red Suit{} 2s,',
            [2] = 'give {X:mult,C:white}X10{} Mult then {C:red}destroy {}scored cards',
            [3] = '{C:inactive,s:0.8}\"Because with this... IT\'S OVER!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}KJ{} {s:0.8}VS {}{C:inactive,s:0.8}Stealth{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count == 3
            end)() and to_big(#context.scoring_hand) == to_big(3) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                return {
                    Xmult = 10
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (to_big(#context.scoring_hand) == to_big(3) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}