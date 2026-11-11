
SMODS.Joker{ --Four
    key = "four",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Four',
        ['text'] = {
            [1] = 'If hand {C:attention}contains{} atleast 1 {C:attention}Face{} card and no 4,',
            [2] = 'turn all scored cards {C:attention}Electric{}',
            [3] = '{C:inactive,s:0.8}\"X, what\'s wrong? You look depressed!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{}{C:uncommon,s:0.8} Battle For Dream Island{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 4 then
                        count = count + 1
                    end
                end
                return count == 0
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_electric)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}