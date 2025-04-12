-- Card Sleeves Support
CardSleeves.Sleeve{
    key = "sus",

    atlas = 'SleevesA',
    pos = { x = 0, y = 0 },

    loc_vars = function(self)
    
        local key, vars

        -- Change description based on which deck is selected
        if self.get_current_deck_key() == "b_susMod_sus" then
            key = self.key .. "_alt"

        else
            key = self.key

        end

        return { key = key, vars = vars }

    end,

    apply = function (self, sleeve)
        if self.get_current_deck_key() == "b_susMod_sus" then
            
            -- Prevent adding Sus suit to the initial deck
            SUS_SUIT.in_pool = function(self, args)
        
                args.initial_deck = false
        
            end
            
            G.E_MANAGER:add_event(Event({

                func = function ()

                    -- Add the Sussy Joker
                    SMODS.add_card({
                        key = 'j_susMod_sussy',
                        set = 'Joker'
                    })

                    return true
                end
            }))

        else
            
            -- Add the sus suit to the initial deck
            SUS_SUIT.in_pool = nil

        end
    end
}