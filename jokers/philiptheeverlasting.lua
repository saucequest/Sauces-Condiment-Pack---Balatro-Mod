
SMODS.Joker{ --Philip the Everlasting
    key = "philiptheeverlasting",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Philip the Everlasting',
        ['text'] = {
            [1] = 'If next hand contains a {C:attention}#1#{}, make a {C:attention}Bullet{}',
            [2] = 'Rank required {C:attention}changes {}every time a hand is {C:attention}played{}',
            [3] = '{C:inactive,s:0.8}\"He is seen as the ever-standing pillar of an otherwise dead world,{}',
            [4] = '{C:inactive,s:0.8}but nothing is truly everlasting in this place of blood and iron.\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:money,s:0.8}Pizza{} {C:red,s:0.8}Game{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true, ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_sauce_bullet"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sauce_bullet\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {localize((G.GAME.current_round.rank_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.rank_card = { rank = '3', id = 3 }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == rank then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
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
                return {
                    message = created_consumable and localize('k_plus_consumable') or nil
                }
            else
                if G.playing_cards then
                    local valid_rank_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_rank(v) then
                            valid_rank_cards[#valid_rank_cards + 1] = v
                        end
                    end
                    if valid_rank_cards[1] then
                        local rank_card = pseudorandom_element(valid_rank_cards, pseudoseed('rank' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.rank_card.rank = rank_card.base.value
                        G.GAME.current_round.rank_card.id = rank_card.base.id
                    end
                end
            end
        end
    end
}