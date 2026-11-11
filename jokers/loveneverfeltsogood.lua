
SMODS.Joker{ --Love Never Felt So Good
    key = "loveneverfeltsogood",
    config = {
        extra = {
            heartsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Love Never Felt So Good',
        ['text'] = {
            [1] = 'Scored {C:hearts}Heart{} cards gain {C:mult}+#1#{}',
            [2] = 'Permanent Mult',
            [3] = '{C:inactive}(Mult equals{} {C:hearts}Heart{} {C:inactive}cards in deck{}',
            [4] = '{C:inactive}divided by 4){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 35
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
        
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Hearts' then count = count + 1 end end; return count end)()) * 0.25}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Hearts' then count = count + 1 end end; return count end)()) * 0.25
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}