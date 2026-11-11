
SMODS.Joker{ --Clock
    key = "clock",
    config = {
        extra = {
            currenthours = 0,
            xmult0 = 1.5,
            xmult = 2,
            xmult2 = 3,
            xmult3 = 4,
            xmult4 = 5,
            xmult5 = 6,
            xmult6 = 7,
            xmult7 = 8,
            xmult8 = 9
        }
    },
    loc_txt = {
        ['name'] = 'Clock',
        ['text'] = {
            [1] = 'Depending on the {C:attention}hour{}, give an amount of {X:mult,C:white}XMult{}',
            [2] = '{s:0.8}1:00 PM - 1:59 PM:{} {X:mult,C:white,s:0.8}X1.5{} {s:0.8}Mult{}',
            [3] = '{s:0.8}2:00 PM - 2:59 PM: {}{X:mult,C:white,s:0.8}X2{} Mult',
            [4] = '{s:0.8}3:00 PM - 3:59 PM: {}{X:mult,C:white,s:0.8}X3{} Mult',
            [5] = '{s:0.8}4:00 PM - 4:59 PM: {}{X:mult,C:white,s:0.8}X4{} Mult',
            [6] = '{s:0.8}5:00 PM - 5:59 PM: {}{X:mult,C:white,s:0.8}X5{} Mult',
            [7] = 'etc until {X:mult,C:white}X9{} Mult',
            [8] = '{C:inactive,s:0.7}\"My name is Clock! Cthing Lthat Oyou Ctell Kthe time oh wait my name is not an acronym,\"{}',
            [9] = '{C:inactive,s:0.8}Originates from{} {X:planet,C:white,s:0.8}It\'s{} {X:planet,C:white,s:0.8}Time{} {X:planet,C:white,s:0.8}for{} {X:planet,C:white,s:0.8}The{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 45,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).hour}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(os.date("*t", os.time()).hour) == to_big(13) then
                return {
                    Xmult = 1.5
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(14) then
                return {
                    Xmult = 2
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(15) then
                return {
                    Xmult = 3
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(16) then
                return {
                    Xmult = 4
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(17) then
                return {
                    Xmult = 5
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(18) then
                return {
                    Xmult = 6
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(19) then
                return {
                    Xmult = 7
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(20) then
                return {
                    Xmult = 8
                }
            elseif to_big(os.date("*t", os.time()).hour) == to_big(21) then
                return {
                    Xmult = 9
                }
            end
        end
    end
}