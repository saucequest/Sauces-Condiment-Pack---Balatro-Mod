SMODS.Joker{ --Crow
    key = "crow",
    config = {
        extra = {
            xchips = 0.9,
            Xmult = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'Crow',
        ['text'] = {
            [1] = '{X:red,C:white}X0.9{} Mult and {X:chips,C:white}x0.9{} Chips',
            [2] = '{C:inactive}Originates from{} {C:rare}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}