
SMODS.Consumable {
    key = 'killdroidsmissile',
    set = 'item',
    pos = { x = 5, y = 2 },
    config = { 
        extra = {
            odds = 2   
        } 
    },
    loc_txt = {
        name = 'Killdroids Missile',
        text = {
            [1] = '{C:green}#1# in #2#{} chance to {C:red}destroy {}a selected card'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce_killdroidsmissile')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) == to_big(1) then
            if SMODS.pseudorandom_probability(card, 'group_0_7b99b9ec', 1, card.ability.extra.odds, 'j_sauce_killdroidsmissile', false) then
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
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) == to_big(1))
    end
}