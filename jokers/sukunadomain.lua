
SMODS.Joker{ --Domain Expansion: Malevolent Shrine
    key = "sukunadomain",
    config = {
        extra = {
            repetitions0_min = NaN,
            repetitions0_max = 15,
            repetitions_min = NaN,
            repetitions_max = 15
        }
    },
    loc_txt = {
        ['name'] = 'Domain Expansion: Malevolent Shrine',
        ['text'] = {
            [1] = 'Scored cards are {C:attention}retriggered {}5-15 times,',
            [2] = 'then {C:red}destroyed{}',
            [3] = 'Also activates on {C:attention}held {}in hand {C:attention}face {}cards',
            [4] = '{C:inactive,s:1.2}(Domains will only last 5 rounds){}',
            [5] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}Jujutsu{} {C:blue,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 48
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_domain",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
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
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            return {
                repetitions = pseudorandom('RANGE:5|15', 5, 15),
                message = localize('k_again_ex'),
                extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    repetitions = pseudorandom('RANGE:5|15', 5, 15),
                    message = localize('k_again_ex'),
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}