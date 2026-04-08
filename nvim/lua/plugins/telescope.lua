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

local old_select = vim.ui.select
vim.ui.select = function(items, opts, on_choice)
    opts = opts or {}
    if opts.kind ~= "codeaction" then
        return old_select(items, opts, on_choice)
    end

    on_choice = vim.schedule_wrap(on_choice)

    local pickers = require("telescope.pickers")
    local entry_display = require("telescope.pickers.entry_display")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local actions_state = require("telescope.actions.state")
    local utils = require("telescope.utils")
    local config = require("telescope.config").values

    local prompt = opts.prompt or "Select one of"
    if prompt:sub(-1, -1) == ":" then
        prompt = prompt:sub(1, -2)
    end

    local indexed_items = {}
    local count = 0
    for idx, item in ipairs(items) do
        table.insert(indexed_items, { idx = idx, item = item })
        count = count + 1
    end

    local displayer = entry_display.create {
        separator = ": ",
        items = {
            { width = #tostring(count) },
            { remaining = true },
        },
    }

    pickers.new({}, {
        prompt_title = string.gsub(prompt, "\n", " "),
        finder = finders.new_table {
            results = indexed_items,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = function(maker)
                        return displayer {
                            { maker.value.idx, "TelescopeResultsIdentifier" },
                            maker.value.item.action.title,
                        }
                    end,
                    ordinal = entry.idx,
                }
            end,
        },
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = actions_state.get_selected_entry()
                local cb = on_choice
                on_choice = function(_, _) end
                actions.close(prompt_bufnr)
                if selection == nil then
                    utils.__warn_no_selection "ui-select"
                    cb(nil, nil)
                    return
                end
                cb(selection.value.item, selection.value.idx)
            end)
            actions.close:enhance {
                post = function()
                    on_choice(nil, nil)
                end,
            }
            return true
        end,
        sorter = config.generic_sorter({}),
    }):find()
end
