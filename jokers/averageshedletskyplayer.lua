SMODS.Joker{ --average shedletsky player:
    key = "averageshedletskyplayer",
    config = {
        extra = {
            Xmult = 1.00001,
            odds = 85,
            Xmult2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'average shedletsky player:',
        ['text'] = {
            [1] = '{C:green}1 in 85{} chance to give {X:red,C:white}X3{} Mult',
            [2] = 'Otherwise, give {X:red,C:white}X1.00001{} Mult and be a fat slob',
            [3] = '{C:inactive}\"OH MY GOD, SHEDLETSKY! K### YOURSELF-\"{}',
            [4] = '{C:inactive}Originates from {}{C:red}FORSAKEN{}',
            [5] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1.1, 
        h = 95 * 1.1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_ba24d790', 1, card.ability.extra.odds, 'j_sauce_averageshedletskyplayer', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}