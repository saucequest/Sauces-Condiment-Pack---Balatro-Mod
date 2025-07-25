SMODS.Joker{ --RandomClover
    name = "RandomClover",
    key = "randomclover",
    config = {
        extra = {
            odds = 2,
            odds2 = 20,
            odds3 = 50,
            mult = 4.56,
            Xmult = 4.2,
            emult = 4.2
        }
    },
    loc_txt = {
        ['name'] = 'RandomClover',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance for {C:red}+4.56{} Mult',
            [2] = '{C:green}1 in 20{} chance for {X:red,C:white}X4.2{} Mult',
            [3] = '{C:green}1 in 50{} chance for {C:dark_edition}^4.2{} Mult',
            [4] = '',
            [5] = '',
            [6] = '{C:inactive}\"I have no idea what to put here now so take this clover.\"{}',
            [7] = '{C:inactive}Originates from{} {C:gold}Comic Studio{}'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 8,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_09e2f477', 1, card.ability.extra.odds, 'group_0_09e2f477') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_7d575c29', 1, card.ability.extra.odds2, 'group_1_7d575c29') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_a692e19a', 1, card.ability.extra.odds3, 'group_2_a692e19a') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                  end
            end
        end
    end
}