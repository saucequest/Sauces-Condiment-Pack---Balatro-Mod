
SMODS.Enhancement {
    key = 'hashtag',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            odds = 3,
            levels0_min = NaN,
            levels0_max = 3
        }
    },
    loc_txt = {
        name = 'Hashtag',
        text = {
            [1] = 'No suit or rank',
            [2] = '{C:green}#1# in #2#{} chance when scored to level up played',
            [3] = 'hand by 1-3',
            [4] = 'Always scores',
            [5] = ''
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 4,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_36c24a74', 1, card.ability.extra.odds, 'j_sauce_hashtag', false) then
                local target_hand
                target_hand = context.scoring_name or "High Card"
                SMODS.calculate_effect({level_up = pseudorandom('RANGE:1|3', 1, 3),
                level_up_hand = target_hand}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            end
        end
    end
}