
SMODS.Joker{ --Rice
    key = "rice",
    config = {
        extra = {
            mult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Rice',
        ['text'] = {
            [1] = 'All cards scored give {C:red}+3{} Mult',
            [2] = '{C:inactive}art by marisa / eggmari{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                mult = 3
            }
        end
    end
}