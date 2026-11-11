
SMODS.Voucher {
    key = 'trash_bin',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0
        } 
    },
    loc_txt = {
        name = 'Trash Bin',
        text = {
            [1] = '{C:attention}Trash{} Jokers no longer appear'
        },
        unlock = {
            [1] = ''
        }
    },
    cost = 8,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_sauce_recyclingbin'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.trash_mod = 0               
                    return true
                end
            }))
        }
    end
}