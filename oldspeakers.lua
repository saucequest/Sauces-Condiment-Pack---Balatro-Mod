
SMODS.Joker{ --old speakers
    key = "oldspeakers",
    config = {
        extra = {
            speakerhands = 3,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'old speakers',
        ['text'] = {
            [1] = 'Every 3 hands, {C:attention}retrigger{} scored',
            [2] = '{C:attention}Electric{} cards',
            [3] = 'On {C:attention}other{} hands, {C:red}destroy{} scored',
            [4] = '{C:attention}Electric{} cards',
            [5] = '{C:inactive}(#1# Hands Left) {}',
            [6] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 39
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_ia"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.speakerhands}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true and to_big((card.ability.extra.speakerhands or 0)) == to_big(0)) then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true and not (to_big((card.ability.extra.speakerhands or 0)) == to_big(0))) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.speakerhands or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.speakerhands = 3
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.speakerhands = math.max(0, (card.ability.extra.speakerhands) - 1)
                        return true
                    end
                }
            end
        end
    end
}