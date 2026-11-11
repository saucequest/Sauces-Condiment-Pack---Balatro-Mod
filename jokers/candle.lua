
SMODS.Joker{ --Candle
    key = "candle",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Candle',
        ['text'] = {
            [1] = 'When a {C:tarot}Tarot{} is {C:attention}used{}, grant a {C:attention}Polychrome{}',
            [2] = '{C:attention}Burning {}card',
            [3] = '{C:inactive,s:0.8}\"It seems the day of betrayal has concluded.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Inanimate {}{C:money,s:0.8}Insanity{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_polychrome"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_polychrome\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
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
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_burning
                }, G.discard, true, false, nil, true)
                
                
                base_card:set_edition("e_polychrome", true)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                return {
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
                    message = "Added Card!"
                }
            end
        end
    end
}