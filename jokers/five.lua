
SMODS.Joker{ --Five
    key = "five",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Five',
        ['text'] = {
            [1] = 'Scored 5s gain a {C:attention}Purple{} Seal',
            [2] = '{C:inactive,s:0.8}\"What does he need? Three, what do you need?\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{}{C:uncommon,s:0.8} Battle For Dream Island{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 5 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Purple", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}