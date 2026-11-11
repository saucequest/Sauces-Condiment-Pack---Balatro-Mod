
SMODS.Joker{ --Flushtro Joker
    key = "flushtrojoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Flushtro Joker',
        ['text'] = {
            [1] = 'If played hand equals a {C:attention}Flush{}, give {C:attention}Smiley Face{}',
            [2] = '{C:inactive}(Requires room){}',
            [3] = '{C:inactive,s:0.8}\"look at this guy\"{}',
            [4] = '{C:inactive,s:0.7}https://github.com/N0tToxicPlayer/Flushtro{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_smiley"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_smiley\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Flush" then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_smileyface' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end
}