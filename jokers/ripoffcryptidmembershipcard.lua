SMODS.Joker{ --Ripoff Cryptid Membership Card
    key = "ripoffcryptidmembershipcard",
    config = {
        extra = {
            Xmult = 18.4
        }
    },
    loc_txt = {
        ['name'] = 'Ripoff Cryptid Membership Card',
        ['text'] = {
            [1] = '{X:red,C:white}X0.1{} Mult for every mention of Cryptid in',
            [2] = 'the JokerForge Discord {C:inactive}(as of 9/3/2025){}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}x18.4{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 19,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}