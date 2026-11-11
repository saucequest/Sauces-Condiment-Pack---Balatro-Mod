
SMODS.Joker{ --football
    key = "football",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'football',
        ['text'] = {
            [1] = 'Scored {C:attention}face{} cards have a {C:green}#1# in #2#{} chance',
            [2] = 'to create a {C:attention}Stone{} card',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 38
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_football') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_b2b63bd7', 1, card.ability.extra.odds, 'j_sauce_football', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_stone
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local new_card = copy_card(base_card, nil, nil, G.playing_card)
                    
                    new_card:add_to_deck()
                    
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                    
                    base_card:remove()
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            new_card:start_materialize()
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            end
        end
    end
}