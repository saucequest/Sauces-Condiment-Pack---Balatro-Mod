SMODS.Joker{ --goodmorning
    key = "goodmorning",
    config = {
        extra = {
            Xmult = 11.92
        }
    },
    loc_txt = {
        ['name'] = 'goodmorning',
        ['text'] = {
            [1] = '{X:red,C:white}X0.01{} Mult for every JokerForge commit',
            [2] = '{C:inactive}(as of 9/8/2025){}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X11.92{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
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
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}