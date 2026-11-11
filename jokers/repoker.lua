
SMODS.Joker{ --REPOker
    key = "repoker",
    config = {
        extra = {
            dollars0 = 1,
            dollars = 2,
            dollars2 = 3,
            dollars3 = 2,
            dollars4 = 3,
            dollars5 = 2
        }
    },
    loc_txt = {
        ['name'] = 'REPOker',
        ['text'] = {
            [1] = 'Scored cards give {C:money}money {}based on {C:attention}rank{}, {C:enhanced}Enhancement{}, and {C:attention}Seal{}',
            [2] = '{C:attention}Higher{} rank = more {C:attention}money {}through {C:attention}scoring{}',
            [3] = '{C:inactive,s:0.7}(Render and cosmetic by UnLuckyNickolay on Thunderstore){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 8 or context.other_card:get_id() == 9 and context.other_card:get_id() == 10) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (context.other_card:is_face() or context.other_card:get_id() == 14) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_gold"] == true or SMODS.get_enhancements(context.other_card)["m_wild"] == true or SMODS.get_enhancements(context.other_card)["m_mult"] == true or SMODS.get_enhancements(context.other_card)["m_stone"] == true or SMODS.get_enhancements(context.other_card)["m_lucky"] == true) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_steel"] == true or SMODS.get_enhancements(context.other_card)["m_glass"] == true or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true or SMODS.get_enhancements(context.other_card)["m_sauce_corrupted"] == true) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif context.other_card.seal ~= nil then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}