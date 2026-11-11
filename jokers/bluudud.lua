
SMODS.Joker{ --bluudud
    key = "bluudud",
    config = {
        extra = {
            chips0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'bluudud',
        ['text'] = {
            [1] = '{C:clubs}Clubs{} give {C:blue}+50{} Chips',
            [2] = 'Jacks played will be turned into Clubs',
            [3] = '{C:inactive,s:0.8}\"Wanna hear my catchphrase? Oh, nevermind, I forgot.\"{}',
            [4] = '{C:inactive,s:0.8}Originates from {}{C:red,s:0.8}FORSAKEN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    chips = 50
                }
            elseif context.other_card:get_id() == 11 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Clubs", nil))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("bluu_buy")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("bluu_sell")
                    
                    return true
                end,
            }))
        end
    end
}