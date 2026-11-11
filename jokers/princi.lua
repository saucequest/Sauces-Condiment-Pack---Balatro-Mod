
SMODS.Joker{ --Princi
    key = "princi",
    config = {
        extra = {
            chips0 = 2,
            chips = 3,
            chips2 = 4,
            chips3 = 5,
            chips4 = 6,
            chips5 = 7,
            chips6 = 8,
            chips7 = 9,
            chips8 = 10,
            chips9 = 11
        }
    },
    loc_txt = {
        ['name'] = 'Princi',
        ['text'] = {
            [1] = '{C:attention}Held{} in hand cards still give {C:blue}Chips{}',
            [2] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 52
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 2 then
                return {
                    chips = 2
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    chips = 3
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    chips = 4
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    chips = 5
                }
            elseif context.other_card:get_id() == 6 then
                return {
                    chips = 6
                }
            elseif context.other_card:get_id() == 7 then
                return {
                    chips = 7
                }
            elseif context.other_card:get_id() == 8 then
                return {
                    chips = 8
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    chips = 9
                }
            elseif (context.other_card:get_id() == 10 or context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
                return {
                    chips = 10
                }
            elseif context.other_card:get_id() == 14 then
                return {
                    chips = 11
                }
            end
        end
    end
}