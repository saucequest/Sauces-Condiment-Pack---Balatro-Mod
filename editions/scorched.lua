SMODS.Shader({ key = 'ionized', path = 'ionized.fs' })

SMODS.Edition {
    key = 'scorched',
    shader = 'ionized',
    config = {
        x_mult = 2
    },
    in_shop = true,
    weight = 0.5,
    apply_to_float = true,
    badge_colour = HEX('ff7300'),
    sound = { sound = "chips1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Scorched',
        label = 'Scorched',
        text = {
        [1] = '{X:red,C:white}X2{} Mult',
        [2] = 'Destroys self after being triggered 5 times',
        [3] = '{C:inactive}(#1# triggers left){}'
    }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            card.ability.extra.var1 = math.max(0, (card.ability.extra.var1) - 1)
            SMODS.calculate_effect({x_mult = card.edition.x_mult}, card)
        end
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            card.should_destroy = false
            if (card.ability.extra.burn or 0) == 0 then
                card.should_destroy = true
            end
        end
    end
}