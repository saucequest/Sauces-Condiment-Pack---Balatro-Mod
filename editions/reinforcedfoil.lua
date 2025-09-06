SMODS.Edition {
    key = 'reinforcedfoil',
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        chips = 100
    },
    in_shop = true,
    weight = 3.75,
    extra_cost = 5,
    apply_to_float = false,
    badge_colour = HEX('8f8f8f'),
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Reinforced Foil',
        label = 'Reinforced Foil',
        text = {
        [1] = '{C:blue}+100{} Chips when scored'
    }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return { chips = card.edition.chips }
        end
    end
}