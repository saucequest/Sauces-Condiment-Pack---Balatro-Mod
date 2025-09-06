SMODS.Joker{ --Retry Now
    key = "retrynow",
    config = {
        extra = {
            livesfailed = 0,
            livesrequired = 15
        }
    },
    loc_txt = {
        ['name'] = 'Retry Now',
        ['text'] = {
            [1] = 'If atleast #2# Kings have been destroyed since bought,',
            [2] = 'prevent a run loss',
            [3] = 'Destroyed Kings required increments by 10 every revive',
            [4] = '{C:inactive}(#1# Kings destroyed){}',
            [5] = '{C:inactive}\"We’re sure to meet in the next life, right?\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.livesfailed, card.ability.extra.livesrequired}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            if (function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:get_id() == 13 then
            return true
        end
    end
    return false
end)() then
                return {
                    func = function()
                    card.ability.extra.livesfailed = (card.ability.extra.livesfailed) + 1
                    return true
                end
                }
            end
        end
        if context.end_of_round and context.game_over and context.main_eval  then
            if (card.ability.extra.livesfailed or 0) >= card.ability.extra.livesrequired then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                    card.ability.extra.livesrequired = (card.ability.extra.livesrequired) + 10
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}