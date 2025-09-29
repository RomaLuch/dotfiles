local luasnip = require("luasnip")

-- Загрузка готовых сниппетов из friendly-snippets
require("luasnip.loaders.from_vscode").load()

-- Настройка LuaSnip
luasnip.config.set_config({
  history = true,              -- Сохранять историю для вставки
  updateevents = "TextChanged,TextChangedI", -- Обновлять сниппеты в реальном времени
  enable_autosnippets = true,  -- Включить autosnippets
})

-- Пример пользовательского сниппета
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("lua", {
  s("func", {
    t("function "), i(1, "name"), t("("), i(2, "args"), t(")\n  "),
    i(3, "-- body"),
    t("\nend")
  })
})
