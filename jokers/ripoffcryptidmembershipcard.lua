
SMODS.Joker{ --Ripoff Cryptid Membership Card
    key = "ripoffcryptidmembershipcard",
    config = {
        extra = {
            xmult0 = 6.92
        }
    },
    loc_txt = {
        ['name'] = 'Ripoff Cryptid Membership Card',
        ['text'] = {
            [1] = '{X:red,C:white}X0.01{} Mult for every mention of {C:attention}Cryptid {}in',
            [2] = 'the JokerForge {C:attention}Discord {}{C:inactive}(as of 2/23/2026){}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X6.92{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 21
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
                Xmult = 6.92
            }
        end
    end
}