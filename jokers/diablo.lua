SMODS.Joker{ --Diablo
    key = "diablo",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Diablo',
        ['text'] = {
            [1] = 'When a {C:attention}Glass{} card breaks, add 3 {C:attention}Burning {}cards to deck',
            [2] = '{C:inactive}\"The fires sing my SYMPHONY!\"{}',
            [3] = '{C:inactive}Originates from{} {C:clubs}The{} {C:diamonds}Rerun {}{C:red}UST{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card.shattered then
            return true
        end
    end
    return false
end)() then
                for i = 1, card.ability.extra.repetitions do
              local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_sauce_burning
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
          end
            end
        end
    end
}