
SMODS.Joker{ --Jax
    key = "jax",
    config = {
        extra = {
            odds = 4,
            echips0 = 0.01,
            xchips0 = 0.01,
            xmult0 = 0.01,
            emult0 = 0.01,
            odds2 = 4,
            hands0 = 1,
            discards0 = 1,
            hand_size0 = 1,
            play_size0 = 1,
            discard_size0 = 1,
            ante_value0 = 30,
            blind_size0 = 5.7e+21,
            odds3 = 4,
            consumable_slots0 = 1,
            voucher_slots0 = 1,
            booster_slots0 = 1,
            joker_slots0 = 1,
            odds4 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Jax',
        ['text'] = {
            [1] = 'Messes with your {C:attention}score, Jokers, consumables{}, and more.',
            [2] = '{C:inactive,s:0.8}\"I do everything \'cause it\'s funny! \'Cause I\'m the funny one!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:diamonds,s:0.8}TADC{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 14
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_jax')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_jax')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_jax')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_jax')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_sauce_jax')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_sauce_jax')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_sauce_jax')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_sauce_jax')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds9, 'j_sauce_jax')
        local new_numerator10, new_denominator10 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds10, 'j_sauce_jax')
        local new_numerator11, new_denominator11 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds11, 'j_sauce_jax')
        local new_numerator12, new_denominator12 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds12, 'j_sauce_jax')
        local new_numerator13, new_denominator13 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds13, 'j_sauce_jax')
        local new_numerator14, new_denominator14 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds14, 'j_sauce_jax')
        local new_numerator15, new_denominator15 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds15, 'j_sauce_jax')
        local new_numerator16, new_denominator16 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds16, 'j_sauce_jax')
        local new_numerator17, new_denominator17 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds17, 'j_sauce_jax')
        local new_numerator18, new_denominator18 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds18, 'j_sauce_jax')
        local new_numerator19, new_denominator19 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds19, 'j_sauce_jax')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9, new_numerator10, new_denominator10, new_numerator11, new_denominator11, new_numerator12, new_denominator12, new_numerator13, new_denominator13, new_numerator14, new_denominator14, new_numerator15, new_denominator15, new_numerator16, new_denominator16, new_numerator17, new_denominator17, new_numerator18, new_denominator18, new_numerator19, new_denominator19}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_aa803752', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                    SMODS.calculate_effect({e_chips = 0.01}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_8174be28', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                    SMODS.calculate_effect({x_chips = 0.01}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_9b6a121d', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                    SMODS.calculate_effect({Xmult = 0.01}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_0045bcbc', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                    SMODS.calculate_effect({e_mult = 0.01}, card)
                end
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c40631bc', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                    SMODS.calculate_effect({
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                            
                            G.GAME.round_resets.hands = 1
                            ease_hands_played(1 - G.GAME.current_round.hands_left)
                            
                            return true
                        end}, card)
                        SMODS.calculate_effect({
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Discards", colour = G.C.BLUE})
                                
                                G.GAME.round_resets.discards = 1
                                ease_discard(1 - G.GAME.current_round.discards_left)
                                
                                return true
                            end}, card)
                        end
                        if SMODS.pseudorandom_probability(card, 'group_1_d795dfb1', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                            SMODS.calculate_effect({
                                func = function()
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Hand Limit set to "..tostring(1), colour = G.C.BLUE})
                                    
                                    local current_hand_size = (G.hand.config.card_limit or 0)
                                    local target_hand_size = 1
                                    local difference = target_hand_size - current_hand_size
                                    G.hand:change_size(difference)
                                    return true
                                end}, card)
                            end
                            if SMODS.pseudorandom_probability(card, 'group_2_f75c58d9', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                SMODS.calculate_effect({
                                    func = function()
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Play Size set to "..tostring(1), colour = G.C.BLUE})
                                        
                                        local current_play_size = (G.GAME.starting_params.play_limit or 0)
                                        local target_play_size = 1
                                        local difference = target_play_size - current_play_size
                                        SMODS.change_play_limit(difference)
                                        return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_3_c97a10f7', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                    SMODS.calculate_effect({
                                        func = function()
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Discard Size set to "..tostring(1), colour = G.C.BLUE})
                                            
                                            local current_discard_size = (G.GAME.starting_params.discard_limit or 0)
                                            local target_discard_size = 1
                                            local difference = target_discard_size - current_discard_size
                                            SMODS.change_discard_limit(difference)
                                            return true
                                        end}, card)
                                    end
                                    if SMODS.pseudorandom_probability(card, 'group_4_bc44af78', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                        SMODS.calculate_effect({
                                            func = function()
                                                
                                                local mod = 30 - G.GAME.round_resets.ante
                                                ease_ante(mod)
                                                G.E_MANAGER:add_event(Event({
                                                    func = function()
                                                        G.GAME.round_resets.blind_ante = 30
                                                        return true
                                                    end,
                                                }))
                                                return true
                                            end}, card)
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ante set to " .. 30 .. "!", colour = G.C.YELLOW})
                                        end
                                        if SMODS.pseudorandom_probability(card, 'group_5_a4e81557', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                            SMODS.calculate_effect({
                                                func = function()
                                                    if G.GAME.blind.in_blind then
                                                        
                                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(5.7e+21).." Blind Size", colour = G.C.GREEN})
                                                        G.GAME.blind.chips = G.GAME.blind.chips * 5.7e+21
                                                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                                        G.HUD_blind:recalculate()
                                                        return true
                                                    end
                                                end}, card)
                                            end
                                            if SMODS.pseudorandom_probability(card, 'group_6_2ed4caf7', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                SMODS.calculate_effect({func = function()
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
                                                    return true
                                                end}, card)
                                            end
                                            if SMODS.pseudorandom_probability(card, 'group_7_c58be50b', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                SMODS.calculate_effect({func = function()
                                                    local target_cards = {}
                                                    for i, consumable in ipairs(G.consumeables.cards) do
                                                        table.insert(target_cards, consumable)
                                                    end
                                                    if #target_cards > 0 then
                                                        local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                                                        G.E_MANAGER:add_event(Event({
                                                            func = function()
                                                                card_to_destroy:start_dissolve()
                                                                return true
                                                            end
                                                        }))
                                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                                                    end
                                                    return true
                                                end}, card)
                                            end
                                        end
                                    end
                                    if context.starting_shop  then
                                        if true then
                                            if SMODS.pseudorandom_probability(card, 'group_0_6805f767', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                SMODS.calculate_effect({func = function()
                                                    G.E_MANAGER:add_event(Event({func = function()
                                                        G.consumeables.config.card_limit = 1
                                                        return true
                                                    end }))
                                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Consumable Slots", colour = G.C.BLUE})
                                                    return true
                                                end}, card)
                                            end
                                            if SMODS.pseudorandom_probability(card, 'group_1_6d898501', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                SMODS.calculate_effect({
                                                    func = function()
                                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Voucher Slots set to "..tostring(1), colour = G.C.BLUE})
                                                        
                                                        local current_voucher_slots = (G.GAME.modifiers.extra_vouchers or 0)
                                                        local target_voucher_slots = 1
                                                        local difference = target_voucher_slots - current_voucher_slots
                                                        SMODS.change_voucher_limit(difference)
                                                        return true
                                                    end}, card)
                                                end
                                                if SMODS.pseudorandom_probability(card, 'group_2_3e3033ae', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                    SMODS.calculate_effect({
                                                        func = function()
                                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Booster Slots set to "..tostring(1), colour = G.C.BLUE})
                                                            
                                                            local current_booster_slots = (G.GAME.modifiers.extra_boosters or 0)
                                                            local target_booster_slots = 1
                                                            local difference = target_booster_slots - current_booster_slots
                                                            SMODS.change_booster_limit(difference)
                                                            return true
                                                        end}, card)
                                                    end
                                                    if SMODS.pseudorandom_probability(card, 'group_3_7d5e8ea8', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                        SMODS.calculate_effect({func = function()
                                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring(1), colour = G.C.BLUE})
                                                            G.jokers.config.card_limit = 1
                                                            return true
                                                        end}, card)
                                                    end
                                                    if SMODS.pseudorandom_probability(card, 'group_4_31b63819', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                        SMODS.calculate_effect({func = function()
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
                                                            return true
                                                        end}, card)
                                                    end
                                                    if SMODS.pseudorandom_probability(card, 'group_5_3b283a97', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                        SMODS.calculate_effect({func = function()
                                                            local target_cards = {}
                                                            for i, consumable in ipairs(G.consumeables.cards) do
                                                                table.insert(target_cards, consumable)
                                                            end
                                                            if #target_cards > 0 then
                                                                local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                                                                G.E_MANAGER:add_event(Event({
                                                                    func = function()
                                                                        card_to_destroy:start_dissolve()
                                                                        return true
                                                                    end
                                                                }))
                                                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                                                            end
                                                            return true
                                                        end}, card)
                                                    end
                                                end
                                            end
                                            if context.destroy_card and context.destroy_card.should_destroy  then
                                                return { remove = true }
                                            end
                                            if context.individual and context.cardarea == G.play  then
                                                context.other_card.should_destroy = false
                                                if true then
                                                    if SMODS.pseudorandom_probability(card, 'group_0_5f78b028', 1, card.ability.extra.odds, 'j_sauce_jax', false) then
                                                        context.other_card.should_destroy = true
                                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                                    end
                                                end
                                            end
                                        end
                                    }