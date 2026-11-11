
SMODS.Joker{ --Water Bottle
    key = "waterbottle",
    config = {
        extra = {
            storedcards = 0,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Water Bottle',
        ['text'] = {
            [1] = 'Scored {C:attention}Drenched{} cards will be {C:attention}stored{}',
            [2] = 'When {C:attention}sold{}, add all {C:attention}stored {}cards to deck',
            [3] = '{C:inactive}(#1# Stored Cards){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 27
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 27
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.storedcards}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_sauce_drenched"] == true then
                context.other_card.should_destroy = true
                card.ability.extra.storedcards = (card.ability.extra.storedcards) + 1
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.selling_self  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_sauce_drenched
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