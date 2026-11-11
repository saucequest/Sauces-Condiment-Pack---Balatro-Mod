
SMODS.Consumable {
    key = 'mayochup',
    set = 'condiment',
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            hand_size0 = 1,
            discards0 = 1   
        } 
    },
    loc_txt = {
        name = 'Mayochup',
        text = {
            [1] = '{C:attention}+1{} Hand Size',
            [2] = '{C:attention}+1{} Discard',
            [3] = '{C:inactive,s:0.7}if you genuinely like these uninstall this mod{}'
        }
    },
    cost = 4,
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
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discards", colour = G.C.GREEN})
                
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
                
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}