
SMODS.Joker{ --Cream
    key = "cream",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Cream',
        ['text'] = {
            [1] = 'Creates a {C:purple}consumable {}when {C:attention}Blind {}selected',
            [2] = 'Creates a {C:attention}Food Joker{} when {C:attention}Boss {}Blind defeated',
            [3] = '{C:inactive,s:0.8}\"I\'m gonna put on the biggest smile I can and share it with everyone!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 0,
        y = 7
    },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                local sets = {'Tarot', 'Planet', 'Spectral'}
                                local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                SMODS.add_card({ set = random_set, })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'sauce_food' })
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
                end
            }
        end
    end
}