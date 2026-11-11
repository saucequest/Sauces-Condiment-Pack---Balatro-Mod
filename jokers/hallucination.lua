
SMODS.Joker{ --Noli?
    key = "hallucination",
    config = {
        extra = {
            chips0 = 201,
            mult0 = 0.8
        }
    },
    loc_txt = {
        ['name'] = 'Noli?',
        ['text'] = {
            [1] = '{C:blue}+201.0{} Chips',
            [2] = '{C:red}+0.8{} Mult',
            [3] = '',
            [4] = '',
            [5] = '{C:inactive,s:0.8}\"This thing of darkness I acknowledge mine.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:spades,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "sauce_hallucination",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 201,
                extra = {
                    mult = 0.8
                }
            }
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_hallucination")
                    
                    return true
                end,
            }))
        end
    end
}