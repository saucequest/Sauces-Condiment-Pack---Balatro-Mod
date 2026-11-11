
SMODS.Joker{ --NO MORE INNOCENCE
    key = "nomoreinnocence",
    config = {
        extra = {
            INNOCENCENOMORE = 0
        }
    },
    loc_txt = {
        ['name'] = 'NO MORE INNOCENCE',
        ['text'] = {
            [1] = 'Discarded Jacks turn {C:attention}Glass{} and {C:attention}Foil{}',
            [2] = 'If a {C:attention}Glass{} Card breaks, {C:attention}copy {}the',
            [3] = '{C:attention}leftmost {}Joker as {C:dark_edition}Negative {}and {C:spectral}Perishable{}',
            [4] = 'next played hand',
            [5] = '{C:inactive,s:0.8}\"Your escapism is FAILING YOU.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 43
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.INNOCENCENOMORE}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if context.other_card:get_id() == 11 then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_glass)
                        context.other_card:set_edition("e_foil", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card.shattered then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.INNOCENCENOMORE = 1
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.INNOCENCENOMORE or 0)) == to_big(1) then
                local target_joker = G.jokers.cards[1] or nil
                
                if target_joker then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            copied_joker:set_edition("e_negative", true)
                            copied_joker:add_sticker('perishable', true)
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                end
                card.ability.extra.INNOCENCENOMORE = 1
            end
        end
    end
}