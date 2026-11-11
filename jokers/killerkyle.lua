
SMODS.Joker{ --Killer Kyle
    key = "killerkyle",
    config = {
        extra = {
            xmult0 = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Killer Kyle',
        ['text'] = {
            [1] = 'All cards played will give {X:red,C:white}X1.1{} Mult and then get {C:red}destroyed{}',
            [2] = 'Adds a {C:attention}Wild{} Card to your deck whenever it {C:attention}destroys {}a card',
            [3] = '',
            [4] = '{C:inactive,s:0.8}\"but it was too late the killer was already waiing out side for them\"{}',
            [5] = '{C:inactive,s:0.8}Originates from{} {C:dark_edition,s:0.8}Roblox movie masked killer{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_roblox"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_wild
            }, G.discard, true, false, nil, true)
            
            
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local new_card = copy_card(base_card, nil, nil, G.playing_card)
            
            new_card:add_to_deck()
            
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            G.deck:emplace(new_card)
            table.insert(G.playing_cards, new_card)
            
            base_card:remove()
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    new_card:start_materialize()
                    return true
                end
            }))
            return {
                Xmult = 1.1,
                extra = {
                    message = "Added Card!",
                    colour = G.C.GREEN,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            }
        end
    end
}