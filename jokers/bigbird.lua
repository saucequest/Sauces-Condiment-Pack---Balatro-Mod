
SMODS.Joker{ --Big Bird
    key = "bigbird",
    config = {
        extra = {
            xmult0 = 1.5,
            joker_slots0 = 1,
            repetitions = 99,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Big Bird',
        ['text'] = {
            [1] = 'Marks the {C:attention}first {}scoring card with a {C:attention}Red{} Seal',
            [2] = 'Scored {C:attention}Red{} Seals will be {C:red}destroyed {}and give {X:mult,C:white}X1.5{} Mult',
            [3] = '{C:inactive,s:0.8}\"A month later, we came to this conclusion: There was no such “beast” in the forest.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Lobotomy {}{C:attention,s:0.8}Corporation{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (not (context.other_card.seal == "Red") and context.other_card == context.scoring_hand[1]) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card.seal == "Red" then
                context.other_card.should_destroy = true
                return {
                    Xmult = 1.5,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_judgementbird" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_punishingbird" then 
                        return true
                    end
                end
            end)()) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_birdup")
                        SMODS.calculate_effect({message = "Bird up!"}, card)
                        return true
                    end,
                }))
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring(1), colour = G.C.BLUE})
                        G.jokers.config.card_limit = 1
                        return true
                    end
                    ,
                    func = function()
                        for i = 1, 99 do
                            SMODS.calculate_effect({func = function()
                                local target_joker = card
                                
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
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    play_sound("sauce_birdup")
                                    
                                    return true
                                end,
                            }))
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_apocalypsebird' })
                                        if joker_card then
                                            
                                            joker_card:add_sticker('eternal', true)
                                        end
                                        
                                        return true
                                    end
                                }))
                                
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}