require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "^.git$" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_config = {
            width = 0.9,
        },
    },
    pickers = {
        lsp_references = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_document_symbols = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_definitions = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_type_definitions = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_implementations = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        diagnostics = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
    },
})

--vim.ui.select = function(items, opts, on_choice)
--    local pickers = require("telescope.pickers")
--    local entry_display = require("telescope.pickers.entry_display")
--    local finders = require("telescope.finders")
--    local actions = require("telescope.actions")
--    local actions_state = require("telescope.actions.state")
--    local utils = require("telescope.utils")
--    local config = require("telescope.config").values
--
--    opts = opts or {}
--    local prompt = vim.F.if_nil(opts.prompt, "Select one of")
--    if prompt:sub(-1, -1) == ":" then
--        prompt = prompt:sub(1, -2)
--    end
--    opts.format_item = vim.F.if_nil(opts.format_item, function(e)
--        return tostring(e)
--    end)
--
--    on_choice = vim.schedule_wrap(on_choice)
--
--    local indexed_items = {}
--    for idx, item in ipairs(items) do
--        table.insert(indexed_items, { idx = idx, text = item })
--    end
--
--    local make_display = function (widths)
--        entry_display.create({
--            separator = " ",
--            items = {
--                { width = widths.idx + 1 }, -- +1 for ":" suffix
--                { width = widths.command_title },
--                { width = widths.client_name },
--            },
--        })
--    end
--
--    local make_ordinal = function(e)
--        return opts.format_item(e.text)
--    end
--
--    pickers.new({}, {
--        prompt_title = string.gsub(prompt, "\n", " "),
--        finder = finders.new_table {
--            results = indexed_items,
--            entry_maker = function(e)
--                return {
--                    value = e,
--                    display = make_display(e),
--                    ordinal = make_ordinal(e),
--                }
--            end,
--        },
--        attach_mappings = function(prompt_bufnr)
--            actions.select_default:replace(function()
--                local selection = actions_state.get_selected_entry()
--                local cb = on_choice
--                on_choice = function(_, _) end
--                actions.close(prompt_bufnr)
--                if selection == nil then
--                    utils.__warn_no_selection "ui-select"
--                    cb(nil, nil)
--                    return
--                end
--                cb(selection.value.text, selection.value.idx)
--            end)
--            actions.close:enhance {
--                post = function()
--                    on_choice(nil, nil)
--                end,
--            }
--            return true
--        end,
--        sorter = config.generic_sorter({}),
--    })
--        :find()
--end
