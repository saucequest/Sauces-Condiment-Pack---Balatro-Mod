
SMODS.Joker{ --Metal Sonic
    key = "metalsonic",
    config = {
        extra = {
            electricmeter = 0
        }
    },
    loc_txt = {
        ['name'] = 'Metal Sonic',
        ['text'] = {
            [1] = '{C:attention}First {}scoring card and {C:attention}Kings {}scored will',
            [2] = 'be turned into {C:attention}Steel{} Cards',
            [3] = 'All {C:attention}Jacks {}scored will be {C:red}destroyed {}and add a',
            [4] = 'random {C:enhanced}Electric {}card to your {C:attention}deck{}',
            [5] = '{C:enhanced}Electric {}cards played add 2 to the {C:attention}Electric Meter{}',
            [6] = '{C:money}Steel {}cards played add 1.5 to the {C:attention}Electric Meter{}',
            [7] = 'Reaching 30 {C:attention}Electric Meter{} will {C:red}unlock Metal\'s true potential.{}',
            [8] = '{C:attention}First {}scoring card, {C:attention}Kings{}, and {C:attention}Jacks {}{C:red}do not count{} toward',
            [9] = 'the {C:attention}Electric Meter{} when played {C:inactive}(sorry, code doesn\'t allow{}',
            [10] = '{C:inactive}me to do it!){}',
            [11] = '{C:inactive}(ELECTRIC METER:{} {C:common}#1#{}{C:inactive}){}',
            [12] = '{C:inactive,s:0.8}\"SONIC, DEAD OR ALIVE, IS MINE.\"{}',
            [13] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 2,
        y = 17
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.electricmeter}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card == context.scoring_hand[1] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "I WILL BATTLE YOU AS MANY TIMES AS IT IS NECESSARY.", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card:get_id() == 13 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "I WILL BATTLE YOU AS MANY TIMES AS IT IS NECESSARY.", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card:get_id() == 11 then
                context.other_card.should_destroy = true
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
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
                return {
                    message = "Added Card!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            elseif SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                card.ability.extra.electricmeter = (card.ability.extra.electricmeter) + 2
            elseif SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                card.ability.extra.electricmeter = (card.ability.extra.electricmeter) + 1.5
            end
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big((card.ability.extra.electricmeter or 0)) >= to_big(30) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_neometal")
                        
                        return true
                    end,
                }))
                local target_joker = card
                
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
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_neometalsonic' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_metalbuy")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_metalsell")
                    
                    return true
                end,
            }))
        end
    end
}