SMODS.Joker{ --bubblyproto
    name = "bubblyproto",
    key = "bubblyproto",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            xchips = 2,
            xchips2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'bubblyproto',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance for {X:blue,C:white}x2{} Chips',
            [2] = '{C:green}1 in 4{} chance for {X:blue,C:white}x0.1{} Chips',
            [3] = '{C:inactive}\"professional cs funnyman and #1 most hated user by the mods\"{}',
            [4] = '{C:inactive}Originates from{} {C:money}Comic Studio{}',
            [5] = '{C:dark_edition}Follower-suggested{}'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 2
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a2db57da', 1, card.ability.extra.odds, 'group_0_a2db57da') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_e8615ea6', 1, card.ability.extra.odds2, 'group_1_e8615ea6') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips2}, card)
                  end
            end
        end
    end
}