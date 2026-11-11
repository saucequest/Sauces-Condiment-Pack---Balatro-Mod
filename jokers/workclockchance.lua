
SMODS.Joker{ --Workclock Chance
    key = "workclockchance",
    config = {
        extra = {
            currentweekday = 0,
            odds = 2,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Workclock Chance',
        ['text'] = {
            [1] = 'If day playing is on a {C:attention}weekend{}, {C:green}#2# in #3#{} chance for {X:mult,C:white}X2{} Mult',
            [2] = '{C:inactive}Chance is not changable{}',
            [3] = '{C:inactive,s:0.8}\"Snazzy!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 28
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
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_workclockchance') 
        return {vars = {os.date("*t", os.time()).wday, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(7) == to_big(os.date("*t", os.time()).wday) or to_big(1) == to_big(os.date("*t", os.time()).wday)) then
                if SMODS.pseudorandom_probability(card, 'group_0_0f4bc6b7', 1, card.ability.extra.odds, 'j_sauce_workclockchance', true) then
                    SMODS.calculate_effect({Xmult = 2}, card)
                end
            end
        end
    end
}