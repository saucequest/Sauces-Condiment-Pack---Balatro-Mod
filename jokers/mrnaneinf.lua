
SMODS.Joker{ --mr naneinf
    key = "mrnaneinf",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'mr naneinf',
        ['text'] = {
            [1] = 'Sets you to {C:attention}Ante {}39',
            [2] = '{C:inactive,s:0.7}(Get it? Because that\'s where the Blind Requirements{}',
            [3] = '{C:inactive,s:0.7}overflow to naneinf? Nevermind.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 1.5
            }
        end
    end
}