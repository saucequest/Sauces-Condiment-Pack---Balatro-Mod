
SMODS.Joker{ --contractor judgement
    key = "contractorjudgement",
    config = {
        extra = {
            repetitions0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'contractor judgement',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} selected, pick a {C:attention}random rank{}',
            [2] = 'When a {C:attention}hand{} is played with the rank, {C:red}destroy{}',
            [3] = 'all other cards and {C:attention}retrigger{} the card',
            [4] = 'with the {C:attention}rank{} 5 times',
            [5] = '{C:inactive}(Rank: #1#){}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 41
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.contractingrank_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.contractingrank_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if G.playing_cards then
                local valid_contractingrank_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_contractingrank_cards[#valid_contractingrank_cards + 1] = v
                    end
                end
                if valid_contractingrank_cards[1] then
                    local contractingrank_card = pseudorandom_element(valid_contractingrank_cards, pseudoseed('contractingrank' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.contractingrank_card.rank = contractingrank_card.base.value
                    G.GAME.current_round.contractingrank_card.id = contractingrank_card.base.id
                end
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.contractingrank_card.id then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not (context.other_card:get_id() == 14)) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.contractingrank_card.id then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and context.other_card:get_id() == 14) then
                return {
                    repetitions = 5,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}