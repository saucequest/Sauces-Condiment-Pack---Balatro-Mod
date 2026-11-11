
SMODS.Joker{ --goodmorning
    key = "goodmorning",
    config = {
        extra = {
            xmult0 = 21.73
        }
    },
    loc_txt = {
        ['name'] = 'goodmorning',
        ['text'] = {
            [1] = '{X:red,C:white}X0.01{} Mult for every JokerForge {C:attention}commit{}',
            [2] = '{C:inactive}(as of 5/29/2026){}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X21.73{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 21,
    rarity = 4,
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 21.73
            }
        end
    end
}