
SMODS.Joker{ --Cruel King
    key = "cruelking",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Cruel King',
        ['text'] = {
            [1] = 'Held in hand {C:attention}face {}cards become {C:attention}Frozen{}',
            [2] = '{C:green}#1# in #2#{} chance when {C:attention}freezing {}cards',
            [3] = 'to add a {C:attention}Steel{} card to hand',
            [4] = '{C:inactive,s:0.8}\"It shall not be in vain!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 33
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 33
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_cruelking') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_frozen)
                    end,
                    message = "Card Modified!"
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_66596bc0', 1, card.ability.extra.odds, 'j_sauce_cruelking', false) then
                            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                            local base_card = create_playing_card({
                                front = card_front,
                                center = G.P_CENTERS.m_steel
                            }, G.discard, true, false, nil, true)
                            
                            
                            
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            base_card.playing_card = G.playing_card
                            table.insert(G.playing_cards, base_card)
                            
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    G.hand:emplace(base_card)
                                    base_card:start_materialize()
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                        end
                        return true
                    end
                }
            end
        end
    end
}