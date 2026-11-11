
SMODS.Joker{ --Hyper Sonic
    key = "hyper_sonic",
    config = {
        extra = {
            hypermult_n0 = 7,
            hypermult_arrows0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Hyper Sonic',
        ['text'] = {
            [1] = '{X:black,C:red}^^^7{} Mult',
            [2] = '{C:inactive,s:0.8}\"Sonic got all Super Emeralds. Now Sonic can be Hyper Sonic.\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 8,
        y = 12
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                hypermult = {
                    3,
                    7
                }
            }
        end
    end
}