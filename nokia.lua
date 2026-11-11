
SMODS.Joker{ --nokia
    key = "nokia",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'nokia',
        ['text'] = {
            [1] = '{C:attention}Steel{} cards cannot be {C:red}destroyed{}',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 39
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {localize((G.GAME.current_round.Suity_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.ranky_card or {}).rank or 'Ace', 'ranks')}, colours = {G.C.SUITS[(G.GAME.current_round.Suity_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.Suity_card = { suit = 'Spades' }
        G.GAME.current_round.ranky_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if SMODS.get_enhancements(removed_card)["m_steel"] == true then
                        return true
                    end
                end
                return false
            end)() then
                G.GAME.current_round.ranky_card.rank = context.other_card.base.id
                G.GAME.current_round.Suity_card.suit = context.other_card.base.suit
                local suit_prefix = G.GAME.current_round.Suity_card.suit
                local rank_suffix = G.GAME.current_round.ranky_card.id
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
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