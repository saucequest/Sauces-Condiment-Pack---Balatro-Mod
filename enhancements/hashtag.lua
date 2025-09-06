SMODS.Enhancement {
    key = 'hashtag',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            odds = 3,
            levels_min = 1,
            levels_max = 3
        }
    },
    loc_txt = {
        name = 'Hashtag',
        text = {
        [1] = '{C:green}1 in 3{} chance when scored to level up played',
        [2] = 'hand by 1-3'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = true,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 4,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_36c24a74', 1, card.ability.extra.odds, 'm_sauce_hashtag') then
                local target_hand
                target_hand = context.scoring_name or "High Card"
                SMODS.calculate_effect({level_up = pseudorandom('levels_2e460d44', card.ability.extra.levels_min, card.ability.extra.levels_max),
                level_up_hand = target_hand}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            end
        end
    end
}