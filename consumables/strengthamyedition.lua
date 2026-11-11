
SMODS.Consumable {
    key = 'strengthamyedition',
    set = 'Tarot',
    pos = { x = 3, y = 4 },
    config = { 
        extra = {
            hand_size0 = 5,
            hands0 = 3   
        } 
    },
    loc_txt = {
        name = 'Strength (Amy Edition)',
        text = {
            [1] = '{C:attention}+5{} Hand Size in exchange for {C:red}-3{} Hands',
            [2] = 'and {C:attention}+1{} Winner Ante'
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
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." Hand Limit", colour = G.C.BLUE})
                
                G.hand:change_size(5)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(3).." Hands", colour = G.C.RED})
                
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - 3
                ease_hands_played(-3)
                
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Ante to Win", colour = G.C.BLUE})
                local ante = G.GAME.win_ante + 1
                local int_part, frac_part = math.modf(ante)
                local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
                G.GAME.win_ante = rounded
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}