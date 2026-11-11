
SMODS.Joker{ --She Gon Call Me Baby Boo
    key = "shegoncallmebabyboo",
    config = {
        extra = {
            babyboo = 0,
            odds = 2,
            odds2 = 2,
            odds3 = 2,
            odds4 = 2,
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'She Gon Call Me Baby Boo',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance for first {C:attention}four {}scored',
            [2] = 'cards to say{C:attention} she gon call me baby boo{}',
            [3] = 'If all chances {C:attention}succeed{}, add two {C:attention}Jacks {}to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 45
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_shegoncallmebabyboo')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_shegoncallmebabyboo')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_shegoncallmebabyboo')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_shegoncallmebabyboo')
        return {vars = {card.ability.extra.babyboo, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                if SMODS.pseudorandom_probability(card, 'group_0_7689a7be', 1, card.ability.extra.odds, 'j_sauce_shegoncallmebabyboo', false) then
                    card.ability.extra.babyboo = 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_shegon")
                            SMODS.calculate_effect({message = "She gon"}, card)
                            return true
                        end,
                    }))
                    
                end
            elseif context.other_card == context.scoring_hand[2] then
                if SMODS.pseudorandom_probability(card, 'group_0_c5bf3682', 1, card.ability.extra.odds, 'j_sauce_shegoncallmebabyboo', false) then
                    card.ability.extra.babyboo = 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_callme")
                            SMODS.calculate_effect({message = "call me"}, card)
                            return true
                        end,
                    }))
                    
                end
            elseif context.other_card == context.scoring_hand[3] then
                if SMODS.pseudorandom_probability(card, 'group_0_d3fefe96', 1, card.ability.extra.odds, 'j_sauce_shegoncallmebabyboo', false) then
                    card.ability.extra.babyboo = 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_baby")
                            SMODS.calculate_effect({message = "baby"}, card)
                            return true
                        end,
                    }))
                    
                end
            elseif context.other_card == context.scoring_hand[4] then
                if SMODS.pseudorandom_probability(card, 'group_0_d798852e', 1, card.ability.extra.odds, 'j_sauce_shegoncallmebabyboo', false) then
                    card.ability.extra.babyboo = 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_boo")
                            SMODS.calculate_effect({message = "boo"}, card)
                            return true
                        end,
                    }))
                    
                end
            elseif (context.other_card == context.scoring_hand[5] and to_big((card.ability.extra.babyboo or 0)) == to_big(1)) then
                for i = 1, 2 do
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = 'J'
                    local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
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
            end
        end
        if context.pseudorandom_result  and not context.blueprint then
            if not context.result then
                return {
                    func = function()
                        card.ability.extra.babyboo = 0
                        return true
                    end
                }
            end
        end
    end
}