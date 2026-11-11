
SMODS.Joker{ --Combat Dummy
    key = "combatdummy",
    config = {
        extra = {
            pb_mult_4154cbc0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Combat Dummy',
        ['text'] = {
            [1] = '{C:attention}Face {}Cards gain a permanent {C:red}+5{} Mult',
            [2] = '{C:inactive,s:0.8}\"Okay, I give up.\"{}',
            [3] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Item {}{C:hearts,s:0.8}Asylum{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_dummybuy")
                    
                    return true
                end,
            }))
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_dummysell")
                    
                    return true
                end,
            }))
        end
    end
}