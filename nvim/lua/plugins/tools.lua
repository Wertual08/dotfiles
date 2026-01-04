return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<space>hs", desc = "Send request" },
      { "<space>ha", desc = "Send all requests" },
      { "<space>hb", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<space>h",
      kulala_keymaps_prefix = "",
    },
  },
}
