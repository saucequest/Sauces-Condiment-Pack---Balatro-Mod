
SMODS.Joker{ --The Ancients
    key = "theancients",
    config = {
        extra = {
            kingsindeck = 0,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Ancients',
        ['text'] = {
            [1] = 'If there are no {C:attention}Kings {}in deck,',
            [2] = 'retrigger scored {C:attention}Burning {}cards',
            [3] = '{C:inactive,s:0.8}\"THE DELICIOUS BLOOD OF SACRIFICE.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 34
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_burning"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_burning\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
        if (to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()) == to_big(0) and SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true) then
            return {
                repetitions = 1,
                message = localize('k_again_ex')
            }
        end
    end
end
}