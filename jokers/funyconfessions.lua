
SMODS.Joker{ --FunyConfessions
    key = "funyconfessions",
    config = {
        extra = {
            odds = 3,
            odds2 = 4,
            odds3 = 14,
            odds4 = 21,
            odds5 = 60,
            mult0 = 5,
            chips0 = 30,
            xmult0 = 1.3,
            xchips0 = 1.5,
            emult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'FunyConfessions',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for {C:red}+5{} Mult',
            [2] = '{C:green}#3# in #4#{} chance for {C:blue}+30{} Chips',
            [3] = '{C:green}#5# in #6#{} chance for {X:red,C:white}x1.3{} Mult',
            [4] = '{C:green}#7# in #8#{} chance for {X:blue,C:white}x1.5{} Chips',
            [5] = '{C:green}#9# in #10#{} chance for{C:dark_edition} ^3{} Mult',
            [6] = '{C:inactive,s:0.8}\"confess your crimes today! (for me to post them)\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Comic Studio{}',
            [8] = '{C:dark_edition,s:0.8}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_funyconfessions')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_funyconfessions')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_funyconfessions')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_funyconfessions')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_sauce_funyconfessions')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5ee12eb7', 1, card.ability.extra.odds, 'j_sauce_funyconfessions', false) then
                    SMODS.calculate_effect({mult = 5}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_3dcd2d47', 1, card.ability.extra.odds2, 'j_sauce_funyconfessions', false) then
                    SMODS.calculate_effect({chips = 30}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_cf34ec67', 1, card.ability.extra.odds3, 'j_sauce_funyconfessions', false) then
                    SMODS.calculate_effect({Xmult = 1.3}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_f5ab6ef6', 1, card.ability.extra.odds4, 'j_sauce_funyconfessions', false) then
                    SMODS.calculate_effect({x_chips = 1.5}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_4_363f98f8', 1, card.ability.extra.odds5, 'j_sauce_funyconfessions', false) then
                    SMODS.calculate_effect({e_mult = 3}, card)
                end
            end
        end
    end
}