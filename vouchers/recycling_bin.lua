
SMODS.Voucher {
    key = 'recycling_bin',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0.5
        } 
    },
    loc_txt = {
        name = 'Recycling Bin',
        text = {
            [1] = '{C:attention}Trash {}Jokers appear less often'
        },
        unlock = {
            [1] = ''
        }
    },
    cost = 8,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.trash_mod = G.GAME.trash_mod -0.5               
                    return true
                end
            }))
        }
    end
}