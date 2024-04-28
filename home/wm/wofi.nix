{pkgs, config, lib, ...}:
{
  programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      allow_markup = false;
      mode = "drun";
      width = 500;
    };

    style = with config.lib.stylix.colors; ''

      * {
        font-family: "JetBrainsMono";
        font-size: 13;
      }

      /*--the entire wofi window--*/

      window {
        margin: 10px;
        border: 3px solid #''+base00+'';
        background-color: #''+base05+'';
      }

      /*--from outermost to innermost*--/

      #outer-box {
        margin: 5px;
      }

      #input {
        margin: 5px;
      }

      #scroll {
        margin: 5px;
      }

      #inner-box {
        padding: 5px;
      }

      #entry:selected {
        background-color: #''+base0C+'';
        padding: 5px;
      }

      #text {
        padding: 5px;
      }


    '';
  };
}
