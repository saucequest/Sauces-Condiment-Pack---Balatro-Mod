
SMODS.Joker{ --White Pumpkin
    key = "whitepumpkin",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'White Pumpkin',
        ['text'] = {
            [1] = 'Add 1 {C:attention}Glass{} Card to deck',
            [2] = 'when Hand is {C:attention}drawn{}',
            [3] = 'Scored {C:attention}Glass{} cards are {C:attention}guaranteed{}',
            [4] = 'to {C:red}self-destruct{}',
            [5] = 'If hand contains 3 or more scoring {C:attention}Glass{} cards,',
            [6] = '{C:red}destroy {}all scored {C:attention}cards {}and create {C:purple}The{}',
            [7] = '{C:purple}Hanged Man{} and {C:purple}Death{}',
            [8] = '{C:inactive,s:0.8}\"Trying to get... leverage?\"{}',
            [9] = '{C:inactive,s:0.8}Originates from {}{C:planet,s:0.8}Minecraft Story Mode{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 28
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
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["c_hanged_man"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_hanged_man\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["c_death"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_death\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn  then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_glass
            }, G.discard, true, false, nil, true)
            
            
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    base_card:start_materialize()
                    G.play:emplace(base_card)
                    return true
                end
            }))
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                end,
                message = "Added Card!"
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            else
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', key = 'c_hanged_man'})                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', key = 'c_death'})                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_tarot') or nil,
                extra = {
                    message = created_consumable and localize('k_plus_tarot') or nil,
                    colour = G.C.PURPLE
                }
            }
        end
    end
}