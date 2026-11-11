
SMODS.Joker{ --Slasher
    key = "slasher",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Slasher',
        ['text'] = {
            [1] = 'When a {C:attention}face {}card is scored, {C:red}destroy {}it and create a {C:attention}Necrobloxicon{}',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"A man whose identity is concealed by a crude hockey mask.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_necrobloxicon"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_necrobloxicon\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'item', key = 'c_sauce_necrobloxicon'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}