
SMODS.Joker{ --posers katana
    key = "poserskatana",
    config = {
        extra = {
            posermult = 0
        }
    },
    loc_txt = {
        ['name'] = 'posers katana',
        ['text'] = {
            [1] = 'The {C:attention}ranks{} of scoring cards will be',
            [2] = '{C:attention}added{} to this Joker\'s {C:attention}Mult{}',
            [3] = '{C:attention}Releases{} all held Mult as +Mult on',
            [4] = '{C:attention}final hand{} of round',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 38
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
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.posermult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) == to_big(1) then
                return {
                    mult = card.ability.extra.posermult
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 2
            elseif context.other_card:get_id() == 3 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 3
            elseif context.other_card:get_id() == 4 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 4
            elseif context.other_card:get_id() == 5 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 5
            elseif context.other_card:get_id() == 6 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 6
            elseif context.other_card:get_id() == 7 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 7
            elseif context.other_card:get_id() == 8 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 8
            elseif context.other_card:get_id() == 9 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 9
            elseif context.other_card:get_id() == 10 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 10
            elseif context.other_card:get_id() == 11 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 11
            elseif context.other_card:get_id() == 12 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 12
            elseif context.other_card:get_id() == 13 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 13
            elseif context.other_card:get_id() == 14 then
                card.ability.extra.posermult = (card.ability.extra.posermult) + 14
            end
        end
    end
}