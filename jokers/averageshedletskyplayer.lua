
SMODS.Joker{ --average shedletsky player:
    key = "averageshedletskyplayer",
    config = {
        extra = {
            xmult0 = 1.00001,
            odds = 85,
            xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'average shedletsky player:',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to give {X:red,C:white}X3{} Mult',
            [2] = 'Otherwise, give {X:red,C:white}X1.00001{} Mult and be a fat slob',
            [3] = '{C:inactive,s:0.8}\"OH MY GOD, SHEDLETSKY! K*** YOURSELF-\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}FORSAKEN{}',
            [5] = '{C:dark_edition}Shedletsky Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1.1, 
        h = 95 * 1.1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_shed"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_averageshedletskyplayer') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = 1.00001
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_ba24d790', 1, card.ability.extra.odds, 'j_sauce_averageshedletskyplayer', false) then
                            SMODS.calculate_effect({Xmult = 3}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}