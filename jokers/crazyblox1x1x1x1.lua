
SMODS.Joker{ --Crazyblox 1x1x1x1
    key = "crazyblox1x1x1x1",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Crazyblox 1x1x1x1',
        ['text'] = {
            [1] = '{C:attention}Held {}in hand {C:attention}face {}cards become',
            [2] = '{C:attention}Drenched{}',
            [3] = '{C:inactive,s:0.8}\"Transmission recieved.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_drenched)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}