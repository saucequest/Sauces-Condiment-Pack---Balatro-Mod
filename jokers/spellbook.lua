
SMODS.Joker{ --Spellbook
    key = "spellbook",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Spellbook',
        ['text'] = {
            [1] = 'Scored cards gain an {C:enhanced}Enhancement{}',
            [2] = 'If a card is {C:attention}destroyed{}, instantly lose',
            [3] = '{C:inactive,s:0.8}\"HEY! Let\'s be teammates! I\'ll always treat you with the utmost respect!\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {X:attention,C:black,s:0.8}5SOS:{} {X:attention,C:black,s:0.8}Bean\'s{} {X:attention,C:black,s:0.8}Show{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
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
        if context.remove_playing_cards  then
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
        end
    end
}