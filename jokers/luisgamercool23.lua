SMODS.Joker{ --luisgamercool23
    key = "luisgamercool23",
    config = {
        extra = {
            luischips = 1,
            blind_size = 2
        }
    },
    loc_txt = {
        ['name'] = 'luisgamercool23',
        ['text'] = {
            [1] = 'Every card played adds {C:blue}0.1 {}to luis\'s {X:chips,C:white}xChips{}',
            [2] = 'If Ante is above 5, {C:red}halves {}the Blind Requirement',
            [3] = '{C:inactive}(Currently{} {X:chips,C:white}x#1#{}{C:inactive} Chips){}',
            [4] = '{C:inactive}\"top 5 reasons why i hate noobs\"{}',
            [5] = '{C:inactive}Originates from {}{C:attention}Flamingo{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.luischips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.luischips = (card.ability.extra.luischips) + 0.1
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.luischips
                }
        end
        if context.setting_blind  then
            if G.GAME.round_resets.ante > 5 then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips / card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            end
        end
    end
}