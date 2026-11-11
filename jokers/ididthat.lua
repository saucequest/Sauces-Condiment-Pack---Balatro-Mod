
SMODS.Joker{ --5. I Did That
    key = "ididthat",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = '5. I Did That',
        ['text'] = {
            [1] = 'Discarded {C:attention}Black {}Suits and 2s',
            [2] = 'have a {C:green}1 in 3{} chance to be',
            [3] = '{C:red}destroyed {}and create a {C:attention}Steel{}',
            [4] = 'card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 36
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_ididthat') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") or context.other_card:get_id() == 2) then
                if SMODS.pseudorandom_probability(card, 'group_0_374675c7', 1, card.ability.extra.odds, 'j_sauce_ididthat', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_steel
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({remove = true,
                    message = "Destroyed!"}, card)
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