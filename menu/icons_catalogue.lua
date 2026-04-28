--- Icons library catalogue: chip definitions, curated picks, pattern-fill
--- rules, and per-chip exclusions. This file is data-only — the projection
--- and rendering live in menu/icons_library.lua.
---
--- Edit by hand or via the curator web app at tools/curate_icons.py. The
--- curator overwrites this whole file on save, so any structural changes
--- (new tables, helpers) belong in menu/icons_library.lua, not here.
---
--- Curated entry shapes:
---   { code = 0xNNNN, ... }   - Nerd Font glyph picked by codepoint. Label
---                              comes from the font's cmap unless overridden
---                              by `label = ...`.
---   { glyph = "<bytes>", label = "..." }
---                            - Pure-Unicode glyph (not in the cmap). Label
---                              is the hand-written description.
--- Optional fields: `label` (override the cmap name), `insert_value` (token
--- string inserted instead of the literal glyph — used for dynamic icons).

local _ = require("bookends_i18n").gettext

local M = {}

-- Chip ordering (left-to-right). "all" is the full Nerd Font index; the
-- curated category chips below show smaller hand-picked lists.
M.CHIPS = {
    { key = "all",        label = _("All") },
    { key = "dynamic",    label = _("Dynamic") },
    { key = "device",     label = _("Device") },
    { key = "reading",    label = _("Reading") },
    { key = "time",       label = _("Time") },
    { key = "status",     label = _("Status") },
    { key = "symbols",    label = _("Symbols") },
    { key = "arrows",     label = _("Arrows") },
    { key = "blocks",     label = _("Blocks") },
    { key = "separators", label = _("Separators") },
}

