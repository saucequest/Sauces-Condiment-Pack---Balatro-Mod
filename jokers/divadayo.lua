
SMODS.Joker{ --Divadayo
    key = "divadayo",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Divadayo',
        ['text'] = {
            [1] = 'Scored Queens get a {C:attention}Blue{} Seal',
            [2] = '{C:inactive,s:0.8}\"I wanna see \'em try ragebaiting me now!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Project Diva: {}{C:spectral,s:0.8}Deep Blue{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true, ["sauce_vocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Blue", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}