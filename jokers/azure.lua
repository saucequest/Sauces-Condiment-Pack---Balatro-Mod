
SMODS.Joker{ --Azure
    key = "azure",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Azure',
        ['text'] = {
            [1] = 'Scored Black Suit {C:attention}face {}cards gain',
            [2] = 'a {C:purple}Purple {}Seal',
            [3] = '{C:inactive,s:0.8}\"what have you done...?\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Purple", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}