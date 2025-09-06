SMODS.Joker{ --Investigative Iris
    key = "investigativeiris",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Investigative Iris',
        ['text'] = {
            [1] = 'If played hand contains a Queen and an Ace,',
            [2] = 'turn scored cards into {C:attention}Hashtag{}',
            [3] = '{C:inactive}\"It seems you\'ve caught me during my{} {C:common}#Investigation{}{C:inactive}\"{}',
            [4] = '{C:inactive}Originates from {}{C:red}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 12 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 14 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_hashtag)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}