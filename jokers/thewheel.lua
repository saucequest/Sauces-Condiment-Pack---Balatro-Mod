
SMODS.Joker{ --The Wheel
    key = "thewheel",
    config = {
        extra = {
            blind_size0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'The Wheel',
        ['text'] = {
            [1] = 'If {C:attention}played {}hand contains exactly 2 {C:attention}Queens{},',
            [2] = '{C:red}half {}the blind {C:attention}requirement{}',
            [3] = '{C:inactive,s:0.8}https://github.com/ry0803-beep{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 26
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count == 2
            end)() then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(2).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips / 2
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            end
        end
    end
}