
SMODS.Joker{ --Man Behind the Tree
    key = "manbehindthetree",
    config = {
        extra = {
            treeman = 0,
            odds = 66
        }
    },
    loc_txt = {
        ['name'] = 'Man Behind the Tree',
        ['text'] = {
            [1] = 'If a {C:enhanced}Enhancement{} was scored in {C:attention}Blind {}when',
            [2] = 'round {C:attention}ends{}, create an {C:attention}Egg{}',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:green}#2# in #3#{} {C:red}unmodifiable {}chance to become an',
            [5] = '{C:dark_edition}Unnatural {}Joker instead',
            [6] = '{C:inactive,s:0.8}\"Well, there is a man here.\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}DEL{}{C:purple,s:0.8}TAR{}{C:green,s:0.8}UNE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_egg"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_egg\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_manbehindthetree') 
        return {vars = {card.ability.extra.treeman, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.treeman or 0)) == to_big(0)) then
                card.ability.extra.treeman = 1
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.treeman or 0)) == to_big(1) then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_egg' })
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
                            card.ability.extra.treeman = 1
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_43d9d419', 1, card.ability.extra.odds, 'j_sauce_manbehindthetree', true) then
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
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_unnatural' })
                                        if joker_card then
                                            
                                            
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