SMODS.Joker{ --Sonic the Hedgehog
    key = "sonicthehedgehog",
    config = {
        extra = {
            sonicpeelout = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sonic the Hedgehog',
        ['text'] = {
            [1] = 'Changes all cards played in the first hand of the round',
            [2] = 'into {C:enhanced}Electric {}Enhanced cards.',
            [3] = '{C:inactive}\"What you see is what you get! Just a guy that loves adventure!\"{}',
            [4] = '{C:inactive}Originates from{} {C:spectral}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 4
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if G.GAME.current_round.hands_played == 0 then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_electric)
                return {
                    message = "Gotta go fast!"
                }
            end
        end
    end
}