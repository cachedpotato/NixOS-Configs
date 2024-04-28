{
  security = {
    pam.services.hyprlock.text = "auth include login";

    #realtimekit system service
    #hands out realtime scheduling priority to user processes on demand
    rtkit.enable = true;

    sudo = {
      #allow non-wheel user to use sudo commands
      enable = true;
      wheelNeedsPassword = true;
    };
  };
}
