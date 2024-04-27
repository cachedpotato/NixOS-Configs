{  
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings = {
        attachments.img_folder = "assets/imgs"; #relative to vault root
        callbacks = {};
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        picker.name = "telescope.nvim";
        templates.subdir = "templates";
        workspaces = [
          {
            name = "work";
            path = "~/vault/work";
          }
          {
            name = "game";
            path = "~/vault/game";
          }
        ];
        mappings = {
          "<leader>oc" = {
            action = "require('obsidian').util.toggle_checkbox";
            opts = {
              noremap = true;
              buffer = true;
              desc = "[o]bsidian toggle [c]heckbox";
            };
          };
        };
      };
    };

    keymaps = [
      {
        key = "<leader>oo";
        action = ":ObsidianOpen<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [o]pen app";
        };
      }
      {
        key = "<leader>on";
        action = ":ObsidianNew<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian create [n]ew note";
        };
      }
      {
        key = "<leader>oq";
        action = ":ObsidianQuickSwitch<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [q]uickswitch to another note"; #ripgrep
        };
      }
      {
        key = "<leader>of";
        action = ":ObsidianFollowLink<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [f]ollow link";
        };
      }
      {
        key = "<leader>ob";
        action = ":ObsidianBacklinks<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [b]ack picker links";
        };
      }
      {
        key = "<leader>ot";
        action = ":ObsidianTemplate<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [t]emplate insert";
        };
      }
      {
        key = "<leader>os";
        action = ":ObsidianSearch<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian [s]earch notes";
        };
      }
      {
        key = "<leader>ol";
        action = ":ObsidianLinks<CR>";
        options = {
          noremap = true;
          desc = "[o]bsidian collect [l]inks";
        };
      }
    ];
  };
}
