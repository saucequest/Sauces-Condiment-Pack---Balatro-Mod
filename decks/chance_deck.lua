
SMODS.Back {
    key = 'chance_deck',
    pos = { x = 3, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Chance Deck',
        text = {
            [1] = 'Begin with a {C:attention}Flintlock{}',
            [2] = 'Whenever {C:attention}Boss {}is defeated, set',
            [3] = '{C:attention}Joker slots{} from 3-7'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            G.GAME.starting_params.joker_slots = pseudorandom('RANGE:3|7', 3, 7)
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_flintlock' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}