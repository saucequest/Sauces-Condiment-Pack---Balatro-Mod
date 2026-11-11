
SMODS.Seal {
    key = 'rage_seal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 2
        }
    },
    badge_colour = HEX('ff0000'),
    loc_txt = {
        name = 'Rage Seal',
        label = 'Rage Seal',
        text = {
            [1] = 'Retriggers twice if hand is within 85-99% of Blind Requirement'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and (to_big(G.GAME.chips / G.GAME.blind.chips) <= to_big(0.99) and to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(0.85)) then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 2
        end
    end
}