M.CURATED_BY_CHIP = {
    -- Dynamic icons resolve at render time to a glyph that reflects current
    -- state (battery level, Wi-Fi status). Labels stay human-written so the
    -- "(changes with level)" cue is preserved.
    dynamic = {
        { code = 0xE790, label = _("Battery (changes with level)"), insert_value = "%batt_icon" },
        { code = 0xECA8, label = _("Wi-Fi (changes with status)"),  insert_value = "%wifi" },
    },
    device = {
        { code = 0xE778 },   -- battery
        { code = 0xE783 },   -- battery-charging
        { code = 0xE782 },   -- battery-alert
        { code = 0xE78D },   -- battery-outline
        { code = 0xECA8 },   -- wifi
        { code = 0xECA9 },   -- wifi-off
        { code = 0xEBA1 },   -- signal
        { code = 0xEDF1 },   -- network
        { code = 0xE7AE },   -- bluetooth
        { code = 0xE81B },   -- cellphone
        { code = 0xE266 },   -- chip
        { code = 0xECED },   -- disk
        { code = 0xE268 },   -- cloud
        { code = 0xF013 },   -- cog
    },
    reading = {
        { code = 0xE7B9 },   -- book
        { code = 0xE7BD },   -- book-open-variant
        { code = 0xE7BE },   -- book-variant
        { code = 0xE7BA },   -- book-multiple
        { code = 0xEA30 },   -- library
        { code = 0xE7BF },   -- bookmark
        { code = 0xE7C2 },   -- bookmark-outline
        { code = 0xE7C0 },   -- bookmark-check
        { code = 0xEA99 },   -- note
        { code = 0xEAEA },   -- pencil
        { code = 0xEAE9 },   -- pen
        { code = 0xEB46 },   -- read
    },
    time = {
        { code = 0xE84F },   -- clock
        { code = 0xE851 },   -- clock-fast
        { code = 0xE850 },   -- clock-end
        { code = 0xE71F },   -- alarm
        { code = 0xEE8C },   -- alarm-bell
        { code = 0xE7EC },   -- calendar
        { code = 0xE7ED },   -- calendar-blank
        { code = 0xE7EF },   -- calendar-clock
        { code = 0xE7F5 },   -- calendar-today
        { code = 0xE7EE },   -- calendar-check
        { code = 0xEC1A },   -- timer
        { code = 0xEC1E },   -- timer-sand
        { code = 0xEC88 },   -- watch
    },
    status = {
        { code = 0xE82B },   -- check
        { code = 0xE82C },   -- check-all
        { code = 0xECDF },   -- check-circle
        { code = 0xE855 },   -- close
        { code = 0xE858 },   -- close-circle
        { code = 0xE725 },   -- alert
        { code = 0xE727 },   -- alert-circle
        { code = 0xE728 },   -- alert-octagon
        { code = 0xF449 },   -- info
        { code = 0xE904 },   -- exclamation
        { code = 0xF420 },   -- question
        { code = 0xEA3D },   -- lock
        { code = 0xEA3E },   -- lock-open
        { code = 0xEB97 },   -- shield
        { code = 0xEE7E },   -- shield-half-full
    },
    -- Symbols are pure Unicode (suit symbols, dagger, pilcrow, etc.) — they
    -- aren't in the Nerd Font cmap, so we hand-label them. Check / cross
    -- have moved to the Status chip where they have richer cmap-named
    -- variants (check, check-all, check-circle, …).
    symbols = {
        { glyph = "\xE2\x98\xBC", label = _("Sun (outline)") },
        { glyph = "\xE2\x99\xA8", label = _("Hot springs / warmth") },
        { glyph = "\xE2\x99\xA0", label = _("Spade") },
        { glyph = "\xE2\x99\xA3", label = _("Club") },
        { glyph = "\xE2\x99\xA5", label = _("Heart") },
        { glyph = "\xE2\x99\xA6", label = _("Diamond suit") },
        { glyph = "\xE2\x98\x85", label = _("Star (filled)") },
        { glyph = "\xE2\x98\x86", label = _("Star (outline)") },
        { glyph = "\xE2\x88\x9E", label = _("Infinity") },
        { glyph = "\xC2\xA7",     label = _("Section sign") },
        { glyph = "\xC2\xB6",     label = _("Pilcrow / paragraph") },
        { glyph = "\xE2\x80\xA0", label = _("Dagger") },
        { glyph = "\xE2\x80\xA1", label = _("Double dagger") },
        { glyph = "\xC2\xA9",     label = _("Copyright") },
        { glyph = "\xE2\x84\x96", label = _("Numero") },
        { glyph = "\xE2\x9A\xA1", label = _("High voltage") },
    },
    arrows = {
        { glyph = "\xE2\x86\x90", label = _("Arrow left") },
        { glyph = "\xE2\x86\x92", label = _("Arrow right") },
        { glyph = "\xE2\x86\x91", label = _("Arrow up") },
        { glyph = "\xE2\x86\x93", label = _("Arrow down") },
        { glyph = "\xE2\x87\x90", label = _("Double arrow left") },
        { glyph = "\xE2\x87\x92", label = _("Double arrow right") },
        { glyph = "\xE2\x87\x91", label = _("Double arrow up") },
        { glyph = "\xE2\x87\x93", label = _("Double arrow down") },
        { glyph = "\xE2\x87\x84", label = _("Arrows left-right") },
        { glyph = "\xE2\x87\x89", label = _("Double arrows right") },
        { glyph = "\xE2\xA5\x96", label = _("Left harpoon with right arrow") },
        { glyph = "\xE2\xA4\xBB", label = _("Curved back arrow") },
        { glyph = "\xE2\x86\xA2", label = _("Arrow left with tail") },
        { glyph = "\xE2\x86\xA3", label = _("Arrow right with tail") },
        { glyph = "\xE2\xA4\x9F", label = _("Arrow left to bar") },
        { glyph = "\xE2\xA4\xA0", label = _("Arrow right to bar") },
        { glyph = "\xE2\x86\xA9", label = _("Arrow left hooked") },
        { glyph = "\xE2\x86\xAA", label = _("Arrow right hooked") },
        { glyph = "\xE2\xA4\xB4", label = _("Arrow right then up") },
        { glyph = "\xE2\xA4\xB5", label = _("Arrow right then down") },
        { glyph = "\xE2\x86\xB0", label = _("Arrow up then left") },
        { glyph = "\xE2\x86\xB1", label = _("Arrow up then right") },
        { glyph = "\xE2\x86\xB2", label = _("Arrow down then left") },
        { glyph = "\xE2\x86\xB3", label = _("Arrow down then right") },
        { glyph = "\xE2\x86\xBA", label = _("Circle arrow left") },
        { glyph = "\xE2\x86\xBB", label = _("Circle arrow right") },
        { glyph = "\xE2\x9E\x94", label = _("Heavy arrow right") },
        { glyph = "\xE2\x9E\x9C", label = _("Heavy round arrow right") },
        { glyph = "\xE2\x9E\x9D", label = _("Triangle-head right") },
        { glyph = "\xE2\x9E\x9E", label = _("Heavy triangle right") },
        { glyph = "\xE2\x9E\xA4", label = _("Arrowhead right") },
        { glyph = "\xE2\x9F\xB5", label = _("Long arrow left") },
        { glyph = "\xE2\x9F\xB6", label = _("Long arrow right") },
        { glyph = "\xE2\x96\xB6", label = _("Triangle right") },
        { glyph = "\xE2\x97\x80", label = _("Triangle left") },
        { glyph = "\xE2\x96\xB2", label = _("Triangle up") },
        { glyph = "\xE2\x96\xBC", label = _("Triangle down") },
        { glyph = "\xE2\x80\xB9", label = _("Single angle left") },
        { glyph = "\xE2\x80\xBA", label = _("Single angle right") },
        { glyph = "\xC2\xAB",     label = _("Double angle left") },
        { glyph = "\xC2\xBB",     label = _("Double angle right") },
        { glyph = "\xE2\x98\x9B", label = _("Pointing right (black)") },
        { glyph = "\xE2\x98\x9E", label = _("Pointing right") },
        { glyph = "\xE2\x98\x9C", label = _("Pointing left") },
        { glyph = "\xE2\x98\x9D", label = _("Pointing up") },
        { glyph = "\xE2\x98\x9F", label = _("Pointing down") },
    },
    -- Solid block / shape palette. Designed for hand-rolled progress bars
    -- assembled with [if:book_pct>X]…[/if] nesting — pairs of filled/empty
    -- variants let you compose proportional fills, and the eighth-block
    -- ramps give finer granularity than the four shading levels.
    -- Eighth-block labels use sequential N/8 (rather than mixing 1/4, 1/2,
    -- 3/4) so alphabetical sort produces the fill-order ramp.
    blocks = {
        { glyph = "\xE2\x96\x88", label = _("Block (full)") },
        { glyph = "\xE2\x96\x93", label = _("Block (dark)") },
        { glyph = "\xE2\x96\x92", label = _("Block (medium)") },
        { glyph = "\xE2\x96\x91", label = _("Block (light)") },
        { glyph = "\xE2\x96\x80", label = _("Upper half block") },
        { glyph = "\xE2\x96\x90", label = _("Right half block") },
        { glyph = "\xE2\x96\x81", label = _("Lower 1/8 block") },
        { glyph = "\xE2\x96\x82", label = _("Lower 2/8 block") },
        { glyph = "\xE2\x96\x83", label = _("Lower 3/8 block") },
        { glyph = "\xE2\x96\x84", label = _("Lower 4/8 block") },
        { glyph = "\xE2\x96\x85", label = _("Lower 5/8 block") },
        { glyph = "\xE2\x96\x86", label = _("Lower 6/8 block") },
        { glyph = "\xE2\x96\x87", label = _("Lower 7/8 block") },
        { glyph = "\xE2\x96\x8F", label = _("Left 1/8 block") },
        { glyph = "\xE2\x96\x8E", label = _("Left 2/8 block") },
        { glyph = "\xE2\x96\x8D", label = _("Left 3/8 block") },
        { glyph = "\xE2\x96\x8C", label = _("Left 4/8 block") },
        { glyph = "\xE2\x96\x8B", label = _("Left 5/8 block") },
        { glyph = "\xE2\x96\x8A", label = _("Left 6/8 block") },
        { glyph = "\xE2\x96\x89", label = _("Left 7/8 block") },
        { glyph = "\xE2\x96\xA0", label = _("Square (filled)") },
        { glyph = "\xE2\x96\xA1", label = _("Square (empty)") },
        { glyph = "\xE2\x96\xAC", label = _("Rectangle (filled)") },
        { glyph = "\xE2\x96\xAD", label = _("Rectangle (empty)") },
        { glyph = "\xE2\x96\xAE", label = _("Vertical block") },
        { glyph = "\xE2\x96\xAF", label = _("Vertical block (empty)") },
        { glyph = "\xE2\x96\xB0", label = _("Slant block") },
        { glyph = "\xE2\x96\xB1", label = _("Slant block (empty)") },
        { glyph = "\xE2\x97\x8F", label = _("Circle (filled)") },
        { glyph = "\xE2\x97\x8B", label = _("Circle (empty)") },
        { glyph = "\xE2\x97\x90", label = _("Circle (left half)") },
        { glyph = "\xE2\x97\x91", label = _("Circle (right half)") },
        { glyph = "\xE2\x97\x92", label = _("Circle (lower half)") },
        { glyph = "\xE2\x97\x93", label = _("Circle (upper half)") },
        { glyph = "\xE2\x97\x86", label = _("Diamond (filled)") },
        { glyph = "\xE2\x97\x87", label = _("Diamond (empty)") },
    },
    separators = {
        { glyph = "|",             label = _("Vertical bar") },
        { glyph = "\xE2\x80\xA2", label = _("Bullet") },
        { glyph = "\xC2\xB7",     label = _("Middle dot") },
        { glyph = "\xE2\x8B\xAE", label = _("Vertical ellipsis") },
        { glyph = "\xE2\x97\x86", label = _("Diamond") },
        { glyph = "\xE2\x80\x94", label = _("Em dash") },
        { glyph = "\xE2\x80\x93", label = _("En dash") },
        { glyph = "\xE2\x80\xA6", label = _("Horizontal ellipsis") },
        { glyph = "/",             label = _("Slash") },
        { glyph = "\xE2\x88\x95", label = _("Division slash") },
        { glyph = "\xE2\x81\x84", label = _("Fraction slash") },
        { glyph = "\xE2\x81\x84\xE2\x81\x84", label = _("Double fraction slash") },
        { glyph = "~",             label = _("Tilde") },
        { glyph = "\xE2\x80\xA3", label = _("Triangular bullet") },
    },
}

