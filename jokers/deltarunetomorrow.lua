
SMODS.Joker{ --DELTARUNE TOMORROW!!!!
    key = "deltarunetomorrow",
    config = {
        extra = {
            DELTARUNETOMORROW = 0,
            currentmonth = 0,
            currentday = 0,
            currentyear = 0,
            xmult0 = 2,
            xmult = 2,
            xmult2 = 2,
            xmult3 = 2,
            xmult4 = 2,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'DELTARUNE TOMORROW!!!!',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if Deltarune is {C:attention}tomorrow{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_deltarunetomorrow') 
        return {vars = {card.ability.extra.DELTARUNETOMORROW, os.date("*t", os.time()).month, os.date("*t", os.time()).day, os.date("*t", os.time()).year, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(os.date("*t", os.time()).month) == to_big(10) and to_big(os.date("*t", os.time()).day) == to_big(31) or to_big(os.date("*t", os.time()).year) == to_big(2018) and to_big((card.ability.extra.DELTARUNETOMORROW or 0)) ~= to_big(1)) then
                return {
                    Xmult = 2
                }
            elseif to_big((card.ability.extra.DELTARUNETOMORROW or 0)) == to_big(1) then
                return {
                    Xmult = 2
                }
            elseif (to_big(os.date("*t", os.time()).month) == to_big(9) and to_big(os.date("*t", os.time()).day) == to_big(17) or to_big(os.date("*t", os.time()).year) == to_big(2021) and to_big((card.ability.extra.DELTARUNETOMORROW or 0)) ~= to_big(1)) then
                return {
                    Xmult = 2
                }
            elseif (to_big(os.date("*t", os.time()).month) == to_big(6) and to_big(os.date("*t", os.time()).day) == to_big(4) or to_big(os.date("*t", os.time()).year) == to_big(2025) and to_big((card.ability.extra.DELTARUNETOMORROW or 0)) ~= to_big(1)) then
                return {
                    Xmult = 2
                }
            elseif (to_big(os.date("*t", os.time()).month) == to_big(3) and to_big(os.date("*t", os.time()).day) == to_big(2) or to_big(os.date("*t", os.time()).year) == to_big(2026) and to_big((card.ability.extra.DELTARUNETOMORROW or 0)) ~= to_big(1)) then
                return {
                    Xmult = 2
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4cf47205', 1, card.ability.extra.odds, 'j_sauce_deltarunetomorrow', true) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.DELTARUNETOMORROW = 1
                        return true
                    end}, card)
                end
            end
        end
    end
}