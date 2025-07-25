SMODS.Consumable {
    key = 'jobapplication',
    set = 'Spectral',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Job Application',
        text = {
        [1] = '{C:green}1 in 12{} chance to give {C:money}$10{}',
        [2] = '{C:green}1 in 15{} chance to give {C:gold}Credit Card{}'
    }
    },
    cost = 8,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
    end,
    can_use = function(self, card)
        return true
    end
}