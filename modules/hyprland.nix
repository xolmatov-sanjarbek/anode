{ ... }: {
wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    monitor = "eDP-1,1920x1080@60.05,auto,1";
     "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "walker";
    "$browser" = "brave";
    "$mainMod" = "SUPER";
     #################
### AUTOSTART ###
#################
     "exec-once" = [
    "waybar"
    "systemctl --user start hyprpolkitagent"
    "elephant"
    "systemctl --user start network-manager-applet"
    "waypaper --restore & awww"
    "swayosd-server"
    "hyprctl setcursor Bibata-Modern-Ice 24"
    ];
     #############################
### ENVIRONMENT VARIABLES ###
#############################
     env = [
    "XCURSOR_SIZE=24"
    "HYPRCURSOR_SIZE=24"
    "LIBVA_DRIVER_NAME=iHD"
    "MOZ_ENABLE_WAYLAND=1"
    ];
     #####################
### LOOK AND FEEL ###
#####################
     general = {gaps_in = 3;
    gaps_out = 8;
    border_size = 2;
    "col.active_border" = "rgba(b4befeff) rgba(89dcebff) 45deg";
    "col.inactive_border" = "rgba(181825ff)";
    resize_on_border = true;
    allow_tearing = false;
    layout = "dwindle";
    };
    decoration = {
    rounding = 5;
    rounding_power = 2;
    active_opacity = 0.95;
    inactive_opacity = 0.85;
    fullscreen_opacity = 0.9;
    shadow = {
    enabled = true;
    range = 4;
    render_power = 3;
    color = "rgba(1a1a1aee)";
    };
    blur = {
    enabled = true;
    size = 5;
    passes = 2;
    xray = true;
    noise = 0.45;
    contrast = 2.0;
    brightness = 2.0;
    vibrancy = 0.1696;
    };
    };
    animations = {
    enabled = true;
    bezier = [
    "easeOutQuint, 0.23, 1, 0.32, 1"
    "easeInOutCubic, 0.65, 0.05, 0.36, 1"
    "linear, 0, 0, 1, 1"
    "almostLinear, 0.5, 0.5, 0.75, 1"
    "quick, 0.15, 0, 0.1, 1"
    ];
    animation = [
    "global, 1, 10, default"
    "border, 1, 5.39, easeOutQuint" "windows, 1, 4.79, easeOutQuint"
    "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
    "windowsOut, 1, 1.49, linear, popin 87%"
    "fadeIn, 1, 1.73, almostLinear"
    "fadeOut, 1, 1.46, almostLinear"
    "fade, 1, 3.03, quick"
    "layers, 1, 3.81, easeOutQuint"
    "layersIn, 1, 4, easeOutQuint, fade"
    "layersOut, 1, 1.5, linear, fade"
    "fadeLayersIn, 1, 1.79, almostLinear"
    "fadeLayersOut, 1, 1.39, almostLinear"
    "workspaces, 1, 1.94, almostLinear, fade"
    "workspacesIn, 1, 1.21, almostLinear, fade"
    "workspacesOut, 1, 1.94, almostLinear, fade"
    "zoomFactor, 1, 7, quick"
    ];
    };
    dwindle = {
    pseudotile = true;
    preserve_split = true;
    };
    master = {
    new_status = "master";
    };
    misc = {
    force_default_wallpaper = 0;
    disable_hyprland_logo = true;
    };
#############
### INPUT ###
#############
    input = {
    kb_layout = "us";
    kb_variant = "";
    kb_model = "";
    kb_options = "";
    kb_rules = "";
    follow_mouse = 1;
    sensitivity = 0;
    touchpad = {
    natural_scroll = false;
    };
    };
    gesture = ["3, horizontal, workspace"];
    device = {name = "epic-mouse-v1";
    sensitivity = -0.5;
    };
     ##############################
### WINDOWS AND WORKSPACES ###
##############################
     windowrule = [
    "float on, match:class waypaper"
    "opacity 0.95, match:class waypaper"
    "float on, match:class (com.gabm.satty)"
    "center on, match:class (com.gabm.satty)"
    "size 800 600, match:class (com.gabm.satty)"
    ];
     # Note: named windowrule { } blocks are in extraConfig below,
# because the settings attrset cannot have duplicate keys.
     ###################
### KEYBINDINGS ###
###################
     bind = [
# Default apps
    "$mainMod, T, exec, $terminal"
    "$mainMod, B, exec, $browser"
    "$mainMod, Q, killactive,"
    "$mainMod, M, exec, sh -c 'command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit'"
    "$mainMod, E, exec, $fileManager"
    "$mainMod, V, togglefloating,"
    "$mainMod, SPACE, exec, $menu"
    "$mainMod, P, pseudo,"
    "$mainMod, J, layoutmsg, togglesplit"
     # Waybar / reload
    "$mainMod SHIFT, B, exec, pkill waybar && waybar & disown"
    "$mainMod SHIFT, H, exec, hyprctl reload"
     # Screenshots
    "$mainMod, PRINT, exec, hyprpicker -a"
    ", PRINT, exec, grim -g \"$(slurp)\" - | satty --filename -"
    "SHIFT, PRINT, exec, grim - | satty --filename -"
    "CTRL, PRINT, exec, sh -c 'hyprctl -j activewindow | jq -r \"\\(.at[0]),\\(.at[1]) \\(.size[0])x\\(.size[1])\" | grim -g - - | satty --filename -'"
     # Move focus
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"
     # Switch workspaces
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"
# Move window to workspace
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"
# Special workspace (scratchpad)
    "$mainMod, S, togglespecialworkspace, magic"
    "$mainMod SHIFT, S, movetoworkspace, special:magic"
# Scroll through workspaces
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
# Audio
    ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
    ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
    ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
# Brightness
    ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
    ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
    ];
# bindel — repeat-on-hold
    bindel = [
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];
# bindl — works on locked screen
    bindl = [
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPause, exec, playerctl play-pause"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPrev, exec, playerctl previous"
    ];
# bindm — mouse move/resize
    bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
    ];
    };
     # Named windowrule blocks go here as raw text because the settings
# attrset can't express duplicate top-level keys.
    extraConfig = ''
# suppress maximize events
    windowrule = suppressevent maximize, class:.*

# fix xwayland drags
    windowrule = nofocus 1, class:^$, title:^$, xwayland:1, floating:1

# move hyprland-run window
    windowrule = floating 1, class:hyprland-run
    windowrule = move 20 900, class:hyprland-run
    '';
    };
}
