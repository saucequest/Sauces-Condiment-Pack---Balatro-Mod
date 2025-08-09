SMODS.Booster {
    key = 'red_ring',
    loc_txt = {
        name = "Red Ring",
        text = {
            "Gives 3 random \"EXE\" Jokers to choose from."
        },
        group_name = "Red Ring"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
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
            0.6
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
