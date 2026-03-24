config.load_autoconfig(False)

# ---- Minimal UI ----
c.tabs.show = "never"
c.statusbar.show = "never"
c.window.title_format = "{percent} - {current_title}"
c.window.hide_decoration = True

# ---- Start page ----
c.url.start_pages = ["https://duckduckgo.com"]
c.url.default_page = "https://duckduckgo.com"

# ---- Behavior ----
c.auto_save.session = True
c.content.autoplay = False

# ---- Fonts ----
c.fonts.default_family = "Menlo"
c.fonts.default_size = "12pt"

# ---- Smooth scrolling ----
c.scrolling.smooth = True

# ---- Dark mode ----
c.colors.webpage.darkmode.enabled = True
