
SMODS.Joker{ --Kitchen Wizard
    key = "kitchenwizard",
    config = {
        extra = {
            xchips0 = 20,
            chips0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Kitchen Wizard',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips',
            [2] = '{X:chips,C:white}x20{} Chips if you own {C:attention}Egg {}and {C:attention}Rice{}',
            [3] = '',
            [4] = '{C:inactive,s:0.8}\"You\'re a real pain, you know that?\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:enhanced,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_egg"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_egg\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_sauce_rice"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_rice\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_egg" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_rice" then 
                        return true
                    end
                end
            end)()) then
                return {
                    x_chips = 20
                }
            else
                return {
                    chips = 20
                }
            end
        end
    end
}