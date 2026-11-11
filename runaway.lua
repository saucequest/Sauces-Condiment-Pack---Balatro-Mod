
SMODS.Joker{ --12. RUNAWAY
    key = "runaway",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = '12. RUNAWAY',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards will be destroyed',
            [2] = 'and have a {C:green}#1# in #2#{} chance to make',
            [3] = 'a {C:attention}Glass{} card',
            [4] = 'When a {C:attention}Glass{} card is destroyed,',
            [5] = 'create a {C:attention}Jack{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 36
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_runaway') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_9fb80fae', 1, card.ability.extra.odds, 'j_sauce_runaway', false) then
                            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                            local base_card = create_playing_card({
                                front = card_front,
                                center = G.P_CENTERS.m_glass
                            }, G.discard, true, false, nil, true)
                            
                            
                            
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local new_card = copy_card(base_card, nil, nil, G.playing_card)
                            
                            new_card:add_to_deck()
                            
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            G.deck:emplace(new_card)
                            table.insert(G.playing_cards, new_card)
                            
                            base_card:remove()
                            
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    new_card:start_materialize()
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                        end
                        return true
                    end
                }
            end
        end
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card.shattered then
                        return true
                    end
                end
                return false
            end)() then
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'J'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end,
                    message = "Added Card!"
                }
            end
        end
    end
}