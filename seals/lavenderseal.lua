
SMODS.Seal {
    key = 'lavenderseal',
    pos = { x = 6, y = 0 },
    badge_colour = HEX('DDA0DD'),
    loc_txt = {
        name = 'Lavender Seal',
        label = 'Lavender Seal',
        text = {
            [1] = 'When scored, create a {C:attention}Item {}if',
            [2] = '{C:attention}Ante {}number is {C:attention}odd{} and is {C:attention}equal{}',
            [3] = 'to or {C:attention}below {}nine',
            [4] = '{C:inactive}(Requires room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and (to_big(G.GAME.round_resets.ante) == to_big(1) or to_big(G.GAME.round_resets.ante) > to_big(3) or to_big(G.GAME.round_resets.ante) > to_big(5) or to_big(G.GAME.round_resets.ante) > to_big(7) or to_big(G.GAME.round_resets.ante) == to_big(9)) then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'item', })                            
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