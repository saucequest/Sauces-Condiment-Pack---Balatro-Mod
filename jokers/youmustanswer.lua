
SMODS.Joker{ --2. You Must Answer
    key = "youmustanswer",
    config = {
        extra = {
            youmustanswer = 0,
            shop_slots0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = '2. You Must Answer',
        ['text'] = {
            [1] = 'If hand {C:attention}contains {}a {C:red}Red {}Suit,',
            [2] = 'give {C:attention}+0.5{} Shop Slots',
            [3] = 'Resets when {C:attention}exiting {}shop'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 36
    },
    display_size = {
        w = 71 * 1, 
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
        
        return {vars = {card.ability.extra.youmustanswer}}
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
                card.ability.extra.youmustanswer = (card.ability.extra.youmustanswer) + 0.5
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(0.5).." Shop Slots", colour = G.C.BLUE})
                        
                        change_shop_size(0.5)
                        return true
                    end
                }
            end
        end
        if context.ending_shop  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.youmustanswer).." Shop Slots", colour = G.C.BLUE})
                    
                    change_shop_size(-card.ability.extra.youmustanswer)
                    return true
                end
            }
        end
    end
}