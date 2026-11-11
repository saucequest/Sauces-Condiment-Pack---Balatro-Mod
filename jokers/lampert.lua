
SMODS.Joker{ --Lampert
    key = "lampert",
    config = {
        extra = {
            multvar = 5
        }
    },
    loc_txt = {
        ['name'] = 'Lampert',
        ['text'] = {
            [1] = 'When a card with an {C:enhanced}Enhancement{} is scored,',
            [2] = '{C:attention}remove {}it and gain {C:red}+5{} Mult',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [4] = '{C:inactive,s:0.8}\"The lights here feel different than what I\'m used to, nothing wrong with that though.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 6,
        y = 15
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.multvar
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.c_base)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.multvar = (card.ability.extra.multvar) + 5
            end
        end
    end
}