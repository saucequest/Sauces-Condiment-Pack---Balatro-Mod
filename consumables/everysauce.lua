
SMODS.Consumable {
    key = 'everysauce',
    set = 'condiment',
    pos = { x = 7, y = 0 },
    config = { 
        extra = {
            hands0 = 1,
            discards0 = 1,
            hand_size0 = 1,
            discard_size0 = 1,
            dollars0 = 10,
            play_size0 = 1   
        } 
    },
    loc_txt = {
        name = 'EVERYSAUCE',
        text = {
            [1] = '{C:attention}+1{} Discards',
            [2] = '{C:attention}+1{} Hands',
            [3] = '{C:attention}+1{} Handsize',
            [4] = '{C:attention}+1{} Discard Size',
            [5] = '{C:attention}+1 {}Play Size',
            [6] = '{C:money}+$10{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
                
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discards", colour = G.C.GREEN})
                
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
                
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                
                G.hand:change_size(1)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discard Size", colour = G.C.BLUE})
                
                SMODS.change_discard_limit(1)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 10
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Play Size", colour = G.C.BLUE})
                
                SMODS.change_play_limit(1)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}