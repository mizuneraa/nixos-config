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

  # nintendo controller udev rules (joy-con, pro controller)
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"
  '';

  boot.kernelModules = [ "hid-nintendo" ];
}
