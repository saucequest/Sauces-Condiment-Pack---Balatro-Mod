SMODS.Enhancement {
    key = 'corrupted',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 1.2
        }
    },
    loc_txt = {
        name = 'Corrupted',
        text = {
        [1] = 'Gives {X:red,C:white}X1.2{} Mult and then destroys itself.'
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
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
            SMODS.calculate_effect({x_mult = card.ability.extra.x_mult}, card)
        end
    end
}