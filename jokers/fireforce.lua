
SMODS.Joker{ --fire force
    key = "fireforce",
    config = {
        extra = {
            hands = 3
        }
    },
    loc_txt = {
        ['name'] = 'fire force',
        ['text'] = {
            [1] = 'When {C:attention}hand{} played, add a {C:attention}Perishable Burning{}',
            [2] = 'card to {C:attention}deck and hand{}',
            [3] = 'If a {C:attention}Burning{} card has {C:red}not{}',
            [4] = 'scored in 3 hands, {C:red}destroy self{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 42
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["e_sauce_perishable"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_sauce_perishable\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.hands}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.hands = math.max(0, (card.ability.extra.hands) - 1)
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_sauce_burning
            }, G.discard, true, false, nil, true)
            
            
            base_card:set_edition("e_perishable", true)
            
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
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_sauce_burning
            }, G.discard, true, false, nil, true)
            
            
            base_card:set_edition("e_perishable", true)
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            base_card.playing_card = G.playing_card
            table.insert(G.playing_cards, base_card)
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    G.hand:emplace(base_card)
                    base_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "Added Card!",
                extra = {
                    message = "Added Card to Hand!",
                    colour = G.C.GREEN
                }
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true then
                card.ability.extra.hands = 3
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.hands or 0)) == to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}