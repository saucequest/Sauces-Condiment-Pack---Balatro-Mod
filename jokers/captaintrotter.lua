
SMODS.Joker{ --Captain Trotter
    key = "captaintrotter",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Captain Trotter',
        ['text'] = {
            [1] = 'Scored card of #1# will be given {C:attention}Burning{}',
            [2] = 'Changes required suit when {C:attention}required {}suit is played',
            [3] = '{C:inactive,s:0.8}\"Weigh Anchor and Hoist the Mizzen!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:attention,s:0.8}Block Tales{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.suitvar_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suitvar_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suitvar_card = { suit = 'Diamonds' }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit(G.GAME.current_round.suitvar_card.suit) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_sauce_burning)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                if G.playing_cards then
                    local valid_suitvar_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_suitvar_cards[#valid_suitvar_cards + 1] = v
                        end
                    end
                    if valid_suitvar_cards[1] then
                        local suitvar_card = pseudorandom_element(valid_suitvar_cards, pseudoseed('suitvar' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.suitvar_card.suit = suitvar_card.base.suit
                    end
                end
            end
        end
    end
}