return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    suppressed_dirs = { '/home/benjamin', '~/Desktop', '~/Downloads', '/' },
    pre_save_cmds = {
        function() require('nvim-tree.api').close() end,
    },
    post_restore_cmds = {
        function()
            local nvim_tree_api = require('nvim-tree.api')
            nvim_tree_api.tree.open()
            nvim_tree_api.tree.change_root(vim.fn.getcwd())
            nvim_tree_api.tree.reload()
        end
    },
  }
}
