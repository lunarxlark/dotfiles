local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
  vim.notify("'alpha' not found", "warn")
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "⠻⣤⡀⠀⠉⠲⣄⡀⠈⠙⠓⠒⠦⠤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠄⠀⠀⠀⠀⠈⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠈⢿⡆⠀⠀⣤⡹⢶⣄⡀⠀⠀⠀⠀⠀⠈⠉⠙⠒⠦⣤⣀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠢⠤⢤⣙⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠈⠻⣄⠀⠀⠉⠳⢦⣁⡀⠀⠀⠀⠀⠑⠲⢤⡀⠀⠀⠈⠙⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡖⠶⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠓⢯⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠆⠀⠀⢹⠀⠀⢻⣷⢤⡀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠙⢷⣄⠀⣀⠰⣿⣛⡒⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⢠⠟⠀⠀⠀⢸⠀⠀⠀⢿⡆⠹⣦⡀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡜⣶⢦⣭⣿⠿⠒⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⢠⠀⠀⠀⠀⢀⡞⣠⠎⠀⠀⠀⢀⡏⠀⠀⠀⠈⠑⠀⠱⡟⢦⡀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣾⡷⠶⠏⢙⣲⠶⠂⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⠀⢀⠋⠀⠀⢀⡴⢋⡴⠋⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠹⣄⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡽⢷⣶⠛⠷⠶⢀⡼⢠⠇⠀⠀⠀⠀⠀⡞⠀⠀⣰⠀⠀⠀⠀⣠⠞⣡⡾⠁⠀⠀⠀⠀⠀⢀⡼⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠘⣆⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣩⡿⠛⠀⠀⠀⠀⣼⠇⣾⠀⠀⠀⣰⠀⢰⠃⠀⢀⡇⠀⢀⡴⠊⣠⢾⠟⠀⠀⠀⠀⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⡸⠀⡼⠀⠀⠘⡄",
  "⠀⠀⠀⠀⠀⣶⣶⠶⠖⠒⠋⠁⠀⠀⠀⠀⠀⢠⡏⢀⠇⠀⢠⠀⡏⠀⢸⠀⠀⣾⠠⠀⣉⡴⠞⡡⢋⡴⠁⠀⠀⠀⣀⡼⠋⠀⠀⠀⠀⠀⠀⠀⠼⠁⢸⠃⠀⠀⢠⢣",
  "⠀⠀⠀⠀⠀⠉⠛⠳⣶⣤⠄⠀⠀⠀⠀⠀⠀⣼⡇⢸⠀⠀⡿⠀⠀⠀⡇⣤⠾⠇⡶⠚⠉⣠⣞⣡⠊⠁⠀⢀⣠⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⣠⠃⣠⢃⠆⠀⠀⣼⢸",
  "⠀⠀⠀⠀⠀⡐⢿⣿⣷⣦⡀⠀⠀⠀⢀⣴⢇⣿⠀⢸⠀⠀⣇⠀⠀⠀⡇⠀⠀⣰⠃⣠⣾⡟⠋⠀⢀⡤⠖⣋⡴⠎⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⣾⣷⠋⠀⠀⠀⡿⢸",
  "⠀⠀⠀⠈⠻⣿⣛⠉⠀⠀⠠⠤⠴⠶⡾⢫⢸⣿⠀⢸⠀⠀⢻⠀⠀⢰⡇⢠⣼⣿⡟⠁⡼⠀⠀⢛⡫⠶⠛⢥⣀⣀⠀⠀⣠⠖⢁⣴⡾⠁⢠⣾⠟⠁⠀⢀⠆⢰⢧⢿",
  "⠀⠀⠀⠀⠠⣤⣿⣟⡛⠀⠀⠀⠠⠞⠁⣿⣸⣿⢀⡄⠀⠀⠘⠀⠀⠈⡇⠀⡿⣿⣣⢠⠇⠀⠀⠀⠀⢀⣤⢞⣁⢤⣽⣻⣷⣫⢷⡿⢴⣾⣻⠛⠀⣠⢦⡞⢠⣾⠏⡞",
  "⠀⠀⠀⠀⠀⢈⣽⠟⠁⠀⠀⠀⠀⠀⠀⠉⣿⣿⡜⣇⠀⠀⠄⠀⠀⠀⢳⠀⢹⢻⣿⣾⢰⠀⣰⣶⣴⣿⣿⣯⣽⣽⣿⣿⣯⣅⣛⣴⣿⠟⠅⣠⡞⣡⢏⣴⣾⡏⢀⡇",
  "⠀⠀⠀⠐⢾⣯⣤⣤⣤⣶⢂⣴⠀⣰⠁⢀⣿⠘⡇⢻⡀⠀⠈⠀⠀⠀⠘⡆⠀⣎⣿⡟⢠⣾⣿⣿⡏⠉⠉⡟⠀⠀⠉⢻⣿⣿⣷⢟⣩⣴⣾⠏⣶⣿⣿⠛⡽⢡⡾⠀",
  "⠀⠀⠀⠀⣤⣶⣾⠛⠛⠋⠹⠃⣰⢏⣠⠾⢿⡄⠘⠈⣧⠀⠀⠀⠀⢄⠀⢹⡄⠈⠸⣿⣿⠃⠀⢸⣷⡀⠀⣇⠀⠀⣀⡼⠛⠏⠉⠛⠉⠛⠉⣲⣿⣿⣷⣾⣵⢿⠃⠀",
  "⠀⠀⠀⠀⠀⠉⠛⠛⢻⣷⠗⠾⠛⠿⠁⠀⢾⣇⢳⡀⠘⢧⠀⠂⠀⠈⣆⠀⢱⡀⠀⠘⢿⣧⣄⣀⠈⠛⠶⠾⢦⣄⣷⣤⡞⠀⠀⠀⠀⡀⢠⢿⠛⠹⣿⢿⠶⠟⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⣴⣿⣁⣠⣤⣄⣠⠀⠀⠈⢿⡘⣇⠀⠘⢷⣄⠀⠀⠘⣧⠀⠃⠀⠰⡈⢿⡄⠙⠛⠶⢤⣀⠀⠀⣄⡀⠉⢧⠀⠀⠀⣷⠈⣿⣤⣾⡟⠈⡆⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠛⢻⣿⡶⠀⠀⠸⣧⠹⣆⠀⠀⠙⢷⣄⠀⠘⢷⣄⠀⠀⠹⣶⣿⠶⠦⠶⠶⠛⠛⠂⠀⠙⠦⠜⠃⠀⠀⠸⣤⡘⢦⣥⡇⠀⢇⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢃⣠⣴⠆⠹⣧⠻⣆⠀⠀⠀⠉⠳⣤⡀⠙⢷⡀⠀⠹⣎⠓⠄⢀⣀⣀⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣾⡃⡇⠀⢸⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⠿⠟⢋⣽⢃⣠⡇⠙⣷⣿⣦⠀⠀⠀⠀⠀⠙⢶⣦⣙⢶⣀⠘⢿⡍⢉⣩⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠉⢳⡇⡆⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣄⣛⡛⠉⠁⣿⣿⣞⣿⣿⣷⣄⠻⣦⠀⠀⢤⡈⠙⠻⢿⣷⣄⡹⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢹⠇⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣇⠀⠉⠛⠓⠲⠿⣥⣿⣿⣿⣿⣿⣦⡌⠳⣄⠀⠹⣶⡄⠀⠻⣿⠻⠶⣤⣀⠀⠀⠘⠛⠒⠒⠒⠒⠒⠒⠀⠀⡼⢃⡏⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣍⠌⠳⣔⣦⡢⣄⠀⠀⠉⠙⣿⣿⣿⣿⣿⣦⡝⣷⡄⠘⣿⡄⠀⠘⣧⡈⠛⠫⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⢁⡞⡼⠁⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣄⡈⠻⣟⢮⣷⡀⠀⠀⢁⡉⠉⠛⡟⢿⣿⣾⣿⣄⠘⣿⠀⠀⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⣠⡾⠏⢀⡼⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⣠⡻⣦⡈⢷⡙⢿⣦⡀⠀⢳⡀⠀⠀⠀⠈⣟⢿⣿⣆⢹⡇⠀⣸⡿⣶⣄⡀⠀⠀⠀⠀⠀⣰⢃⣼⠧⠾⠋⠀⠀⡸⠃⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠈⠡⠀⠀⠀⠀⣀⣼⠋⠀⠈⢻⣾⣷⡄⠛⠦⣦⡀⢷⡀⠘⡄⠀⢹⡀⠙⢿⡄⣷⠀⣾⣷⣿⣿⠟⢻⣶⣤⣤⡤⠴⠛⣹⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠻⠀⣀⣠⡿⠁⠀⠀⠀⠀⢻⣿⣿⣷⣄⢘⢿⣤⢧⠀⢳⡀⠀⡇⠀⠘⣷⢹⡀⣇⣿⣿⡋⠀⣼⠈⠀⠀⠀⠀⢠⡏⡀⢠⣀⡾⠁⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠄⠉⢉⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣾⣾⣿⣿⣧⢈⣧⠀⢹⠀⠀⢻⣸⣧⣿⣿⡇⠁⣢⡟⠀⠀⠀⠀⢀⣾⠟⢁⣵⠏⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢀⣄⠄⠋⠀⠁⠙⡂⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⡄⠘⣷⠀⢸⣿⡟⠙⣿⡇⢈⣿⡇⠀⠀⠀⠀⠈⢁⣶⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠦⠀⣀⠛⠉⠀⠀⠀⠀⢀⠉⠀⣀⡀⣼⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣷⡀⢿⠀⡿⢛⡁⣸⠉⠳⣾⣿⡘⠦⣄⣀⠉⠙⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠉⠀⠤⠿⠃⠀⠜⢀⠒⠀⢠⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⡀⠀⠟⣸⠃⠀⠸⣿⣿⣿⣶⣤⣙⡳⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "📝   New File", "<cmd>ene <BAR> startinsert <CR>"),
  dashboard.button("f", "🔎   Find File", "<cmd>Telescope find_files<CR>"),
  dashboard.button("g", "🔭   Find Word", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("r", "📋   Recents", "<cmd>Telescope oldfiles<CR>"),
  dashboard.button("u", "📦   Update", "<cmd>PackerSync<CR>"),
  dashboard.button("q", "🏠   Quit", " <cmd>qa!<CR>"),
}

alpha.setup(dashboard.opts)
