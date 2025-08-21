SMODS.Seal {
    key = 'discordping',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            jokercount = 0
        }
    },
    badge_colour = HEX('DC143C'),
   loc_txt = {
        name = 'Discord Ping',
        label = 'Discord Ping',
        text = {
        [1] = 'Retriggers itself for every Joker you own.'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = #(G.jokers and G.jokers.cards or {})
        end
    end
}