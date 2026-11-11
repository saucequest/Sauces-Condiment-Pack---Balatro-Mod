
SMODS.Joker{ --Silver the Hedgehog
    key = "silverthehedgehog",
    config = {
        extra = {
            ante_value0 = 1,
            ante_value = 1
        }
    },
    loc_txt = {
        ['name'] = 'Silver the Hedgehog',
        ['text'] = {
            [1] = 'Scored {C:attention}Electric{} cards send you an Ante {C:attention}back{}',
            [2] = 'Scored {C:attention}Burning{} cards send you an Ante {C:attention}forward{}',
            [3] = '{C:inactive,s:0.8}\"Destinies are made to be defied! I won\'t back down!\"',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    soul_pos = {
        x = 0,
        y = 32
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                local mod = -1
                ease_ante(mod)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                        return true
                    end,
                }))
                return {
                    message = "Ante -" .. 1
                }
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true then
                local mod = 1
                ease_ante(mod)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                        return true
                    end,
                }))
                return {
                    message = "Ante +" .. 1
                }
            end
        end
    end
}