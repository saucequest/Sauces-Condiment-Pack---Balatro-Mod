
SMODS.Joker{ --Greed
    key = "greed",
    config = {
        extra = {
            mostmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Greed',
        ['text'] = {
            [1] = 'If hand played is {C:attention}most played{} hand.',
            [2] = 'subtract player\'s {C:attention}highest ever{} money',
            [3] = 'in a run {C:money}($#1#){} from money',
            [4] = 'If hand is {C:red}not {}most played, add a {C:attention}fourth{}',
            [5] = 'of player\'s {C:attention}highest ever{} money to current money',
            [6] = '{C:inactive,s:0.8}\"You really fell for it!\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 34
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sin"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif not ((function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + (G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt) * 0.25
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring((G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt) * 0.25), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}