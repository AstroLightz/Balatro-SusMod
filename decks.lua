-- Decks
SMODS.Back{
    key = 'sus',
    loc_txt = {
        name = 'Suspicious Deck',
        text = {
            'Start run with {C:attention}52{}',
            '{C:sus}Sus{} cards in deck'
        }
    },

    atlas = 'DecksA',
    pos = {x = 0, y = 0},

    apply = function (self, back)
        
        G.E_MANAGER:add_event(Event({

            func = function ()

                -- Convert all cards to Sus
                for _, card in ipairs(G.playing_cards) do
                    if card.base.suit ~= SUS_SUIT.key then
                        assert(SMODS.change_base(card, SUS_SUIT.key))
                    end
                end

                return true
            end
        }))

    end
}

-- Full Deck: 52 + 16 Sus cards
-- Only define if CardSleeves is not installed
if not CardSleeves then
    SMODS.Back{
        key = 'full',
        loc_txt = {
            name = 'Full Deck',
            text = {
                'Start run with {C:sus}Sus{}',
                'suit in deck'
            }
        },

        atlas = 'DecksA',
        pos = {x = 1, y = 0},

        apply = function (self, back)
            
            -- Allow Sus cards to be added to the deck
            SUS_SUIT.in_pool = nil

        end
    }
end

-- Crewmate Deck: Start with Bean Merchant and two random Bean cards
SMODS.Back{
    key = 'crewmate',
    loc_txt = {
        name = 'Crewmate Deck',
        text = {
            'Start run with the',
            '{C:attention,T:v_susMod_bean_merchant}Bean Merchant{} voucher',
            '2 {C:bean}Bean{} cards, and',
            '{C:attention}26{} {C:sus}Sus{} cards'
        }
    },

    atlas = 'DecksA',
    pos = {x = 2, y = 0},

    set = 'Back',
    config = {
        voucher = 'v_susMod_bean_merchant'
    },

    apply = function (self, back)
       
        G.E_MANAGER:add_event(Event({

            func = function ()

                -- Convert half the deck to Sus
                i = 0
                for _, card in ipairs(G.playing_cards) do
                    if i < 26 then
                        if card.base.suit ~= SUS_SUIT.key then
                            assert(SMODS.change_base(card, SUS_SUIT.key))
                        end
                    end
                    i = i + 1
                end

                -- Add two random Bean cards
                for _ = 1, 2 do
                    
                    local _card = SMODS.create_card({
                        set = 'Bean',
                        area = G.consumeables
                    })

                    G.consumeables:emplace(_card)

                end

                return true
            end
        }))

    end

}