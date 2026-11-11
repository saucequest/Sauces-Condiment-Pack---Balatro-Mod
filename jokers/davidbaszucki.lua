
SMODS.Joker{ --David Baszucki
    key = "davidbaszucki",
    config = {
        extra = {
            dollars0 = 12000000000
        }
    },
    loc_txt = {
        ['name'] = 'David Baszucki',
        ['text'] = {
            [1] = 'If a {C:attention}Jack {}is played, lose {C:money}$12,000,000,000{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - 12000000000
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(12000000000), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}