-- Per-chip patterns used to absorb related cmap entries into a curated
-- chip. Plain-substring match against the cmap name (lowercase kebab-
-- case). Patterns are deliberately narrow words that stick close to the
-- chip's theme; widening them risks pulling unrelated brand or UI icons.
M.PATTERNS_BY_CHIP = {
    device  = { "battery", "wifi", "wireless", "signal", "bluetooth",
                "cellphone", "tablet", "laptop", "monitor", "memory",
                "chip", "disk", "router", "ethernet", "usb",
                "power-plug", "headphone", "speaker", "cog" },
    reading = { "book", "library", "note", "pencil", "feather",
                "format-quote" },
    time    = { "clock", "alarm", "watch", "hourglass", "calendar",
                "timer", "history" },
    status  = { "check", "close", "alert", "info", "shield", "lock",
                "exclamation", "question", "cancel" },
    arrows  = { "arrow", "chevron", "menu-down", "menu-up", "menu-left",
                "menu-right", "triangle" },
}

-- Names matched by a chip's patterns that don't belong there. Substring
-- matching can't distinguish "book" from "facebook"; rather than fight
-- the matcher with anchored patterns (which then miss legitimate hits
-- like "bookmark"), we list the offenders explicitly.
M.PATTERN_EXCLUDES = {
    device = {
        ["incognito"]  = true,
        ["poker-chip"] = true,
    },
    reading = {
        ["facebook"]                  = true,
        ["facebook-box"]              = true,
        ["facebook-messenger"]        = true,
        ["facebook.1"]                = true,
        ["facebook_sign"]             = true,
        ["evernote"]                  = true,
        ["onenote"]                   = true,
        ["bookmark-music"]            = true,
        ["library-music"]             = true,
        ["music-note"]                = true,
        ["music-note-bluetooth"]      = true,
        ["music-note-bluetooth-off"]  = true,
        ["music-note-eighth"]         = true,
        ["music-note-half"]           = true,
        ["music-note-off"]            = true,
        ["music-note-quarter"]        = true,
        ["music-note-sixteenth"]      = true,
        ["music-note-whole"]          = true,
    },
    status = {
        ["block-helper"] = true,
    },
}

return M
