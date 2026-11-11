
SMODS.Joker{ --Thanos
    key = "thanos",
    config = {
        extra = {
            balancingtime = 100,
            repetitions = 1,
            xchips0 = 2,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Thanos',
        ['text'] = {
            [1] = '{X:chips,C:white}X2{} Chips and {X:mult,C:white}X2{} Mult #1# times',
            [2] = 'After scoring, {C:red}half {}scoring triggers',
            [3] = '{C:inactive,s:0.8}\"Dread it. Run from it. Destiny arrives all the same. And now, it\'s here. Or should I say, I am.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:red,s:0.8}MARVEL{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 25
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.balancingtime}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({x_chips = 2}, card)
                    SMODS.calculate_effect({Xmult = 2}, card)
                end
                for i = 1, 1 do
                    card.ability.extra.balancingtime = (card.ability.extra.balancingtime) / 2
                    
                end
            end
        end
    end
}