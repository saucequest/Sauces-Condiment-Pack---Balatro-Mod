
SMODS.Joker{ --Satoru Gojo
    key = "satorugojo",
    config = {
        extra = {
            cardsinhand = 0,
            odds = 4,
            odds2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Satoru Gojo',
        ['text'] = {
            [1] = '{C:green}1 in 4{} chance to add a {C:attention}Red{} Seal card and',
            [2] = '{C:attention}Blue{} Seal card to Deck when hand is {C:attention}drawn{}',
            [3] = 'If a {C:attention}Red{} Seal and {C:attention}Blue{} Seal is in played hand,',
            [4] = '{C:red}destroy {}non-Seal scored cards, give {X:red,C:white}X1{} Mult',
            [5] = 'for {C:attention}every card{} in scored hand, and make scored',
            [6] = 'sealed cards {C:attention}Purple{} Seals',
            [7] = '{C:green}1 in 5{} chance to create {C:attention}Unlimited Void{} when a card',
            [8] = 'with a {C:attention}modifier {}is scored',
            [9] = '{C:inactive,s:0.8}\"Throughout heaven and earth, I alone am the honored one.\"{}',
            [10] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 46
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
    soul_pos = {
        x = 3,
        y = 46
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_gojodomain"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_gojodomain\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_satorugojo')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_satorugojo')
        return {vars = {(#(G.hand and G.hand.cards or {}) or 0), new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_dc64bd39', 1, card.ability.extra.odds, 'j_sauce_satorugojo', false) then
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    base_card:set_seal("Red", true)
                    
                    
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
                    
                    base_card:set_seal("Blue", true)
                    
                    
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
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.seal == "Red" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.seal == "Blue" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)()) then
                return {
                    Xmult = #(G.hand and G.hand.cards or {})
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (not (context.other_card.seal ~= nil) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.seal == "Red" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.seal == "Blue" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card.seal ~= nil then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Purple", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (context.other_card.seal ~= nil and (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and context.other_card.edition ~= nil) then
                if SMODS.pseudorandom_probability(card, 'group_0_7b861e15', 1, card.ability.extra.odds2, 'j_sauce_satorugojo', false) then
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_gojodomain' })
                            if joker_card then
                                
                                joker_card:add_sticker('eternal', true)
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