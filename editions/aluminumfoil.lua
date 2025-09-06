SMODS.Edition {
    key = 'aluminumfoil',
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        chips = 25
    },
    in_shop = true,
    weight = 11.75,
    apply_to_float = false,
    badge_colour = HEX('969696'),
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Aluminum Foil',
        label = 'Aluminum Foil',
        text = {
        [1] = '{C:blue}+25{} Chips when scored'
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