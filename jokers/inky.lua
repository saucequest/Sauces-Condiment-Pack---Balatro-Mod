
SMODS.Joker{ --Inky
    key = "inky",
    config = {
        extra = {
            inkychances = 10
        }
    },
    loc_txt = {
        ['name'] = 'Inky',
        ['text'] = {
            [1] = '{C:attention}Multiplies {}{C:green}probability numerators{} by {C:green}#1#{}',
            [2] = '(ex: {C:green}1 in 3{} -> {C:green}#1# in 3{})',
            [3] = '{C:attention}Increment {}multiplying by 1 when a {C:clubs}Club{} is scored',
            [4] = '{C:inactive,s:0.8}\"I always hit the chances!\"{}',
            [5] = '{C:inactive,s:0.7}https://cja.straw.page/{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.inkychances}}
    end,
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (card.ability.extra.inkychances)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                card.ability.extra.inkychances = (card.ability.extra.inkychances) + 1
            end
        end
    end
}