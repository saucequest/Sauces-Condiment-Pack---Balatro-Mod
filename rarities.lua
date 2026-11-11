SMODS.Rarity {
    key = "hallucination",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
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
    default_weight = 0,
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

SMODS.Rarity {
    key = "trash",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.019,
    badge_colour = HEX('6A7A8B'),
    loc_txt = {
        name = "Trash"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "nonbuyable",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('417505'),
    loc_txt = {
        name = "Non-Buyable"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "domain",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('73000e'),
    loc_txt = {
        name = "Domain"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}