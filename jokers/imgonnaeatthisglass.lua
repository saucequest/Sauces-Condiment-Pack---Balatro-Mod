
SMODS.Joker{ --Im Gonna Eat This GLASS
    key = "imgonnaeatthisglass",
    config = {
        extra = {
            xmult0 = 1.5,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Im Gonna Eat This GLASS',
        ['text'] = {
            [1] = 'Scored {C:attention}Glass{} cards will be {C:red}destroyed {}and give {X:mult,C:white}X1.5{} Mult',
            [2] = '{C:green}#1# in #2#{} chance to give a {C:attention}Glass{} card when',
            [3] = '{C:attention}Glass{} card scored instead'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_imgonnaeatthisglass') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                context.other_card.should_destroy = true
                return {
                    Xmult = 1.5,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_e9524099', 1, card.ability.extra.odds, 'j_sauce_imgonnaeatthisglass', false) then
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
    end
}