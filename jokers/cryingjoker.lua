SMODS.Joker{ --Crying Joker
    key = "cryingjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Crying Joker',
        ['text'] = {
            [1] = 'All cards scored will be given {C:attention}Drenched in Tears{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_drenchedintears)
                return {
                    message = "Card Modified!"
                }
        end
    end
}