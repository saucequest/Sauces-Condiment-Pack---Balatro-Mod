SMODS.Joker{ --Let There Be Light
    key = "lettherebelight",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Let There Be Light',
        ['text'] = {
            [1] = 'When a {C:attention}Steel{} Card is played, {C:red}destroys {}the card and does {X:mult,C:white}x3{} Mult',
            [2] = '',
            [3] = '{C:inactive}\"Let us settle the score\"{}',
            [4] = '{C:inactive}Originates from{} {C:clubs}Hit Single{}'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                context.other_card.should_destroy = true
                return {
                    Xmult = card.ability.extra.Xmult,
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