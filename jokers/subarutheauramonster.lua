
SMODS.Joker{ --Subaru, the Aura Monster
    key = "subarutheauramonster",
    config = {
        extra = {
            pfpofpower = 0
        }
    },
    loc_txt = {
        ['name'] = 'Subaru, the Aura Monster',
        ['text'] = {
            [1] = 'Gain {C:blue}+5{} Chips when {C:attention}Straight {}is played',
            [2] = '{C:red}Lose {}Chips if other hand is played',
            [3] = '{C:inactive,s:0.8}\"HAPPY BIRTHDAY DANIEL!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 51
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["sauce_sauce_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pfpofpower}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight" then
                card.ability.extra.pfpofpower = (card.ability.extra.pfpofpower) + 5
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("sauce_auramonster")
                        
                        return true
                    end,
                }))
            elseif not (context.scoring_name == "Straight") then
                card.ability.extra.pfpofpower = 0
            else
                return {
                    chips = card.ability.extra.pfpofpower
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("sauce_happybirthdaydaniel")
                    
                    return true
                end,
            }))
        end
    end
}