
SMODS.Joker{ --Wheel of Fortune will not hit
    key = "wheeloffortunewillnothit",
    config = {
        extra = {
            fortunemult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Wheel of Fortune will not hit',
        ['text'] = {
            [1] = 'Gain {X:mult,C:white}X0.25{} Mult whenever a {C:attention}Wheel{} of',
            [2] = 'Fortune chance {C:attention}fails{}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 28
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_wheel_of_fortune"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_wheel_of_fortune\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.fortunemult}}
    end,
    
    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if (not context.result and context.identifier == "wheel_of_fortune") then
                return {
                    func = function()
                        card.ability.extra.fortunemult = (card.ability.extra.fortunemult) + 0.25
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.fortunemult
            }
        end
    end
}