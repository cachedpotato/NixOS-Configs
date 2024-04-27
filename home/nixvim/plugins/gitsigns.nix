{
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>";
        current_line_blame_opts = {
          delay = 1000;
          virt_text = true;
          virt_text_pos = "eol";
          ignore_whitespace = false;
          virt_text_priority = 100;
        };
        sign_priority = 6;
        signs = {
          add = {
            text = "│";
          };
          change = {
            text = "│";
          };
          changedelete = {
            text = "│";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          untracked = {
            text = "┆";
          };
        };
        update_debounce = 100;
        preview_config = {
          border = "single";
          style = "minimal";
          relative = "cursor";
          row = 0;
          col = 1;
        };
        on_attach = ''
          function(bufnr)
            local gitsigns = require('gitsigns')
            local function map(mode, l, r, desc)
              vim.keymap.set(mode, l, r, {buffer = bufnr, desc = desc})
            end

            --Navi
            map('n', '<leader>hj', gitsigns.next_hunk, "[h]unk move down")
            map('n', '<leader>hk', gitsigns.prev_hunk, "[h]unk move up")

            --Hunk management
            map('n', '<leader>hs', gitsigns.stage_hunk, "[h]unk move up")
            map('n', '<leader>hr', gitsigns.reset_hunk, "[h]unk move up")
            map('n', '<leader>hS', gitsigns.stage_buffer, "[h][S]tage buffer")
            map('n', '<leader>hR', gitsigns.reset_buffer, "[h][R]eset buffer")
            map('n', '<leader>hu', gitsigns.undo_stage_hunk, "[h]unk [u]ndo")
            map('n', '<leader>hp', gitsigns.preview_hunk, "[h]unk [p]review")
            map('n', '<leader>tb', gitsigns.toggle_current_line_blame, "[t]oggle line [b]lame")
            map('n', '<leader>hd', gitsigns.diffthis, "[h]unk diffthis")
            map('n', '<leader>td', gitsigns.toggle_deleted, "[t]oggle [d]eleted")
            map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, "[h]unk [b]lame line")
            map('n', '<leader>hD', function() gitsigns.diffthis('~') end, "[D]iff this ~")

            --visual mode commands
            map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "[h]unk [s]tage")
            map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "[h]unk [r]eset")

            --Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', "select hunk text")
          end
        '';
      };
    };
  };
}
