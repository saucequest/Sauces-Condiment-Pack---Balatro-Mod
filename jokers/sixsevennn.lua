
SMODS.Joker{ --six sevennn!
    key = "sixsevennn",
    config = {
        extra = {
            chips0 = 67
        }
    },
    loc_txt = {
        ['name'] = 'six sevennn!',
        ['text'] = {
            [1] = 'If {C:attention}played {}hand contains a {C:attention}6 {}and a {C:attention}7{}, give {C:blue}+67{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 22
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 6 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    chips = 67,
                    message = "Six sevennn!"
                }
            end
        end
    end
}