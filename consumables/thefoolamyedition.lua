
SMODS.Consumable {
    key = 'thefoolamyedition',
    set = 'Tarot',
    pos = { x = 2, y = 4 },
    config = { 
        extra = {
            hand_size0 = 2   
        } 
    },
    loc_txt = {
        name = 'The Fool (Amy Edition)',
        text = {
            [1] = '{C:attention}+1{} Joker Slot in exchange for',
            [2] = '{C:red}-2{} Hand Size'
        }
    },
    cost = 6,
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
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Hand Limit", colour = G.C.BLUE})
                
                G.hand:change_size(-2)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}