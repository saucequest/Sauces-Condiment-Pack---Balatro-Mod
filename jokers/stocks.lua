SMODS.Joker{ --Stocks
    key = "stocks",
    config = {
        extra = {
            moneylose = 5,
            moneygain = 5,
            odds = 2,
            sell_value = 1,
            sell_value2 = 1,
            sell_value3 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Stocks',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance of gaining{C:money} $#2#{} when card scored',
            [2] = 'If chance fails, lose {C:money}-$#1#{}',
            [3] = 'If chance is successful, adds {C:money}$1{} to money chance will give',
            [4] = 'If chance fails, add {C:money}$1{} to money Joker reduces',
            [5] = 'Sell value fluctuates based on chance successes and failures'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_stocks') 
        return {vars = {card.ability.extra.moneylose, card.ability.extra.moneygain, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fb99f833', 1, card.ability.extra.odds, 'j_sauce_stocks') then
                      local moneygain_value = card.ability.extra.moneygain
                        card.ability.extra.moneygain = (card.ability.extra.moneygain) + 1
                        card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                        SMODS.calculate_effect({dollars = moneygain_value}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.sell_value).." Sell Value", colour = G.C.MONEY})
                  end
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                local moneylose_value = card.ability.extra.moneylose
                return {
                    dollars = -moneylose_value,
                    extra = {
                        func = function()
                    card.ability.extra.moneylose = (card.ability.extra.moneylose) + 1
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
            card.ability.extra_value = math.max(0, (card.ability.extra_value or 0) - card.ability.extra.sell_value2)
            card:set_cost()
                    return true
                end,
                            message = "-"..tostring(card.ability.extra.sell_value2).." Sell Value",
                            colour = G.C.MONEY
                        }
                        }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    func = function()
            card.ability.extra_value = card.ability.extra.sell_value3
            card:set_cost()
                    return true
                end,
                    message = "Sell Value: $"..tostring(card.ability.extra.sell_value3)
                }
        end
    end
}