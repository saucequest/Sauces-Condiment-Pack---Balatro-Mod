
SMODS.Joker{ --californian friday
    key = "californianfriday",
    config = {
        extra = {
            hands = 4,
            currentweekday = 0,
            mult0 = 29,
            mult = 58
        }
    },
    loc_txt = {
        ['name'] = 'californian friday',
        ['text'] = {
            [1] = 'Every #1# {C:attention}hands{}, give {C:red}+29{} Mult',
            [2] = 'If it is {C:attention}Friday{}, give {C:red}+58{} Mult instead',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 37
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gun"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.hands, os.date("*t", os.time()).wday}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.hands or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.hands = 4
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.hands = math.max(0, (card.ability.extra.hands) - 1)
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.hands or 0)) == to_big(4) and not (to_big(os.date("*t", os.time()).wday) == to_big(6))) then
                return {
                    mult = 29,
                    message = "Shoot! "
                }
            elseif (to_big((card.ability.extra.hands or 0)) == to_big(4) and to_big(os.date("*t", os.time()).wday) == to_big(6)) then
                return {
                    mult = 58,
                    message = "Shoot! "
                }
            end
        end
        if context.setting_blind  then
            if to_big((card.ability.extra.hands or 0)) == to_big(4) then
                return {
                    message = "Today is Friday in California. "
                }
            end
        end
    end
}