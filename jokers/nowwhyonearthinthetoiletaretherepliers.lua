
SMODS.Joker{ --Now why on Earth in the toilet are there pliers?
    key = "nowwhyonearthinthetoiletaretherepliers",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Now why on Earth in the toilet are there pliers?',
        ['text'] = {
            [1] = 'When {C:attention}rerolling{}, {C:green}1 in 5{} chance to create',
            [2] = '{C:attention}FGTeeV\'s Pliers{} then {C:red}self-destruct{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 50
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_fgteevspliers"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_fgteevspliers\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_nowwhyonearthinthetoiletaretherepliers') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_16f42c4d', 1, card.ability.extra.odds, 'j_sauce_nowwhyonearthinthetoiletaretherepliers', false) then
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_fgteevspliers' })
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
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}