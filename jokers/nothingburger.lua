
SMODS.Joker{ --Nothing Burger
    key = "nothingburger",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Nothing Burger',
        ['text'] = {
            [1] = '{X:mult,C:white}X1.5{} when {C:attention}hand{}',
            [2] = 'If give {C:red}+4{} instead'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = "sauce_trash",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_nothingburger') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    message = "X1.5 Mult"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_6c836cfe', 1, card.ability.extra.odds, 'j_sauce_nothingburger', false) then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+4 Mult", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}