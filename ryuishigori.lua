
SMODS.Joker{ --Ryu Ishigori
    key = "ryuishigori",
    config = {
        extra = {
            graniteblast = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ryu Ishigori',
        ['text'] = {
            [1] = 'Scored {C:attention}Electric {}cards add 1 {C:attention}retrigger{}',
            [2] = 'to the Granite Blast meter',
            [3] = 'Scored {C:attention}face {}cards are {C:attention}retriggered {}by',
            [4] = 'the number in the Granite Blast meter',
            [5] = 'on {C:attention}last {}possible hand',
            [6] = '{C:inactive,s:1.1}(Electric Meter: 0){}',
            [7] = '{C:inactive,s:0.8}\"This is... my desert!\"{}',
            [8] = '{C:inactive,s:0.8}Originates from{} {C:blue,s:0.8}Jujutsu {}{C:red,s:0.8}Kaisen{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 49
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_sauce_electric"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_sauce_electric\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.graniteblast}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_sauce_electric"] == true then
                card.ability.extra.graniteblast = (card.ability.extra.graniteblast) + 1
            elseif (context.other_card:is_face() and to_big(G.GAME.current_round.hands_left) <= to_big(1)) then
                return {
                    repetitions = card.ability.extra.graniteblast,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}