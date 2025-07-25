SMODS.Joker{ --Surge the Tenrec
    name = "Surge the Tenrec",
    key = "surgethetenrec",
    config = {
        extra = {
            xchips = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Surge the Tenrec',
        ['text'] = {
            [1] = 'All cards played will be turned into {C:money}Mult{} Cards',
            [2] = '{X:chips,C:white}x1.4{} Chips',
            [3] = 'All cards discarded will be {C:hearts}destroyed{}'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                context.other_card:set_ability(G.P_CENTERS.m_mult)
                return {
                    message = "Card Modified!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
        if context.discard and not context.blueprint then
                return {
                    remove = true,
                  message = "Destroyed!"
                }
        end
    end
}