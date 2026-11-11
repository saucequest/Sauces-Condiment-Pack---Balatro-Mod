
SMODS.Joker{ --Chef Two
    key = "cheftwo",
    config = {
        extra = {
            consumable_slots0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Chef Two',
        ['text'] = {
            [1] = 'Adds 2 {C:purple}Consumable {}slots and a random {C:common}{X:blue,C:white}Common{}{} Joker',
            [2] = 'when {C:attention}Boss {}Blind defeated',
            [3] = '{C:inactive,s:0.8}\"Every night, I think of people I\'ll invite!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{}{C:uncommon,s:0.8} Battle For Dream Island{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 5
    },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
                        return true
                    end }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Consumable Slot", colour = G.C.GREEN})
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
    end
}