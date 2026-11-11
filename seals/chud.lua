
SMODS.Seal {
    key = 'chud',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            xmult0 = 0.1
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'chud',
        label = 'chud',
        text = {
            [1] = 'applies chudness to the card'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(1) then
            return {
                Xmult = 0.1
            }
        end
    end
}