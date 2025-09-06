SMODS.Joker{ --Heart Stealing Girl
    key = "heartstealinggirl",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Heart Stealing Girl',
        ['text'] = {
            [1] = 'Scored {C:hearts}Heart{} cards will be destroyed and',
            [2] = 'give a random {C:spectral}Spectral{}',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive}\"Heart is palpating, with anticipation!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Hearts") then
                context.other_card.should_destroy = true
                local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Spectral', key = nil, key_append = 'joker_forge_spectral'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}