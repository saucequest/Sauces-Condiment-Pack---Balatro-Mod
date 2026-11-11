
SMODS.Joker{ --Wet Cement Vending Machine
    key = "wetcementvendingmachine",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Wet Cement Vending Machine',
        ['text'] = {
            [1] = 'When a {C:attention}Blind {}is selected, give {C:attention}Wet Cement{}',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_wetcement"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_wetcement\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'item', key = 'c_sauce_wetcement'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}