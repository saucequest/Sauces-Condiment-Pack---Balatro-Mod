
SMODS.Joker{ --Devilware
    key = "devilware",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Devilware',
        ['text'] = {
            [1] = 'Scored {C:attention}Burning{} cards create a',
            [2] = '{C:attention}Keyboard Shortcut{}',
            [3] = '{C:inactive}(Requires room){}',
            [4] = '{C:inactive,s:0.8}\"HAHA! YOU ARE IN MY POSSESSION!!\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:green,s:0.8}Di{}{C:common,s:0.8}e o{}{C:dark_edition,s:0.8}f D{}{C:money,s:0.8}ea{}{C:red,s:0.8}th{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 29
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_burning"] == true then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'keyboard_shortcut', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            end
        end
    end
}