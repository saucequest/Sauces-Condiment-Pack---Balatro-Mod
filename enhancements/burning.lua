SMODS.Enhancement {
    key = 'burning',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 1.5,
            odds = 5
        }
    },
    loc_txt = {
        name = 'Burning',
        text = {
        [1] = '{X:red,C:white}X1.5{} Mult',
        [2] = '{C:green}1 in 5{} chance to balance Chips and Mult and then destroy self'
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
            if SMODS.pseudorandom_probability(card, 'group_0_6348ca3c', 1, card.ability.extra.odds, 'm_sauce_burning') then
                card.should_destroy = true
                SMODS.calculate_effect({balance = true}, card)
            end
            return { x_mult = card.ability.extra.x_mult }
        end
    end
}