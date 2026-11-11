
SMODS.Joker{ --Mahito
    key = "mahito",
    config = {
        extra = {
            itadoriyuuujii = 0,
            jiheiendonka = 0,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Mahito',
        ['text'] = {
            [1] = 'Log the {C:attention}last {}scored rank',
            [2] = 'Scored cards with that rank {C:attention}next hand{}',
            [3] = 'become {C:attention}Meat{}',
            [4] = 'If a {C:attention}Meat {}card {C:attention}pair {}is played,',
            [5] = 'create a {C:spectral}Perishable {}{C:attention}Transfigured Human{}',
            [6] = 'If four or more {C:attention}Meat {}cards are played,',
            [7] = 'create a {C:spectral}Perishable {}{C:attention}Body Repel{}',
            [8] = 'After creating 5 {C:attention}Transfigured Humans{}, create',
            [9] = '{C:attention}Self-Embodiment of Perfection{}',
            [10] = '{C:inactive,s:0.8}\"I truly am... a curse!\"{}',
            [11] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        local info_queue_0 = G.P_CENTERS["m_sauce_meat"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_meat\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_sauce_transfiguredhuman"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_transfiguredhuman\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_sauce_bodyrepel"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_bodyrepel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_CENTERS["j_sauce_mahitodomain"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_mahitodomain\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_mahito') 
        return {vars = {card.ability.extra.itadoriyuuujii, card.ability.extra.jiheiendonka, localize((G.GAME.current_round.evilrank_card or {}).rank or 'Ace', 'ranks'), new_numerator, new_denominator}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.evilrank_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                G.GAME.current_round.evilrank_card.rank = context.other_card.base.id
                card.ability.extra.itadoriyuuujii = 1
            elseif (context.other_card:get_id() == 14 and to_big((card.ability.extra.itadoriyuuujii or 0)) == to_big(1)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_meat)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.itadoriyuuujii or 0)) == to_big(1) then
                return {
                    func = function()
                        card.ability.extra.itadoriyuuujii = 0
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(#context.scoring_hand) == to_big(2) and to_big((card.ability.extra.jiheiendonka or 0)) < to_big(4)) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_transfiguredhuman' })
                        if joker_card then
                            
                            joker_card:add_sticker('perishable', true)
                        end
                        
                        return true
                    end
                }))
                card.ability.extra.jiheiendonka = (card.ability.extra.jiheiendonka) + 1
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not ((G.GAME.pool_flags.sauce_truecurse or false))) then
                if SMODS.pseudorandom_probability(card, 'group_0_117c027c', 1, card.ability.extra.odds, 'j_sauce_mahito', true) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:juice_up(0.3, 0.5)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "truecurse", colour = G.C.BLUE})
                            G.GAME.pool_flags.sauce_truecurse = true
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("sauce_mahito")
                            
                            return true
                        end,
                    }))
                    local target_joker = card
                    
                    if target_joker then
                        if target_joker.ability.eternal then
                            target_joker.ability.eternal = nil
                        end
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_mahitoinstantspiritbodyofdistortedkilling' })
                            if joker_card then
                                
                                
                            end
                            
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I truly am...", colour = G.C.WHITE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "...a curse!", colour = G.C.WHITE})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "BLACK FLASH!", colour = G.C.RED})
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                end
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (G.GAME.pool_flags.sauce_truecurse or false)) then
                local target_joker = card
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_mahitoinstantspiritbodyofdistortedkilling' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            elseif (to_big(#context.scoring_hand) == to_big(2) and to_big((card.ability.extra.jiheiendonka or 0)) == to_big(4)) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_transfiguredhuman' })
                        if joker_card then
                            
                            joker_card:add_sticker('perishable', true)
                        end
                        
                        return true
                    end
                }))
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_mahitodomain' })
                        if joker_card then
                            
                            joker_card:add_sticker('eternal', true)
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                    }
                }
            else
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_bodyrepel' })
                        if joker_card then
                            
                            joker_card:add_sticker('perishable', true)
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}