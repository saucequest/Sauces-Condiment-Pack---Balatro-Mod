
SMODS.Joker{ --Catbox
    key = "catbox",
    config = {
        extra = {
            jokercount = 0,
            sell_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Catbox',
        ['text'] = {
            [1] = 'When sold, set {C:attention}consumable {}slots',
            [2] = 'to the amount of {C:attention}full {}Joker slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = #(G.jokers and G.jokers.cards or {})
                        return true
                    end }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(#(G.jokers and G.jokers.cards or {})).." Consumable Slots", colour = G.C.BLUE})
                    return true
                end
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                    target_card.ability.extra_value = 1
                    target_card:set_cost()
                    return true
                end,
                message = "Sell Value: $"..tostring(1)
            }
        end
    end
}