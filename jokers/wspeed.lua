
SMODS.Joker{ --W Speed
    key = "wspeed",
    config = {
        extra = {
            wspeed = 15
        }
    },
    loc_txt = {
        ['name'] = 'W Speed',
        ['text'] = {
            [1] = 'Scored {C:hearts}Hearts{} give {C:red}+#1#{} Mult',
            [2] = 'When a {C:attention}Speed {}Tag is acquired, increase',
            [3] = 'Mult by {C:red}5{}',
            [4] = '{C:inactive,s:0.8}*KINDEST STREAMER*{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 27
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.wspeed}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    mult = card.ability.extra.wspeed,
                    message = "*Speed gives Mult*",
                    extra = {
                        message = "*W Speed*",
                        colour = G.C.WHITE
                    }
                }
            end
        end
        if context.tag_added and not context.blueprint then
            if to_big(context.tag_added.key) == to_big("undefined") then
                return {
                    func = function()
                        card.ability.extra.wspeed = (card.ability.extra.wspeed) + 5
                        return true
                    end,
                    message = "*Speed increases his +Mult*",
                    extra = {
                        message = "*Kindest Streamer*",
                        colour = G.C.WHITE
                    }
                }
            end
        end
    end
}