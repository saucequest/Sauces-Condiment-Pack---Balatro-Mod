
SMODS.Consumable {
    key = 'windowsctrlshiftb',
    set = 'keyboard_shortcut',
    pos = { x = 3, y = 3 },
    config = { 
        extra = {
            odds = 4,
            repetitions = 8   
        } 
    },
    loc_txt = {
        name = 'Windows + CTRL + Shift + B',
        text = {
            [1] = 'Create 8 {C:dark_edition}Negative {}{C:spectral}Spectral{} cards',
            [2] = '{C:green}#1# in #2#{} chance to {C:red}crash {}the game'
        }
    },
    cost = 7,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce_windowsctrlshiftb')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_7bec6968', 1, card.ability.extra.odds, 'j_sauce_windowsctrlshiftb', false) then
            error("EasternFarmer Was Here")
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}