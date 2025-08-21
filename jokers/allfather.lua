SMODS.Joker{ --All-Father
    key = "allfather",
    config = {
        extra = {
            Xmult = 1.6,
            Xmult2 = 1.6
        }
    },
    loc_txt = {
        ['name'] = 'All-Father',
        ['text'] = {
            [1] = '{C:red}EXE{} Jokers give {X:red,C:white}1.6x{}',
            [2] = '{C:inactive}\"For now I am truly. GOD.\"{}',
            [3] = '{C:inactive}Originates from {}{C:red}SonicSavesRobloxia{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.other_joker  then
            if ((function()
    return context.other_joker.config.center.rarity == undefined
end)() or (function()
    return context.other_joker.config.center.rarity == undefined
end)() and (function()
    return context.other_joker.config.center.rarity == undefined
end)()) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif ((function()
        return context.other_joker.config.center.key == "j_sauce_elpendriveazul"
    end)() or (function()
        return context.other_joker.config.center.key == "j_sauce_2011x"
    end)() and (function()
        return context.other_joker.config.center.key == "j_sauce_end"
    end)() and (function()
        return context.other_joker.config.center.key == "j_sauce_indigo"
    end)() and (function()
        return context.other_joker.config.center.key == "j_sauce_niku"
    end)() and (function()
        return context.other_joker.config.center.key == "j_sauce_paceandtheshadow"
    end)()) then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    end
}