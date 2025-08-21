SMODS.Rarity {
    key = "hallucination",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.001,
    badge_colour = HEX('8200ff'),
    loc_txt = {
        name = "Hallucination"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "unnatural",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.001,
    badge_colour = HEX('bd10e0'),
    loc_txt = {
        name = "Unnatural"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "cursed",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Cursed"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}