
SMODS.Joker{ --Emerson
    key = "emerson",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Emerson',
        ['text'] = {
            [1] = 'When Boss defeated, give an {C:attention}Item {}and {C:attention}Condiment{}',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"Thank you, come again.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 9
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_emerson")
                    
                    return true
                end,
            }))
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'item', })                            
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
                end,
                extra = {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'condiment', })                            
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
                    end,
                    colour = G.C.PURPLE
                }
            }
        end
    end
}