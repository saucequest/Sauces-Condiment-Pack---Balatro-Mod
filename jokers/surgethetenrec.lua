SMODS.Joker{ --Surge the Tenrec
    key = "surgethetenrec",
    config = {
        extra = {
            xchips = 1.4
        }
    },
    loc_txt = {
        ['name'] = 'Surge the Tenrec',
        ['text'] = {
            [1] = 'First and last card in hand will be given the {C:enhanced}Electric {}enhancement.',
            [2] = '{X:chips,C:white}x1.4{} Chips',
            [3] = 'All cards discarded will be {C:hearts}destroyed{}',
            [4] = '{C:inactive}\"We\'re taking over whether you like it or not!\"{}',
            [5] = '{C:inactive}Originates from {}{C:spectral}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 4
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_electric)
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card == context.scoring_hand[1] then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_electric)
                return {
                    message = "Card Modified!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
        if context.discard  then
                return {
                    remove = true,
                  message = "Destroyed!"
                }
        end
    end
}