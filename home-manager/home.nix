{ config, pkgs, ... }:

{
  #imports = [
  #./modules/niri.nix
#
  #];
  # Разрешаем unfree пакеты (Steam, и некоторые драйверы)
  nixpkgs.config.allowUnfree = true;
  
  home.username = "komi";
  home.homeDirectory = "/home/komi";
  home.stateVersion = "26.05";
  # Отключаем проверку версий
  home.enableNixpkgsReleaseCheck = false;
  # === ПАКЕТЫ ПОЛЬЗОВАТЕЛЯ ==
  home.packages = with pkgs; [
    telegram-desktop
    qutebrowser 
    amnezia-vpn
    kitty
    alacritty
    thunar
    yazi
    imagemagick
    git
    neovim
    gcc
    fd
    ripgrep
    grim
    slurp
    wl-clipboard
    niri
    libnotify
    swaylock
    waybar
    rofi
    fuzzel
    wlogout
    awww
    steam  
    curl
    wget
    unzip
    htop
    fastfetch
    brave
    noctalia-shell
    python3
    tmux
    
    # LSP-серверы
    bash-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    lua-language-server
    nil
    pyright
    rust-analyzer
    gopls


];





# === ОСТАЛЬНАЯ КОНФИГУРАЦИЯ ===
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "komi";
        email = "komi@example.com";
      };
      alias = {
        co = "checkout";
        br = "branch";
        st = "status";
        ci = "commit";
      };
      init = {
       defaultBranch = "main";
      };
      core = {
        editor = "nvim";
      };
    };
  };



  # Меняем shell на zsh
  programs.zsh = {
    enable = true;
    
    # Автодополнения
    enableCompletion = true;
    
    # История команд
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };
    
    # Плагины (опционально)
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "docker" ];
    };
    
    # Кастомные алиасы
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
      n = "nvim";
      sn = "sudo nvim";
      nhm = "nvim .config/home-manager/home.nix";
      snc = "sudo nvim /etc/nixos/configuration.nix";
    };
  };

  # Указываем zsh как shell по умолчанию
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
 # programs.waybar = {
  #  enable = true;
  #  systemd.enable = true;
  #  settings.mainBar = {
  #    layer = "top";
  #    position = "top";
  #    modules-left = [ "hyprland/workspaces" "sway/mode" ];
  #    modules-center = [ "clock" ];
  #    modules-right = [ "pulseaudio" "network" "battery" "tray" ];
  #  };
  #};
  

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "qutebrowser";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
