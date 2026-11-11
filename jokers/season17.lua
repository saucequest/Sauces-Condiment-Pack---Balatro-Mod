
SMODS.Joker{ --Season 17
    key = "season17",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Season 17',
        ['text'] = {
            [1] = 'If hand {C:attention}contains {}an Ace and a 7,',
            [2] = 'give all scored cards {C:attention}Blue{} Seal',
            [3] = '{C:inactive,s:0.8}\"OhHH I JUST LOVE this cliff... do YOU love this cliff?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Animatic {}{C:common,s:0.8}Battle{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 34
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
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 34
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == A then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Blue", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}