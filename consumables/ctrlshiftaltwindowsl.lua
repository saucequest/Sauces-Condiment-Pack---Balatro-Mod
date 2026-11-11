
SMODS.Consumable {
    key = 'ctrlshiftaltwindowsl',
    set = 'keyboard_shortcut',
    pos = { x = 4, y = 3 },
    config = { 
        extra = {
            repetitions = 5   
        } 
    },
    loc_txt = {
        name = 'Ctrl + Shift + Alt + Windows + L',
        text = {
            [1] = 'Create 5 {C:dark_edition}Negative {}{C:attention}Jokers{}',
            [2] = '{C:inactive}(Only works if Job Application has{}',
            [3] = '{C:inactive}been used){}'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if (G.GAME.pool_flags.sauce_jobacquired or false) then
            for i = 1, 5 do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            local new_joker = SMODS.add_card({ set = 'Joker' })
                            if new_joker then
                                new_joker:set_edition("e_negative", true)
                            end
                            G.GAME.joker_buffer = 0
                        end
                        used_card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                delay(0.6)
                
            end
        end
    end,
    can_use = function(self, card)
        return ((G.GAME.pool_flags.sauce_jobacquired or false))
    end
}