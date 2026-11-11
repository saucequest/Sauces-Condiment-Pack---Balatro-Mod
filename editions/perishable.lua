
SMODS.Shader({ key = 'gilded', path = 'gilded.fs' })

SMODS.Edition {
    key = 'perishable',
    shader = 'gilded',
    in_shop = false,
    weight = 3.5,
    apply_to_float = false,
    badge_colour = HEX('389fff'),
    sound = { sound = "negative1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Perishable',
        label = 'Perishable',
        text = {
            [1] = 'This {C:attention}Joker {}is {C:red}destroyed {}in 3 {C:attention}scores{}'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) then
            card.ability.extra.perishing = math.max(0, (card.ability.extra.perishing) - 1)
        end
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) then
            card.should_destroy = false
            if to_big((card.ability.extra.perishing or 0)) == to_big(0) then
                card.should_destroy = true
            end
        end
    end
}