
SMODS.Joker{ --kyle
    key = "kyle",
    config = {
        extra = {
            kyle = 0,
            odds = 2,
            joker_slots0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'kyle',
        ['text'] = {
            [1] = 'W {C:attention}kyle{}',
            [2] = 'kindest skribbl.io player'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
    blueprint_compat = false,
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_kyle') 
        return {vars = {card.ability.extra.kyle, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8ce4ec52', 1, card.ability.extra.odds, 'j_sauce_kyle', false) then
                    SMODS.calculate_effect({saved = true}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_saved_ex'), colour = G.C.RED})
                    SMODS.calculate_effect({func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I believe in you.", colour = G.C.DARK_EDITION})
                        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
                        return true
                    end}, card)
                end
            end
        end
    end
}