SMODS.Joker{ --a tale of two lovebirds
    key = "ataleoftwolovebirds",
    config = {
        extra = {
            currentyearday = 0
        }
    },
    loc_txt = {
        ['name'] = 'a tale of two lovebirds',
        ['text'] = {
            [1] = 'we\'re broken apart yet again.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                context.other_card:set_ability(G.P_CENTERS.m_wild)
                return {
                    e_chips = os.date("*t", os.time()).yday,
                    message = "come back, please.",
                    extra = {
                        message = "i dont want to die alone.",
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}