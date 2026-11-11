
SMODS.Joker{ --Spud!
    key = "spud",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Spud!',
        ['text'] = {
            [1] = 'If {C:attention}first played hand{} is a single scoring {C:attention}Face {}card,',
            [2] = 'give it a random {C:enhanced}Enhancement{}',
            [3] = '{C:inactive,s:0.8}\"I miss erm.. being a camp counselor... spud spud spud..\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:legendary,s:0.8}RE{}{s:0.8}GR{}{C:money,s:0.8}ET{}{C:red,s:0.8}EV{}{C:clubs,s:0.8}AT{}{C:planet,s:0.8}OR{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    soul_pos = {
        x = 0,
        y = 24
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.scoring_hand) == to_big(1) and context.other_card:is_face()) then
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
            end
        end
    end
}