
SMODS.Joker{ --Crow
    key = "crow",
    config = {
        extra = {
            xchips0 = 0.9,
            xmult0 = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'Crow',
        ['text'] = {
            [1] = '{X:red,C:white}X0.9{} Mult and {X:chips,C:white}x0.9{} Chips',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:rare,s:0.8}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 0.9,
                extra = {
                    Xmult = 0.9
                }
            }
        end
    end
}