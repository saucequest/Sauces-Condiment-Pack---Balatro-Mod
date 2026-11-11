
SMODS.Joker{ --Combat King
    key = "combatking",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Combat King',
        ['text'] = {
            [1] = 'When a {C:attention}King {}is scored, make a {C:attention}Perishable{} Combat Dummy',
            [2] = '{C:inactive,s:0.8}\"Fight me like a true warrior!\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_sauce_combatdummy"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_sauce_combatdummy\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sauce_combatdummy' })
                        if joker_card then
                            
                            joker_card:add_sticker('perishable', true)
                        end
                        
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_dummybuy")
                        
                        return true
                    end,
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}