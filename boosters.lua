SMODS.Booster {
    key = 'cursed_pack',
    loc_txt = {
        name = "Cursed Pack",
        text = {
            "Pick 1 of 5 Cursed Jokers",
            "(why would you ever want this?)"
        },
        group_name = "Cursed Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 2,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "Joker",
        rarity = "sauce_cursed",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sauce_cursed_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'gun_pack',
    loc_txt = {
        name = "Gun Pack",
        text = {
            "Choose 1 of 4 Gun Jokers."
        },
        group_name = "Gun Pack"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "sauce_gun",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sauce_gun_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'red_ring',
    loc_txt = {
        name = "Red Ring",
        text = {
            "Gives 3 random \"EXE\" Jokers to choose from"
        },
        group_name = "Red Ring"
    },
    config = { extra = 3, choose = 1 },
    cost = 8,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            0.9,
            0.5,
            0.7,
            0.6,
            0.9,
            0.5,
            1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('sauce_red_ring_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_sauce_niku",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 2 then
            return {
            key = "j_sauce_2011x",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 3 then
            return {
            key = "j_sauce_indigo",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 4 then
            return {
            key = "j_sauce_paceandtheshadow",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 5 then
            return {
            key = "j_sauce_elpendriveazul",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 6 then
            return {
            key = "j_sauce_allfather",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        elseif selected_index == 7 then
            return {
            key = "sauce_end",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_red_ring"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("470a0a"))
        ease_background_colour({ new_colour = HEX('470a0a'), special_colour = HEX("fa0000"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'shedletsky_pack',
    loc_txt = {
        name = "Shedletsky Pack",
        text = {
            "Choose 1 of 3 Shedletsky Jokers"
        },
        group_name = "Shedletsky Pack"
    },
    config = { extra = 3, choose = 6 },
    cost = 6,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "sauce_shed",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sauce_shedletsky_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
