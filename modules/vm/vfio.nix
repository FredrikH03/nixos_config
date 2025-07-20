{ config, pkgs, inputs, ... }:

{
  boot.kernelParams = [
  "amd_iommu=on"
  "iommu=pt"
  "vfio-pci.ids=1002:687f,1002:aaf8"
  ];
}
