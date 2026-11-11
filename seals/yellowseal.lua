
SMODS.Seal {
    key = 'yellowseal',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            discardsusedthisround = 0
        }
    },
    badge_colour = HEX('FFD700'),
    loc_txt = {
        name = 'Yellow Seal',
        label = 'Yellow Seal',
        text = {
            [1] = 'If {C:attention}discarded {}in {C:attention}first {}discard',
            [2] = 'of round, create a {C:attention}Condiment{}',
            [3] = '{C:inactive}(Requires room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {(G.GAME.current_round.discards_used or 0)}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and to_big(G.GAME.current_round.discards_used) == to_big(0) then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'condiment', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}