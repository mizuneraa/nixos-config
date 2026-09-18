# module: desktop/hyprland
# hyprland + hyprlock + wayland ecosystem packages
{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    rofi
    brightnessctl
    wayle
    hyprshot
    playerctl
  ];
}
