
SMODS.Joker{ --ashura senku
    key = "ashurasenku",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'ashura senku',
        ['text'] = {
            [1] = '{C:attention}Lastmost{} scoring card\'s rank is {C:attention}converted{}',
            [2] = 'into the {C:attention}leftmost{} scoring card\'s rank',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 41
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.rankyo_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.rankyo_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                G.GAME.current_round.rankyo_card.rank = context.other_card.base.id
            elseif context.other_card == context.scoring_hand[#context.scoring_hand] then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, G.GAME.current_round.rankyo_card.rank))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}