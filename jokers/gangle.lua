SMODS.Joker{ --Gangle
    key = "gangle",
    config = {
        extra = {
            sadorhappy = 0,
            sadcardsplayed = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gangle',
        ['text'] = {
            [1] = 'Turns all cards scored into {C:attention}Glass{}',
            [2] = 'When {C:attention}Glass{} card destroys itself, turn sad.',
            [3] = 'When sad, turns the next 7 scored cards into {C:attention}Drenched in Tears{}',
            [4] = 'After those 7 cards have been scored, become happy again',
            [5] = '{C:inactive}\"WE NEED TO FIND THE TOMMY GUN!\"{}',
            [6] = '{C:inactive}Originates from{} {C:diamonds}TADC{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (card.ability.extra.sadorhappy or 0) == 0 then
                context.other_card:set_ability(G.P_CENTERS.m_glass)
                return {
                    message = "Card Modified!"
                }
            elseif (card.ability.extra.sadorhappy or 0) == 1 then
                context.other_card:set_ability(G.P_CENTERS.m_sauce_drenchedintears)
                card.ability.extra.sadcardsplayed = (card.ability.extra.sadcardsplayed) + 1
                return {
                    message = "Card Modified!"
                }
            end
        end
        if context.remove_playing_cards  then
            if (function()
    for k, removed_card in ipairs(context.removed) do
        if SMODS.get_enhancements(removed_card)["m_glass"] == true then
            return true
        end
    end
    return false
end)() then
                return {
                    func = function()
                    card.ability.extra.sadorhappy = 1
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.sadcardsplayed or 0) >= 7 then
                card.ability.extra.sadorhappy = 0
            end
        end
    end
}