
SMODS.Joker{ --mac0
    key = "mac0",
    config = {
        extra = {
            textest = 'Test'
        }
    },
    loc_txt = {
        ['name'] = 'mac0',
        ['text'] = {
            [1] = '{C:attention}Leftmost {}scored card wlil',
            [2] = 'be turned {C:enhanced}Negative{}',
            [3] = '{C:inactive,s:0.8}\"THE MOON IS FAKE!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:diamonds,s:0.8}Hello{} {C:enhanced,s:0.8}Again {}{C:money,s:0.8}John {}{C:red,s:0.8}Doe{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 35
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
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.textest}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_negative", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}