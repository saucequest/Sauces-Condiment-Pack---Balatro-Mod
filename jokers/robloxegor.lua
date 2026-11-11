
SMODS.Joker{ --Roblox_Egor
    key = "robloxegor",
    config = {
        extra = {
            speed = 1,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Roblox_Egor',
        ['text'] = {
            [1] = 'When {C:attention}Electric {}card scored, give a {C:attention}Speed {}tag',
            [2] = 'Whenever {C:attention}Roblox {} is used, {C:attention}double {}number of {C:attention}Speed{}',
            [3] = 'tags given',
            [4] = '{C:inactive}(Currently give{} {C:attention}#1#{} {C:inactive}Speed Tags){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 21
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["c_sauce_roblox"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_roblox\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.speed}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                for i = 1, card.ability.extra.repetitions do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_skip")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
                end
            end
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_sauce_roblox' then
                return {
                    func = function()
                        card.ability.extra.speed = (card.ability.extra.speed) * 2
                        return true
                    end
                }
            end
        end
    end
}