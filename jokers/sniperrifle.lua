
SMODS.Joker{ --Sniper Rifle
    key = "sniperrifle",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Sniper Rifle',
        ['text'] = {
            [1] = 'If card scored is {C:attention}#1#{}, {C:red}destroy{}',
            [2] = 'the card, give {X:red,C:white}X1.5{} Mult, and give a {C:attention}bullet{}',
            [3] = 'Rank required {C:attention}changes{} whenever required is {C:attention}scored{}',
            [4] = '{C:inactive}(Requires room) {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 29
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_gun"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_bullet"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_bullet\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {localize((G.GAME.current_round.ohbabyatriple_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.ohbabyatriple_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 14 then
                context.other_card.should_destroy = true
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'item', key = 'c_sauce_bullet2'})                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                if G.playing_cards then
                    local valid_ohbabyatriple_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_rank(v) then
                            valid_ohbabyatriple_cards[#valid_ohbabyatriple_cards + 1] = v
                        end
                    end
                    if valid_ohbabyatriple_cards[1] then
                        local ohbabyatriple_card = pseudorandom_element(valid_ohbabyatriple_cards, pseudoseed('ohbabyatriple' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.ohbabyatriple_card.rank = ohbabyatriple_card.base.value
                        G.GAME.current_round.ohbabyatriple_card.id = ohbabyatriple_card.base.id
                    end
                end
                return {
                    Xmult = 1.5,
                    extra = {
                        message = created_consumable and localize('k_plus_consumable') or nil,
                        colour = G.C.PURPLE,
                        extra = {
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                    }
                }
            end
        end
    end
}