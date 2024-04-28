{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {

      #flakes!
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;

      #whether to warn about dirty git trees for flake config
      warn-dirty = true;

      #log lines for when nixos build fails
      log-lines = 25;

      #if free disk space in nix/store drops down to min-free,
      #garbage-collection is performed until max-free bytes of space is available
      min-free = 128000000; #128MB
      max-free = 1000000000; #1GB

      #timeout (sec) for establishing connections with binary cache substituter
      connect-timeout = 5;
    };

    #garbage-collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };
}
