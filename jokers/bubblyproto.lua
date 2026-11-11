
SMODS.Joker{ --bubblyproto
    key = "bubblyproto",
    config = {
        extra = {
            odds = 4,
            odds2 = 6,
            xchips0 = 2,
            xchips = 0.1,
            odds2 = 2,
            odds22 = 4,
            xchips2 = 2,
            xchips3 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'bubblyproto',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for {X:blue,C:white}x2{} Chips',
            [2] = '{C:green}#3# in #4#{} chance for {X:blue,C:white}x0.1{} Chips',
            [3] = '{C:inactive,s:0.8}\"professional cs funnyman\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Comic Studio{}',
            [5] = '{C:dark_edition,s:0.8}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    soul_pos = {
        x = 7,
        y = 3
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_bubblyproto')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_bubblyproto')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_bubblyproto')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_bubblyproto')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_cheftwo" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_a2db57da', 1, card.ability.extra.odds, 'j_sauce_bubblyproto', false) then
                    SMODS.calculate_effect({x_chips = 2}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_e8615ea6', 1, card.ability.extra.odds2, 'j_sauce_bubblyproto', false) then
                    SMODS.calculate_effect({x_chips = 0.1}, card)
                end
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_cheftwo" then 
                        return true
                    end
                end
            end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_9d13e01b', 1, card.ability.extra.odds3, 'j_sauce_bubblyproto', false) then
                    SMODS.calculate_effect({x_chips = 2}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_e811445f', 1, card.ability.extra.odds, 'j_sauce_bubblyproto', false) then
                    SMODS.calculate_effect({x_chips = 0.1}, card)
                end
            end
        end
    end
}