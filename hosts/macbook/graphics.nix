{ config, pkgs, ... }:

{
  # Enable OpenGL/Vulkan userspace. The i915 kernel driver for the
  # Intel HD 3000 iGPU is built into the kernel already, so there's
  # no separate driver package to install like there was for Nvidia.
  hardware.graphics = {
    enable = true;
  };

  # No services.xserver.videoDrivers override needed — "modesetting"
  # (the default) handles Intel fine. Only set this explicitly if you
  # run into issues and want to force the "intel" driver instead.
  # services.xserver.videoDrivers = [ "intel" ];
}
