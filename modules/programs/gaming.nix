# module: programs/gaming
# steam + proton-ge + nintendo controller support
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = [
    pkgs.atlauncher
    pkgs.prismlauncher
    pkgs.jdk25
    pkgs.archipelago
    pkgs.poptracker # progression tracker for archipelago randomizers
  ];

  # udev rules: nintendo controllers + endgame gear mouse (non-root hid access)
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3367", ATTRS{idProduct}=="1978", MODE="0666"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3367", ATTRS{idProduct}=="1976", MODE="0666"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3367", ATTRS{idProduct}=="1966", MODE="0666"
  '';
  boot.kernelModules = [ "hid-nintendo" ];
}
