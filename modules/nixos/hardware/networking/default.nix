{  lib, config,  ... }:
with lib;
let

  cfg = config.wildgoo.hardware.networking;
  networks = {

      abosami = {
        ssid="Abo Sami 5G";
        psk = "9112c3b95abf2a116539b696e689306324d3371218bf6993434d09eb602922a4";
      };
     huwaei = {
      ssid ="HUAWEI";
      psk ="6f41725a9d9d280b6b020e40d3d066997fb78ac58f906ec94b80272af3923bd1";
    };
  };
    in
{
  options.wildgoo.hardware.networking = {
    enable = lib.mkEnableOption " Enable wpa supplicant";
  };
  config = mkIf cfg.enable {

  networking.networkmanager.enable = false;
  networking.wireless.enable = true;
  networking.hosts = { "209.38.180.44" = ["raven.local"]; };
  # networking.wireless.interfaces = [ "wlp6s0" ];
  # networking.wireless.driver = "rtw89";
  networking.wireless.userControlled.enable = true;
  networking.wireless.networks = {
    "Abo Sami 5G." = {
      pskRaw =
        networks.abosami.psk;
    };
    Zhone5G_EF53 = {
      pskRaw =
        "9566e8de34e93086f669d988e2acff1341188036c261ea787019523c82783f82";
      #psk =   "9566e8de34e93086f669d988e2acff1341188036c261ea787019523c82783f82";
    };

    ":skullemoji:"= {
      pskRaw =
        "0b1d359fd6c71b546e195f08605df857bea1125d4700ba27a094378bbc1a29b7";
    };
    HUAWEI= {
      pskRaw = networks.huwaei.psk;
          };

    Student_Bootcamp = {
      pskRaw =
        "11480ae36be234a99588708cc25534ef298dd247031d7a997c26704b1f5aa8a7";
    };
    APARTMENT = {
      pskRaw =
        "c11351185e5e95b598daec6607d70ebc1a97b00c8e73f81f935ae4d621f469da";
    };

    lordkoma = {
      pskRaw =
        "27586f90ea6dae87d8f41a2ca4328280eeb5cd57f4b544172698c12b261360be";
    };

  };

  };

}
