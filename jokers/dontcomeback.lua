
SMODS.Joker{ --16. Dont Come Back
    key = "dontcomeback",
    config = {
        extra = {
            rounds = 0,
            pb_mult_a75650f1 = 5
        }
    },
    loc_txt = {
        ['name'] = '16. Dont Come Back',
        ['text'] = {
            [1] = 'Cards scored in the {C:attention}first {}5',
            [2] = '{C:attention}rounds {}after this Joker is',
            [3] = 'bought will be {C:attention}Marked{}',
            [4] = '{C:attention}After {}the 5 rounds, scored',
            [5] = '{C:attention}Marked {}cards will gain a',
            [6] = 'permanent {C:red}+5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 36
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.rounds = (card.ability.extra.rounds) + 1
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.rounds or 0)) <= to_big(5) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("sauce_marked", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (to_big((card.ability.extra.rounds or 0)) > to_big(5) and context.other_card.seal == "Sauce_marked") then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}