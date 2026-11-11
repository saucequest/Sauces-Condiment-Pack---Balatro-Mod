
SMODS.Joker{ --Dirty Bubble
    key = "dirtybubble",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dirty Bubble',
        ['text'] = {
            [1] = '{C:red}Destroy {}all scored cards that {C:attention}aren\'t{} face cards',
            [2] = 'Create a singular {C:attention}Steel{} Card to your hand',
            [3] = 'when hand played',
            [4] = '{C:inactive,s:0.8}\"They\'ll feel the pain and the torture...\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:spades,s:0.8}BFDI {}{C:attention,s:0.8}26{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 8
    },
    
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
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if not (context.other_card:is_face()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
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
            return {
                message = "Added Card to Hand!"
            }
        end
    end
}