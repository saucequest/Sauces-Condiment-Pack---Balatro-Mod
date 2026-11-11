
SMODS.Enhancement {
    key = 'crystalized',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        name = 'Crystalized',
        text = {
            [1] = 'Balances {C:blue}Chips {}and {C:red}Mult{}',
            [2] = '{C:green}#1# in #2# {}chance to be {C:red}destroyed{}',
            [3] = 'when scored'
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
            SMODS.calculate_effect({balance = true}, card)
            if SMODS.pseudorandom_probability(card, 'group_0_6fcca3e7', 1, card.ability.extra.odds, 'j_sauce_crystalized', false) then
                context.other_card.should_destroy = true
                card.should_destroy = true
                
            end
        end
    end
}