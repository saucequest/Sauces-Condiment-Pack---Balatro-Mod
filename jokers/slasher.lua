SMODS.Joker{ --Slasher
    key = "slasher",
    config = {
        extra = {
            xchips = 1.5,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Slasher',
        ['text'] = {
            [1] = '{X:chips,C:white}x1.5 {} Chips',
            [2] = '{C:money}-$3{} every time you discard a hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
        if context.pre_discard  then
                return {
                    dollars = -card.ability.extra.dollars
                }
        end
    end
}