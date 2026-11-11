
SMODS.Joker{ --Average Vanilla+ JokerForge Joker
    key = "average_vanilla_jokerforge_joker",
    config = {
        extra = {
            chips0 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Average Vanilla+ JokerForge Joker',
        ['text'] = {
            [1] = 'when hand play give {C:blue}+0.1{} Chip so useful!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 0.1
            }
        end
    end
}