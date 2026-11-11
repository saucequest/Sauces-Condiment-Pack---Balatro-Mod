
SMODS.Joker{ --Himeno
    key = "himeno",
    config = {
        extra = {
            chips0 = 4,
            chips = 6,
            chips2 = 8,
            chips3 = 10,
            chips4 = 12,
            chips5 = 14,
            chips6 = 16,
            chips7 = 18,
            chips8 = 20,
            chips9 = 22,
            chips10 = 24,
            chips11 = 26,
            chips12 = 28
        }
    },
    loc_txt = {
        ['name'] = 'Himeno',
        ['text'] = {
            [1] = '{C:attention}Rightmost {}scoring card gives',
            [2] = 'triple the {C:blue}Chips{}',
            [3] = '{C:inactive,s:0.8}\"When I die, you can cry for me.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 2) then
                return {
                    chips = 4
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 3) then
                return {
                    chips = 6
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 4) then
                return {
                    chips = 8
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 5) then
                return {
                    chips = 10
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 6) then
                return {
                    chips = 12
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 7) then
                return {
                    chips = 14
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 8) then
                return {
                    chips = 16
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 9) then
                return {
                    chips = 18
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 10) then
                return {
                    chips = 20
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 11) then
                return {
                    chips = 22
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 12) then
                return {
                    chips = 24
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 13) then
                return {
                    chips = 26
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and context.other_card:get_id() == 14) then
                return {
                    chips = 28
                }
            end
        end
    end
}