
SMODS.Joker{ --Whales Shedletsky
    key = "whalesshedletsky",
    config = {
        extra = {
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Whales Shedletsky',
        ['text'] = {
            [1] = 'Give {X:mult,C:white}X3{} Mult and apply {C:attention}Burning {}to scoring cards {C:attention}next hand{}',
            [2] = '{C:red}Destroys {}self and Jokers to the {C:attention}left and right{} of it after the hand',
            [3] = '{C:inactive,s:0.8}\"i may or may not have nuked a few whales earlier\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}',
            [5] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
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
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local target_joker = nil
            if my_pos and my_pos > 1 then
                local joker = G.jokers.cards[my_pos - 1]
                if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                    target_joker = joker
                end
            end
            
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
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local target_joker = nil
            if my_pos and my_pos < #G.jokers.cards then
                local joker = G.jokers.cards[my_pos + 1]
                if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                    target_joker = joker
                end
            end
            
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
            return {
                Xmult = 3
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}