
SMODS.Joker{ --Spare Trousers Enthusiast
    key = "sparetrousersenthusiast",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Spare Trousers Enthusiast',
        ['text'] = {
            [1] = 'If hand played contains a {C:attention}Two Pair{},',
            [2] = 'create {C:attention}Spare Trousers{}',
            [3] = '{C:inactive,s:0.8}Art by SSarahh themself{}',
            [4] = '{C:inactive,s:0.8}https://steamcommunity.com/profiles/76561199082568900{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_trousers"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_trousers\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Two Pair"]) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_trousers' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}