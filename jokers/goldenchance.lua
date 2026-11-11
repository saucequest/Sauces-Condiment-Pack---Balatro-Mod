
SMODS.Joker{ --Golden Chance
    key = "goldenchance",
    config = {
        extra = {
            xmult0 = 2.5,
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Golden Chance',
        ['text'] = {
            [1] = 'If you have over {C:money}$50{}, give {X:mult,C:white}X2.5{} Mult',
            [2] = 'When {C:attention}Gold{} Cards scored, give {C:money}$3{}',
            [3] = '{C:inactive,s:0.8}\"Imbued with an ancient power\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_gold"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_gold\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.dollars) >= to_big(50) then
                return {
                    Xmult = 2.5
                }
            end
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
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
            end
        end
    end
}