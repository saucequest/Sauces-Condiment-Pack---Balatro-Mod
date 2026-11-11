
SMODS.Joker{ --Chaos Emerald
    key = "chaosemerald",
    config = {
        extra = {
            odds = 5,
            ante_value0 = 1,
            ante_value = 1
        }
    },
    loc_txt = {
        ['name'] = 'Chaos Emerald',
        ['text'] = {
            [1] = 'When sold, sends you an {C:attention}Ante {}back',
            [2] = 'Has a {C:green}#1# in #2#{} chance to send you {C:attention}forward {}an Ante instead'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_chaosemerald') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_f95498c3', 1, card.ability.extra.odds, 'j_sauce_chaosemerald', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local mod = 1
                            ease_ante(mod)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                                    return true
                                end,
                            }))
                            return true
                        end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ante +" .. 1, colour = G.C.YELLOW})
                    end
                end
            end
            if context.pseudorandom_result  then
                if not context.result then
                    return {
                        
                        func = function()
                            
                            local mod = -1
                            ease_ante(mod)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                                    return true
                                end,
                            }))
                            return true
                        end,
                        message = "Ante -" .. 1
                    }
                end
            end
        end
    }