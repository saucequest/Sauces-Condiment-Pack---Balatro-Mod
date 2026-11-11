
SMODS.Joker{ --DONT PLAY BALATRO AT 3 AM?!?!?!??!
    key = "dontplaybalatroat3am",
    config = {
        extra = {
            currenthours = 0,
            xmult0 = 3,
            odds = 3,
            xmult = 30
        }
    },
    loc_txt = {
        ['name'] = 'DONT PLAY BALATRO AT 3 AM?!?!?!??!',
        ['text'] = {
            [1] = 'If playing game at {C:attention}3:00 AM{} to 3:59 AM, give {X:mult,C:white}X3{} Mult',
            [2] = '{C:green}#2# in #3#{} chance to give {X:mult,C:white}X30{} Mult if playing at 3:00 AM to {C:attention}3:59 AM{}',
            [3] = '{C:inactive}(yes this really works){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_dontplaybalatroat3am') 
        return {vars = {os.date("*t", os.time()).hour, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(3) == to_big(os.date("*t", os.time()).hour) then
                return {
                    Xmult = 3
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c1a5c0e7', 1, card.ability.extra.odds, 'j_sauce_dontplaybalatroat3am', false) then
                            SMODS.calculate_effect({Xmult = 30}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}