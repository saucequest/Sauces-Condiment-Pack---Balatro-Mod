
SMODS.Consumable {
    key = 'mustard',
    set = 'condiment',
    pos = { x = 3, y = 1 },
    config = { 
        extra = {
            hands0 = 1,
            odds = 10   
        } 
    },
    loc_txt = {
        name = 'Mustard',
        text = {
            [1] = '{C:attention}+1{} Hand',
            [2] = '{C:green}#1# in #2#{} chance to summon Kendrick Lamar'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce_mustard')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
                
                return true
            end
        }))
        delay(0.6)
        if SMODS.pseudorandom_probability(card, 'group_0_d00e2b1f', 1, card.ability.extra.odds, 'j_sauce_mustard', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_kendricklamar' })
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