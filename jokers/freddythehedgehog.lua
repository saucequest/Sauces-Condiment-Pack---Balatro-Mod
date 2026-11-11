
SMODS.Joker{ --Freddy the Hedgehog
    key = "freddythehedgehog",
    config = {
        extra = {
            odds = 3,
            odds2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Freddy the Hedgehog',
        ['text'] = {
            [1] = 'Scored {C:attention}Face {}cards have a {C:green}#1# in #2#{}',
            [2] = 'chance to be {C:red}destroyed {}and {C:attention}create {}an',
            [3] = '{C:attention}Electric {}card',
            [4] = 'Scored {C:attention}Electric {}cards have a {C:green}#3# in #4#{}',
            [5] = 'chance of turning {C:attention}Freddy the Hedgehog{}',
            [6] = 'into {C:attention}Bear5 the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 32
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_bear5thehedgehog"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_bear5thehedgehog\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_freddythehedgehog')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_freddythehedgehog')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_2c4ee941', 1, card.ability.extra.odds, 'j_sauce_freddythehedgehog', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_sauce_electric
                    }, G.discard, true, false, nil, true)
                    
                    
                    
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_2c4ee941', 1, card.ability.extra.odds, 'j_sauce_freddythehedgehog', false) then
                    context.other_card.should_destroy = true
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_sauce_electric
                    }, G.discard, true, false, nil, true)
                    
                    
                    
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                end
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_1a24cf2e', 1, card.ability.extra.odds2, 'j_sauce_freddythehedgehog', false) then
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:explode({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_bear5thehedgehog' })
                            if joker_card then
                                
                                
                            end
                            
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                end
            end
        end
    end
}