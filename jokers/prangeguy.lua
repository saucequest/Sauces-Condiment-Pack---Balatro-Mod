SMODS.Joker{ --Prange Guy
    key = "prangeguy",
    config = {
        extra = {
            mult = 10
        }
    },
    loc_txt = {
        ['name'] = 'Prange Guy',
        ['text'] = {
            [1] = 'Diet Colas give {C:red}+10{} Mult',
            [2] = '{C:inactive}“Definitely in the thick of that right now.”{}',
            [3] = '{C:inactive}Originates from{} {C:tarot}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 9
    },

    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
        return context.other_joker.config.center.key == "j_dietcola"
    end)() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}