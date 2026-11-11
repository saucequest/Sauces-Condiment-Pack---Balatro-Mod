
SMODS.Joker{ --Starved
    key = "starved",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Starved',
        ['text'] = {
            [1] = 'If scored face card is {C:attention}Burning {}or {C:attention}Scorched{},',
            [2] = 'create a {C:attention}Meat {}card',
            [3] = '{C:inactive,s:0.8}\"I hope my suspicions are true.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {X:red,C:black,s:0.8}Outcome{} {X:red,C:black,s:0.8}Memories{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 24
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["e_sauce_scorched"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_sauce_scorched\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true or context.other_card:is_face() and context.other_card.edition and context.other_card.edition.key == "e_sauce_scorched") then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_sauce_meatcard
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
                return {
                    message = "Added Card!"
                }
            end
        end
    end
}