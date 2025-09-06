SMODS.Joker{ --Brooke
    key = "brooke_stage2",
    config = {
        extra = {
            chips = 21,
            chips2 = 95,
            discards = 1,
            round = 0,
            stage_2_sold = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brooke',
        ['text'] = {
            [1] = 'Scored 8s and 7s give {C:blue}+21{} Chips',
            [2] = 'Scored Queens give {C:blue}+95{} Chips',
            [3] = 'Scored Jacks subtracts a discard for the round',
            [4] = '{C:inactive}\"I\'m sorry, this is... too much right now.\"{}',
            [5] = '{C:inactive}Originates from{} {C:tarot}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and G.GAME.pool_flags.sauce_stage_1_sold and not G.GAME.pool_flags.sauce_stage_2_sold and not G.GAME.pool_flags.sauce_trauma
      end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 or context.other_card:get_id() == 8) then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:get_id() == 12 then
                return {
                    chips = card.ability.extra.chips2
                }
            elseif context.other_card:get_id() == 11 then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.discards).." Discard", colour = G.C.RED})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - card.ability.extra.discards
                return true
            end
                }
            end
        end
        if context.selling_self  then
                G.GAME.pool_flags.sauce_stage_2_sold = true
                return {
                    message = "stage_2_sold"
                }
        end
    end
}