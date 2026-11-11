
SMODS.Joker{ --Visage of False Hope
    key = "visageoffalsehope",
    config = {
        extra = {
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'Visage of False Hope',
        ['text'] = {
            [1] = 'Scored {C:attention}Burning {}cards add 5 {C:attention}Stone{} cards to hand',
            [2] = '{C:inactive,s:0.8}\"Manifesting its full form, the demon twisted Bruce\'s body into a{}',
            [3] = '{C:inactive,s:0.8} grotesque tower of ego, pride, and sickness. This abomination compelled all in the sewers to follow it, growing{}',
            [4] = '{C:inactive,s:0.8}ever more powerful by consuming its followers. Bruce, now a mere remnant, was left hanging from {}',
            [5] = '{C:inactive,s:0.8}the creature\'s face, forced to witness his grave mistake.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Pizza{} {C:red,s:0.8}Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_stone"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_"] == true then
                for i = 1, 5 do
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.m_stone
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                end
            end
        end
    end
}