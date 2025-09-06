SMODS.Joker{ --mr naneinf
    key = "mrnaneinf",
    config = {
        extra = {
            Xmult = 0
        }
    },
    loc_txt = {
        ['name'] = 'mr naneinf',
        ['text'] = {
            [1] = 'Sets you to Ante 39',
            [2] = '{C:inactive,s:0.7}(Get it? Because that\'s where the Blind Requirements{}',
            [3] = '{C:inactive,s:0.7}overflow to naneinf? Nevermind.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}