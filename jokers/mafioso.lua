SMODS.Joker{ --Mafioso
    key = "mafioso",
    config = {
        extra = {
            Xmult = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Mafioso',
        ['text'] = {
            [1] = 'If in debt, give {X:mult,C:white}X0.5{} Mult',
            [2] = '{C:inactive}\"I didn\'t really expect to find one of our targets here.\"{}',
            [3] = '{C:inactive}Originates from{} {C:planet}Dream Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
            if G.GAME.dollars < to_big(0) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}