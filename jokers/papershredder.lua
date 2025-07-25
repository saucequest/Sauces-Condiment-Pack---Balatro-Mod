SMODS.Joker{ --Paper Shredder
    name = "Paper Shredder",
    key = "papershredder",
    config = {
        extra = {
            j_joker = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Paper Shredder',
        ['text'] = {
            [1] = '{C:red}Destroys{} a random Joker when Blind selected.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 1,
    rarity = "sauce_trash",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end
                }
        end
    end
}