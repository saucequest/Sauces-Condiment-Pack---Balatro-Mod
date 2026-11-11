
SMODS.Consumable {
    key = 'thechineseroom',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    loc_txt = {
        name = 'The Chinese Room',
        text = {
            [1] = '{C:inactive}What does it do? I\'m not sure.{}',
            [2] = '{C:inactive}I\'ve never personally been inside; really.{}',
            [3] = '{C:inactive}I believe it\'s a Chinese mentor who will{}',
            [4] = '{C:inactive}give me advice!{}',
            [5] = '{C:inactive}But who knows?{}'
        }
    },
    cost = 7,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'sauce_unnatural' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                        new_joker:add_sticker('perishable', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}