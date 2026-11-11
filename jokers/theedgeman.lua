
SMODS.Joker{ --TheEdgeMan
    key = "theedgeman",
    config = {
        extra = {
            totaljokerslots = 0
        }
    },
    loc_txt = {
        ['name'] = 'TheEdgeMan',
        ['text'] = {
            [1] = 'If all Joker slots are {C:attention}full{} when {C:attention}hand is played{},',
            [2] = 'destroy a {C:attention}random {}Joker and make all scored',
            [3] = 'cards {C:attention}Electric{}',
            [4] = '{C:inactive,s:0.8}\"You\'re a DEAD MAN!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 26
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {(G.jokers and G.jokers.config.card_limit or 0 or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big(G.jokers and G.jokers.config.card_limit or 0) == to_big(0) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_electric)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big(G.jokers and G.jokers.config.card_limit or 0) == to_big(0) then
                return {
                    func = function()
                        local destructable_jokers = {}
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                table.insert(destructable_jokers, joker)
                            end
                        end
                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                        
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
                        return true
                    end
                }
            end
        end
    end
}