SMODS.Joker{ --Chef Two
    key = "cheftwo",
    config = {
        extra = {
            consumable_slots = 2,
            two_scream = 0
        }
    },
    loc_txt = {
        ['name'] = 'Chef Two',
        ['text'] = {
            [1] = 'Adds 2 {C:purple}Consumable {}slots and a random {C:common}{X:blue,C:white}Common{}{} Joker',
            [2] = 'when Boss Blind defeated',
            [3] = '{C:inactive}\"Every night, I think of people I\'ll invite!\"{}',
            [4] = '{C:inactive}Originates from{}{C:uncommon} Battle For Dream Island{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 2
    },

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slots
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.consumable_slots).." Consumable Slot", colour = G.C.GREEN})
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
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                    if joker_card then
                        
                        
                    end
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
        end
        if context.selling_self  then
                play_sound("sauce_two_scream")
        end
    end
}