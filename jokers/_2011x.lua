SMODS.Joker{ --2011X
    name = "2011X",
    key = "_2011x",
    config = {
        extra = {
            sonicexemult = 1
        }
    },
    loc_txt = {
        ['name'] = '2011X',
        ['text'] = {
            [1] = 'Starts out with {X:red,C:white}X1{} Mult',
            [2] = 'Discarded cards each add {C:red}0.4{} Mult to 2011X\'s {X:mult,C:white}XMult{}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive}\"THINKING OUTSIDE THE BOX, ARE WE?\"{}',
            [5] = '{C:inactive}Originates from{} {C:hearts}SONIC 2011{}'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.sonicexemult}}
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.sonicexemult = (card.ability.extra.sonicexemult) + 0.4
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.sonicexemult
                }
        end
    end
}