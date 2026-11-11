
SMODS.Joker{ --Ralsei Plush Owners VS Spamton Plush Owners
    key = "ralseiplushownersvsspamtonplushowners",
    config = {
        extra = {
            xmult0 = 1.2,
            xmult = 0.8,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Ralsei Plush Owners VS Spamton Plush Owners',
        ['text'] = {
            [1] = 'Scored {C:red}Red{} Suits give {X:red,C:white}X1.2{} Mult',
            [2] = 'Scored {C:spades}Black{} suits give {X:red,C:white}X0.8{} Mult',
            [3] = 'and have a {C:green}#1# in #2#{} chance to be {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 30
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_ralseiplushownersvsspamtonplushowners') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                return {
                    Xmult = 1.2
                }
            elseif context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    Xmult = 0.8
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_dda19219', 1, card.ability.extra.odds, 'j_sauce_ralseiplushownersvsspamtonplushowners', false) then
                            context.other_card.should_destroy = true
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}