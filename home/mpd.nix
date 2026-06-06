{ ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
      startWhenNeeded = true;
    };
    
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      auto_update "yes"
      restore_paused "yes"
    '';
  };
}
