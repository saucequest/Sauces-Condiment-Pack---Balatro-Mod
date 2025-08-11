SMODS.Joker{ --Pace and The Shadow
    key = "paceandtheshadow",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pace and The Shadow',
        ['text'] = {
            [1] = 'All cards played become {C:dark_edition}Negative{}',
            [2] = 'Discarding cards will give a {C:attention}Glass{} version of the card',
            [3] = '{C:inactive}\"I\'m really scared right now!\"{}',
            [4] = '{C:inactive}Originates from{} {C:spades}The Pace Collection{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
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
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_edition("e_negative", true)
                return {
                    message = "Card Modified!"
                }
        end
        if context.discard  then
                return {
                    func = function()
                context.other_card:set_ability(G.P_CENTERS.m_glass)
                    end,
                    message = "Card Modified!"
                }
        end
    end
}