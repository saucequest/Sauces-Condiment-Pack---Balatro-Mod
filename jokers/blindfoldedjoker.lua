
SMODS.Joker{ --Blindfolded Joker
    key = "blindfoldedjoker",
    config = {
        extra = {
            blind_size0 = 1.6
        }
    },
    loc_txt = {
        ['name'] = 'Blindfolded Joker',
        ['text'] = {
            [1] = 'When {C:attention}Boss{} Blind effect is activated, divide',
            [2] = 'Blind {C:attention}requirement {}by 1.6 and {C:attention}flip {}all Jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.triggered then
                if #G.jokers.cards > 0 then
                    for _, joker in ipairs(G.jokers.cards) do
                        joker:flip()
                    end
                end
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(1.6).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips / 1.6
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end,
                    extra = {
                        message = "Flip!",
                        colour = G.C.ORANGE
                    }
                }
            end
        end
    end
}