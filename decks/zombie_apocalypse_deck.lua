
SMODS.Back {
    key = 'zombie_apocalypse_deck',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            odds = 5
        },
    },
    loc_txt = {
        name = 'Zombie Apocalypse Deck',
        text = {
            [1] = 'Begin with a {C:attention}Gun Joker{} and',
            [2] = 'an {C:attention}Eternal Zombie{}',
            [3] = 'When {C:attention}Blind {}selected, {C:green}1 in 5{}',
            [4] = 'chance to gain another {C:attention}Gun Joker{}',
            [5] = '{C:inactive}(Requires room){}'
        },
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_3ba4ef98', 1, card.ability.extra.odds, 'j_sauce_zombie_apocalypse_deck', false) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            local new_joker = SMODS.add_card({ set = 'sauce_gun' })
                            if new_joker then
                            end
                            G.GAME.joker_buffer = 0
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
                    local new_joker = SMODS.add_card({ set = 'sauce_gun' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_sauce_zombie' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}