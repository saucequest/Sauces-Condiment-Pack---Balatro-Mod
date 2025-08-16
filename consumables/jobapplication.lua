SMODS.Consumable {
    key = 'jobapplication',
    set = 'Spectral',
    pos = { x = 1, y = 0 },
    config = { extra = {
        odds = 15,
        odds2 = 12,
        dollars_value = 10
    } },
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
            if SMODS.pseudorandom_probability(card, 'group_0_4d01f0ee', 1, card.ability.extra.odds, 'c_sauce') then
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', key = 'j_credit_card' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_6b17b932', 1, card.ability.extra.odds2, 'c_sauce') then
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.MONEY})
                    ease_dollars(10, true)
                    return true
                end
            }))
            delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}