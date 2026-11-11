
SMODS.Joker{ --Bill Cipher
    key = "billcipher",
    config = {
        extra = {
            ciphermult = 1.1,
            threeofakindlevel = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bill Cipher',
        ['text'] = {
            [1] = 'Give {C:dark_edition}^#1#{} Mult',
            [2] = 'When a {C:attention}face {}card is {C:red}destroyed{},',
            [3] = 'power exponential {C:red}Mult {}by level of {C:attention}Three of a Kind{}{C:inactive} (#2#){}',
            [4] = '{C:inactive,s:0.8}\"I\'ll be WATCHING Y O U....\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Gravity {}{C:blue,s:0.8}Falls{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ciphermult, (G.GAME.hands['Three of a Kind'].level or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.ciphermult = (card.ability.extra.ciphermult) ^ G.GAME.hands['Three of a Kind'].level
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.ciphermult
            }
        end
    end
}