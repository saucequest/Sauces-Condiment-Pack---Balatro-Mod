
SMODS.Joker{ --JokerForge Autosaves
    key = "jokerforgeautosaves",
    config = {
        extra = {
            currentante = 0,
            odds = 25,
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'JokerForge Autosaves',
        ['text'] = {
            [1] = 'When sold, {C:green}#2# in #3#{} chance for {C:red}-1{} Ante',
            [2] = 'If failed, {C:red}triple Ante{} instead'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 39
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_jokerforgeautosaves') 
        return {vars = {((G.GAME.round_resets.ante or 0)) * 3, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_10c5d9f7', 1, card.ability.extra.odds, 'j_sauce_jokerforgeautosaves', false) then
                    SMODS.calculate_effect({
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
                        end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ante -" .. 1, colour = G.C.YELLOW})
                    end
                end
            end
            if context.pseudorandom_result  then
                if not context.result then
                    return {
                        
                        func = function()
                            
                            local mod = (G.GAME.round_resets.ante) * 3 - G.GAME.round_resets.ante
                            ease_ante(mod)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.round_resets.blind_ante = (G.GAME.round_resets.ante) * 3
                                    return true
                                end,
                            }))
                            return true
                        end,
                        message = "Ante set to " .. (G.GAME.round_resets.ante) * 3 .. "!"
                    }
                end
            end
        end
    }