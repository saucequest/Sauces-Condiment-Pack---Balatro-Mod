
SMODS.Joker{ --Brooke
    key = "brookestage2",
    config = {
        extra = {
            chips0 = 21,
            chips = 95,
            discards0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Brooke',
        ['text'] = {
            [1] = 'Scored {C:attention}8s{} and {C:attention}7s {}give {C:blue}+21{} Chips',
            [2] = 'Scored {C:attention}Queens {}give {C:blue}+95{} Chips',
            [3] = 'Scored Jacks subtracts a {C:attention}discard {}for the round',
            [4] = '{C:inactive,s:0.8}\"I\'m sorry, this is... too much right now.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:tarot,s:0.8}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 3
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
        x = 3,
        y = 3
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
                    chips = 21
                }
            elseif context.other_card:get_id() == 12 then
                return {
                    chips = 95
                }
            elseif context.other_card:get_id() == 11 then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Discards", colour = G.C.RED})
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 1
                        return true
                    end
                }
            end
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "stage_2_sold", colour = G.C.BLUE})
                    G.GAME.pool_flags.sauce_stage_2_sold = true
                    return true
                end
            }))
        end
    end
}