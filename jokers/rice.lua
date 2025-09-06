SMODS.Joker{ --Rice
    key = "rice",
    config = {
        extra = {
            mult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Rice',
        ['text'] = {
            [1] = 'All cards scored give {C:red}+3{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 10
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
    soul_pos = {
        x = 6,
        y = 10
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}