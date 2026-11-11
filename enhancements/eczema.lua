
SMODS.Enhancement {
    key = 'eczema',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        name = 'Eczema',
        text = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = 'When scored, {X:mult,C:white}XMult{} goes down by {X:mult,C:white}0.1{}',
            [3] = 'When held in hand, {X:mult,C:white}XMult{} goes up by {X:mult,C:white}0.1{}',
            [4] = ''
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = false,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.xmult = math.max(0, (card.ability.extra.xmult) - 0.1)
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.cardarea == G.hand and context.main_scoring then
            return {
                func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.1
                    return true
                end
            }
        end
    end
}