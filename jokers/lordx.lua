
SMODS.Joker{ --Lord X
    key = "lordx",
    config = {
        extra = {
            lordsmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Lord X',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult when {C:attention}Kings{} are scored',
            [2] = 'Every round {C:attention}defeated{}, increase {C:attention}XMult{} by {X:red,C:white}X0.1{}',
            [3] = '{C:inactive,s:0.8}\"Every death is orchestrated for YOUR amusement.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}SONIC PC PORT{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sonic"] = true },
    soul_pos = {
        x = 4,
        y = 16
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.lordsmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_lord")
                        
                        return true
                    end,
                }))
                return {
                    Xmult = card.ability.extra.lordsmult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.lordsmult = (card.ability.extra.lordsmult) + 0.1
                    return true
                end
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_lordbuy")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_lordsell")
                    
                    return true
                end,
            }))
        end
    end
}