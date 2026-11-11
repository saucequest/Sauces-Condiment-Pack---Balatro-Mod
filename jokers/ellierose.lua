
SMODS.Joker{ --Ellie Rose
    key = "ellierose",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ellie Rose',
        ['text'] = {
            [1] = 'Played {C:attention}Queens {}gain a {C:attention}Red{} Seal',
            [2] = '{C:inactive,s:0.8}\"I don\'t know about you, but I\'m runnin\' pretty low on cash...\"{}',
            [3] = '{C:inactive,s:0.8}Originates from He{}{C:money,s:0.8}nry {}{C:red,s:0.8}Sti{}{C:uncommon,s:0.8}ckmin{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
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
            if (context.other_card:get_id() == 12 and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_henrystickmin" then 
                        return true
                    end
                end
            end)()) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sauce_henrystickmin" then 
                        return true
                    end
                end
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}