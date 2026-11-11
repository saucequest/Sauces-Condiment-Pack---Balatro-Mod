
SMODS.Booster {
    key = 'shedletsky_pack2',
    loc_txt = {
        name = "Shedletsky Pack",
        text = {
            [1] = 'Choose 1 of 3 Shedletsky Jokers'
        },
        group_name = "Shedletsky Pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
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
            set = "sauce_shed",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sauce_shedletsky_pack2"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'condiment_pack2',
        loc_txt = {
            name = "Condiment Pack",
            text = {
                [1] = 'Choose 1 out of 4 {C:attention}Condiment{}',
                [2] = 'consumables to use {C:attention}instantly{}'
            },
            group_name = "sauce_boosters"
        },
        config = { extra = 4, choose = 1 },
        cost = 5,
        weight = 1.3,
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
                set = "condiment",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "sauce_condiment_pack2"
            }
        end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                timer = 0.015,
                scale = 0.2,
                initialize = true,
                lifespan = 1,
                speed = 1.1,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
    }
    
    
    SMODS.Booster {
        key = 'cursed_pack2',
        loc_txt = {
            name = "Cursed Pack",
            text = {
                [1] = 'Pick 1 of 5 Cursed Jokers',
                [2] = '{C:inactive,s:0.7}(why would you ever want this?){}'
            },
            group_name = "Cursed Pack"
        },
        config = { extra = 5, choose = 1 },
        cost = 2,
        atlas = "CustomBoosters",
        pos = { x = 2, y = 0 },
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
                key_append = "sauce_cursed_pack2"
            }
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'gun_pack2',
            loc_txt = {
                name = "Gun Pack",
                text = {
                    [1] = 'Choose 1 of 4 Gun Jokers'
                },
                group_name = "Gun Pack"
            },
            config = { extra = 4, choose = 1 },
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
                    set = "sauce_gun",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "sauce_gun_pack2"
                }
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'item_pack2',
                loc_txt = {
                    name = "Item Pack",
                    text = {
                        [1] = 'Pick 1 of 3 Item consumables to pull'
                    },
                    group_name = "sauce_boosters"
                },
                config = { extra = 3, choose = 1 },
                cost = 5,
                atlas = "CustomBoosters",
                pos = { x = 4, y = 0 },
                draw_hand = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "item",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "sauce_item_pack2"
                    }
                end,
                particles = function(self)
                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                        timer = 0.015,
                        scale = 0.2,
                        initialize = true,
                        lifespan = 1,
                        speed = 1.1,
                        padding = -1,
                        attach = G.ROOM_ATTACH,
                        colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                        fill = true
                    })
                    G.booster_pack_sparkles.fade_alpha = 1
                    G.booster_pack_sparkles:fade(1, 0)
                end,
            }
            
            
            SMODS.Booster {
                key = 'roblox_pack',
                loc_txt = {
                    name = "Roblox Pack",
                    text = {
                        [1] = 'Choose 1 out of 3 Roblox Jokers'
                    },
                    group_name = "sauce_boosters"
                },
                config = { extra = 3, choose = 1 },
                cost = 6,
                atlas = "CustomBoosters",
                pos = { x = 5, y = 0 },
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "sauce_roblox",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "sauce_roblox_pack"
                    }
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'vocaloid_pack',
                    loc_txt = {
                        name = "Vocaloid Pack",
                        text = {
                            [1] = 'Choose 1 of 3 Vocaloid Jokers'
                        },
                        group_name = "sauce_boosters"
                    },
                    config = { extra = 3, choose = 1 },
                    cost = 8,
                    atlas = "CustomBoosters",
                    pos = { x = 6, y = 0 },
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        return {
                            set = "sauce_vocaloid",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "sauce_vocaloid_pack"
                        }
                    end,
                    particles = function(self)
                        -- No particles for joker packs
                        end,
                    }
                    
                    
                    SMODS.Booster {
                        key = 'oopsallsixesbooster',
                        loc_txt = {
                            name = "Oops! All Oops! All Sixes",
                            text = {
                                [1] = 'Choose 1 out of 10 Oops! All Sixes'
                            },
                            group_name = "sauce_boosters"
                        },
                        config = { extra = 6, choose = 1 },
                        cost = 6,
                        atlas = "CustomBoosters",
                        pos = { x = 7, y = 0 },
                        loc_vars = function(self, info_queue, card)
                            local cfg = (card and card.ability) or self.config
                            return {
                                vars = { cfg.choose, cfg.extra }
                            }
                        end,
                        create_card = function(self, card, i)
                            return {
                                key = "j_oops",
                                set = "Joker",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "sauce_oopsallsixesbooster"
                            }
                        end,
                        ease_background_colour = function(self)
                            ease_colour(G.C.DYN_UI.MAIN, HEX("12af4f"))
                            ease_background_colour({ new_colour = HEX('12af4f'), special_colour = HEX("13ef81"), contrast = 2 })
                        end,
                        particles = function(self)
                            -- No particles for joker packs
                            end,
                        }
                        
                        
                        SMODS.Booster {
                            key = 'mindspack',
                            loc_txt = {
                                name = "Sinister Minds Pack",
                                text = {
                                    [1] = 'Choose 1 out of 4 {C:attention}Sinister{}',
                                    [2] = '{C:attention}Minds {}Jokers'
                                },
                                group_name = "sauce_boosters"
                            },
                            config = { extra = 4, choose = 1 },
                            cost = 8,
                            weight = 0.4,
                            atlas = "CustomBoosters",
                            pos = { x = 8, y = 0 },
                            discovered = true,
                            loc_vars = function(self, info_queue, card)
                                local cfg = (card and card.ability) or self.config
                                return {
                                    vars = { cfg.choose, cfg.extra }
                                }
                            end,
                            create_card = function(self, card, i)
                                return {
                                    set = "sauce_sinisterminds",
                                    area = G.pack_cards,
                                    skip_materialize = true,
                                    soulable = true,
                                    key_append = "sauce_mindspack"
                                }
                            end,
                            ease_background_colour = function(self)
                                ease_colour(G.C.DYN_UI.MAIN, HEX("000000"))
                                ease_background_colour({ new_colour = HEX('000000'), special_colour = HEX("ffffff"), contrast = 2 })
                            end,
                            particles = function(self)
                                -- No particles for joker packs
                                end,
                            }
                            
                            
                            SMODS.Booster {
                                key = 'sonicpack',
                                loc_txt = {
                                    name = "Sonic the Hedgehog Pack",
                                    text = {
                                        [1] = 'Choose 1 out of 3 {C:attention}Sonic the{}',
                                        [2] = '{C:attention}Hedgehog {}Jokers'
                                    },
                                    group_name = "sauce_boosters"
                                },
                                config = { extra = 3, choose = 1 },
                                cost = 6,
                                weight = 0.55,
                                atlas = "CustomBoosters",
                                pos = { x = 9, y = 0 },
                                loc_vars = function(self, info_queue, card)
                                    local cfg = (card and card.ability) or self.config
                                    return {
                                        vars = { cfg.choose, cfg.extra }
                                    }
                                end,
                                create_card = function(self, card, i)
                                    return {
                                        set = "sauce_sonic",
                                        area = G.pack_cards,
                                        skip_materialize = true,
                                        soulable = true,
                                        key_append = "sauce_sonicpack"
                                    }
                                end,
                                particles = function(self)
                                    -- No particles for joker packs
                                    end,
                                }
                                