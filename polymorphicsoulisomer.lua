
SMODS.Joker{ --Polymorphic Soul Isomer
    key = "polymorphicsoulisomer",
    config = {
        extra = {
            xmult0 = 2.5,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Polymorphic Soul Isomer',
        ['text'] = {
            [1] = '{X:red,C:white}X2.5{} Mult',
            [2] = '{C:green}#1# in #2#{} chance to be {C:red}destroyed{}',
            [3] = 'after hand is {C:attention}done scoring{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_polymorphicsoulisomer') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 2.5
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d2ff6e8c', 1, card.ability.extra.odds, 'j_sauce_polymorphicsoulisomer', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}