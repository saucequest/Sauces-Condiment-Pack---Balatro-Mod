
SMODS.Joker{ --Brooke
    key = "brookestage3",
    config = {
        extra = {
            chips0 = 0.87,
            chips = 500
        }
    },
    loc_txt = {
        ['name'] = 'Brooke',
        ['text'] = {
            [1] = '{C:blue}+0.87{} Chips',
            [2] = 'Queens scored give {C:blue}+500{} Chips',
            [3] = '{C:inactive,s:0.8}\"I can\'t even think without seeing him anymore. I have to go. I\'m sorry.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:tarot,s:0.8}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 3
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
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "trauma", colour = G.C.BLUE})
                    G.GAME.pool_flags.sauce_trauma = true
                    return true
                end
            }))
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 0.87
            }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                return {
                    chips = 500
                }
            end
        end
    end
}