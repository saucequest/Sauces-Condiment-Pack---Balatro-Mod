SMODS.Joker{ --Indigo
    key = "indigo",
    config = {
        extra = {
            chips = 300,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Indigo',
        ['text'] = {
            [1] = '{C:blue}+300{} Chips if you play exactly 3 scoring cards',
            [2] = 'Creates 2 copies of itself when sold',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive}\"let me out.\"{}',
            [5] = '{C:inactive}Originates from{} {C:rare}Sonic Originals{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
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
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.scoring_hand == 3 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.selling_self  and not context.blueprint then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_sauce_ticktock" then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            
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
                    extra = {
                        func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_sauce_ticktock" then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            
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
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}