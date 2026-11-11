
SMODS.Joker{ --Glee Co.
    key = "gleeco",
    config = {
        extra = {
            mult0 = 8
        }
    },
    loc_txt = {
        ['name'] = 'Glee Co.',
        ['text'] = {
            [1] = '{C:attention}Held {}in hand face cards will be given {C:enhanced}Foil{}',
            [2] = 'Scored {C:attention}face {}cards will be {C:red}destroyed{}',
            [3] = 'and give {C:red}+8{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 43
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_foil"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_foil\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  and not context.blueprint then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_edition("e_foil", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    mult = 8,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}