
SMODS.Joker{ --Cementful
    key = "cementful",
    config = {
        extra = {
            dollars0 = 3,
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cementful',
        ['text'] = {
            [1] = 'Give {C:money}$3{} if played {C:attention}Stone{} card was previously a Face card',
            [2] = '{C:inactive,s:0.8}\"Sorry Artful, but in order to be part of the Forsaken x Die Of Death collab, {}',
            [3] = '{C:inactive,s:0.8}you have to be submerged in cement.\"{}{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_stone"] == true and context.other_card:is_face() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_banana" then 
                        return true
                    end
                end
            end)()) then
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
            elseif (SMODS.get_enhancements(context.other_card)["m_stone"] == true and context.other_card:is_face() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_banana" then 
                        return true
                    end
                end
            end)()) then
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
            end
        end
    end
}