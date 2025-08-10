SMODS.Joker{ --Guest 666
    key = "guest666",
    config = {
        extra = {
            guesttransform = 6,
            Xmult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Guest 666',
        ['text'] = {
            [1] = '{C:red}+6{} Mult when bought',
            [2] = 'Gains {C:red}6 more{} Mult whenever a Card is destroyed',
            [3] = 'Becomes {X:red,C:white}X6{} Mult when they reach {C:red}+66{} Mult',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [5] = '{C:inactive}\"Your worst nightmare.\"{}',
            [6] = '{C:inactive}Originates from{} {X:red,C:white}ObliviousHD{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.guesttransform}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.guesttransform or 0) < 66 then
                return {
                    mult = card.ability.extra.guesttransform
                }
            elseif (card.ability.extra.guesttransform or 0) >= 66 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.remove_playing_cards  then
                return {
                    func = function()
                    card.ability.extra.guesttransform = (card.ability.extra.guesttransform) + 6
                    return true
                end
                }
        end
    end
}