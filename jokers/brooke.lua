
SMODS.Joker{ --Brooke
    key = "brooke",
    config = {
        extra = {
            pb_bonus_6dc23e6f = 21
        }
    },
    loc_txt = {
        ['name'] = 'Brooke',
        ['text'] = {
            [1] = 'Scored Jacks and Queens gain {C:blue}+21{} Chips when scored',
            [2] = '{C:inactive,s:0.8}\"DUDE NOBODY TOLD ME THE MCRIB WAS BACK I WOULD\'VE GPOTTEN IT SO MUCH EARLYer\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:tarot,s:0.8}Vs. OURPLE GUY{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 3
    },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and not G.GAME.pool_flags.sauce_stage_1_sold and not G.GAME.pool_flags.sauce_stage_2_sold and not G.GAME.pool_flags.sauce_trauma
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 11 or context.other_card:get_id() == 12) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 21
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "stage_1_sold", colour = G.C.BLUE})
                    G.GAME.pool_flags.sauce_stage_1_sold = true
                    return true
                end
            }))
        end
    end
}