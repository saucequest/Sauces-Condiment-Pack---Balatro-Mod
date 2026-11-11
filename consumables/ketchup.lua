
SMODS.Consumable {
    key = 'ketchup',
    set = 'condiment',
    pos = { x = 0, y = 1 },
    config = { 
        extra = {
            discards0 = 1   
        } 
    },
    loc_txt = {
        name = 'Ketchup',
        text = {
            [1] = '{C:attention}+1{} Discard'
        }
    },
    cost = 3,
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