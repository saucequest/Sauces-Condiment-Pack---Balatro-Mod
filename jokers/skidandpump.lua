
SMODS.Joker{ --Skid and Pump
    key = "skidandpump",
    config = {
        extra = {
            currentmonth = 0
        }
    },
    loc_txt = {
        ['name'] = 'Skid and Pump',
        ['text'] = {
            [1] = 'If you are playing on {C:attention}October{}, create a {C:attention}Food{}',
            [2] = 'Joker after {C:attention}Boss {}is defeated',
            [3] = '{C:inactive}(Requires room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 22
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).month}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if to_big(os.date("*t", os.time()).month) == to_big(10) then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'sauce_food' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
    end
}