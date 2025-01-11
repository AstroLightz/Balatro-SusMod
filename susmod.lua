-- Amogus Suit
sus_suit = SMODS.Suit{
    key = 'Sus',
    card_key = 'SUS',

    hc_atlas = 'HC_susModA',
    lc_atlas = 'susModA',
    hc_ui_atlas = 'HC_UI_susModA',
    lc_ui_atlas = 'UI_susModA',

    pos = { y = 0},

    ui_pos = { x = 0, y = 0},

    hc_colour = HEX('D33AA1'),
    lc_colour = HEX('EE54BA'),

    loc_txt = {
        singular = 'Sus',
        plural = 'Sus',
    },

    in_pool = function(self, args)
        
        args.initial_deck = false

    end    
}

-- Setup Localiation Colors
G.C.SUITS.Sus = HEX('EE54BA')
G.C.BEAN = HEX('F03463')
G.C.SUSSY = HEX('C252B5')

local lc = loc_colour
function loc_colour(_c, _default)

    if not G.ARGS.LOC_COLOURS then
        lc()
    end

    -- Define custom colors
    G.ARGS.LOC_COLOURS.sus = G.C.SUITS.Sus
    G.ARGS.LOC_COLOURS.bean = G.C.BEAN

    return lc(_c, _default)

end

-- Load needed files
assert(SMODS.load_file('atlases.lua'))()
assert(SMODS.load_file('poker_hands.lua'))()
assert(SMODS.load_file('jokers.lua'))()
assert(SMODS.load_file('decks.lua'))()
assert(SMODS.load_file('beans.lua'))()
assert(SMODS.load_file('boosters.lua'))()

-- Bean Card Collectibles
SMODS.ConsumableType{
    key = 'Bean',

    collection_rows = {4, 4},
    shop_rate = 0,

    primary_colour = HEX('F03463'),
    secondary_colour = HEX('E92D5C'),
    
    loc_txt = {
        name = 'Bean',
        collection = 'Bean Cards',
        undiscovered = {
            name = 'Not Discovered',
            text = {
                'Use this card',
                'in an unseeded',
                'run to learn',
                'what it does'
            }
        }
    }
}

SMODS.UndiscoveredSprite{
    object_type = "UndiscoveredSprite",
    key = 'Bean',
    atlas = 'BeansA',
    pos = { x = 0, y = 1 }
}





-- Sus Suit Tarot
-- TODO: Fix crashing when using and hovering over The Fool
SMODS.Consumable{
    key = 'The_Sus',
    set = 'Tarot',
    loc_txt = {
        name = 'The Sus',
        text = {
            'Converts up to',
            '{C:attention}#1#{} selected cards',
            'to {V:1}#2#{} cards',
        }
    },

    config = { extra = {
        convert_num = 3,
        suit_name = 'Sus',
        suit = sus_suit.key
    }},

    loc_vars = function(self, info_queue, center)
        return {vars = {
            center.ability.extra.convert_num,
            center.ability.extra.suit_name,
            colours = { G.C.SUITS.Sus }
        }}
    end,

    atlas = 'SusTarotA',
    pos = { x = 0, y = 0 },

    cost = 3,

    unlocked = true,
    discovered = false,

    can_use = function(self, card)
        -- Only allow use when 1-3 cards are selected
        return #G.hand.highlighted >= 1 and #G.hand.highlighted <= 3
    end,

    use = function(self, card, area, copier)

        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4, func = function()

                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true

            end 
        }))
            
        -- Flip all selected card over
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',delay = 0.15,func = function() 
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        -- Change all selected cards to sus suit
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',delay = 0.1,func = function()
                    SMODS.change_base(G.hand.highlighted[i], card.ability.extra.suit)
                    return true
                end 
            }))
        end

        -- Flip cards back
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        -- Deselect all cards
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.2,func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.5)

    end
}

-- The Imposter: Sus Suit Debuff Blind
SMODS.Blind{
    key = 'blind_imposter',
    loc_txt = {
        name = 'The Imposter',
        text = {
            'All Sus cards',
            'are debuffed'
        }
    },
    dollars = 5,
    mult = 2,
    
    boss = { min = 1, max = 10 },
    boss_colour = G.C.SUSSY,

    atlas = 'SusBlindsA',
    pos = { x = 0, y = 0 },

    discovered = false,
    debuff = {
        suit = sus_suit.key
    }
}

-- Amogus Deck Skins
-- Spades
SMODS.DeckSkin{
    key = 'skin_amogus_s',
    suit = 'Spades',
    ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
    lc_atlas = 'SkinsA',
    loc_txt = 'Amogus'
}

-- Hearts
SMODS.DeckSkin{
    key = 'skin_amogus_h',
    suit = 'Hearts',
    ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
    lc_atlas = 'SkinsA',
    loc_txt = 'Amogus'
}

-- Clubs
SMODS.DeckSkin{
    key = 'skin_amogus_c',
    suit = 'Clubs',
    ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
    lc_atlas = 'SkinsA',
    loc_txt = 'Amogus'
}

-- Diamonds
SMODS.DeckSkin{
    key = 'skin_amogus_d',
    suit = 'Diamonds',
    ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' },
    lc_atlas = 'SkinsA',
    loc_txt = 'Amogus'
}