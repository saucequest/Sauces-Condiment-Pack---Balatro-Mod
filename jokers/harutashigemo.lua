
SMODS.Joker{ --Haruta Shigemo
    key = "harutashigemo",
    config = {
        extra = {
            miracles = 0
        }
    },
    loc_txt = {
        ['name'] = 'Haruta Shigemo',
        ['text'] = {
            [1] = 'Upon a {C:attention}miracle {}activating, store it',
            [2] = 'Prevent {C:attention}death {}at the cost of 3 {C:attention}miracles{}',
            [3] = '{C:inactive}(#1#/6 Miracles stored){}',
            [4] = '-----------------------------------',
            [5] = '{C:attention,s:1.4}-- Miracles --{}',
            [6] = '{C:inactive}Wheel of Fortune activating{}',
            [7] = '{C:inactive}Beating a Blind on final hand{}',
            [8] = '{C:inactive}Using a Soul{}',
            [9] = '{C:inactive}Gaining an Unnatural Joker{}',
            [10] = '{C:inactive}Opening a {}{C:spectral}Spectral{}{C:inactive} Pack{}',
            [11] = '-----------------------------------',
            [12] = '{C:inactive,s:0.8}\"I really am lucky! For another day... I survive!\"{}',
            [13] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 47
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_wheel_of_fortune"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_wheel_of_fortune\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["c_soul"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_soul\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.miracles}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Spectral' and context.consumeable.config.center.key == 'c_soul' and to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_wheel_of_fortune' and to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (to_big(G.GAME.current_round.hands_left) == to_big(0) and to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            end
        end
        if context.open_booster  then
            if (to_big(context.card.config.center.key) == to_big(0) or to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            elseif (to_big(context.card.config.center.key) == to_big(0) or to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            elseif (to_big(context.card.config.center.key) == to_big(0) or to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            elseif (to_big(context.card.config.center.key) == to_big(0) or to_big((card.ability.extra.miracles or 0)) < to_big(6)) then
                return {
                    func = function()
                        card.ability.extra.miracles = (card.ability.extra.miracles) + 1
                        return true
                    end
                }
            end
        end
    end
}