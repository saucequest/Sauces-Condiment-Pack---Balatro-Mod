
SMODS.Consumable {
    key = 'jobapplication',
    set = 'item',
    pos = { x = 9, y = 0 },
    config = { 
        extra = {
            odds = 7,
            odds2 = 10,
            dollars0 = 10   
        } 
    },
    loc_txt = {
        name = 'Job Application',
        text = {
            [1] = '{C:green}#1# in #2#{} chance to give {C:money}$10{}',
            [2] = '{C:green}#3# in #4#{} chance to give {C:gold}Credit Card{}'
        }
    },
    cost = 8,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.odds8, card.ability.extra.odds11}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                used_card:juice_up(0.3, 0.5)
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "jobacquired", colour = G.C.BLUE})
                G.GAME.pool_flags.sauce_jobacquired = true
                return true
            end
        }))
        delay(0.6)
        if SMODS.pseudorandom_probability(card, 'group_0_94743091', 1, card.ability.extra.odds, 'j_sauce_jobapplication', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 10
                    local dollar_value = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.RED})
                    ease_dollars(dollar_value, true)
                    return true
                end
            }))
            delay(0.6)
            
        end
        if SMODS.pseudorandom_probability(card, 'group_1_8b62def7', 1, card.ability.extra.odds2, 'j_sauce_jobapplication', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_credit_card' })
                    if new_joker then
                    end
                    used_card:juice_up(0.3, 0.5)
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