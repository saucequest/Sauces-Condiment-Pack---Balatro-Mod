
SMODS.Joker{ --Know Your Homers
    key = "knowyourhomers",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Know Your Homers',
        ['text'] = {
            [1] = 'Scored non-{C:attention}#1# {}cards give {X:mult,C:white}X1.5{} Mult',
            [2] = 'Scored {C:attention}#1#{} cards will make you instantly {C:red}lose{}',
            [3] = '{C:inactive}(Losing suit changes after every round){}',
            [4] = '{C:inactive}(Wild Cards count as losing suit){}',
            [5] = '{C:inactive,s:0.8}\"This information may save your life.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.evilhomersuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.evilhomersuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.evilhomersuit_card = { suit = 'Diamonds' }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card:is_suit(G.GAME.current_round.evilhomersuit_card.suit)) then
                return {
                    Xmult = 1.5
                }
            elseif (context.other_card:is_suit(G.GAME.current_round.evilhomersuit_card.suit) or SMODS.get_enhancements(context.other_card)["m_wild"] == true) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_evilhomersuit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_evilhomersuit_cards[#valid_evilhomersuit_cards + 1] = v
                    end
                end
                if valid_evilhomersuit_cards[1] then
                    local evilhomersuit_card = pseudorandom_element(valid_evilhomersuit_cards, pseudoseed('evilhomersuit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.evilhomersuit_card.suit = evilhomersuit_card.base.suit
                end
            end
        end
    end
}