
SMODS.Joker{ --14. Red-Handed
    key = "redhanded",
    config = {
        extra = {
            redsuitplayed = 'false',
            extrasize = 0,
            hand_size0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = '14. Red-Handed',
        ['text'] = {
            [1] = 'If hand contains a {C:red}Red {}suit,',
            [2] = 'add {C:attention}+0.5{} hand size',
            [3] = 'When {C:attention}Boss {}Blind is defeated,',
            [4] = 'reset extra handsize given',
            [5] = 'If round {C:attention}ends {}without a single',
            [6] = '{C:red}Red {}suit being {C:attention}played {}in the round,',
            [7] = '{C:red}destroy self{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 36
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.redsuitplayed, card.ability.extra.extrasize}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts") or playing_card:is_suit("Diamonds") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                card.ability.extra.redsuitplayed = 'true'
                card.ability.extra.extrasize = (card.ability.extra.extrasize) + 0.5
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(0.5).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(0.5)
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if card.ability.extra.redsuitplayed == 'false' then
                return {
                    func = function()
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
                    end
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.extrasize).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(-card.ability.extra.extrasize)
                    return true
                end
            }
        end
    end
}