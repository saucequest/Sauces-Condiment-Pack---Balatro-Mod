SMODS.Joker{ --DONT PLAY BALATRO AT 3 AM?!?!?!??!
    key = "dontplaybalatroat3am",
    config = {
        extra = {
            currenthours = 0,
            Xmult = 3,
            odds = 3,
            Xmult2 = 30
        }
    },
    loc_txt = {
        ['name'] = 'DONT PLAY BALATRO AT 3 AM?!?!?!??!',
        ['text'] = {
            [1] = 'If playing game at exactly 3:00 AM, give {X:mult,C:white}X3{} Mult',
            [2] = '{C:green}1 in 3{} chance to give {X:mult,C:white}X30{} Mult if playing at 3:00 AM',
            [3] = '{C:inactive}(yes this really works){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if 3 == os.date("*t", os.time()).hour then
                return {
                    Xmult = card.ability.extra.Xmult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c1a5c0e7', 1, card.ability.extra.odds, 'j_sauce_dontplaybalatroat3am') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}