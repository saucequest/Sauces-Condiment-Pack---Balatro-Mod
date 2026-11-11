
SMODS.Back {
    key = 'conveyor_belt_sushi_deck',
    pos = { x = 1, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Conveyor Belt Sushi Deck',
        text = {
            [1] = 'When Deck selected, create a',
            [2] = '{C:attention}Perishable Food{} Joker',
            [3] = 'When {C:attention}Boss{} defeated, create another',
            [4] = '{C:attention}Perishable Food{} Joker'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'sauce_food' })
                        if new_joker then
                            new_joker:add_sticker('perishable', true)
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'sauce_food' })
                if new_joker then
                    new_joker:add_sticker('perishable', true)
                end
                return true
            end
        }))
    end
}