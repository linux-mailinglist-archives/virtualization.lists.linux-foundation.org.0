Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2333604EF
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 10:53:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F6360D8B;
	Thu, 15 Apr 2021 08:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RD272Nf1kzf5; Thu, 15 Apr 2021 08:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A767860D81;
	Thu, 15 Apr 2021 08:53:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16A48C000C;
	Thu, 15 Apr 2021 08:53:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E4E8C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D69960D83
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cj9xlM-PMtSS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:53:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 160D060D74
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:53:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDE3BB1B7;
 Thu, 15 Apr 2021 08:53:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v3 0/9] drm: Support simple-framebuffer devices and firmware
 fbs
Date: Thu, 15 Apr 2021 10:53:17 +0200
Message-Id: <20210415085326.8824-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This patchset adds support for simple-framebuffer platform devices and
a handover mechanism for native drivers to take-over control of the
hardware.

The new driver, called simpledrm, binds to a simple-frambuffer platform
device. The kernel's boot code creates such devices for firmware-provided
framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
loader sets up the framebuffers. Description via device tree is also an
option.

Simpledrm is small enough to be linked into the kernel. The driver's main
purpose is to provide graphical output during the early phases of the boot
process, before the native DRM drivers are available. Native drivers are
typically loaded from an initrd ram disk. Occationally simpledrm can also
serve as interim solution on graphics hardware without native DRM driver.

So far distributions rely on fbdev drivers, such as efifb, vesafb or
simplefb, for early-boot graphical output. However fbdev is deprecated and
the drivers do not provide DRM interfaces for modern userspace.

Patches 1 and 2 prepare the DRM format helpers for simpledrm.

Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
pageflips, SHMEM buffers are copied into the framebuffer memory, similar
to cirrus or mgag200. The code in patches 7 and 8 handles clocks and
regulators. It's based on the simplefb drivers, but has been modified for
DRM.

Patches 3 and 9 add a hand-over mechanism. Simpledrm acquires it's
framebuffer's I/O-memory range and provides a callback function to be
removed by a native driver. The native driver will remove simpledrm before
taking over the hardware. The removal is integrated into existing helpers,
so drivers use it automatically.

I've also been working on fastboot support (i.e., flicker-free booting).
This requires state-readout from simpledrm via generic interfaces, as
outlined in [1]. I do have some prototype code, but it will take a while
to get this ready. Simpledrm will then support it.

I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
reliably. The fbdev console and Weston work automatically. Xorg requires
manual configuration of the device. Xorgs current modesetting driver does
not work with both, platform and PCI device, for the same physical
hardware. Once configured, X11 works. I looked into X11, but couldn't see
an easy way of fixing the problem. With the push towards Wayland+Xwayland
I expect the problem to become a non-issue soon. Additional testing has
been reported at [2].

One cosmetical issue is that simpledrm's device file is card0 and the
native driver's device file is card1. After simpledrm has been kicked out,
only card1 is left. This does not seem to be a practical problem however.

TODO/IDEAS:
	* provide deferred takeover
	* provide bootsplash DRM client
	* make simplekms usable with ARM-EFI fbs

v3:
	* clear screen to black when disabled (Daniel)
	* rebase onto existing aperture helpers
	* detach via hot-unplug via platform_device_unregister()
v2:
	* rename to simpledrm, aperture helpers
	* reorganized patches
	* use hotplug helpers for removal (Daniel)
	* added DT match tables (Rob)
	* use shadow-plane helpers
	* lots of minor cleanups

[1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/

Thomas Zimmermann (9):
  drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
  drm/format-helper: Add blitter functions
  drm/aperture: Add infrastructure for aperture ownership
  drm: Add simpledrm driver
  drm/simpledrm: Add fbdev emulation
  drm/simpledrm: Initialize framebuffer data from device-tree node
  drm/simpledrm: Acquire clocks from DT device node
  drm/simpledrm: Acquire regulators from DT device node
  drm/simpledrm: Acquire memory aperture for framebuffer

 MAINTAINERS                            |   7 +
 drivers/gpu/drm/drm_aperture.c         | 216 +++++-
 drivers/gpu/drm/drm_format_helper.c    |  96 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
 drivers/gpu/drm/tiny/Kconfig           |  16 +
 drivers/gpu/drm/tiny/Makefile          |   1 +
 drivers/gpu/drm/tiny/cirrus.c          |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c       | 920 +++++++++++++++++++++++++
 include/drm/drm_aperture.h             |  36 +-
 include/drm/drm_format_helper.h        |  10 +-
 10 files changed, 1279 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c

--
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
