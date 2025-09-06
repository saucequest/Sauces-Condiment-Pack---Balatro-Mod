SMODS.Joker{ --Homeless Chance
    key = "homelesschance",
    config = {
        extra = {
            odds = 2,
            Xmult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Homeless Chance',
        ['text'] = {
            [1] = 'If money is under {C:money}$10{}, {C:green}1 in 2{} chance for {X:mult,C:white}X2.5{} Mult',
            [2] = '{C:inactive}\"times been real tough since he fell for a projected limited scam\"{}',
            [3] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.dollars <= to_big(10) then
                if SMODS.pseudorandom_probability(card, 'group_0_94b60dac', 1, card.ability.extra.odds, 'j_sauce_homelesschance', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
            end
        end
    end
}