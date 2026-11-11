
SMODS.Consumable {
    key = 'bullet',
    set = 'item',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'Bullet',
        text = {
            [1] = 'Adds an extra remaining round to Gun Jokers'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}