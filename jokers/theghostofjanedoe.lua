
SMODS.Joker{ --The Ghost of Jane Doe
    key = "theghostofjanedoe",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Ghost of Jane Doe',
        ['text'] = {
            [1] = '{C:attention}Held {}in hand {C:attention}Queens {}gain {C:dark_edition}Negative {}and',
            [2] = 'a {C:tarot}Purple{} Seal',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 44
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
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
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 12 then
                return {
                    func = function()
                        context.other_card:set_seal("Purple", true)
                        context.other_card:set_edition("e_negative", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}