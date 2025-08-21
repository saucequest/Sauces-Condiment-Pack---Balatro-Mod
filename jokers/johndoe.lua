SMODS.Joker{ --John Doe
    key = "johndoe",
    config = {
        extra = {
            chips = 30
        }
    },
    loc_txt = {
        ['name'] = 'John Doe',
        ['text'] = {
            [1] = 'Applies {C:red}Corrupted {}to the last scoring card.',
            [2] = 'Played Aces and 8s give {C:blue}+30{} Chips',
            [3] = '{C:inactive}\"DON\'T PLAY ROBLOX ON MARCH 18TH?!?!\"{}',
            [4] = '{C:inactive}Originates from{} {C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 8) then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card == context.scoring_hand[#context.scoring_hand] then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_corrupted)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}