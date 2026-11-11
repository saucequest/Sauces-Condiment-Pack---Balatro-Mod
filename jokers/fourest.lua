
SMODS.Joker{ --Fourest
    key = "fourest",
    config = {
        extra = {
            repetitions0 = 4,
            emult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Fourest',
        ['text'] = {
            [1] = 'All scored {C:attention}unfour{} cards become 4s and',
            [2] = '{C:attention}retrigger {}4 times',
            [3] = 'Played {C:attention}4s {}give {C:dark_edition}^4{} Mult',
            [4] = '{C:inactive,s:0.8}\"THE WORST IS YET TO COME!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:spades,s:0.8}BFDI {}{C:attention,s:0.8}26{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "sauce_unnatural",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if not (context.other_card:get_id() == 4) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "4"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    repetitions = 4,
                    message = localize('k_again_ex')
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    e_mult = 4
                }
            end
        end
    end
}