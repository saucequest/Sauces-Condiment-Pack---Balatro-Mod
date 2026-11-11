
SMODS.Joker{ --eyepatch
    key = "eyepatch",
    config = {
        extra = {
            totaljokerslots = 0,
            blind_size0 = 0.6
        }
    },
    loc_txt = {
        ['name'] = 'eyepatch',
        ['text'] = {
            [1] = 'x0.6 Blind {C:attention}requirement{}, but',
            [2] = '{C:red}divides{} Joker slots in {C:attention}half{} when bought',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 42
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.jokers and G.jokers.config.card_limit or 0 or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.6).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.6
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring((G.jokers and G.jokers.config.card_limit or 0) * 0.5), colour = G.C.BLUE})
                    G.jokers.config.card_limit = (G.jokers and G.jokers.config.card_limit or 0) * 0.5
                    return true
                end
            }
        end
    end
}