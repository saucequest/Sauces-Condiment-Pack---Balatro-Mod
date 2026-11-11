
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
            [1] = 'If atleast {C:attention}#2# Kings{} have been {C:red}destroyed {}since bought,',
            [2] = '{C:attention}prevent {}a run loss',
            [3] = 'Destroyed {C:attention}Kings {}required {C:attention}increments {}by 5 every {C:attention}revive{}',
            [4] = '{C:inactive}(#1# Kings destroyed){}',
            [5] = '{C:inactive,s:0.8}\"We’re sure to meet in the next life, right?\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_vocaloid"] = true },
    
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
            if to_big((card.ability.extra.livesfailed or 0)) >= to_big(card.ability.extra.livesrequired) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                            card.ability.extra.livesrequired = (card.ability.extra.livesrequired) + 5
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}