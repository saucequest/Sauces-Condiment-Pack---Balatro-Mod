SMODS.Joker{ --Rice
    name = "Rice",
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
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 2
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}