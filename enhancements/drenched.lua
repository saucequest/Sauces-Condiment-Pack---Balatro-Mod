
SMODS.Enhancement {
    key = 'drenched',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            xchips0 = 0.95,
            dollars0 = 1
        }
    },
    loc_txt = {
        name = 'Drenched',
        text = {
            [1] = '{X:chips,C:white}x0.95{} Chips'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = 0.95,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..tostring(1), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
    end
}