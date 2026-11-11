
SMODS.Joker{ --RandomClover
    key = "randomclover",
    config = {
        extra = {
            odds = 2,
            odds2 = 20,
            odds3 = 50,
            mult0 = 4.56,
            xmult0 = 4.2,
            emult0 = 4.2
        }
    },
    loc_txt = {
        ['name'] = 'RandomClover',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for {C:red}+4.56{} Mult',
            [2] = '{C:green}#3# in #4#{} chance for {X:red,C:white}X4.2{} Mult',
            [3] = '{C:green}#5# in #6#{} chance for {C:dark_edition}^4.2{} Mult',
            [4] = '',
            [5] = '',
            [6] = '{C:inactive,s:0.8}\"I have no idea what to put here now so take this clover.\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:gold,s:0.8}Comic Studio{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_randomclover')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_randomclover')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_randomclover')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_09e2f477', 1, card.ability.extra.odds, 'j_sauce_randomclover', false) then
                    SMODS.calculate_effect({mult = 4.56}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_7d575c29', 1, card.ability.extra.odds2, 'j_sauce_randomclover', false) then
                    SMODS.calculate_effect({Xmult = 4.2}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_a692e19a', 1, card.ability.extra.odds3, 'j_sauce_randomclover', false) then
                    SMODS.calculate_effect({e_mult = 4.2}, card)
                end
            end
        end
    end
}