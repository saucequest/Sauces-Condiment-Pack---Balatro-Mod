SMODS.Joker{ --007n7
    key = "007n7",
    config = {
        extra = {
            clonecooldown = 0,
            perishable = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = '007n7',
        ['text'] = {
            [1] = 'Makes a {C:tarot}c00lgui {}when a Blind is selected',
            [2] = 'Creates a perishable copy of itself every 3 rounds',
            [3] = '{C:inactive}\"all your base are belong 2 us\"{}',
            [4] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
            if (card.ability.extra.clonecooldown or 0) == 3 then
                return {
                    func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_007n7' })
                    if joker_card then
                        
                        joker_card:add_sticker('perishable', true)
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
                    extra = {
                        func = function()
                    card.ability.extra.clonecooldown = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.clonecooldown = (card.ability.extra.clonecooldown) + 1
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_sauce_c00lgui', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                        colour = G.C.PURPLE
                        }
                }
            end
        end
    end
}