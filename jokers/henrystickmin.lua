
SMODS.Joker{ --Henry Stickmin
    key = "henrystickmin",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Henry Stickmin',
        ['text'] = {
            [1] = 'When hand played, create a {C:attention}Item{}',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"WHAT THE-\"{}',
            [4] = '{C:inactive,s:0.8}Originates from He{}{C:money,s:0.8}nry {}{C:red,s:0.8}Sti{}{C:uncommon,s:0.8}ckmin{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(1) then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'item', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            end
        end
    end
}