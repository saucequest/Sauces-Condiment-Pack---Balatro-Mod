
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
            [2] = '{C:inactive,s:0.8}\"The fires sing my SYMPHONY!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:clubs,s:0.8}The{} {C:diamonds,s:0.8}Rerun {}{C:red,s:0.8}UST{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
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
                for i = 1, 3 do
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_sauce_burning
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
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
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            end
        end
    end
}