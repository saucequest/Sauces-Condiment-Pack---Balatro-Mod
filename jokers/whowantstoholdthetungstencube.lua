
SMODS.Joker{ --Who wants to hold the Tungsten Cube?
    key = "whowantstoholdthetungstencube",
    config = {
        extra = {
            hand_size0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Who wants to hold the Tungsten Cube?',
        ['text'] = {
            [1] = 'If {C:attention}played {}hand is a {C:attention}single card{}, make',
            [2] = 'it {C:attention}Steel{} and {C:red}decrease {} hand {C:attention}size {}by 0.5'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 28
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
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.scoring_name == "High Card" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(0.5).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(-0.5)
                        return true
                    end
                }
            end
        end
    end
}