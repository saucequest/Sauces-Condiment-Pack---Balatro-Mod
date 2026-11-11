
SMODS.Back {
    key = 'bucket_of_doomed_souls_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Bucket of Doomed Souls Deck',
        text = {
            [1] = 'Start off with an {C:attention}Eternal Cursed{} Joker',
            [2] = 'When {C:attention}Boss{} defeated, create another {C:attention}Eternal{}',
            [3] = '{C:attention}Cursed{} Joker',
            [4] = 'Winning {C:attention}Ante{} is 4'
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
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
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
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.win_ante = 4
    end
}