SMODS.Rarity {
    key = "trash",
    pools = {
        ["Joker"] = true
    },
    default_weight = 1,
    badge_colour = HEX('6A7A8B'),
    loc_txt = {
        name = "Trash"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "hallucination",
    pools = {
        ["Joker"] = true
    },
    default_weight = 1,
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
    default_weight = 1,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Unnatural"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}