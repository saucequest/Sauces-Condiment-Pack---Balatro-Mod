
SMODS.Joker{ --Yuri
    key = "yuri",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Yuri',
        ['text'] = {
            [1] = 'Upon the {C:attention}first {}hand being {C:attention}drawn{}, select',
            [2] = 'a random {C:attention}rank{} {C:inactive}(#1#){}',
            [3] = 'Scoring the {C:attention}rank {}will {C:red}destroy {}all other cards',
            [4] = 'in {C:attention}scored hand{} and make the scored rank {C:attention}Wild{}',
            [5] = '{C:inactive,s:0.8}\"I can\'t speak japanese so this is what happens\"{}',
            [6] = '{C:inactive,s:0.8}Originates from Terror{} {C:red,s:0.8}Realm{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {localize((G.GAME.current_round.loveatfirstsight_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.loveatfirstsight_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            if G.playing_cards then
                local valid_loveatfirstsight_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_loveatfirstsight_cards[#valid_loveatfirstsight_cards + 1] = v
                    end
                end
                if valid_loveatfirstsight_cards[1] then
                    local loveatfirstsight_card = pseudorandom_element(valid_loveatfirstsight_cards, pseudoseed('loveatfirstsight' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.loveatfirstsight_card.rank = loveatfirstsight_card.base.value
                    G.GAME.current_round.loveatfirstsight_card.id = loveatfirstsight_card.base.id
                end
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == 14 and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.loveatfirstsight_card.id then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_wild)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (not (context.other_card:get_id() == 14) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.loveatfirstsight_card.id then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}