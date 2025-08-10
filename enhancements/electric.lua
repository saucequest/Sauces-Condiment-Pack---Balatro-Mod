SMODS.Enhancement {
    key = 'electric',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_chips = 2,
            x_chips = 2.5
        }
    },
    loc_txt = {
        name = 'Electric',
        text = {
        [1] = 'When scored, does {X:chips,C:white}x2{} Chips',
        [2] = 'If scored in the first hand of the round, gives {X:chips,C:white}x2.5{} Chips'
    }
    },
    atlas = 'CustomEnhancements',
    pos = { x = 0, y = 0 },
    any_suit = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.extra.x_chips }
        end
        if context.main_scoring and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            return { x_chips = card.ability.extra.x_chips }
        end
    end
}