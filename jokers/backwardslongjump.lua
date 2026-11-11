
SMODS.Joker{ --Backwards Long Jump
    key = "backwardslongjump",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Backwards Long Jump',
        ['text'] = {
            [1] = '{C:attention}Level up{} Straight if played {C:attention}Straight{}',
            [2] = 'is a {C:attention}Wheel{} Straight',
            [3] = '{C:inactive}(Contains an Ace and 2){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 41
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
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
            if (next(context.poker_hands["Straight"]) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count == 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                local target_hand = (context.scoring_name or "High Card")
                level_up_hand(card, target_hand, true, 1)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}