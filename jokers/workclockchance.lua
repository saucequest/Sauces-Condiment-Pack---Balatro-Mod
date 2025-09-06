SMODS.Joker{ --Workclock Chance
    key = "workclockchance",
    config = {
        extra = {
            currentweekday = 0,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Workclock Chance',
        ['text'] = {
            [1] = 'If day playing is on a weekend, {C:green}1 in 2{} chance for {X:mult,C:white}X2{} Mult',
            [2] = '{C:inactive}\"Snazzy!\"{}',
            [3] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 13
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (7 == os.date("*t", os.time()).wday or 1 == os.date("*t", os.time()).wday) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}