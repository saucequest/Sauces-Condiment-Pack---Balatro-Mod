
SMODS.Joker{ --1. I Miss The Quiet
    key = "imissthequiet",
    config = {
        extra = {
            iffirsthand = 'true',
            xmult0 = 1.5,
            xmult = 0.9
        }
    },
    loc_txt = {
        ['name'] = '1. I Miss The Quiet',
        ['text'] = {
            [1] = 'The {C:attention}first {}5 ranks played of {C:attention}round{}',
            [2] = 'will be {C:attention}logged {}into this Joker\'s description',
            [3] = 'When any of the {C:attention}logged {}ranks are',
            [4] = 'scored, give {X:red,C:white}X1.5{} Mult',
            [5] = 'If a rank that is {C:red}not {}{C:attention}logged {}is played,',
            [6] = 'instead give {X:mult,C:white}x0.9{} Mult',
            [7] = '{C:inactive}(#2#, #3#, #4#, #5#, #6#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 36
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_sinisterminds"] = true, ["sauce_sonic"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.iffirsthand, localize((G.GAME.current_round.loggedr1_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.loggedr2_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.loggedr3_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.loggedr4_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.loggedr5_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.loggedr1_card = { rank = 'Ace', id = 14 }
        G.GAME.current_round.loggedr2_card = { rank = 'Ace', id = 14 }
        G.GAME.current_round.loggedr3_card = { rank = 'Ace', id = 14 }
        G.GAME.current_round.loggedr4_card = { rank = 'Ace', id = 14 }
        G.GAME.current_round.loggedr5_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (card.ability.extra.iffirsthand == 'true' and context.other_card == context.scoring_hand[1]) then
                G.GAME.current_round.loggedr1_card.rank = context.other_card.base.id
            elseif (card.ability.extra.iffirsthand == 'true' and context.other_card == context.scoring_hand[2]) then
                G.GAME.current_round.loggedr2_card.rank = context.other_card.base.id
            elseif (card.ability.extra.iffirsthand == 'true' and context.other_card == context.scoring_hand[3]) then
                G.GAME.current_round.loggedr3_card.rank = context.other_card.base.id
            elseif (card.ability.extra.iffirsthand == 'true' and context.other_card == context.scoring_hand[4]) then
                G.GAME.current_round.loggedr4_card.rank = context.other_card.base.id
            elseif (card.ability.extra.iffirsthand == 'true' and context.other_card == context.scoring_hand[5]) then
                G.GAME.current_round.loggedr5_card.rank = context.other_card.base.id
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 14 or context.other_card:get_id() == 14 or context.other_card:get_id() == 14 or context.other_card:get_id() == 14) then
                return {
                    Xmult = 1.5
                }
            elseif (not (context.other_card:get_id() == 14) and not (context.other_card:get_id() == 14) and not (context.other_card:get_id() == 14) and not (context.other_card:get_id() == 14) and not (context.other_card:get_id() == 14)) then
                return {
                    Xmult = 0.9
                }
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            card.ability.extra.iffirsthand = 'false'
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            card.ability.extra.iffirsthand = 'true'
            G.GAME.current_round.loggedr1_card.rank = 'A'
            G.GAME.current_round.loggedr1_card.id = 14
            G.GAME.current_round.loggedr2_card.rank = 'A'
            G.GAME.current_round.loggedr2_card.id = 14
            G.GAME.current_round.loggedr3_card.rank = 'A'
            G.GAME.current_round.loggedr3_card.id = 14
            G.GAME.current_round.loggedr4_card.rank = 'A'
            G.GAME.current_round.loggedr4_card.id = 14
            G.GAME.current_round.loggedr5_card.rank = 'A'
            G.GAME.current_round.loggedr5_card.id = 14
        end
    end
}