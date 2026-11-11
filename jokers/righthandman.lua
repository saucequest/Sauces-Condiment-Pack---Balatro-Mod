
SMODS.Joker{ --Right Hand Man
    key = "righthandman",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Right Hand Man',
        ['text'] = {
            [1] = 'If {C:attention}rightmost{} scoring card is a {C:attention}Face {}Card,',
            [2] = 'make it {C:attention}Steel{} and {C:attention}duplicate {}it',
            [3] = '{C:inactive,s:0.8}\"Do I gotta do everything around here?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from He{}{C:money,s:0.8}nry {}{C:red,s:0.8}Sti{}{C:uncommon,s:0.8}ckmin{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 21
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card == context.scoring_hand[#context.scoring_hand]) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                copied_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Copied Card to Hand!"
                }
            end
        end
    end
}