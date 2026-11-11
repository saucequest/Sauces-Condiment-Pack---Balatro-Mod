
SMODS.Joker{ --Cashier
    key = "cashier",
    config = {
        extra = {
            money÷5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cashier',
        ['text'] = {
            [1] = 'When {C:attention}Boss {}defeated, give a {C:attention}Food Joker{}',
            [2] = 'and {C:attention}divide {}your {C:money}money{} by 5',
            [3] = '{C:inactive,s:0.8}\"have you every wondered about the possibility that we\'re just inside... a game?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}GA{}{C:green,s:0.8}SA{}{C:inactive,s:0.8}4{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'sauce_food' })
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
                end,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = math.floor(lenient_bignum(G.GAME.dollars / 5))
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(math.floor(lenient_bignum(G.GAME.dollars / 5))), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
    end
}