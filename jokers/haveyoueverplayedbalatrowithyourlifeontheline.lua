
SMODS.Joker{ --Have You Ever Played BALATRO With Your Life on The Line?!
    key = "haveyoueverplayedbalatrowithyourlifeontheline",
    config = {
        extra = {
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Have You Ever Played BALATRO With Your Life on The Line?!',
        ['text'] = {
            [1] = 'All {C:attention}player actions{} have a {C:green}#1# in #2#{}',
            [2] = 'chance to instantly {C:red}lose {}the run'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 45
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_haveyoueverplayedbalatrowithyourlifeontheline') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_23cf3e9f', 1, card.ability.extra.odds, 'j_sauce_haveyoueverplayedbalatrowithyourlifeontheline', false) then
                    SMODS.calculate_effect({func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end}, card)
                end
            end
        end
    end
}