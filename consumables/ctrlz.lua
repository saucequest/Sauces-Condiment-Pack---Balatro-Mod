
SMODS.Consumable {
    key = 'ctrlz',
    set = 'keyboard_shortcut',
    pos = { x = 2, y = 2 },
    config = { 
        extra = {
            ante_value0 = 1   
        } 
    },
    loc_txt = {
        name = 'Ctrl + Z',
        text = {
            [1] = '{C:attention}-1{} Ante when used'
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
        local mod = -1
        ease_ante(mod)
        G.E_MANAGER:add_event(Event({
            func = function()
                
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Ante", colour = G.C.YELLOW})
                return true
            end,
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}