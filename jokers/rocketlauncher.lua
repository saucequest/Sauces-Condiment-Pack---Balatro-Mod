SMODS.Joker{ --Rocket Launcher
    key = "rocketlauncher",
    config = {
        extra = {
            missilesleft = 1,
            Xmult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Rocket Launcher',
        ['text'] = {
            [1] = '{X:mult,C:white}X2.5{} Mult on next hand',
            [2] = 'Does not give Mult at all for the run after the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.missilesleft or 0) == 1 then
                card.ability.extra.missilesleft = 0
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}