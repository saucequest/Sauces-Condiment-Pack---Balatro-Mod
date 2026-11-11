
SMODS.Joker{ --Litany
    key = "litany",
    config = {
        extra = {
            handsplayed = 0,
            active = 0
        }
    },
    loc_txt = {
        ['name'] = 'Litany',
        ['text'] = {
            [1] = 'Every {C:attention}3 hands{} played, become {C:attention}active{}',
            [2] = 'If scored hand is your {C:attention}most played{} hand',
            [3] = 'when {C:attention}active{}, instantly {C:attention}lose{}',
            [4] = '{C:inactive}(why did you listen.{} {C:red}#2#{}{C:inactive}){}',
            [5] = '{C:inactive,s:0.8}\"don’t keep your head high when it looks.\"{}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}GR{}{C:clubs,s:0.8}AC{}{s:0.8}E{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "sauce_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gracescape"] = true },
    soul_pos = {
        x = 0,
        y = 16
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsplayed, card.ability.extra.active}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.handsplayed or 0)) == to_big(3) and not ((function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)())) then
                card.ability.extra.handsplayed = 1
                card.ability.extra.active = 1
            elseif (to_big((card.ability.extra.handsplayed or 0)) == to_big(3) and (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
                card.ability.extra.handsplayed = 1
                card.ability.extra.active = 1
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            else
                card.ability.extra.handsplayed = (card.ability.extra.handsplayed) + 1
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.active = 1
                    return true
                end
            }
        end
    end
}