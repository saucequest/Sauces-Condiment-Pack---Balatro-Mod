
SMODS.Joker{ --2017x
    key = "_2017x",
    config = {
        extra = {
            discards0 = 1
        }
    },
    loc_txt = {
        ['name'] = '2017x',
        ['text'] = {
            [1] = 'Second scoring card will gain {C:attention}Burning {}',
            [2] = 'and subtracts a {C:attention}discard {}for the round',
            [3] = '{C:inactive,s:0.8}\"You\'re not very good at this, ARE YOU?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:hearts,s:0.8}Sonic Legacy{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[2] and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_sonicthehedgehog" then 
                        return true
                    end
                end
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Discards", colour = G.C.RED})
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 1
                        return true
                    end
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_sonicthehedgehog" then 
                        return true
                    end
                end
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}