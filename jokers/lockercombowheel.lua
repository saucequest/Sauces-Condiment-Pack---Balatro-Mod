SMODS.Joker{ --Locker Combo Wheel
    key = "lockercombowheel",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Locker Combo Wheel',
        ['text'] = {
            [1] = 'If hand contains a #1#, a #2#, and a #3#, give {X:mult,C:white}X1.5{} Mult',
            [2] = '{C:inactive}(Required ranks changes every round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.rankone_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.ranktwo_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.rankthree_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.rankone_card = { rank = '2', id = 2 }
        G.GAME.current_round.ranktwo_card = { rank = '3', id = 3 }
        G.GAME.current_round.rankthree_card = { rank = '4', id = 4 }
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                if G.playing_cards then
                        local valid_rankone_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_rankone_cards[#valid_rankone_cards + 1] = v
                            end
                        end
                        if valid_rankone_cards[1] then
                            local rankone_card = pseudorandom_element(valid_rankone_cards, pseudoseed('rankone' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.rankone_card.rank = rankone_card.base.value
                            G.GAME.current_round.rankone_card.id = rankone_card.base.id
                        end
                    end
                if G.playing_cards then
                        local valid_ranktwo_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_ranktwo_cards[#valid_ranktwo_cards + 1] = v
                            end
                        end
                        if valid_ranktwo_cards[1] then
                            local ranktwo_card = pseudorandom_element(valid_ranktwo_cards, pseudoseed('ranktwo' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.ranktwo_card.rank = ranktwo_card.base.value
                            G.GAME.current_round.ranktwo_card.id = ranktwo_card.base.id
                        end
                    end
                if G.playing_cards then
                        local valid_rankthree_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_rankthree_cards[#valid_rankthree_cards + 1] = v
                            end
                        end
                        if valid_rankthree_cards[1] then
                            local rankthree_card = pseudorandom_element(valid_rankthree_cards, pseudoseed('rankthree' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.rankthree_card.rank = rankthree_card.base.value
                            G.GAME.current_round.rankthree_card.id = rankthree_card.base.id
                        end
                    end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == G.GAME.current_round.rankone_card.id then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == G.GAME.current_round.ranktwo_card.id then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == G.GAME.current_round.rankthree_card.id then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
            end
        end
    end
}