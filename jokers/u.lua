
SMODS.Joker{ --U
    key = "u",
    config = {
        extra = {
            retriggers = 1
        }
    },
    loc_txt = {
        ['name'] = 'U',
        ['text'] = {
            [1] = '{C:attention}Retriggers {}rightmost Joker',
            [2] = 'When round ends, {C:red}destroys {}{C:attention}rightmost {}Joker',
            [3] = '{C:inactive,s:0.8}\"I\'ll make you love me too, I am ALL OF YOU!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:diamonds,s:0.8}Burger King Disaster{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.retriggers}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    local target_joker = nil
                    for i = #G.jokers.cards, 1, -1 do
                        local joker = G.jokers.cards[i]
                        if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                            target_joker = joker
                            break
                        end
                    end
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
        
        local target_joker = nil
        
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}