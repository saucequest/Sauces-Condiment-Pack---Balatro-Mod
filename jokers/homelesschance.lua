
SMODS.Joker{ --Homeless Chance
    key = "homelesschance",
    config = {
        extra = {
            odds = 2,
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Homeless Chance',
        ['text'] = {
            [1] = 'If money is under {C:money}$10{}, {C:green}1 in 2{} chance for {X:mult,C:white}X2.5{} Mult',
            [2] = '{C:inactive}Chance is not changable{}',
            [3] = '{C:inactive,s:0.8}\"times been real tough since he fell for a projected limited scam\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_homelesschance') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.dollars) <= to_big(10) then
                if SMODS.pseudorandom_probability(card, 'group_0_94b60dac', 1, card.ability.extra.odds, 'j_sauce_homelesschance', true) then
                    SMODS.calculate_effect({Xmult = 2.5}, card)
                end
            end
        end
    end
}