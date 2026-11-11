
SMODS.Joker{ --Rangers Guests
    key = "rangersguests",
    config = {
        extra = {
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Rangers Guests',
        ['text'] = {
            [1] = 'If card scored is a {C:attention}face {}card of {C:attention}#1#{}, give {C:money}$5{}',
            [2] = '{C:inactive}(Suit required changes every boss defeated){}',
            [3] = '{C:inactive,s:0.8}\"Stop blocking the door.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.suitvar_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suitvar_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suitvar_card = { suit = 'Diamonds' }
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
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
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
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
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card:is_suit(G.GAME.current_round.suitvar_card.suit)) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 5
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}