local dir_path = vim.fn.stdpath("config") .. "/lua/lsps"
for _, file in ipairs(vim.fn.readdir(dir_path, [[v:val =~ '\.lua$']])) do
  require("lsps." .. file:gsub("%.lua$", ""))
end

