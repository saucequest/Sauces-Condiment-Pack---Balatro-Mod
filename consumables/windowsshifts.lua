
SMODS.Consumable {
    key = 'windowsshifts',
    set = 'keyboard_shortcut',
    pos = { x = 1, y = 2 },
    loc_txt = {
        name = 'Windows + Shift + S',
        text = {
            [1] = 'Create {C:dark_edition}Negative {}copies of up to 5',
            [2] = '{C:attention}selected {}cards'
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
        if to_big(#G.hand.highlighted) <= to_big(5) then
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) <= to_big(5))
    end
}