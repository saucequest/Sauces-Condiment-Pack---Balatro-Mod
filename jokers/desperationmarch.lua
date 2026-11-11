
SMODS.Joker{ --Desperation March
    key = "desperationmarch",
    config = {
        extra = {
            vocaloidcommunism = 0
        }
    },
    loc_txt = {
        ['name'] = 'Desperation March',
        ['text'] = {
            [1] = 'If hand {C:attention}played{} contains a {C:attention}Queen{},',
            [2] = 'modify all {C:attention}other{} cards into {C:attention}Face{} Cards',
            [3] = '{C:inactive,s:0.8}\"Spin into your place, the rest will comply\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 29
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_vocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.vocaloidcommunism}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                card.ability.extra.vocaloidcommunism = pseudorandom('RANGE:1|3', 1, 3)
            end
        end
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not (context.other_card:get_id() == 12) and to_big((card.ability.extra.vocaloidcommunism or 0)) == to_big(1)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Jack"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not (context.other_card:get_id() == 12) and to_big((card.ability.extra.vocaloidcommunism or 0)) == to_big(2)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Queen"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (to_big((card.ability.extra.vocaloidcommunism or 0)) == to_big(3) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not (context.other_card:get_id() == 12)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "King"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.vocaloidcommunism = 1
                    return true
                end
            }
        end
    end
}