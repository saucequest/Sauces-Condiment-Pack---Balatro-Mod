
SMODS.Joker{ --JabibiXD
    key = "jabibixd",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'JabibiXD',
        ['text'] = {
            [1] = 'Apply a {C:attention}Rage {}Seal to {C:attention}discarded {}face cards',
            [2] = '{C:inactive,s:0.8}\"YAHIIIII!\"{}',
            [3] = '{C:inactive,s:0.7}https://www.youtube.com/@jabibixd{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 13
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.discard  then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_seal("sauce_rage_seal2", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}