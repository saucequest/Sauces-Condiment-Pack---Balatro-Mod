SMODS.Enhancement {
    key = 'drenchedintears',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            x_chips = 0.95,
            dollars = 1
        }
    },
    loc_txt = {
        name = 'Drenched in Tears',
        text = {
        [1] = '{X:chips,C:white}x0.95{} Chips and {C:money}-$1{}'
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
            return { x_chips = card.ability.extra.x_chips, dollars = -lenient_bignum(card.ability.extra.dollars) }
        end
    end
}