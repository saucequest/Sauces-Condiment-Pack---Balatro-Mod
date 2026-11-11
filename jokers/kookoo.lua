
SMODS.Joker{ --Kookoo
    key = "kookoo",
    config = {
        extra = {
            kookootimer = 0,
            kookooequal = 12
        }
    },
    loc_txt = {
        ['name'] = 'Kookoo',
        ['text'] = {
            [1] = 'When card is scored, {C:attention}increment {}timer by 1.',
            [2] = 'When timer is #2# and your {C:attention}most played hand{} is scored,',
            [3] = '{C:attention}instantly lose{} the run.',
            [4] = '{C:attention}Randomizes{} what the timer needs to {C:attention}equal {}from 6 to 12 when {C:attention}activated{}',
            [5] = '{C:inactive}(REMEMBER.{} {C:common}#1#{}{C:inactive}){}',
            [6] = '{C:inactive,s:0.8}\"Remember the number, empty your hands when it hits\"{}',
            [7] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}GR{}{C:clubs,s:0.8}AC{}{s:0.8}E{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        x = 4,
        y = 15
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.kookootimer, card.ability.extra.kookooequal}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.kookootimer or 0)) < to_big(12) then
                card.ability.extra.kookootimer = (card.ability.extra.kookootimer) + 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.kookootimer or 0)) == to_big(12) and (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
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
            elseif to_big((card.ability.extra.kookootimer or 0)) == to_big(card.ability.extra.kookooequal) then
                card.ability.extra.kookootimer = 1
                card.ability.extra.kookooequal = pseudorandom('RANGE:6|12', 6, 12)
            end
        end
    end
}