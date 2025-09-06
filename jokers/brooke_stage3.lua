SMODS.Joker{ --Brooke
    key = "brooke_stage3",
    config = {
        extra = {
            trauma = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brooke',
        ['text'] = {
            [1] = '{C:blue}+0.87{} Chips',
            [2] = 'Queens scored give {C:blue}+500{} Chips',
            [3] = '{C:inactive}\"I can\'t even think without seeing him anymore. I have to go. I\'m sorry.\"{}',
            [4] = '{C:inactive}Originates from{} {C:tarot}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and not G.GAME.pool_flags.sauce_stage_1_sold and G.GAME.pool_flags.sauce_stage_2_sold and not G.GAME.pool_flags.sauce_trauma
      end,

    calculate = function(self, card, context)
        if context.selling_self  then
                G.GAME.pool_flags.sauce_trauma = true
                return {
                    message = "trauma"
                }
        end
    end
}