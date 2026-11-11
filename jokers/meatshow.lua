
SMODS.Joker{ --6. Meatshow
    key = "meatshow",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = '6. Meatshow',
        ['text'] = {
            [1] = 'If hand is atleast {C:attention}150%{} of the',
            [2] = 'Blind {C:attention}requirement {} or contains',
            [3] = 'atleast 3 {C:red}Red {}Suit cards',
            [4] = 'and is not a {C:attention}Flush {}after finishing',
            [5] = 'scoring, add a {C:attention}Meat {}card to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 35
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_meat"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_meat\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(1.5) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_meat
                }, G.discard, true, false, nil, true)
                
                
                
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
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 3
            end)() and not (context.scoring_name == "Flush")) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_meat
                }, G.discard, true, false, nil, true)
                
                
                
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