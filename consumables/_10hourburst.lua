
SMODS.Consumable {
    key = '_10hourburst',
    set = 'item',
    pos = { x = 2, y = 0 },
    config = { 
        extra = {
            odds = 5   
        } 
    },
    loc_txt = {
        name = '10 Hour Burst',
        text = {
            [1] = '{C:green}#1# in #2#{} chance of summoning 10 Hour Burst Man'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_sauce__10hourburst')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("sauce_burstdrink")
                
                return true
            end,
        }))
        if SMODS.pseudorandom_probability(card, 'group_0_202c3b19', 1, card.ability.extra.odds, 'j_sauce__10hourburst', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_10hourburstman' })
                    if new_joker then
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_hourburst")
                    
                    return true
                end,
            }))
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}