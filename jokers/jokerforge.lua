
SMODS.Joker{ --JokerForge
    key = "jokerforge",
    config = {
        extra = {
            mult0 = 6,
            odds = 4,
            xmult0 = 2.5,
            odds2 = 6
        }
    },
    loc_txt = {
        ['name'] = 'JokerForge',
        ['text'] = {
            [1] = '{C:red}+6{} Mult',
            [2] = '{C:green}#1# in #2#{} chance for {X:red,C:white}X2.5{} Mult',
            [3] = '{C:green}#3# in #4#{} chance when {C:attention}Blind {}selected to {C:attention}crash {}the game'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_jokerforge')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_jokerforge')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = 6
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_48b49545', 1, card.ability.extra.odds, 'j_sauce_jokerforge', false) then
                            SMODS.calculate_effect({Xmult = 2.5}, card)
                        end
                        return true
                    end
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_09b311cf', 1, card.ability.extra.odds2, 'j_sauce_jokerforge', false) then
                    error("EasternFarmer Was Here")
                    
                end
            end
        end
    end
}