
SMODS.Enhancement {
    key = 'frozen',
    pos = { x = 9, y = 0 },
    config = {
        h_chips = 30,
        extra = {
            meltylittlepopsicle = 3
        }
    },
    loc_txt = {
        name = 'Frozen',
        text = {
            [1] = 'Gives {C:blue}+50{} Chips when {C:attention}held {}in hand',
            [2] = 'After being triggered 3 times,',
            [3] = 'become {C:attention}Drenched in Tears{}'
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
    weight = 2.75,
    loc_vars = function(self, info_queue, card)
        return {vars = {50}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                func = function()
                    card.ability.extra.meltylittlepopsicle = math.max(0, (card.ability.extra.meltylittlepopsicle) - 1)
                    return true
                end
            }
        end
        if context.cardarea == G.hand and context.main_scoring and to_big((card.ability.extra.meltylittlepopsicle or 0)) == to_big(0) then
            return {
                func = function()
                    card:set_ability(G.P_CENTERS.m_sauce_drenchedintears)
                end,
                message = "Card Modified!"
            }
        end
    end
}