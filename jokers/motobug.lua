SMODS.Joker{ --Moto Bug
    key = "motobug",
    config = {
        extra = {
            chips = 20
        }
    },
    loc_txt = {
        ['name'] = 'Moto Bug',
        ['text'] = {
            [1] = 'Cards scored each give {C:blue}+20{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 6
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}