
local telescope_mapper = require("telescope-config.mappings")

local filetype_attach = setmetatable({
    go = function(_)
        vim.cmd([[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]   )
    end,

    gdscript = function(_) end,
}, {
    __index = function()
        return function() end
    end,
})

local function on_attach(client)
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    -- keymaps for lsp
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>vf", function()
        return vim.lsp.buf.format({ async = true })
    end, { buffer = 0 })
    vim.keymap.set("n", "<leader>vn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>vp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = 0 })
    vim.keymap.set("n", "<leader>vo", ":LspRestart<cr>", { noremap = true })

    telescope_mapper("gr", "lsp_references", nil, true)
    telescope_mapper("<leader>pv", "find_symbol", nil, true)
    telescope_mapper("<leader>pd", "lsp_document_symbols", nil, true)

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Attach any filetype specific options to the client
    filetype_attach[filetype](client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 2, prefix = "●" },
    severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Actual configs
local lsp_flags = {
    debounce_text_changes = 150,
}

require("lspconfig").dockerls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

require("lspconfig").jsonls.setup({
    flags = lsp_flags,
})
require("lspconfig").html.setup({
    fags = lsp_flags,l
})
require("lspconfig").html.setup({
    flags = lsp_flags,
})
require("lspconfig").emmet_ls.setup({
    flags = lsp_flags,
})
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require("lspconfig")["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
