
SMODS.Joker{ --Dance or Die
    key = "danceordie",
    config = {
        extra = {
            mult0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'Dance or Die',
        ['text'] = {
            [1] = '{C:attention}Face {}Cards and {C:enhanced}Enhanced{} cards scored give {C:red}+25{} Mult',
            [2] = 'If card scored is not a {C:attention}Face {}Card or {C:enhanced}Enhanced{}, {C:red}destroy {}it',
            [3] = '{C:inactive,s:0.8}\"Wenda thought it was just a game, but it was a death sentence for her comrades.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() or (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) then
                return {
                    mult = 25
                }
            elseif (not (context.other_card:is_face()) or not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)())) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}