{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.moonlight-qt ];
  hardware.graphics.extraPackages = [ pkgs.intel-media-driver ];
}
