-- Bean Merchant: Bean cards appear 2X more frequently in the shop
SMODS.Voucher{
    key = 'bean_merchant',
    loc_txt = {
        name = 'Bean Merchant',
        text = {
            '{C:bean}Bean{} cards appear',
            '{C:attention}#1#X{} more frequently',
            'in the shop'
        }
    },

    atlas = 'VouchersA',
    pos = { x = 0, y = 0 },

    unlocked = true,
    discovered = false,

    config = {
        extra = 4.8/2,
        extra_disp = 2
    },

    loc_vars = function (self, info_queue, center)
        return {vars = {
            center.ability.extra_disp
        }}
    end,

    cost = 10,

    redeem = function (self, card)
        
        G.E_MANAGER:add_event(Event({

            func = function()
                
                G.GAME.bean_rate = G.GAME.bean_rate * card.ability.extra
                return true

            end
        }))
    end
}

-- Bean Tycoon: Bean cards appear 4X more frequently in the shop
BEAN_TYCOON = SMODS.Voucher{
    key = 'bean_tycoon',
    loc_txt = {
        name = 'Bean Tycoon',
        text = {
            '{C:bean}Bean{} cards appear',
            '{C:attention}#1#X{} more frequently',
            'in the shop'
        }
    },

    atlas = 'VouchersA',
    pos = { x = 0, y = 1 },

    unlocked = true,
    discovered = false,

    config = {
        extra = 9.6/2,
        extra_disp = 4,
    },

    loc_vars = function (self, info_queue, center)
        return {
            vars = {
                center.ability.extra_disp
            }
        }
    end,

    cost = 10,

    requires = {'v_susMod_bean_merchant'},

    redeem = function (self, card)
        
        G.E_MANAGER:add_event(Event({

            func = function()
                
                G.GAME.bean_rate = G.GAME.bean_rate * card.ability.extra
                return true

            end
        }))
    end
}