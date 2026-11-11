
SMODS.Back {
    key = 'refrigerator_deck',
    pos = { x = 4, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Refrigerator Deck',
        text = {
            [1] = 'Begin with all {C:attention}Frozen {}cards',
            [2] = 'and a {C:attention}Food {}Joker'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v:set_ability(G.P_CENTERS['m_sauce_frozen'])
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'sauce_food' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}