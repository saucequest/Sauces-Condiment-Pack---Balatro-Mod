
SMODS.Joker{ --Unlike You
    key = "unlikeyou",
    config = {
        extra = {
            neglectedson = 10,
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'Unlike You',
        ['text'] = {
            [1] = '{C:attention}Kings {}scored have a {C:green}#2# in #3#{}',
            [2] = 'chance to be {C:red}destroyed{}',
            [3] = 'When {C:attention}destroying {}a King, create',
            [4] = 'an {C:enhanced}Enhanced{} Jack and {C:attention}lower{}',
            [5] = 'this Joker\'s {C:attention}denominator {}by 1',
            [6] = 'If {C:attention}denominator {}is 2, reset',
            [7] = 'denominator'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 43
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_unlikeyou') 
        return {vars = {card.ability.extra.neglectedson, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 13 then
                if SMODS.pseudorandom_probability(card, 'group_0_64ed3bd7', 1, card.ability.extra.odds, 'j_sauce_unlikeyou', false) then
                    card.ability.extra.neglectedson = math.max(0, (card.ability.extra.neglectedson) - 1)
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = 'J'
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_64ed3bd7', 1, card.ability.extra.odds, 'j_sauce_unlikeyou', false) then
                    context.other_card.should_destroy = true
                    card.ability.extra.neglectedson = math.max(0, (card.ability.extra.neglectedson) - 1)
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = 'J'
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            elseif to_big((card.ability.extra.neglectedson or 0)) == to_big(2) then
                card.ability.extra.neglectedson = 10
            end
        end
    end
}