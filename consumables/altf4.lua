
SMODS.Consumable {
    key = 'altf4',
    set = 'keyboard_shortcut',
    pos = { x = 3, y = 2 },
    loc_txt = {
        name = 'Alt + F4',
        text = {
            [1] = 'Makes you {C:red}instantly {}lose'
        }
    },
    cost = 1,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        return {
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Alt + F4", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                            G.STATE = G.STATES.GAME_OVER
                            G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
        }
    end,
    can_use = function(self, card)
        return true
    end
}