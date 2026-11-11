
SMODS.Joker{ --Joker 150
    key = "joker150",
    config = {
        extra = {
            chips0 = 150,
            mult0 = 15,
            xmult0 = 15,
            dollars0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Joker 150',
        ['text'] = {
            [1] = '{C:blue}+150{} Chips',
            [2] = '{C:red}+15{} Mult',
            [3] = '{C:money}+$15{} when {C:attention}Blind{} is selected',
            [4] = '{X:mult,C:white}X15{} Mult',
            [5] = '{C:inactive}wow. 150 jokers already, huh?{}',
            [6] = '{C:inactive}i\'d like to thank all the goats in the JokerForge discord server,{}',
            [7] = '{C:inactive}for being great people.{}',
            [8] = '{C:inactive}and lastly, you! for playing this mod. i hope you somehow enjoyed{}',
            [9] = '{C:inactive}this stupid mess of a mod. thank you. thank you all.{}',
            [10] = '{C:inactive,s:0.8}Pixel Perfect? What\'s that?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 150,
    rarity = 4,
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
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 150,
                extra = {
                    mult = 15,
                    extra = {
                        Xmult = 15
                    }
                }
            }
        end
        if context.setting_blind  and not context.blueprint then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 15
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(15), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}