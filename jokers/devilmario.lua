
SMODS.Joker{ --Devil Mario
    key = "devilmario",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Devil Mario',
        ['text'] = {
            [1] = 'When a {C:attention}card {}is bought, {C:red}destroy{}',
            [2] = 'a owned {C:attention}consumable {}and create a',
            [3] = '{C:attention}Wild Jack{} with a random {C:attention}Seal{}',
            [4] = '{C:inactive,s:0.8}\"The vulnerable state your kingdom is in now, only invites attack.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Power {}{C:red,s:0.8}Star{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 8,
        y = 7
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
            local rank_suffix = 'J'
            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_wild
            }, G.discard, true, false, nil, true)
            
            base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','sauce_rage_seal','sauce_chud','sauce_discord_ping','sauce_marked','sauce_greenseal','sauce_yellowseal','sauce_lavenderseal'}, pseudoseed('add_card_hand_seal')), true)
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            return {
                func = function()
                    local target_cards = {}
                    for i, consumable in ipairs(G.consumeables.cards) do
                        table.insert(target_cards, consumable)
                    end
                    if #target_cards > 0 then
                        local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card_to_destroy:start_dissolve()
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end,
                    message = "Added Card!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}