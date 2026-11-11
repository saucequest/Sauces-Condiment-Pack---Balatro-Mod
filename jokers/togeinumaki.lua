
SMODS.Joker{ --Toge Inumaki
    key = "togeinumaki",
    config = {
        extra = {
            highcardlevel = 0,
            pairlevel = 0,
            threeofakindlevel = 0,
            straightlevel = 0,
            flushlevel = 0,
            fullhouselevel = 0,
            fourofakindlevel = 0,
            fiveofakindlevel = 0,
            straightflushlevel = 0,
            flushhouselevel = 0,
            flushfivelevel = 0
        }
    },
    loc_txt = {
        ['name'] = 'Toge Inumaki',
        ['text'] = {
            [1] = 'Add the {C:attention}level {}of a hand x 1.5 as {C:red}Mult{}',
            [2] = 'to played hand if it {C:attention}contains {}the hand',
            [3] = '{C:inactive,s:0.8}\"Salmon.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 49
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.GAME.hands['High Card'].level or 0)) * 1.5, ((G.GAME.hands['Pair'].level or 0)) * 1.5, ((G.GAME.hands['Three of a Kind'].level or 0)) * 1.5, ((G.GAME.hands['Straight'].level or 0)) * 1.5, ((G.GAME.hands['Flush'].level or 0)) * 1.5, ((G.GAME.hands['Full House'].level or 0)) * 1.5, ((G.GAME.hands['Four of a Kind'].level or 0)) * 1.5, ((G.GAME.hands['Five of a Kind'].level or 0)) * 1.5, ((G.GAME.hands['Straight Flush'].level or 0)) * 1.5, ((G.GAME.hands['Flush House'].level or 0)) * 1.5, ((G.GAME.hands['Flush Five'].level or 0)) * 1.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["High Card"]) then
                return {
                    mult = (G.GAME.hands['High Card'].level) * 1.5
                }
            elseif next(context.poker_hands["Pair"]) then
                return {
                    mult = (G.GAME.hands['Pair'].level) * 1.5
                }
            elseif next(context.poker_hands["Two Pair"]) then
                return {
                    mult = (G.GAME.hands['Pair'].level) * 1.5
                }
            elseif next(context.poker_hands["Three of a Kind"]) then
                return {
                    mult = (G.GAME.hands['Three of a Kind'].level) * 1.5
                }
            elseif next(context.poker_hands["Straight"]) then
                return {
                    mult = (G.GAME.hands['Straight'].level) * 1.5
                }
            elseif next(context.poker_hands["Flush"]) then
                return {
                    mult = (G.GAME.hands['Flush'].level) * 1.5
                }
            elseif next(context.poker_hands["Full House"]) then
                return {
                    mult = (G.GAME.hands['Full House'].level) * 1.5
                }
            elseif next(context.poker_hands["Four of a Kind"]) then
                return {
                    mult = (G.GAME.hands['Four of a Kind'].level) * 1.5
                }
            elseif next(context.poker_hands["Five of a Kind"]) then
                return {
                    mult = (G.GAME.hands['Five of a Kind'].level) * 1.5
                }
            elseif next(context.poker_hands["Straight Flush"]) then
                return {
                    mult = (G.GAME.hands['Straight Flush'].level) * 1.5
                }
            elseif next(context.poker_hands["Flush House"]) then
                return {
                    mult = (G.GAME.hands['Flush House'].level) * 1.5
                }
            elseif next(context.poker_hands["Flush Five"]) then
                return {
                    mult = (G.GAME.hands['Flush Five'].level) * 1.5
                }
            end
        end
    end
}