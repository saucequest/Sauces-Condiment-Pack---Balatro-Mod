
SMODS.Enhancement {
    key = 'orange',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Orange',
        text = {
            [1] = 'If held in hand or discarded, destroy self'
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
        if context.cardarea == G.hand and context.main_scoring then
            card.should_destroy = false
            card.should_destroy = true
        end
        if context.discard and context.other_card == card then
            return {
                remove = true
            }
        end
    end
}