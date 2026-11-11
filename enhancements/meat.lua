
SMODS.Enhancement {
    key = 'meat',
    pos = { x = 8, y = 0 },
    loc_txt = {
        name = 'Meat',
        text = {
            [1] = 'No suit or rank',
            [2] = 'When scored, {C:attention}destroy {}self and create a {C:attention}consumable{}',
            [3] = 'Card always scores'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = false,
    no_collection = false,
    weight = 2.25,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
            return {
                
                func = function()
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                local sets = {'Tarot', 'Planet', 'Spectral'}
                                local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                SMODS.add_card({ set = random_set, soulable = true, })                            
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