
SMODS.Joker{ --Three
    key = "three",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Three',
        ['text'] = {
            [1] = 'If hand {C:attention}contains{} an Ace and a 3,',
            [2] = 'create a {C:attention}Crystalized{} Card',
            [3] = '{C:green}#1# in #2#{} chance when {C:attention}Crystalized{} Cards',
            [4] = 'or {C:attention}Aces{} are scored to {C:red}destroy{} self',
            [5] = '{C:inactive,s:0.8}\"Oh, yeah! I love walking!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_crystalized"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_crystalized\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_three') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_yoylite
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
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_sauce_yoylite"] == true and context.other_card:get_id() == 14) then
                if SMODS.pseudorandom_probability(card, 'group_0_3ebbc161', 1, card.ability.extra.odds, 'j_sauce_three', false) then
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    
                end
            end
        end
    end
}