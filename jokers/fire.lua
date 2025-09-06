SMODS.Joker{ --FIRE!!!
    key = "fire",
    config = {
        extra = {
            gun = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'FIRE!!!',
        ['text'] = {
            [1] = 'Scored {C:attention}Burning {}cards will create a Gun Joker',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive}\"And I\'ll be sure to hit the mark!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true then
                local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'sauce_gun' })
                          if joker_card then
                              
                              
                          end
                          G.GAME.joker_buffer = 0
                          return true
                      end
                  }))
                  end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}