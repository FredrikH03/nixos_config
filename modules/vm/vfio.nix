{ config, pkgs, inputs, ... }:

{
  boot.initrd.kernelModules = [ "vfio_pci" ];

  boot.initrd.systemd.services.vfio-bind = {
    description = "Bind Vega 56 to vfio-pci";
    after = [ "systemd-udevd.service" ];
    wantedBy = [ "initrd.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /bin/sh -c 'echo 1002 687f > /sys/bus/pci/drivers/vfio-pci/new_id'
        /bin/sh -c 'echo 1002 aaf8 > /sys/bus/pci/drivers/vfio-pci/new_id'
      '';
    };
  };

  boot.kernelParams = [
  "amd_iommu=on"
  "vfio-pci.ids=1002:687f,1002:aaf8"
  ];

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };
}
