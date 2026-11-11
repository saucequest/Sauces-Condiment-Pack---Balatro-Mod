
SMODS.Joker{ --Outcast
    key = "outcast",
    config = {
        extra = {
            kingsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Outcast',
        ['text'] = {
            [1] = 'Destroy {C:attention}last {}scored card if no',
            [2] = '{C:attention}Kings {}are in deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 45
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sonic"] = true, ["sauce_sinisterminds"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
        if (context.other_card == context.scoring_hand[#context.scoring_hand] and to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()) == to_big(0)) then
            context.other_card.should_destroy = true
            return {
                message = "Destroyed!"
            }
        end
    end
end
}