SMODS.Joker{ --Flintlock
    key = "flintlock",
    config = {
        extra = {
            odds = 2,
            Xmult = 2,
            odds2 = 5,
            Xmult2 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Flintlock',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance for {X:mult,C:white}X2{} Mult',
            [2] = '{C:green}1 in 5{} chance to destroy self when hand played and give {X:mult,C:white}X0.1{} Mult',
            [3] = '{C:inactive}Belongs to a certain gambler...{}',
            [4] = '{C:dark_edition}Gun Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
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
    pools = { ["sauce_gun"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2a8a55f3', 1, card.ability.extra.odds, 'j_sauce_flintlock', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_d42ebed3', 1, card.ability.extra.odds, 'j_sauce_flintlock', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
          end
            end
        end
    end
}