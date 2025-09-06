SMODS.Joker{ --Chaos Emerald
    key = "chaosemerald",
    config = {
        extra = {
            odds = 5,
            ante_value = 1,
            ante_value2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Chaos Emerald',
        ['text'] = {
            [1] = 'When sold, sends you an Ante back',
            [2] = 'Has a {C:green}1 in 5{} chance to send you forward an Ante instead'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_f95498c3', 1, card.ability.extra.odds, 'j_sauce_chaosemerald', false) then
              SMODS.calculate_effect({func = function()
                    local mod = card.ability.extra.ante_value
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ante +" .. card.ability.extra.ante_value, colour = G.C.FILTER})
          end
            end
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
                    local mod = -card.ability.extra.ante_value2
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end,
                    message = "Ante -" .. card.ability.extra.ante_value2
                }
            end
        end
    end
}