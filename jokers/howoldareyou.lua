
SMODS.Joker{ --How Old Are You?
    key = "howoldareyou",
    config = {
        extra = {
            dollars0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'How Old Are You?',
        ['text'] = {
            [1] = 'Gives {C:money}$1{} if {C:attention}Ante {}is 4 or less when {C:attention}Blind {}selected',
            [2] = '{C:inactive,s:0.8}\"I\'m 4 years old!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if to_big(G.GAME.round_resets.ante) <= to_big(4) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Im four years old!", colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}