
SMODS.Joker{ --mister retrigger
    key = "misterretrigger",
    config = {
        extra = {
            retriggers = 0
        }
    },
    loc_txt = {
        ['name'] = 'mister retrigger',
        ['text'] = {
            [1] = '{C:attention}Retrigger {}scored cards #1# times',
            [2] = '{C:attention}Increase {}retriggers by 0.5 whenever a card is {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_unnatural",
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.retriggers}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            card.ability.extra.retriggers = (card.ability.extra.retriggers) + 0.5
            return {
                repetitions = card.ability.extra.retriggers,
                message = localize('k_again_ex')
            }
        end
    end
}