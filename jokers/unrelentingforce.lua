
SMODS.Joker{ --unrelenting force
    key = "unrelentingforce",
    config = {
        extra = {
            straights = 5,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'unrelenting force',
        ['text'] = {
            [1] = '{X:mult,C:white}X3{} Mult every 5 {C:attention}Straights{}',
            [2] = '{C:inactive}(#1# Straights Remaining){}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 40
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.straights}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.straights or 0)) == to_big(0) and context.scoring_name == "Straight") then
                return {
                    Xmult = 3
                }
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if context.scoring_name == "Straight" then
                return {
                    func = function()
                        card.ability.extra.straights = math.max(0, (card.ability.extra.straights) - 1)
                        return true
                    end
                }
            elseif (context.scoring_name == "Straight" and to_big((card.ability.extra.straights or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.straights = 5
                        return true
                    end
                }
            end
        end
    end
}