
SMODS.Joker{ --Reminisce 
    key = "reminisce",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Reminisce ',
        ['text'] = {
            [1] = 'Give all cards scored {C:dark_edition}Editions{}',
            [2] = 'if it is {C:attention}last {}played hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 45
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big(G.GAME.current_round.hands_left) == to_big(1) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_sauce_scorched','e_sauce_aluminum_foil','e_sauce_reinforced_foil','e_sauce_perishable'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}