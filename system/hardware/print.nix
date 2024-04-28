{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;

    #whether shared printers are advertised
    browsing = true;

    #cups-pdf virtual printer
    cups-pdf = {
      enable = true;
    };
  };
}
