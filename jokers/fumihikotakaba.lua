
SMODS.Joker{ --Fumihiko Takaba
    key = "fumihikotakaba",
    config = {
        extra = {
            comedian = 0,
            hands0_min = NaN,
            hands0_max = 3,
            discards0_min = NaN,
            discards0_max = 2,
            hand_size0_min = NaN,
            hand_size0_max = 5,
            hand_size_min = NaN,
            hand_size_max = 5,
            joker_slots0 = 1.5,
            odds = 6,
            odds2 = 4,
            odds3 = 2,
            emult0_min = NaN,
            emult0_max = 9.9,
            xmult0_min = NaN,
            xmult0_max = 10,
            mult0_min = NaN,
            mult0_max = 50,
            odds2 = 2,
            odds3 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Fumihiko Takaba',
        ['text'] = {
            [1] = 'Do a {C:dark_edition}random effect{}, whenever it wants',
            [2] = '{C:inactive,s:0.8}\"Don\'t marry me! I don\'t want you as my wi-fi!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 49
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 49
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_fumihikotakaba')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_fumihikotakaba')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_sauce_fumihikotakaba')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_sauce_fumihikotakaba')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_sauce_fumihikotakaba')
        return {vars = {card.ability.extra.comedian, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if to_big((card.ability.extra.comedian or 0)) == to_big(1) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_slip")
                        
                        return true
                    end,
                }))
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(pseudorandom('RANGE:1|3', 1, 3)).." Hands", colour = G.C.RED})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands - pseudorandom('RANGE:1|3', 1, 3)
                        ease_hands_played(-pseudorandom('RANGE:1|3', 1, 3))
                        
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(pseudorandom('RANGE:1|2', 1, 2)).." Discards", colour = G.C.RED})
                            
                            G.GAME.round_resets.discards = G.GAME.round_resets.discards - pseudorandom('RANGE:1|2', 1, 2)
                            ease_discard(-pseudorandom('RANGE:1|2', 1, 2))
                            
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.comedian = 0
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                }
            elseif to_big((card.ability.extra.comedian or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.comedian = pseudorandom('RANGE:1|5', 1, 5)
                        return true
                    end
                }
            elseif to_big((card.ability.extra.comedian or 0)) == to_big(2) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_slip")
                        
                        return true
                    end,
                }))
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|5', 1, 5)).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(pseudorandom('RANGE:1|5', 1, 5))
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(pseudorandom('RANGE:1|5', 1, 5)).." Hand Limit", colour = G.C.BLUE})
                            
                            G.hand:change_size(-pseudorandom('RANGE:1|5', 1, 5))
                            return true
                        end,
                        colour = G.C.WHITE,
                        extra = {
                            func = function()
                                card.ability.extra.comedian = 0
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                }
            elseif to_big((card.ability.extra.comedian or 0)) == to_big(3) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_toonbite")
                        
                        return true
                    end,
                }))
                return {
                    func = function()
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
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1.5).." Joker Slot", colour = G.C.DARK_EDITION})
                            G.jokers.config.card_limit = G.jokers.config.card_limit + 1.5
                            return true
                        end,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            func = function()
                                card.ability.extra.comedian = 0
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2a6d29ba', 1, card.ability.extra.odds, 'j_sauce_fumihikotakaba', false) then
                    SMODS.calculate_effect({e_mult = pseudorandom('RANGE:1.1|9.9', 1.1, 9.9)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_ce9d1404', 1, card.ability.extra.odds2, 'j_sauce_fumihikotakaba', false) then
                    SMODS.calculate_effect({Xmult = pseudorandom('RANGE:1.1|10', 1.1, 10)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_1b6aad63', 1, card.ability.extra.odds3, 'j_sauce_fumihikotakaba', false) then
                    SMODS.calculate_effect({mult = pseudorandom('RANGE:1|50', 1, 50)}, card)
                end
            end
        end
        if context.setting_blind  then
            if G.GAME.blind.boss then
                if SMODS.pseudorandom_probability(card, 'group_0_52dbeae0', 1, card.ability.extra.odds3, 'j_sauce_fumihikotakaba', false) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_bonk")
                            
                            return true
                        end,
                    }))
                    SMODS.calculate_effect({func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_1bf8d7c4', 1, card.ability.extra.odds2, 'j_sauce_fumihikotakaba', false) then
                    if #G.jokers.cards > 0 then
                        for _, joker in ipairs(G.jokers.cards) do
                            joker:flip()
                        end
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_toonrun")
                            
                            return true
                        end,
                    }))
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Flip!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shuffle!", colour = G.C.ORANGE})
                end
            end
        end
    end
}