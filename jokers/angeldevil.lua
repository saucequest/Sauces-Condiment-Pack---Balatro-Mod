
SMODS.Joker{ --Angel Devil
    key = "angeldevil",
    config = {
        extra = {
            lifespan = 0,
            angel = 0,
            ante_value0 = 0.1,
            hand_size0 = 3,
            hand_size = 3,
            emult0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Angel Devil',
        ['text'] = {
            [1] = 'When a card is {C:attention}discarded {}while this Joker',
            [2] = 'is selected, {C:attention}+0.1 Ante{} and gain 5 {C:attention}Lifespan{}',
            [3] = 'If selected while {C:attention}lastmost{} card is scored,',
            [4] = '{C:red}destroy {}card, use up 5 {C:attention}Lifespan{}, and gain Lifespan',
            [5] = 'equal to rank of {C:attention}destroyed {}card',
            [6] = 'If selected while {C:attention}first {}card is scored, {C:red}destroy {}card,',
            [7] = 'use up 100 {C:attention}Lifespan{}, and give  {C:attention}+3{} handsize for the round',
            [8] = 'If selected when {C:attention}first hand{} is played, use up 1,000',
            [9] = '{C:attention}Lifespan {}and give {C:dark_edition}^6{} Mult',
            [10] = '{C:inactive}(Lifespan: #1#){}',
            [11] = '{C:inactive,s:0.8}\"If I just let you die, I have this feeling you\'ll start haunting my dreams too.\"{}',
            [12] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 52
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.lifespan, card.ability.extra.angel}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if #G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" then
                return {
                    func = function()
                        card.ability.extra.lifespan = (card.ability.extra.lifespan) + 5
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            
                            local mod = 0.1
                            ease_ante(mod)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                                    return true
                                end,
                            }))
                            return true
                        end,
                        message = "Ante +" .. 0.1,
                        colour = G.C.YELLOW
                    }
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 2 and to_big((card.ability.extra.lifespan or 0)) >= to_big(5)) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 2
                return {
                    message = "Destroyed!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 3) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 3
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 4) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 4
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 5) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 5
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 6) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 6
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 7) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 7
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 8) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 8
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 9) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 9
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 10) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 10
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 11) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 11
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 12) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 12
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 13) then
                context.other_card.should_destroy = true
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 13
                return {
                    message = "Destroyed!"
                }
            elseif (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((card.ability.extra.lifespan or 0)) >= to_big(5) and context.other_card:get_id() == 14) then
                local lifespan_value = card.ability.extra.lifespan
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 5)
                card.ability.extra.lifespan = (card.ability.extra.lifespan) + 14
            elseif (context.other_card == context.scoring_hand[1] and to_big((card.ability.extra.lifespan or 0)) >= to_big(100) and #G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil") then
                context.other_card.should_destroy = true
                card.ability.extra.angel = 1
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 100)
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(3)
                        return true
                    end,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.angel or 0)) == to_big(1) then
                return {
                    func = function()
                        card.ability.extra.angel = 0
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(3).." Hand Limit", colour = G.C.BLUE})
                            
                            G.hand:change_size(-3)
                            return true
                        end,
                        colour = G.C.WHITE
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_angeldevil" and to_big((card.ability.extra.lifespan or 0)) == to_big(1000)) then
                card.ability.extra.lifespan = math.max(0, (card.ability.extra.lifespan) - 1000)
                return {
                    e_mult = 6
                }
            end
        end
    end
}