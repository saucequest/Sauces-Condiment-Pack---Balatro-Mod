
SMODS.Joker{ --Amy Rose
    key = "amyrose",
    config = {
        extra = {
            tarotsofthefuture = 0
        }
    },
    loc_txt = {
        ['name'] = 'Amy Rose',
        ['text'] = {
            [1] = 'If {C:attention}hand {}contains a {C:attention}Queen{}, create',
            [2] = 'a {C:attention}Electric {}Jack',
            [3] = 'When {C:attention}Boss {}defeated, create 2 {C:tarot}Tarots{}',
            [4] = '{C:inactive}(Requires room){}',
            [5] = '{C:inactive,s:0.8}\"Sonic! You\'re my hero!\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 32
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    soul_pos = {
        x = 6,
        y = 32
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.tarotsofthefuture}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'J'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_electric
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
                return {
                    message = "Added Card to Hand!"
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.remove_playing_cards  then
            if not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_joker" then 
                        return true
                    end
                end
            end)()) then
            end
        end
    end
}