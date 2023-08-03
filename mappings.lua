-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local function get_namespace()
    local current_line = vim.fn.line('.')
    for line_number = current_line, 1, -1 do
        local line = vim.fn.getline(line_number)
        local namespace = vim.fn.matchstr(line, '\\v^\\s*namespace\\s+\\zs\\S+')
        if namespace ~= "" then
            return namespace
        end
    end
    return ""
end

local function get_method_name()
    local current_line = vim.fn.line('.')
    for line_number = current_line, 2, -1 do
        local line = vim.fn.getline(line_number)
        if vim.fn.match(line, '^\\s*{') ~= -1 then
            local previous_line = vim.fn.getline(line_number - 1)
            local class_and_method = vim.fn.matchstr(previous_line, '\\v\\zs\\w+::\\w+\\ze\\s*\\(')
            if class_and_method ~= "" then
                return class_and_method
            end
        end
    end
    return ""
end

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    ["<leader>v"] = {
      function()
        local file = vim.fn.expand('%:t:r')
        local namespace = get_namespace()
        local method = get_method_name()
        local debug_string = string.format('ROS_WARN("%s::%s: ");', namespace, method)
        vim.api.nvim_put({debug_string}, 'l', true, true)
      end,
      desc = "Insert Debug Msg",
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
