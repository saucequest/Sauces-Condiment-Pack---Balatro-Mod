SMODS.Joker{ --Jax
    key = "jax",
    config = {
        extra = {
            odds = 4,
            echips = 0.01,
            xchips = 0.01,
            Xmult = 0.01,
            emult = 0.01,
            odds2 = 4,
            hands = 1,
            discards = 0,
            hand_size = 1,
            play_size = 1,
            play_size2 = 1,
            ante_value = 30,
            blind_size = 5.7e+21,
            odds3 = 4,
            consumable_slots = 0,
            voucher_slots = 0,
            booster_slots = 0,
            joker_slots = 1,
            odds4 = 4,
            permanent = 0,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jax',
        ['text'] = {
            [1] = 'Messes with your score, Jokers, consumables, and more.',
            [2] = '{C:inactive}\"I do everything \'cause it\'s funny! \'Cause I\'m the funny one!\"{}',
            [3] = '{C:inactive}Originates from{} {C:diamonds}TADC{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 4
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_aa803752', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({e_chips = card.ability.extra.echips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_8174be28', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_9b6a121d', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_0045bcbc', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                  end
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c40631bc', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.hands).." Hands", colour = G.C.BLUE})
                
        G.GAME.round_resets.hands = card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands - G.GAME.current_round.hands_left)
        
                return true
            end}, card)
                        SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.discards).." Discards", colour = G.C.BLUE})
                
        G.GAME.round_resets.discards = card.ability.extra.discards
        ease_discard(card.ability.extra.discards - G.GAME.current_round.discards_left)
        
                G.GAME.round_resets.hands = card.ability.extra.discards
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_d795dfb1', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local current_hand_size = G.hand.config.card_limit
                local target_hand_size = card.ability.extra.hand_size
                local difference = target_hand_size - current_hand_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Hand Size set to "..tostring(card.ability.extra.hand_size), colour = G.C.BLUE})
                G.hand:change_size(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_f75c58d9', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local current_play_size = G.GAME.starting_params.play_limit
                local target_play_size = card.ability.extra.play_size
                local difference = target_play_size - current_play_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Play Size set to "..tostring(card.ability.extra.play_size), colour = G.C.BLUE})
                SMODS.change_play_limit(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_c97a10f7', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local current_play_size = G.GAME.starting_params.discard_limit
                local target_play_size = card.ability.extra.play_size
                local difference = target_play_size - current_play_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Play Size set to "..tostring(card.ability.extra.play_size), colour = G.C.BLUE})
                SMODS.change_discard_limit(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_4_bc44af78', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                    local mod = card.ability.extra.ante_value - G.GAME.round_resets.ante
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = card.ability.extra.ante_value
				return true
			end,
		}))
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ante set to " .. card.ability.extra.ante_value .. "!", colour = G.C.FILTER})
                  end
                if SMODS.pseudorandom_probability(card, 'group_5_a4e81557', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_6_2ed4caf7', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
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
                if SMODS.pseudorandom_probability(card, 'group_7_c58be50b', 1, card.ability.extra.odds, 'j_sauce_jax') then
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
                if SMODS.pseudorandom_probability(card, 'group_0_6805f767', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = card.ability.extra.consumable_slots
                    return true
                end }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.consumable_slots).." Consumable Slots", colour = G.C.BLUE})
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_6d898501', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local current_voucher_slots = G.GAME.modifiers.extra_vouchers or 0
                local target_voucher_slots = card.ability.extra.voucher_slots
                local difference = target_voucher_slots - current_voucher_slots
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Voucher Slots set to "..tostring(card.ability.extra.voucher_slots), colour = G.C.BLUE})
                SMODS.change_voucher_limit(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_3e3033ae', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local current_booster_slots = G.GAME.modifiers.extra_boosters
                local target_booster_slots = card.ability.extra.booster_slots
                local difference = target_booster_slots - current_booster_slots
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Booster Slots set to "..tostring(card.ability.extra.booster_slots), colour = G.C.BLUE})
                SMODS.change_booster_limit(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_7d5e8ea8', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring(card.ability.extra.joker_slots), colour = G.C.BLUE})
                G.jokers.config.card_limit = card.ability.extra.joker_slots
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_4_31b63819', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      SMODS.calculate_effect({func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
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
                if SMODS.pseudorandom_probability(card, 'group_5_3b283a97', 1, card.ability.extra.odds, 'j_sauce_jax') then
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
                if SMODS.pseudorandom_probability(card, 'group_0_5f78b028', 1, card.ability.extra.odds, 'j_sauce_jax') then
                      context.other_card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
            end
        end
    end
}