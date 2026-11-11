
SMODS.Seal {
    key = 'discord_ping',
    pos = { x = 2, y = 0 },
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
            [1] = 'Retriggers itself for every Joker you own.',
            [2] = '{C:inactive}(Currently #1# retriggers.){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = #(G.jokers and G.jokers.cards or {})
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_ping")
                    
                    return true
                end,
            }))
        end
    end
}