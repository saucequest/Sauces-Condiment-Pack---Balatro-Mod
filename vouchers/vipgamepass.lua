
SMODS.Voucher {
    key = 'vipgamepass',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'VIP Gamepass',
        text = {
            [1] = 'Unlocks the {C:attention}VIP Door{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 35,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "vip", colour = G.C.BLUE})
                G.GAME.pool_flags.sauce_vip = true
                return true
            end
        }))
    end
}