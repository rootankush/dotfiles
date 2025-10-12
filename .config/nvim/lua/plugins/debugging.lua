return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
            local pwaType = "pwa-" .. adapterType

            dap.adapters[pwaType] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = {
                        vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                        "${port}",
                    },
                },
            }

            -- this allow us to handle launch.json configurations
            -- which specify type as "node" or "chrome" or "msedge"
            dap.adapters[adapterType] = function(cb, config)
                local nativeAdapter = dap.adapters[pwaType]

                config.type = pwaType

                if type(nativeAdapter) == "function" then
                    nativeAdapter(cb, config)
                else
                    cb(nativeAdapter)
                end
            end
        end

        local enter_launch_url = function()
            local co = coroutine.running()
            return coroutine.create(function()
                vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
                    if url == nil or url == "" then
                        return
                    else
                        coroutine.resume(co, url)
                    end
                end)
            end)
        end

        for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    name = "Launch files",
                    request = "launch",
                    program = "${file}",
                    cwd = "${workspaceFolder}"
                },
                {
                    name = 'Debug Chrome',
                    type = 'chrome',
                    request = 'launch',
                    url = enter_launch_url,
                    webRoot = '${workspaceFolder}',
                    sourceMaps = true,
                },
                {
                    name = 'Debug Zen',
                    type = 'firefox',
                    request = 'launch',
                    url = enter_launch_url,
                    webRoot = '${workspaceFolder}',
                    sourceMaps = true,
                }
            }
        end

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<Leader>dbc", dap.clear_breakpoints, { desc = "Clear all breakpoints" })
        vim.keymap.set("n", "<Leader>dbl", dap.list_breakpoints, { desc = "Clear all breakpoints" })
    end,
}
