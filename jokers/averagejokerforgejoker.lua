
SMODS.Joker{ --Average JokerForge Joker
    key = "averagejokerforgejoker",
    config = {
        extra = {
            hypermult_n0 = 12,
            hypermult_arrows0 = 23
        }
    },
    loc_txt = {
        ['name'] = 'Average JokerForge Joker',
        ['text'] = {
            [1] = 'Makes you instantly win the game.',
            [2] = '{C:inactive}(Gives{} {X:black,C:red}^^^^^^^^^^^^^^^^^^^^^^^12{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
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
                    23,
                    12
                }
            }
        end
    end
}