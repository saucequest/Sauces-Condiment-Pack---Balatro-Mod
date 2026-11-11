
SMODS.Joker{ --pm9 evil gun
    key = "pm9evilgun",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'pm9 evil gun',
        ['text'] = {
            [1] = '{C:red}Destroy{} scored 9s',
            [2] = 'When {C:attention}destroying{}, create an',
            [3] = '{C:attention}Eternal Cursed{} Joker',
            [4] = '{C:inactive}(Overflows){}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 40
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gun"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 9 then
                context.other_card.should_destroy = true
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'sauce_cursed' })
                        if joker_card then
                            
                            joker_card:add_sticker('eternal', true)
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}