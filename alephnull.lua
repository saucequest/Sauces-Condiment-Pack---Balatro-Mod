
SMODS.Joker{ --Aleph-Null
    key = "alephnull",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Aleph-Null',
        ['text'] = {
            [1] = '{X:mult,C:white}XN0{} Mult',
            [2] = '{C:inactive,s:0.7}Surely if it\'s a number I don\'t know, it has to be good right?{}',
            [3] = '{C:inactive,s:0.6}......Right?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 1.5
            }
        end
    end
}