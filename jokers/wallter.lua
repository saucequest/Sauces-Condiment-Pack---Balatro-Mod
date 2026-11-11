
SMODS.Joker{ --Wallter
    key = "wallter",
    config = {
        extra = {
            wallchip = 50
        }
    },
    loc_txt = {
        ['name'] = 'Wallter',
        ['text'] = {
            [1] = 'When {C:attention}Wet Cement{} is used, gain {C:blue}+25{} Chips',
            [2] = '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips){}',
            [3] = '{C:inactive,s:0.8}\"I yearn for grey stuff at this time...\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 3,
        y = 27
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_wetcement"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_wetcement\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.wallchip}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_sauce_wetcement' then
                return {
                    func = function()
                        card.ability.extra.wallchip = (card.ability.extra.wallchip) + 25
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.wallchip
            }
        end
    end
}