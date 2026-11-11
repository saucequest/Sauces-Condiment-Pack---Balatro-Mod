
SMODS.Consumable {
    key = 'roblox',
    set = 'item',
    pos = { x = 5, y = 1 },
    config = { 
        extra = {
            odds = 10   
        } 
    },
    loc_txt = {
        name = 'Roblox',
        text = {
            [1] = '{C:green}1 in 10{} chance of giving a {C:attention}Roblox {}Joker',
            [2] = '{C:inactive}(Requires room){}'
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
        if SMODS.pseudorandom_probability(card, 'group_0_8b43d29f', 1, card.ability.extra.odds, 'j_sauce_roblox', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'sauce_roblox' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
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