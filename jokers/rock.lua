
SMODS.Joker{ --Rock
    key = "rock",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Rock',
        ['text'] = {
            [1] = 'Played {C:attention}Stone{} cards get {C:attention}copied{} to deck',
            [2] = '{C:inactive,s:0.8}\"Could... be me... could... be me... could be me!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {X:attention,C:black,s:0.8}5SOS:{} {X:attention,C:black,s:0.8}Bean\'s{} {X:attention,C:black,s:0.8}Show{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 21
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
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