
SMODS.Joker{ --Surge the Tenrec
    key = "surgethetenrec",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Surge the Tenrec',
        ['text'] = {
            [1] = 'If {C:attention}hand {}contains a {C:attention}Jack{}, all {C:attention}cards {}become {C:blue}Electric{}',
            [2] = 'then {C:red}destroy {}all {C:attention}face {}cards in {C:attention}hand{}',
            [3] = '{C:inactive,s:0.8}\"We\'re taking over whether you like it or not!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:spectral,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 24
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 6,
        y = 24
    },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == J then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_electric)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == J then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and context.other_card:is_face()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}