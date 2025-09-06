SMODS.Consumable {
    key = 'c00lgui',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    config = { extra = {
        consumable_count = 1,
        odds = 5
    } },
    loc_txt = {
        name = 'c00lgui',
        text = {
        [1] = 'Creates a random {C:tarot}consumable{} when used',
        [2] = '{C:green}1 in 5{} chance to make a random {C:common}Common {}Joker',
        [3] = '{C:inactive}(Requires room){}'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            local sets = {'Tarot', 'Planet', 'Spectral'}
                            local random_set = pseudorandom_element(sets, 'random_consumable_set')
                            SMODS.add_card({ set = random_set })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
            if SMODS.pseudorandom_probability(card, 'group_0_5d32d506', 1, card.ability.extra.odds, 'c_sauce_c00lgui', false) then
                
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
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