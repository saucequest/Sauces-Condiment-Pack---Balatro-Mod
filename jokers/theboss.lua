
SMODS.Joker{ --The Boss
    key = "theboss",
    config = {
        extra = {
            xmult0 = 0.5,
            xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'The Boss',
        ['text'] = {
            [1] = 'Held {C:attention}Red {}suit cards give {X:mult,C:white}X1.5{} Mult',
            [2] = 'Scored {C:attention}Red {}suit cards give {X:mult,C:white}X0.5{} Mult',
            [3] = '{C:inactive,s:0.8}\"I didn\'t design THIS!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Just Shapes{} {C:blue,s:0.8}and Beats{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 25
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                return {
                    Xmult = 0.5
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                return {
                    Xmult = 1.5
                }
            end
        end
    end
}