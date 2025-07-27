SMODS.Joker{ --Tick Tock
    name = "Tick Tock",
    key = "ticktock",
    config = {
        extra = {
            xchips = 3,
            j_sauce_ticktock = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tick Tock',
        ['text'] = {
            [1] = '{X:chips,C:white}x3{} Chips if you play exactly 3 scoring cards',
            [2] = 'Creates 3 copies of itself when sold',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive}\"let me out.\"{}',
            [5] = '{C:inactive}Originates from{} {C:rare}Sonic Originals{}'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    cost = 30,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if #context.scoring_hand == 3 then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
        if context.selling_self and not context.blueprint then
                return {
                    func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker', key = 'j_sauce_ticktock' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker', key = 'j_sauce_ticktock' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker', key = 'j_sauce_ticktock' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}