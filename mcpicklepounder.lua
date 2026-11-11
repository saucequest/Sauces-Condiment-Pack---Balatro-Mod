
SMODS.Joker{ --McPickle Pounder
    key = "mcpicklepounder",
    config = {
        extra = {
            pickles = 0,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'McPickle Pounder',
        ['text'] = {
            [1] = '{C:attention}Drawn hands{} have a {C:green}#2# in #3#{} chance to',
            [2] = 'add 2 {C:green}Green {}Seals to {C:attention}deck{}',
            [3] = 'Once 6 {C:green}Green {}Seals have been {C:attention}added{},',
            [4] = '{C:red}destroy{} self',
            [5] = '{C:inactive,s:0.8}\"I asked for no pickles and they gave me the fucking MCPICKLE POUNDER.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_mcpicklepounder') 
        return {vars = {card.ability.extra.pickles, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            if to_big((card.ability.extra.pickles or 0)) < to_big(6) then
                if SMODS.pseudorandom_probability(card, 'group_0_a9f529d9', 1, card.ability.extra.odds, 'j_sauce_mcpicklepounder', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    base_card:set_seal("sauce_greenseal", true)
                    
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            base_card:start_materialize()
                            G.play:emplace(base_card)
                            return true
                        end
                    }))
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    base_card:set_seal("sauce_greenseal", true)
                    
                    
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
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.pickles = (card.ability.extra.pickles) + 2
                        return true
                    end}, card)
                end
            elseif to_big((card.ability.extra.pickles or 0)) >= to_big(6) then
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