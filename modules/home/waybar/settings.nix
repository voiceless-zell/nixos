{ config, lib, ... }:
with lib;
let
  cfg = config.modules.waybarsetting;
in{

  programs.waybar.settings = [
    {
      "layer" = "top";
      "position" = "top";
      modules-left = [
        "temperature"
        "hyprland/workspaces" 
        "battery"
      ];
      modules-center = [
        "clock"
      ];
      
      modules-right = [
      #  "pulseaudio"
      #  "pulseaudio#microphone"
        "memory"
        "cpu"
        "disk"
        "keyboard-state"
        "network"
      #  "cava"
        "tray"
      ];
      "disk" = {
        "path" = "/";
        "format" = "󰋊 {percentage_used}%";
      };
      "hyprland/workspaces" = {
        "format" = "{icon}";
        "on-click" = "activate";
      };
     # "pulseaudio" = {
     #   "scroll-step" = 5;
     #   "format" = "{icon} {volume}%";
     #   "format-muted" = "󰸈 Muted";
     #   "format-icons" = {
     #     "default" = [ "" "" "󱄠" ];
     #   };
     #   "on-click" = "pamixer -t";
     #   "on-click-right" = "pavucontrol";
     #   "on-click-middle" = "$HOME/.local/bin/toggle_sound_output";
     #   "tooltip" = false;
     # };
     # "pulseaudio#microphone" = {
     #   "format" = "{format_source}";
     #   "format-source" = "󰍬 {volume}%";
     #   "format-source-muted" = "󰍭 Muted";
     #   "on-click" = "pamixer --default-source -t";
     #   "on-scroll-up" = "pamixer --default-source -i 5";
     #   "on-scroll-down" = "pamixer --default-source -d 5";
     #   "scroll-step" = 5;
     #   "on-click-right" = "pavucontrol";
     # };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰟜 {percentage}%";
        "states" = {
          "warning" = 85;
        };
      };
      "battery" = {
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}%  ";
          "format-plugged" = "{capacity}%  ";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
      "cpu" = {
        "interval" = 1;
        "format" = "󰇖 {usage}%";
      };
      "network" = {
        "interval" = 1;
        "format" = "󰣺 Connected";
        "format-alt" = "  {bandwidthUpBytes}    {bandwidthDownBytes}";
        "format-disconnected" = "󰣼 Disconnected";
        "tooltip" = false;
      };
      "temperature" = {
        "tooltip" = false;
        "thermal-zone" = 2;
        "hwmon-path" = "/sys/class/hwmon/hwmon0/temp1_input";
        "format" = " {temperatureF}°F";
      };
     # "cava" = {
     #   "framerate" = 60;
     #   "autosens" = 1;
     #   "sensitivity" = 10;
     #   "bars" = 6;
     #   "lower_cutoff_freq" = 50;
     #   "higher_cutoff_freq" = 10000;
     #   "method" = "pulse";
     #   "source" = "auto";
     #   "stereo" = true;
     #   "reverse" = false;
     #   "bar_delimiter" = 0;
     #   "monstercat" = false;
     #   "waves" = false;
     #   "noise_reduction" = 0.77;
     #   "input_delay" = 2;
     #   "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
     #   "on-click-right" = "playerctl play-pause";
     # };
      "tray" = {
        "icon-size" = 12;
        "spacing" = 5;
      };
    }
  ];
}
