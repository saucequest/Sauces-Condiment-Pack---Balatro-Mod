
SMODS.Joker{ --Jiro Awasaka
    key = "jiroawasaka",
    config = {
        extra = {
            xmult0 = 2,
            xmult = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Jiro Awasaka',
        ['text'] = {
            [1] = 'If hand score is below 55% of',
            [2] = 'the Blind {C:attention}Requirement{},',
            [3] = 'give {X:red,C:white}X2{} Mult',
            [4] = 'If hand score is above 55% of',
            [5] = 'the Blind {C:attention}Requirement{},',
            [6] = 'give {X:red,C:white}X0.5{} Mult',
            [7] = '{C:inactive,s:0.8}\"Until the day I die... I will trample on the weak!\"{}',
            [8] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 50
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(0.55) then
                return {
                    Xmult = 2
                }
            elseif to_big(G.GAME.chips / G.GAME.blind.chips) > to_big(0.55) then
                return {
                    Xmult = 0.5
                }
            end
        end
    end
}