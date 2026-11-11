
SMODS.Joker{ --Gold Tooth Joker
    key = "goldtoothjoker",
    config = {
        extra = {
            gangsterjoker = 0,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Gold Tooth Joker',
        ['text'] = {
            [1] = 'Scored {C:attention}cards{} have a {C:green}#2# in #3#{} chance',
            [2] = 'to become {C:attention}Gold{}',
            [3] = 'Can {C:attention}only{} make {C:attention}one{} card {C:attention}Gold{} per {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 31
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_goldtoothjoker') 
        return {vars = {card.ability.extra.gangsterjoker, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.gangsterjoker or 0)) == to_big(0) then
                if SMODS.pseudorandom_probability(card, 'group_0_7a37d52f', 1, card.ability.extra.odds, 'j_sauce_goldtoothjoker', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_gold)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    card.ability.extra.gangsterjoker = (card.ability.extra.gangsterjoker) + 1
                    
                end
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.gangsterjoker = 1
                    return true
                end
            }
        end
    end
}