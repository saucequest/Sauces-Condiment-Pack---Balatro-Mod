
SMODS.Joker{ --Let There Be Light
    key = "lettherebelight",
    config = {
        extra = {
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Let There Be Light',
        ['text'] = {
            [1] = 'When a {C:attention}Steel{} Card is played, {C:red}destroys {}the card and gives {X:mult,C:white}x3{} Mult',
            [2] = '',
            [3] = '{C:inactive,s:0.8}\"Let us settle the score\"{}',
            [4] = '{C:inactive,s:0.8}Originates from{} {C:clubs,s:0.8}Hit Single{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_steel"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                context.other_card.should_destroy = true
                return {
                    Xmult = 3,
                    message = "LET THERE BE LIGHT!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}