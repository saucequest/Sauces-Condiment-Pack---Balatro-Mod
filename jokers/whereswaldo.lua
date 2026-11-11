
SMODS.Joker{ --Wheres Waldo?
    key = "whereswaldo",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Wheres Waldo?',
        ['text'] = {
            [1] = 'When the {C:attention}Blind {}is selected, all',
            [2] = 'Jokers get {C:attention}flipped {}and {C:attention}shuffled{}',
            [3] = 'If this is the {C:attention}leftmost {}Joker when',
            [4] = 'hand played, {C:attention}swap {}Chips and Mult',
            [5] = 'Shuffles all Jokers {C:attention}again {}when',
            [6] = 'hand is {C:attention}done {}scoring'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 33
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 0.85)
                                return true
                            end,
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1.15)
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1)
                                return true
                            end
                        }))
                        delay(0.5)
                        return true
                    end
                }))
            end
            return {
                message = "Flip!",
                extra = {
                    message = "Shuffle!",
                    colour = G.C.ORANGE
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                return G.jokers.cards[1] == card
            end)() then
                return {
                    swap = true
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 0.85)
                                return true
                            end,
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1.15)
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1)
                                return true
                            end
                        }))
                        delay(0.5)
                        return true
                    end
                }))
            end
            return {
                message = "Shuffle!"
            }
        end
    end
}