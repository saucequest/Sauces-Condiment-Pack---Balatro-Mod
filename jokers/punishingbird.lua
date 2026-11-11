
SMODS.Joker{ --Punishing Bird
    key = "punishingbird",
    config = {
        extra = {
            pb_bonus_0b85d1e2 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Punishing Bird',
        ['text'] = {
            [1] = 'Scored {C:attention}2s {}will gain {C:blue}+30{} Chips',
            [2] = '{C:inactive,s:0.8}\"People have been committing sins since long ago.{}',
            [3] = '{C:inactive,s:0.8}\"Why do they commit sins, knowing it\'s wrong?\" \"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}Lobotomy{} {C:attention,s:0.8}Corporation{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 15
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}