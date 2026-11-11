
SMODS.Joker{ --The Great Floccinaucinihilipilification
    key = "thegreatfloccinaucinihilipilification",
    config = {
        extra = {
            wisheffect = 0,
            dollars0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'The Great Floccinaucinihilipilification',
        ['text'] = {
            [1] = 'Grants a {C:attention}\"wish\"{} with effects in the order below whenever a {C:attention}Blind {}is selected.',
            [2] = '\"I wish they were RICH!\" - Gives you {C:money}$25{}',
            [3] = '\"I wish they were FAMOUS!\" - Adds 5 random {C:dark_edition}Negative {}consumables',
            [4] = 'and 1 random {C:dark_edition}Negative {}{C:common}Common{} Joker.',
            [5] = '\"I wish for a brand-new CAR!\" - {C:attention}\"Runs over\"{} a random Joker and {C:red}destroys {}it',
            [6] = '',
            [7] = '{C:inactive,s:0.8}\"Oh, thou have GOT to be kidding me.\"{}',
            [8] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.wisheffect}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            if to_big((card.ability.extra.wisheffect or 0)) == to_big(4) then
                return {
                    func = function()
                        card.ability.extra.wisheffect = 1
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.wisheffect = (card.ability.extra.wisheffect) + 1
                        return true
                    end
                }
            end
        end
        if context.setting_blind  then
            if to_big((card.ability.extra.wisheffect or 0)) == to_big(1) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 25
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were RICH!", colour = G.C.MONEY})
                        return true
                    end
                }
            elseif to_big((card.ability.extra.wisheffect or 0)) == to_big(2) then
                return {
                    func = function()
                        
                        for i = 1, 5 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                    SMODS.add_card({ set = random_set, edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                                    if joker_card then
                                        joker_card:set_edition(card.ability.extra.e_negative, true)
                                        
                                    end
                                    
                                    return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish they were FAMOUS!", colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            elseif to_big((card.ability.extra.wisheffect or 0)) == to_big(3) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wish for a brand-new CAR!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}