
SMODS.Enhancement {
    key = 'blue',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Blue',
        text = {
            [1] = 'If scored, destroy self',
            [2] = '{C:inactive,s:0.8}\"When scoring, think about blue stop signs.\"{}'
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
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
        end
    end
}