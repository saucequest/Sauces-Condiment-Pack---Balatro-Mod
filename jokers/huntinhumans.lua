
SMODS.Joker{ --HUNTIN HUMANS
    key = "huntinhumans",
    config = {
        extra = {
            humanscaught = 2
        }
    },
    loc_txt = {
        ['name'] = 'HUNTIN HUMANS',
        ['text'] = {
            [1] = 'Scored {C:attention}face {}cards will increase {C:attention}Mult {}by {C:red}2{}',
            [2] = '{C:attention}Discarding {}a {C:attention}face {}card will make the card {C:blue}Blue{}',
            [3] = 'and decrease {C:attention}Mult {}by {C:red}1{}',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [5] = '{C:inactive,s:0.8}\"WE\'RE HUNTING HUMANSSS!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_blue"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_blue\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.humanscaught}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
                card.ability.extra.humanscaught = (card.ability.extra.humanscaught) + 2
            end
        end
        if context.discard  and not context.blueprint then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_sauce_blue)
                    end,
                    message = "Card Modified!",
                    extra = {
                        func = function()
                            card.ability.extra.humanscaught = math.max(0, (card.ability.extra.humanscaught) - 1)
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.humanscaught
            }
        end
    end
}