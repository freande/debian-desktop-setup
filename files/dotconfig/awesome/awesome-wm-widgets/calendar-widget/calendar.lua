-------------------------------------------------
-- Calendar Widget for Awesome Window Manager
-- Shows the current month and supports scroll up/down to switch month
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/calendar-widget

-- @author Pavel Makhov
-- @copyright 2019 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local calendar_widget = {}

local function worker(user_args)
    local calendar_theme = {
        bg = beautiful.bg,
        fg = beautiful.fg,
        focus_date_bg = beautiful.bg_focus,
        focus_date_fg = beautiful.bg,
        border = beautiful.border_normal
    }

    local args = user_args or {}

    local placement = args.placement or 'bottom_right'
    local radius = args.radius or 0
    local next_month_button = args.next_month_button or 4
    local previous_month_button = args.previous_month_button or 5
    local start_sunday = args.start_sunday or false

    local styles = {}
    local function rounded_shape(size)
        return function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, size)
        end
    end

    styles.month = {
        padding = 4,
        bg_color = calendar_theme.bg,
        border_width = 0,
    }

    styles.normal = {
        markup = function(t) return t end,
        shape = rounded_shape(4)
    }

    styles.focus = {
        fg_color = calendar_theme.focus_date_fg,
        bg_color = calendar_theme.focus_date_bg,
        markup = function(t) return '<b>' .. t .. '</b>' end,
        shape = rounded_shape(4)
    }

    styles.header = {
        fg_color = calendar_theme.fg,
        bg_color = calendar_theme.bg,
        markup = function(t) return '<b>' .. t .. '</b>' end
    }

    styles.weekday = {
        fg_color = calendar_theme.fg,
        bg_color = calendar_theme.bg,
        markup = function(t) return '<b>' .. t .. '</b>' end,
    }

    local function decorate_cell(widget, flag, date)
        if flag == 'monthheader' and not styles.monthheader then
            flag = 'header'
        end

        -- highlight only today's day
        if flag == 'focus' then
            local today = os.date('*t')
            if not (today.month == date.month and today.year == date.year) then
                flag = 'normal'
            end
        end

        local props = styles[flag] or {}
        if props.markup and widget.get_text and widget.set_markup then
            widget:set_markup(props.markup(widget:get_text()))
        end

        local ret = wibox.widget {
            {
                {
                    widget,
                    halign = 'center',
                    widget = wibox.container.place
                },
                margins = (props.padding or 2) + (props.border_width or 0),
                widget = wibox.container.margin
            },
            shape = props.shape,
            shape_border_color = props.border_color or '#000000',
            shape_border_width = props.border_width or 0,
            fg = props.fg_color or calendar_theme.fg,
            bg = props.bg_color or calendar_theme.bg,
            widget = wibox.container.background
        }

        return ret
    end

    local cal = wibox.widget {
        date = os.date('*t'),
        font = beautiful.get_font(),
        fn_embed = decorate_cell,
        long_weekdays = true,
        start_sunday = start_sunday,
        widget = wibox.widget.calendar.month
    }

    local popup = awful.popup {
        ontop = true,
        visible = false,
        shape = rounded_shape(radius),
        offset = { y = 5 },
        border_width = 1,
        border_color = calendar_theme.border,
        widget = cal
    }

    popup:buttons(
        awful.util.table.join(
            awful.button({}, next_month_button, function()
                local a = cal:get_date()
                a.month = a.month + 1
                cal:set_date(nil)
                cal:set_date(a)
                popup:set_widget(cal)
            end),
            awful.button({}, previous_month_button, function()
                local a = cal:get_date()
                a.month = a.month - 1
                cal:set_date(nil)
                cal:set_date(a)
                popup:set_widget(cal)
            end)
        )
    )

    function calendar_widget.toggle()
        if popup.visible then
            -- to faster render the calendar refresh it and just hide
            cal:set_date(nil)     -- the new date is not set without removing the old one
            cal:set_date(os.date('*t'))
            popup:set_widget(nil) -- just in case
            popup:set_widget(cal)
            popup.visible = not popup.visible
        else
            if placement == 'top' then
                awful.placement.top(popup, { margins = { top = 30 }, parent = awful.screen.focused() })
            elseif placement == 'top_right' then
                awful.placement.top_right(popup, { margins = { top = 30, right = 10 }, parent = awful.screen.focused() })
            elseif placement == 'top_left' then
                awful.placement.top_left(popup, { margins = { top = 30, left = 10 }, parent = awful.screen.focused() })
            elseif placement == 'bottom_right' then
                awful.placement.bottom_right(popup, {
                    margins = { bottom = 30, right = 10 },
                    parent = awful.screen.focused()
                })
            elseif placement == 'bottom_left' then
                awful.placement.bottom_left(popup, {
                    margins = { bottom = 30, left = 10 },
                    parent = awful.screen.focused()
                })
            else
                awful.placement.top(popup, { margins = { top = 30 }, parent = awful.screen.focused() })
            end

            popup.visible = true
        end
    end

    return calendar_widget
end

return setmetatable(calendar_widget, {
    __call = function(_, ...)
        return worker(...)
    end
})
