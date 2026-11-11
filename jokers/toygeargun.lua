
SMODS.Joker{ --toy gear gun
    key = "toygeargun",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'toy gear gun',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} cards are {C:attention}retriggered{}',
            [2] = 'and then randomly {C:enhanced}enhanced{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 40
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true, ["sauce_gun"] = true, ["sauce_ia"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}