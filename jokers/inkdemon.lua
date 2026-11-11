
SMODS.Joker{ --Ink Demon
    key = "inkdemon",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Ink Demon',
        ['text'] = {
            [1] = 'Scored {C:attention}Black {}Suit face cards',
            [2] = 'have a {C:green}1 in 3{} chance to gain',
            [3] = 'a {C:money}Yellow{} Seal',
            [4] = '{C:inactive,s:0.8}\"My ink swells and boils. It consumes.{}',
            [5] = '{C:inactive,s:0.8}I am the Ink Demon. This realm is mine.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Bendy and the{} {s:0.8}Ink Machine{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 48
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sauce_inkdemon') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
                if SMODS.pseudorandom_probability(card, 'group_0_b33981e0', 1, card.ability.extra.odds, 'j_sauce_inkdemon', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("sauce_yellowseal", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}