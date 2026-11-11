
SMODS.Joker{ --Hotdog
    key = "hotdog",
    config = {
        extra = {
            hand_size0 = 1,
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Hotdog',
        ['text'] = {
            [1] = 'Disables all {C:attention}Boss Blinds{}, but lowers your hand size',
            [2] = 'by {C:attention}1 {}when disabling',
            [3] = '{C:inactive,s:0.8}\"Hey, give me the hotdog!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 12
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                            
                            G.hand:change_size(-1)
                            return true
                        end,
                        colour = G.C.WHITE
                    }
                    ,
                    func = function()
                        for i = 1, 3 do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    play_sound("sauce_hotdogdisable")
                                    
                                    return true
                                end,
                            }))
                            
                        end
                        return true
                    end
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_hotdogbuy")
                    
                    return true
                end,
            }))
        end
    end
}