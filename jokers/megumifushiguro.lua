
SMODS.Joker{ --Megumi Fushiguro
    key = "megumifushiguro",
    config = {
        extra = {
            tenshadows = 0,
            potentialman = 'No shadow currently selected',
            chips0 = 10,
            pb_mult_83d2f4cd = 4,
            pb_x_mult_d4298a0b = 1.25,
            odds = 3,
            repetitions = 10
        }
    },
    loc_txt = {
        ['name'] = 'Megumi Fushiguro',
        ['text'] = {
            [1] = '{C:attention}Randomly {}switch to a random shadow',
            [2] = 'of the {C:attention}10 Shadows{} Technique whenever Blind',
            [3] = 'is selected',
            [4] = '#2#',
            [5] = 'Upon death, revive, {C:attention}self-destruct{}, and summon',
            [6] = '{C:attention}Mahoraga{}',
            [7] = '{C:inactive,s:0.8}“I’ll kill you if you die again!”{}',
            [8] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_drenched"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_drenched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_sauce_megumidomain"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_megumidomain\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_CENTERS["j_sauce_mahoraga"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_mahoraga\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_megumifushiguro') 
        return {vars = {card.ability.extra.tenshadows, card.ability.extra.potentialman, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    card.ability.extra.tenshadows = pseudorandom('RANGE:1|7', 1, 7)
                    return true
                end
            }
        end
        if context.hand_drawn  then
            if to_big((card.ability.extra.tenshadows or 0)) == to_big(1) then
                card.ability.extra.potentialman = 'Divine Dog: Totality - Cards scored give +10 Chips if hand contains 2 Suits or more'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(2) then
                card.ability.extra.potentialman = 'Nue - Scored cards gain Electric if atleast 3 face cards are in played hand'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(3) then
                card.ability.extra.potentialman = 'Great Serpent - Held face cards give +4 Mult'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(4) then
                card.ability.extra.potentialman = 'Toad - Discarded cards have 1 in 3 chance to gain Green Seal'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(5) then
                card.ability.extra.potentialman = 'Max Elephant - Scored cards gain Drenched, held cards gain X1.25 Mult'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(6) then
                card.ability.extra.potentialman = 'Rabbit Escape - Create 10 Negative Perishable Jimbos if played hand contains a Black Suit'
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(7) then
                card.ability.extra.potentialman = 'Chimera Shadow Garden - Domain Expansion: Chimera Shadow Garden'
                return {
                    func = function()
                        local target_joker = G.P_CENTERS["j_sauce_megumidomain"]
                        if target_joker then
                            unlock_card(target_joker)
                            discover_card(target_joker)
                            
                        else
                            error("JOKERFORGE: Invalid joker key in Unlock Joker Effect. Did you forget the modprefix or misspelled the key?")
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_megumidomain' })
                                    if joker_card then
                                        
                                        
                                    end
                                    
                                    return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (to_big((card.ability.extra.tenshadows or 0)) == to_big(1) and (function()
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
            end)()) then
                return {
                    chips = 10
                }
            elseif (to_big((card.ability.extra.tenshadows or 0)) == to_big(2) and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 3
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_electric)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(5) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_drenchedintears)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (context.other_card:is_face() and to_big((card.ability.extra.tenshadows or 0)) == to_big(3)) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 4
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            elseif to_big((card.ability.extra.tenshadows or 0)) == to_big(5) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 1.25
            end
        end
        if context.discard  then
            if to_big((card.ability.extra.tenshadows or 0)) == to_big(4) then
                if SMODS.pseudorandom_probability(card, 'group_0_f2722054', 1, card.ability.extra.odds, 'j_sauce_megumifushiguro', false) then
                    SMODS.calculate_effect({func = function()
                        context.other_card:set_seal("sauce_greenseal", true)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.tenshadows or 0)) == to_big(6) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                for i = 1, 10 do
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                joker_card:add_sticker('perishable', true)
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