SMODS.Joker{ --Rouxls Kaard
    key = "rouxlskaard",
    config = {
        extra = {
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Rouxls Kaard',
        ['text'] = {
            [1] = 'Creates a {C:tarot}Rules Card{} when Blind is selected',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive}\"Geh ha ha ha ha! Thoust FOOLS!\"{}',
            [4] = '{C:inactive}Originates from{} {C:common}DELTARUNE{}',
            [5] = '{C:dark_edition}Follower-suggested{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 3
    },

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_sauce_rulescard', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end
                }
        end
    end
}