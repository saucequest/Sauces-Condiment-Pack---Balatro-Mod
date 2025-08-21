SMODS.Joker{ --bubblyproto
    key = "bubblyproto",
    config = {
        extra = {
            odds = 4,
            odds2 = 6,
            xchips = 2,
            xchips2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'bubblyproto',
        ['text'] = {
            [1] = '{C:green}1 in 4{} chance for {X:blue,C:white}x2{} Chips',
            [2] = '{C:green}1 in 6{} chance for {X:blue,C:white}x0.1{} Chips',
            [3] = '{C:inactive}\"professional cs funnyman\"{}',
            [4] = '{C:inactive}Originates from{} {C:money}Comic Studio{}',
            [5] = '{C:dark_edition}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a2db57da', 1, card.ability.extra.odds, 'j_sauce_bubblyproto') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_e8615ea6', 1, card.ability.extra.odds2, 'j_sauce_bubblyproto') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips2}, card)
                  end
            end
        end
    end
}