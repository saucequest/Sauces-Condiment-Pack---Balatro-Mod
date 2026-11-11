
SMODS.Joker{ --Super Sonic
    key = "supersonic",
    config = {
        extra = {
            emult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Super Sonic',
        ['text'] = {
            [1] = '{C:dark_edition}^1.2{} Mult if hand scored is all {C:attention}face {}cards',
            [2] = '{C:inactive,s:0.8}\"Time to scramble some Eggmen, SUPER SONIC STYLE!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:common,s:0.8}Sonic the Hedgehog{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 24
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
    soul_pos = {
        x = 4,
        y = 24
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() then
                return {
                    e_mult = 1.2
                }
            end
        end
    end
}