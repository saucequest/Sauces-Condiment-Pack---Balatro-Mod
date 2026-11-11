
SMODS.Joker{ --Kinji Hakari
    key = "kinjihakari",
    config = {
        extra = {
            rank1 = 0,
            rank2 = 0,
            rank3 = 0,
            jackpot = 0,
            ijusthitthejackpot = 'Rolling...',
            handsleft = 4,
            multpot = 1,
            lastchance = 0,
            incredibleluck = 0,
            hands = 0,
            discards = 0,
            odds = 3,
            hands0 = 4,
            discards0 = 4,
            hand_size0 = 1,
            hands = 1,
            discards = 0,
            odds2 = 3,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Kinji Hakari',
        ['text'] = {
            [1] = '{C:attention,s:1.6}#1#-#2#-#3#{}',
            [2] = '{C:green,s:1.6}#5#{}',
            [3] = 'Upon a hand being {C:attention}drawn{}, select 3 numbers from 1 to 7',
            [4] = 'When {C:attention}hand played{}, attempt to hit the {C:green}Jackpot{}',
            [5] = 'If the {C:green}Jackpot {}is successfully hit, enter {C:green}Jackpot {}state for 4 rounds',
            [6] = 'During {C:green}Jackpot{}, you {C:attention}cannot die{}, instead you will {C:red}lose {}1',
            [7] = '{C:attention}hand size{} when saved from death',
            [8] = 'In {C:green}Jackpot{}, {C:attention}held {}cards have a {C:green}1 in 3 {}chance to gain a',
            [9] = '{C:green}Green Seal{}',
            [10] = 'Scored {C:green}Green Seal {}cards during {C:green}Jackpot {}will be {C:red}destroyed{}',
            [11] = 'and add {X:red,C:white}0.5{} to Hakari\'s {X:red,C:white}XMult{} he gives during {C:green}Jackpot{}',
            [12] = 'Prevent {C:attention}death {}if not in {C:green}Jackpot{}, set {C:blue}hands {}to 1',
            [13] = 'and {C:red}discards {}to 0',
            [14] = 'Played hand after a non-{C:green}Jackpot {}prevented {C:attention}death {}will have',
            [15] = 'a {C:green}1 in 256{} chance to hit the {C:green}Jackpot {}and set {C:blue}hands {}and',
            [16] = '{C:red}discards {}to 4',
            [17] = '{C:inactive}(Currently{} {X:red,C:white}X#7#{} {C:inactive}Mult){}',
            [18] = '{C:inactive,s:0.8}\"Wanna get high on my fever?\"{}',
            [19] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 50
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_kinjihakari')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_sauce_kinjihakari')
        return {vars = {card.ability.extra.rank1, card.ability.extra.rank2, card.ability.extra.rank3, card.ability.extra.jackpot, card.ability.extra.ijusthitthejackpot, card.ability.extra.handsleft, card.ability.extra.multpot, card.ability.extra.lastchance, card.ability.extra.incredibleluck, card.ability.extra.hands, card.ability.extra.discards, card.ability.extra.var1, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            if to_big((card.ability.extra.jackpot or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.rank1 = pseudorandom('RANGE:1|7', 1, 7)
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.rank2 = pseudorandom('RANGE:1|7', 1, 7)
                            return true
                        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                                card.ability.extra.rank3 = pseudorandom('RANGE:1|7', 1, 7)
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.rank1 or 0)) == to_big(1) and to_big((card.ability.extra.rank2 or 0)) == to_big(1) and to_big((card.ability.extra.rank3 or 0)) == to_big(1) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(2) and to_big((card.ability.extra.rank2 or 0)) == to_big(2) and to_big((card.ability.extra.rank3 or 0)) == to_big(2) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(3) and to_big((card.ability.extra.rank2 or 0)) == to_big(3) and to_big((card.ability.extra.rank3 or 0)) == to_big(3) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(4) and to_big((card.ability.extra.rank2 or 0)) == to_big(4) and to_big((card.ability.extra.rank3 or 0)) == to_big(4) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(5) and to_big((card.ability.extra.rank2 or 0)) == to_big(5) and to_big((card.ability.extra.rank3 or 0)) == to_big(5) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(6) and to_big((card.ability.extra.rank2 or 0)) == to_big(6) and to_big((card.ability.extra.rank3 or 0)) == to_big(6) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif (to_big((card.ability.extra.rank1 or 0)) == to_big(7) and to_big((card.ability.extra.rank2 or 0)) == to_big(7) and to_big((card.ability.extra.rank3 or 0)) == to_big(7) and to_big((card.ability.extra.jackpot or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 1
                card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpot")
                        
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_jackpottheme")
                        
                        return true
                    end,
                }))
            elseif to_big((card.ability.extra.jackpot or 0)) == to_big(1) then
                card.ability.extra.handsleft = math.max(0, (card.ability.extra.handsleft) - 1)
                return {
                    Xmult = card.ability.extra.multpot
                }
            elseif (to_big((card.ability.extra.jackpot or 0)) == to_big(1) and to_big((card.ability.extra.handsleft or 0)) == to_big(0)) then
                card.ability.extra.jackpot = 0
                card.ability.extra.ijusthitthejackpot = 'Rolling...'
                card.ability.extra.handsleft = 4
            elseif (to_big((card.ability.extra.lastchance or 0)) == to_big(1) and to_big((card.ability.extra.incredibleluck or 0)) == to_big(0)) then
                if SMODS.pseudorandom_probability(card, 'group_0_ef717c17', 1, card.ability.extra.odds, 'j_sauce_kinjihakari', true) then
                    card.ability.extra.jackpot = 1
                    card.ability.extra.incredibleluck = 1
                    card.ability.extra.ijusthitthejackpot = 'JACKPOT!!!!!'
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_jackpot")
                            
                            return true
                        end,
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_jackpottheme")
                            
                            return true
                        end,
                    }))
                    SMODS.calculate_effect({
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(4).." Hands", colour = G.C.BLUE})
                            
                            G.GAME.round_resets.hands = 4
                            ease_hands_played(4 - G.GAME.current_round.hands_left)
                            
                            return true
                        end}, card)
                        SMODS.calculate_effect({
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(4).." Discards", colour = G.C.BLUE})
                                
                                G.GAME.round_resets.discards = 4
                                ease_discard(4 - G.GAME.current_round.discards_left)
                                
                                return true
                            end}, card)
                        end
                    end
                end
                if context.end_of_round and context.game_over and context.main_eval  then
                    if to_big((card.ability.extra.jackpot or 0)) == to_big(1) then
                        return {
                            saved = true,
                            message = "Reverse Cursed Technique?!",
                            extra = {
                                
                                func = function()
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                                    
                                    G.hand:change_size(-1)
                                    return true
                                end,
                                colour = G.C.WHITE
                            }
                        }
                    elseif (to_big((card.ability.extra.jackpot or 0)) == to_big(0) and to_big((card.ability.extra.lastchance or 0)) == to_big(0)) then
                        return {
                            saved = true,
                            message = localize('k_saved_ex'),
                            extra = {
                                func = function()
                                    card.ability.extra.var1 = (card.ability.extra.var1) + 1
                                    return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                    
                                    func = function()
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                                        
                                        G.GAME.round_resets.hands = 1
                                        ease_hands_played(1 - G.GAME.current_round.hands_left)
                                        
                                        return true
                                    end,
                                    colour = G.C.GREEN,
                                    extra = {
                                        
                                        func = function()
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(0).." Discards", colour = G.C.BLUE})
                                            
                                            G.GAME.round_resets.discards = 0
                                            ease_discard(0 - G.GAME.current_round.discards_left)
                                            
                                            return true
                                        end,
                                        colour = G.C.GREEN,
                                        extra = {
                                            func = function()
                                                card.ability.extra.lastchance = 1
                                                return true
                                            end,
                                            colour = G.C.BLUE,
                                            extra = {
                                                func = function()
                                                    card.ability.extra.hands = 1
                                                    return true
                                                end,
                                                colour = G.C.BLUE
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    end
                end
                if context.individual and context.cardarea == G.hand and not context.end_of_round  then
                    if to_big((card.ability.extra.jackpot or 0)) == to_big(1) then
                        if SMODS.pseudorandom_probability(card, 'group_0_7861ba2e', 1, card.ability.extra.odds, 'j_sauce_kinjihakari', true) then
                            SMODS.calculate_effect({func = function()
                                context.other_card:set_seal("sauce_greenseal", true)
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                        end
                    end
                end
                if context.destroy_card and context.destroy_card.should_destroy  then
                    return { remove = true }
                end
                if context.individual and context.cardarea == G.play  then
                    context.other_card.should_destroy = false
                    if (context.other_card.seal == "Sauce_greenseal" and to_big((card.ability.extra.jackpot or 0)) == to_big(1)) then
                        context.other_card.should_destroy = true
                        card.ability.extra.multpot = (card.ability.extra.multpot) + 0.5
                        return {
                            message = "Destroyed!"
                        }
                    end
                end
            end
        }