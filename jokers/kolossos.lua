
SMODS.Joker{ --Kolossos
    key = "kolossos",
    config = {
        extra = {
            bigmeatyclaws = 0
        }
    },
    loc_txt = {
        ['name'] = 'Kolossos',
        ['text'] = {
            [1] = 'If hand {C:attention}contains{} atleast 1 {C:attention}Face{} card,',
            [2] = 'make the {C:attention}first{} scoring non-Face card {C:attention}Meat{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:spectral,s:0.8}Sonic.EX{}{C:red,s:0.8}E: The Di{}{C:orange,s:0.8}saster'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bigmeatyclaws}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and to_big((card.ability.extra.bigmeatyclaws or 0)) == to_big(0) and not (context.other_card:is_face())) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_meat)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.bigmeatyclaws = 1
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.bigmeatyclaws = 1
                    return true
                end
            }
        end
    end
}