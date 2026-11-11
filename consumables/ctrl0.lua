
SMODS.Consumable {
    key = 'ctrl0',
    set = 'keyboard_shortcut',
    pos = { x = 2, y = 3 },
    loc_txt = {
        name = 'Ctrl + 0',
        text = {
            [1] = '{C:red}Destroy {}up to 3 {C:attention}selected {}cards'
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
        if to_big(#G.hand.highlighted) <= to_big(3) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    SMODS.destroy_cards(G.hand.highlighted)
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) <= to_big(3))
    end
}