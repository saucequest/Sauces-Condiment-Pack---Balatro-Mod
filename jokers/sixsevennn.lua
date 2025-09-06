SMODS.Joker{ --six sevennn!
    key = "sixsevennn",
    config = {
        extra = {
            chips = 67
        }
    },
    loc_txt = {
        ['name'] = 'six sevennn!',
        ['text'] = {
            [1] = 'If played hand contains a 6 and a 7, give {C:blue}+67{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 11
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
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 6 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 7 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                return {
                    chips = card.ability.extra.chips,
                    message = "Six sevennn!"
                }
            end
        end
    end
}