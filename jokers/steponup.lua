
SMODS.Joker{ --Step On Up
    key = "steponup",
    config = {
        extra = {
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Step On Up',
        ['text'] = {
            [1] = 'If hand contains {C:attention}exactly{} 1 {C:attention}Face{} card,',
            [2] = 'give {X:red,C:white}X2.5{} Mult',
            [3] = 'If hand contains {C:attention}more{} than 1 {C:attention}Face{} card,',
            [4] = '{C:red}destroy{} a random {C:attention}Joker{}',
            [5] = '{C:inactive,s:0.8}\"Step on in, step on him, step on UP!\" {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 30
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 1
            end)() then
                return {
                    Xmult = 2.5
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 2
            end)() then
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}