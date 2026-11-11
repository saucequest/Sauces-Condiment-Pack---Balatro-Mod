
SMODS.Joker{ --Aki Hayakawa
    key = "akihayakawa",
    config = {
        extra = {
            kon = 0,
            fox = 0,
            changeeffect = 0,
            nails = 0,
            cursedevil = 0,
            xmult0 = 2,
            xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Aki Hayakawa',
        ['text'] = {
            [1] = 'If this Joker is {C:attention}selected{}',
            [2] = 'when a hand is played, {C:red}destroy{}',
            [3] = 'all scored cards and give {X:red,C:white}X2{} Mult',
            [4] = 'If the round was {C:attention}not won{} after',
            [5] = 'this Joker {C:attention}triggered{} 3 times, change effect',
            [6] = 'to next effect',
            [7] = '',
            [8] = '---------- Effect After 3 Failures --------',
            [9] = 'After 3 {C:attention}Steel{} cards have been scored, {C:red}destroy{}',
            [10] = 'the next scored {C:attention}face {}card, give {X:red,C:white}X1.5{} Mult',
            [11] = 'and {C:red}disable {}this effect for the rest of the {C:attention}Ante{}',
            [12] = '{C:inactive,s:0.8}\"But enemies are enemies... we\'re only using them.\"{}',
            [13] = '{C:inactive,s:0.8}Originates from {}{C:attention,s:0.8}Chainsaw{} {s:0.8}Man{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 51
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
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.kon, card.ability.extra.fox, card.ability.extra.changeeffect, card.ability.extra.nails, card.ability.extra.cursedevil}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_akihayakawa" and to_big((card.ability.extra.changeeffect or 0)) == to_big(0)) then
                card.ability.extra.fox = 1
                return {
                    Xmult = 2
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (#G.jokers.highlighted > 0 and G.jokers.highlighted[1].config.center.key == "j_sauce_akihayakawa" and to_big((card.ability.extra.changeeffect or 0)) == to_big(0)) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif (SMODS.get_enhancements(context.other_card)["m_steel"] == true and to_big((card.ability.extra.cursedevil or 0)) == to_big(0) and to_big((card.ability.extra.changeeffect or 0)) == to_big(1)) then
                card.ability.extra.nails = (card.ability.extra.nails) + 1
            elseif (context.other_card:is_face() and to_big((card.ability.extra.nails or 0)) >= to_big(3) or to_big((card.ability.extra.cursedevil or 0)) == to_big(0) and to_big((card.ability.extra.changeeffect or 0)) == to_big(1)) then
                context.other_card.should_destroy = true
                card.ability.extra.nails = 0
                card.ability.extra.cursedevil = 1
                return {
                    Xmult = 1.5,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (to_big((card.ability.extra.fox or 0)) == to_big(1) and to_big(G.GAME.chips / G.GAME.blind.chips) < to_big(1) and to_big((card.ability.extra.changeeffect or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.kon = (card.ability.extra.kon) + 1
                        return true
                    end
                }
            end
        end
        if context.hand_drawn  then
            if to_big((card.ability.extra.kon or 0)) == to_big(3) then
                return {
                    func = function()
                        card.ability.extra.changeeffect = 1
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if to_big((card.ability.extra.changeeffect or 0)) == to_big(1) then
                return {
                    func = function()
                        card.ability.extra.cursedevil = 0
                        return true
                    end
                }
            end
        end
    end
}