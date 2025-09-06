SMODS.Joker{ --Blaze the Cat
    key = "blazethecat",
    config = {
        extra = {
            odds = 5,
            Xmult = 0.5,
            Xmult2 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Blaze the Cat',
        ['text'] = {
            [1] = 'Queens played will be given {C:attention}Burning{}',
            [2] = '{C:green}1 in {}5 chance to destroy the triggered Queen and give {X:red,C:white}X0.5{} Mult',
            [3] = '{C:inactive}\"I will not allow my people to come to such suffering!\"{}',
            [4] = '{C:inactive}Originates from{} {C:common}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    soul_pos = {
        x = 1,
        y = 1
    },

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 12 then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_burning)
                return {
                    message = "Card Modified!"
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3c40be7a', 1, card.ability.extra.odds, 'j_sauce_blazethecat', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
                    if SMODS.pseudorandom_probability(card, 'group_1_3c40be7a', 1, card.ability.extra.odds, 'j_sauce_blazethecat', false) then
              context.other_card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}