
SMODS.Joker{ --Stoned Joker
    key = "stoned",
    config = {
        extra = {
            cigaweed = 0,
            chips0 = 50,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Stoned Joker',
        ['text'] = {
            [1] = '{C:attention}Stone{} Card\'s effect triggers when',
            [2] = '{C:attention}held {}in hand if a {C:attention}High Card{} has been',
            [3] = 'played this Blind',
            [4] = '{C:inactive,s:0.8}Don\'t take too much of the forbidden plant...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and not G.GAME.pool_flags.sauce_cigaweed
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_stoned') 
        return {vars = {card.ability.extra.cigaweed, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    chips = 50
                }
            end
        end
        if context.setting_blind  then
            if to_big(G.GAME.blind.config.blind.key) == to_big("bl_plant") then
                if SMODS.pseudorandom_probability(card, 'group_0_c3869747', 1, card.ability.extra.odds, 'j_sauce_stoned', false) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "cigaweed", colour = G.C.BLUE})
                            G.GAME.pool_flags.sauce_cigaweed = true
                            return true
                        end
                    }))
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}