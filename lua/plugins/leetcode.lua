local leet_arg = "leetcode.nvim"

return {
    {
        "kawre/leetcode.nvim",
        lazy = leet_arg ~= vim.fn.argv()[1],
        -- cmd = "Leet",
        build = ":TSUpdate html",
        dependencies = {
            "plenary.nvim",
        },
        opts = {
            lang = "c",
            arg = leet_arg,
            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },
        },
    }
}
