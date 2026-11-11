
SMODS.Joker{ --Does Bad Things Guy
    key = "doesbadthingsguy",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Does Bad Things Guy',
        ['text'] = {
            [1] = 'Upon {C:attention}Blind {}selected, {C:red}destroy {}a random Joker',
            [2] = 'When {C:attention}destroying {}a Joker, have a {C:green}#1# in #2#{} chance',
            [3] = 'of making a {C:dark_edition}Photograph{} {C:inactive}(chance cannot be changed){}',
            [4] = '{C:inactive}(Requires room){}',
            [5] = '{C:inactive,s:0.8}\"Ooh, where’s my saw...?\"{}',
            [6] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Super {}{C:spectral,s:0.8}Mario {}{C:money,s:0.8}Logan{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 8
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_photograph"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_photograph\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_doesbadthingsguy') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
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
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_6ce9e987', 1, card.ability.extra.odds, 'j_sauce_doesbadthingsguy', true) then
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = false
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    created_joker = true
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_photograph' })
                                            if joker_card then
                                                
                                                
                                            end
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                end
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