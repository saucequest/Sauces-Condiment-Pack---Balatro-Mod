
SMODS.Joker{ --Yuji Itadori
    key = "yujiitadori",
    config = {
        extra = {
            blackflashes = 0,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Yuji Itadori',
        ['text'] = {
            [1] = 'If hand played contains {C:attention}both {}Black',
            [2] = 'and {C:red}Red {}Suits, balance {C:blue}Chips {}and {C:red}Mult{}',
            [3] = 'After 8 balances, create {C:attention}Hometown{}',
            [4] = '{C:green}1 in 4{} chance when card {C:red}destroyed {}to',
            [5] = 'become {C:attention}Sukuna{}',
            [6] = '{C:inactive,s:0.8}\"Smart people usually don’t brag about being smart.\"{}',
            [7] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 46
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
    soul_pos = {
        x = 1,
        y = 46
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_yujidomain"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_yujidomain\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_yujiitadori') 
        return {vars = {card.ability.extra.blackflashes, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") or playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                card.ability.extra.blackflashes = (card.ability.extra.blackflashes) + 1
                return {
                    balance = true
                }
            elseif to_big((card.ability.extra.blackflashes or 0)) >= to_big(8) then
                card.ability.extra.blackflashes = 0
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_yujidomain' })
                        if joker_card then
                            
                            joker_card:add_sticker('eternal', true)
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
        if context.remove_playing_cards  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_19886b5d', 1, card.ability.extra.odds, 'j_sauce_yujiitadori', false) then
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
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_sukuna' })
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
            end
        end
    end
}