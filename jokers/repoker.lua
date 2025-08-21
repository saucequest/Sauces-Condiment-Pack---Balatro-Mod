SMODS.Joker{ --REPOker
    key = "repoker",
    config = {
        extra = {
            dollars = 1,
            dollars2 = 2,
            dollars3 = 3,
            dollars4 = 2,
            dollars5 = 3,
            dollars6 = 2
        }
    },
    loc_txt = {
        ['name'] = 'REPOker',
        ['text'] = {
            [1] = 'Scored cards give {C:money}money {}based on rank, {C:enhanced}Enhancement{}, and Seal.',
            [2] = 'Higher rank = more money through scoring',
            [3] = '{C:inactive}(Render and cosmetic by UnLuckyNickolay on Thunderstore){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
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
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    dollars = card.ability.extra.dollars
                }
            elseif (context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 8 or context.other_card:get_id() == 9) then
                return {
                    dollars = card.ability.extra.dollars2
                }
            elseif (context.other_card:is_face() or context.other_card:get_id() == 14) then
                return {
                    dollars = card.ability.extra.dollars3
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_gold"] == true or SMODS.get_enhancements(context.other_card)["m_wild"] == true or SMODS.get_enhancements(context.other_card)["m_mult"] == true or SMODS.get_enhancements(context.other_card)["m_stone"] == true or SMODS.get_enhancements(context.other_card)["m_lucky"] == true) then
                return {
                    dollars = card.ability.extra.dollars4
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_steel"] == true or SMODS.get_enhancements(context.other_card)["m_glass"] == true or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true or SMODS.get_enhancements(context.other_card)["m_sauce_corrupted"] == true) then
                return {
                    dollars = card.ability.extra.dollars5
                }
            elseif context.other_card.seal ~= nil then
                return {
                    dollars = card.ability.extra.dollars6
                }
            end
        end
    end
}