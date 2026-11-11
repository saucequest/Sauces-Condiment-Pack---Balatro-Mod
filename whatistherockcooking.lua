
SMODS.Joker{ --what is the rock cooking
    key = "whatistherockcooking",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'what is the rock cooking',
        ['text'] = {
            [1] = 'Scoring {C:attention}Kings{} gain a random {C:dark_edition}Edition{}',
            [2] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 41
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
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