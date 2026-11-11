
SMODS.Joker{ --Hatred
    key = "hatred",
    config = {
        extra = {
            howfoolish = 0,
            levels0 = 5,
            repetitions = 99
        }
    },
    loc_txt = {
        ['name'] = 'Hatred',
        ['text'] = {
            [1] = 'When a {C:red}Red {}Suit Ace or {C:attention}Face {}card',
            [2] = 'is scored, {C:red}destroy {}a Joker and',
            [3] = 'create an {C:enhanced}Enhanced{} Ace',
            [4] = 'If hand is a {C:red}Red {}Suit Flush, {C:red}destroy {}all',
            [5] = 'scored {C:attention}Face {}cards and {C:attention}Jokers {}and level',
            [6] = 'up {C:attention}Flush {}by 5',
            [7] = '{C:inactive,s:0.8}\"FOR I AM THE SCOURGE OF EVERYONE THAT YOU CANNOT HIDE\"{}',
            [8] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 35
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sin"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.howfoolish}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") and context.other_card:get_id() == 14) then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
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
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'A'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
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
                return {
                    message = "Added Card!"
                }
            elseif (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") and context.other_card:is_face()) then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
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
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'A'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
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
                return {
                    message = "Added Card!"
                }
            elseif (context.other_card:is_face() and to_big((card.ability.extra.howfoolish or 0)) == to_big(1)) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() and context.scoring_name == "Flush") then
                card.ability.extra.howfoolish = 1
                local target_hand = "Flush"
                level_up_hand(card, target_hand, true, 5)
                return {
                    message = localize('k_level_up_ex')
                    ,
                    func = function()
                        for i = 1, 99 do
                            local destructable_jokers = {}
                            for i, joker in ipairs(G.jokers.cards) do
                                if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                    table.insert(destructable_jokers, joker)
                                end
                            end
                            local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                            
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
                            
                        end
                        return true
                    end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.howfoolish = 1
                    return true
                end
            }
        end
    end
}