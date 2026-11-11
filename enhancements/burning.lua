
SMODS.Enhancement {
    key = 'burning',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            xmult0 = 1.5,
            odds = 3
        }
    },
    loc_txt = {
        name = 'Burning',
        text = {
            [1] = '{X:red,C:white}X1.5{} Mult',
            [2] = '{C:green}#1# in #2#{} chance to {C:red}destroy {}self',
            [3] = ''
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            return {
                Xmult = 1.5
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_87a05c96', 1, card.ability.extra.odds, 'j_sauce_burning', false) then
                        context.other_card.should_destroy = true
                        card.should_destroy = true
                        
                    end
                    return true
                end
            }
        end
    end
}