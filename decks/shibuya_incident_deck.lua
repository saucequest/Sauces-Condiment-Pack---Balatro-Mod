
SMODS.Back {
    key = 'shibuya_incident_deck',
    pos = { x = 2, y = 1 },
    config = {
        extra = {
            currentante = 0
        },
    },
    loc_txt = {
        name = 'Shibuya Incident Deck',
        text = {
            [1] = 'I just felt {C:attention}Sukuna\'s {}presence...',
            [2] = 'what the hell is happening in {C:red}Shibuya{}?!'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = true,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if to_big(G.GAME.round_resets.ante) == to_big(1) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_yujiitadori' })
                            if new_joker then
                                new_joker:set_edition("e_negative", true)
                                new_joker:add_sticker('eternal', true)
                            end
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_harutashigemo' })
                        if new_joker then
                            new_joker:set_edition("e_negative", true)
                            new_joker:add_sticker('perishable', true)
                        end
                        return true
                    end
                }))
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if to_big(G.GAME.round_resets.ante) == to_big(2) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_ryomensukuna' })
                            if new_joker then
                                new_joker:set_edition("e_negative", true)
                            end
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_megumifushiguro' })
                        if new_joker then
                            new_joker:set_edition("e_negative", true)
                            new_joker:add_sticker('perishable', true)
                        end
                        return true
                    end
                }))
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if to_big(G.GAME.round_resets.ante) == to_big(3) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_mahoraga' })
                        if new_joker then
                            new_joker:set_edition("e_negative", true)
                        end
                        return true
                    end
                }))
            end
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_satorugojo' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                        new_joker:add_sticker('perishable', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}