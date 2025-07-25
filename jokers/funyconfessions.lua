SMODS.Joker{ --FunyConfessions
    name = "FunyConfessions",
    key = "funyconfessions",
    config = {
        extra = {
            odds = 3,
            odds2 = 4,
            odds3 = 14,
            odds4 = 21,
            odds5 = 60,
            mult = 5,
            chips = 30,
            Xmult = 1.3,
            xchips = 1.5,
            emult = 3
        }
    },
    loc_txt = {
        ['name'] = 'FunyConfessions',
        ['text'] = {
            [1] = '{C:green}1 in 3{} chance for {C:red}+5{} Mult',
            [2] = '{C:green}1 in 4{} chance for {C:blue}+30{} Chips',
            [3] = '{C:green}1 in 14{} chance for {X:red,C:white}x1.3{} Mult',
            [4] = '{C:green}1 in 21{} chance for {X:blue,C:white}x1.5{} Chips',
            [5] = '{C:green}1 in 60{} chance for{C:dark_edition} ^3{} Mult',
            [6] = '{C:inactive}\"confess your crimes today! (for me to post them)\"{}',
            [7] = '{C:inactive}Originates from{} {C:money}Comic Studio{}',
            [8] = '{C:dark_edition}Follower-suggested{}'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5ee12eb7', 1, card.ability.extra.odds, 'group_0_5ee12eb7') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_3dcd2d47', 1, card.ability.extra.odds2, 'group_1_3dcd2d47') then
                      SMODS.calculate_effect({chips = card.ability.extra.chips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_cf34ec67', 1, card.ability.extra.odds3, 'group_2_cf34ec67') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_f5ab6ef6', 1, card.ability.extra.odds4, 'group_3_f5ab6ef6') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_4_363f98f8', 1, card.ability.extra.odds5, 'group_4_363f98f8') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                  end
            end
        end
    end
}