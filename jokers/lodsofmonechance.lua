SMODS.Joker{ --Lods Of Mone Chance
    key = "lodsofmonechance",
    config = {
        extra = {
            odds = 2,
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Lods Of Mone Chance',
        ['text'] = {
            [1] = 'When card scored, {C:green}1 in 2{} chance to give {C:money}$2{}',
            [2] = '{C:inactive}\"SHUT YOUR MOUTH AND LOOK AT MY WAD!\"{}',
            [3] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
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

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c1dece72', 1, card.ability.extra.odds, 'j_sauce_lodsofmonechance', false) then
              SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shut your mouth and look at my WAD!", colour = G.C.MONEY})
          end
            end
        end
    end
}