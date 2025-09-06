SMODS.Joker{ --Brighteyes
    key = "brighteyes",
    config = {
        extra = {
            yes = 0,
            var1 = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brighteyes',
        ['text'] = {
            [1] = 'When Blind selected, make the leftmost Joker {C:dark_edition}Polychrome{}',
            [2] = '{C:inactive}\"Is it totes adorbs?\"{}',
            [3] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}',
            [4] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true },

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
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
                end,
                    extra = {
                        func = function()
                local target_joker = G.jokers.cards[1] or nil
                
                if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                        copied_joker:set_edition("e_polychrome", true)
                            
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                        G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                end
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
    end
}