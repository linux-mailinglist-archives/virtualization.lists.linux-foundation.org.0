Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6532C9F67
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 11:36:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71BC5874F3;
	Tue,  1 Dec 2020 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gY9ziSf8TbOw; Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 335988751C;
	Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1560FC163C;
	Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8177C163C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A481586B67
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLLwUXxWI_0y
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4076286AC1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2599AD0B;
 Tue,  1 Dec 2020 10:35:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 09/20] drm/i915: Remove references to struct drm_device.pdev
Date: Tue,  1 Dec 2020 11:35:31 +0100
Message-Id: <20201201103542.2182-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Jani Nikula <jani.nikula@linux.intel.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
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

Using struct drm_device.pdev is deprecated. Convert i915 to struct
drm_device.dev. No functional changes.

v2:
	* move gt/ and gvt/ changes into separate patches

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
 drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++----------
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  4 ++--
 drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
 drivers/gpu/drm/i915/i915_pmu.c               |  5 +++--
 drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
 drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
 drivers/gpu/drm/i915/intel_region_lmem.c      |  8 ++++----
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
 32 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4cc949b228f2..8879676372a3 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2088,7 +2088,7 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
 
 static struct vbt_header *oprom_get_vbt(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	void __iomem *p = NULL, *oprom;
 	struct vbt_header *vbt;
 	u16 vbt_size;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c449d28d0560..a6e13208dc50 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -96,7 +96,7 @@ static void fixed_450mhz_get_cdclk(struct drm_i915_private *dev_priv,
 static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
 			   struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 hpllcc = 0;
 
 	/*
@@ -138,7 +138,7 @@ static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
 static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -162,7 +162,7 @@ static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
 static void i945gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -256,7 +256,7 @@ static unsigned int intel_hpll_vco(struct drm_i915_private *dev_priv)
 static void g33_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	static const u8 div_3200[] = { 12, 10,  8,  7, 5, 16 };
 	static const u8 div_4000[] = { 14, 12, 10,  8, 6, 20 };
 	static const u8 div_4800[] = { 20, 14, 12, 10, 8, 24 };
@@ -305,7 +305,7 @@ static void g33_get_cdclk(struct drm_i915_private *dev_priv,
 static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u16 gcfgc = 0;
 
 	pci_read_config_word(pdev, GCFGC, &gcfgc);
@@ -339,7 +339,7 @@ static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
 static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	static const u8 div_3200[] = { 16, 10,  8 };
 	static const u8 div_4000[] = { 20, 12, 10 };
 	static const u8 div_5333[] = { 24, 16, 14 };
@@ -384,7 +384,7 @@ static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
 static void gm45_get_cdclk(struct drm_i915_private *dev_priv,
 			   struct intel_cdclk_config *cdclk_config)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	unsigned int cdclk_sel;
 	u16 tmp = 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/drm/i915/display/intel_csr.c
index 67dc64df78a5..19cbcab69689 100644
--- a/drivers/gpu/drm/i915/display/intel_csr.c
+++ b/drivers/gpu/drm/i915/display/intel_csr.c
@@ -640,7 +640,7 @@ static void csr_load_work_fn(struct work_struct *work)
 	dev_priv = container_of(work, typeof(*dev_priv), csr.work);
 	csr = &dev_priv->csr;
 
-	request_firmware(&fw, dev_priv->csr.fw_path, &dev_priv->drm.pdev->dev);
+	request_firmware(&fw, dev_priv->csr.fw_path, dev_priv->drm.dev);
 	parse_csr_fw(dev_priv, fw);
 
 	if (dev_priv->csr.dmc_payload) {
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index eed037ec0b29..e349caef1926 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -425,7 +425,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 				  const u16 slave_addr)
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
-	struct device *dev = &drm_dev->pdev->dev;
+	struct device *dev = drm_dev->dev;
 	struct acpi_device *acpi_dev;
 	struct list_head resource_list;
 	struct i2c_adapter_lookup lookup;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 842c04e63214..4ccb462bd497 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -167,7 +167,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct i915_ggtt *ggtt = &dev_priv->ggtt;
 	const struct i915_ggtt_view view = {
 		.type = I915_GGTT_VIEW_NORMAL,
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index b0d71bbbf2ad..0c952e1d720e 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -840,7 +840,7 @@ static const struct i2c_lock_operations gmbus_lock_ops = {
  */
 int intel_gmbus_setup(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct intel_gmbus *bus;
 	unsigned int pin;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index ad5cc13037ae..98eb52a938d0 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -80,6 +80,7 @@ static struct platform_device *
 lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct platform_device_info pinfo = {};
 	struct resource *rsc;
 	struct platform_device *platdev;
@@ -99,9 +100,9 @@ lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
 	rsc[0].flags    = IORESOURCE_IRQ;
 	rsc[0].name     = "hdmi-lpe-audio-irq";
 
-	rsc[1].start    = pci_resource_start(dev->pdev, 0) +
+	rsc[1].start    = pci_resource_start(pdev, 0) +
 		I915_HDMI_LPE_AUDIO_BASE;
-	rsc[1].end      = pci_resource_start(dev->pdev, 0) +
+	rsc[1].end      = pci_resource_start(pdev, 0) +
 		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
 	rsc[1].flags    = IORESOURCE_MEM;
 	rsc[1].name     = "hdmi-lpe-audio-mmio";
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 4f77cf849171..dfd724e506b5 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -247,7 +247,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 		 u32 function, u32 parm, u32 *parm_out)
 {
 	struct opregion_swsci *swsci = dev_priv->opregion.swsci;
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u32 main_function, sub_function, scic;
 	u16 swsci_val;
 	u32 dslp;
@@ -807,7 +807,7 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 	if (!name || !*name)
 		return -ENOENT;
 
-	ret = request_firmware(&fw, name, &dev_priv->drm.pdev->dev);
+	ret = request_firmware(&fw, name, dev_priv->drm.dev);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Requesting VBT firmware \"%s\" failed (%d)\n",
@@ -840,7 +840,7 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 int intel_opregion_setup(struct drm_i915_private *dev_priv)
 {
 	struct intel_opregion *opregion = &dev_priv->opregion;
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u32 asls, mboxes;
 	char buf[sizeof(OPREGION_SIGNATURE)];
 	int err = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 52b4f6193b4c..ea6a630cf6ef 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -201,7 +201,7 @@ struct intel_overlay {
 static void i830_overlay_clock_gating(struct drm_i915_private *dev_priv,
 				      bool enable)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u8 val;
 
 	/* WA_OVERLAY_CLKGATE:alm */
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 9f23bac0d792..1b643ed71f66 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -557,7 +557,7 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
 
-		pci_read_config_byte(dev_priv->drm.pdev, LBPC, &lbpc);
+		pci_read_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, &lbpc);
 		val *= lbpc;
 	}
 
@@ -631,7 +631,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 
 		lbpc = level * 0xfe / panel->backlight.max + 1;
 		level /= lbpc;
-		pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);
+		pci_write_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, lbpc);
 	}
 
 	if (IS_GEN(dev_priv, 4)) {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 46beb155d835..98dd787b00e3 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -160,7 +160,7 @@ static struct intel_quirk intel_quirks[] = {
 
 void intel_init_quirks(struct drm_i915_private *i915)
 {
-	struct pci_dev *d = i915->drm.pdev;
+	struct pci_dev *d = to_pci_dev(i915->drm.dev);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(intel_quirks); i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 4eaa4aa86ecd..3fac60899d8e 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3281,7 +3281,7 @@ static bool
 intel_sdvo_init_ddc_proxy(struct intel_sdvo *sdvo,
 			  struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	sdvo->ddc.owner = THIS_MODULE;
 	sdvo->ddc.class = I2C_CLASS_DDC;
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index be333699c515..5f8e4f53649d 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -25,7 +25,7 @@ static i915_reg_t intel_vga_cntrl_reg(struct drm_i915_private *i915)
 /* Disable the VGA plane that we never use */
 void intel_vga_disable(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
 	u8 sr1;
 
@@ -76,7 +76,7 @@ void intel_vga_redisable(struct drm_i915_private *i915)
 
 void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	/*
 	 * After we re-enable the power well, if we touch VGA register 0x3d5
@@ -136,7 +136,7 @@ intel_vga_set_decode(void *cookie, bool enable_decode)
 
 int intel_vga_register(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int ret;
 
 	/*
@@ -156,7 +156,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 
 void intel_vga_unregister(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	vga_client_register(pdev, NULL, NULL, NULL);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 3a4dfe2ef1da..f47dafdda539 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -35,7 +35,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	 * to handle all possible callers, and given typical object sizes,
 	 * the alignment of the buddy allocation will naturally match.
 	 */
-	vaddr = dma_alloc_coherent(&obj->base.dev->pdev->dev,
+	vaddr = dma_alloc_coherent(obj->base.dev->dev,
 				   roundup_pow_of_two(obj->base.size),
 				   &dma, GFP_KERNEL);
 	if (!vaddr)
@@ -83,7 +83,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 err_st:
 	kfree(st);
 err_pci:
-	dma_free_coherent(&obj->base.dev->pdev->dev,
+	dma_free_coherent(obj->base.dev->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 	return -ENOMEM;
@@ -129,7 +129,7 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 	sg_free_table(pages);
 	kfree(pages);
 
-	dma_free_coherent(&obj->base.dev->pdev->dev,
+	dma_free_coherent(obj->base.dev->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 75e8b71c18b9..08c9c25f1109 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -172,7 +172,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 			max_segment = PAGE_SIZE;
 			goto rebuild_st;
 		} else {
-			dev_warn(&i915->drm.pdev->dev,
+			dev_warn(i915->drm.dev,
 				 "Failed to DMA remap %lu pages\n",
 				 page_count);
 			goto err_pages;
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 263074c2c097..b4d38f68a246 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1275,7 +1275,7 @@ static int i915_llc(struct seq_file *m, void *data)
 static int i915_runtime_pm_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	if (!HAS_RUNTIME_PM(dev_priv))
 		seq_puts(m, "Runtime power management not supported\n");
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 320856b665a1..397483f5f0bd 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -91,7 +91,7 @@ static const struct drm_driver driver;
 
 static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
 {
-	int domain = pci_domain_nr(dev_priv->drm.pdev->bus);
+	int domain = pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
 
 	dev_priv->bridge_dev =
 		pci_get_domain_bus_and_slot(domain, 0, PCI_DEVFN(0, 0));
@@ -458,7 +458,6 @@ static void intel_sanitize_options(struct drm_i915_private *dev_priv)
  */
 static int i915_set_dma_info(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
 	unsigned int mask_size = INTEL_INFO(i915)->dma_mask_size;
 	int ret;
 
@@ -468,9 +467,9 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
 	 * We don't have a max segment size, so set it to the max so sg's
 	 * debugging layer doesn't complain
 	 */
-	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	dma_set_max_seg_size(i915->drm.dev, UINT_MAX);
 
-	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
+	ret = dma_set_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
 	if (ret)
 		goto mask_err;
 
@@ -490,7 +489,7 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
 	if (IS_I965G(i915) || IS_I965GM(i915))
 		mask_size = 32;
 
-	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
+	ret = dma_set_coherent_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
 	if (ret)
 		goto mask_err;
 
@@ -510,7 +509,7 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
  */
 static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	int ret;
 
 	if (i915_inject_probe_failure(dev_priv))
@@ -642,7 +641,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
  */
 static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	i915_perf_fini(dev_priv);
 
@@ -792,7 +791,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(i915))
 		return i915;
 
-	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
 
 	/* Device parameters start as a copy of module parameters. */
@@ -1094,7 +1092,7 @@ static int i915_drm_prepare(struct drm_device *dev)
 static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	pci_power_t opregion_target_state;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
@@ -1151,7 +1149,7 @@ get_suspend_mode(struct drm_i915_private *dev_priv, bool hibernate)
 static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret;
 
@@ -1281,7 +1279,7 @@ static int i915_drm_resume(struct drm_device *dev)
 static int i915_drm_resume_early(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	int ret;
 
 	/*
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 15be8debae54..b5a33430f3b7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1295,7 +1295,7 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
 
 #define REVID_FOREVER		0xff
-#define INTEL_REVID(dev_priv)	((dev_priv)->drm.pdev->revision)
+#define INTEL_REVID(dev_priv)	(to_pci_dev((dev_priv)->drm.dev)->revision)
 
 #define INTEL_GEN_MASK(s, e) ( \
 	BUILD_BUG_ON_ZERO(!__builtin_constant_p(s)) + \
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index c5ee1567f3d1..55eb42e1c994 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -28,7 +28,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	do {
-		if (dma_map_sg_attrs(&obj->base.dev->pdev->dev,
+		if (dma_map_sg_attrs(obj->base.dev->dev,
 				     pages->sgl, pages->nents,
 				     PCI_DMA_BIDIRECTIONAL,
 				     DMA_ATTR_SKIP_CPU_SYNC |
@@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
-	struct device *kdev = &dev_priv->drm.pdev->dev;
+	struct device *kdev = dev_priv->drm.dev;
 	struct i915_ggtt *ggtt = &dev_priv->ggtt;
 
 	if (unlikely(ggtt->do_idle_maps)) {
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index f96032c60a12..8d37f4987cfa 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -12,6 +12,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
 	drm_i915_getparam_t *param = data;
 	int value;
@@ -24,10 +25,10 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		/* Reject all old ums/dri params. */
 		return -ENODEV;
 	case I915_PARAM_CHIPSET_ID:
-		value = i915->drm.pdev->device;
+		value = pdev->device;
 		break;
 	case I915_PARAM_REVISION:
-		value = i915->drm.pdev->revision;
+		value = pdev->revision;
 		break;
 	case I915_PARAM_NUM_FENCES_AVAIL:
 		value = i915->ggtt.num_fences;
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index d8cac4c5881f..97aa2c0f27aa 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -644,7 +644,7 @@ static void err_print_params(struct drm_i915_error_state_buf *m,
 static void err_print_pciid(struct drm_i915_error_state_buf *m,
 			    struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	err_printf(m, "PCI ID: 0x%04x\n", pdev->device);
 	err_printf(m, "PCI Revision: 0x%02x\n", pdev->revision);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index c80eeac53952..ee3c90c90761 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4357,7 +4357,7 @@ static void intel_irq_postinstall(struct drm_i915_private *dev_priv)
  */
 int intel_irq_install(struct drm_i915_private *dev_priv)
 {
-	int irq = dev_priv->drm.pdev->irq;
+	int irq = to_pci_dev(dev_priv->drm.dev)->irq;
 	int ret;
 
 	/*
@@ -4392,7 +4392,7 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
  */
 void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 {
-	int irq = dev_priv->drm.pdev->irq;
+	int irq = to_pci_dev(dev_priv->drm.dev)->irq;
 
 	/*
 	 * FIXME we can get called twice during driver probe
@@ -4452,5 +4452,5 @@ bool intel_irqs_enabled(struct drm_i915_private *dev_priv)
 
 void intel_synchronize_irq(struct drm_i915_private *i915)
 {
-	synchronize_irq(i915->drm.pdev->irq);
+	synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
 }
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index cd786ad12be7..58aa1aaaeb85 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -427,7 +427,8 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
 static u64 count_interrupts(struct drm_i915_private *i915)
 {
 	/* open-coded kstat_irqs() */
-	struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct irq_desc *desc = irq_to_desc(pdev->irq);
 	u64 sum = 0;
 	int cpu;
 
@@ -1117,7 +1118,7 @@ static void i915_pmu_unregister_cpuhp_state(struct i915_pmu *pmu)
 
 static bool is_igp(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	/* IGP is 0000:00:02.0 */
 	return pci_domain_nr(pdev->bus) == 0 &&
diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915/i915_suspend.c
index db2111fc809e..2ec76acf778d 100644
--- a/drivers/gpu/drm/i915/i915_suspend.c
+++ b/drivers/gpu/drm/i915/i915_suspend.c
@@ -84,7 +84,7 @@ static void intel_restore_swf(struct drm_i915_private *dev_priv)
 
 void i915_save_display(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	/* Display arbitration control */
 	if (INTEL_GEN(dev_priv) <= 4)
@@ -99,7 +99,7 @@ void i915_save_display(struct drm_i915_private *dev_priv)
 
 void i915_restore_display(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	intel_restore_swf(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index b3a24eac21f1..de0e224b56ce 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -54,14 +54,14 @@ static const struct vga_switcheroo_client_ops i915_switcheroo_ops = {
 
 int i915_switcheroo_register(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	return vga_switcheroo_register_client(pdev, &i915_switcheroo_ops, false);
 }
 
 void i915_switcheroo_unregister(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
 	vga_switcheroo_unregister_client(pdev);
 }
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 70fca72f5162..172799277dd5 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -61,7 +61,7 @@
  */
 void intel_vgpu_detect(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	u64 magic;
 	u16 version_major;
 	void __iomem *shared_area;
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index ef767f04c37c..5cda41e3b660 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -348,7 +348,7 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	}
 
 	if (IS_TIGERLAKE(i915)) {
-		struct pci_dev *root, *pdev = i915->drm.pdev;
+		struct pci_dev *root, *pdev = to_pci_dev(i915->drm.dev);
 
 		root = list_first_entry(&pdev->bus->devices, typeof(*root), bus_list);
 
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 40d8f1a95df6..0fe49b3adade 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -26,12 +26,12 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
 	if (ret)
 		return ret;
 
-	mem->remap_addr = dma_map_resource(&i915->drm.pdev->dev,
+	mem->remap_addr = dma_map_resource(i915->drm.dev,
 					   mem->region.start,
 					   mem->fake_mappable.size,
 					   PCI_DMA_BIDIRECTIONAL,
 					   DMA_ATTR_FORCE_CONTIGUOUS);
-	if (dma_mapping_error(&i915->drm.pdev->dev, mem->remap_addr)) {
+	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
 		drm_mm_remove_node(&mem->fake_mappable);
 		return -EINVAL;
 	}
@@ -56,7 +56,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
 
 	drm_mm_remove_node(&mem->fake_mappable);
 
-	dma_unmap_resource(&mem->i915->drm.pdev->dev,
+	dma_unmap_resource(mem->i915->drm.dev,
 			   mem->remap_addr,
 			   mem->fake_mappable.size,
 			   PCI_DMA_BIDIRECTIONAL,
@@ -104,7 +104,7 @@ const struct intel_memory_region_ops intel_region_lmem_ops = {
 struct intel_memory_region *
 intel_setup_fake_lmem(struct drm_i915_private *i915)
 {
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_memory_region *mem;
 	resource_size_t mappable_end;
 	resource_size_t io_start;
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 153ca9e65382..4970ef0843dc 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -625,7 +625,7 @@ void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm)
 {
 	struct drm_i915_private *i915 =
 			container_of(rpm, struct drm_i915_private, runtime_pm);
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct device *kdev = &pdev->dev;
 
 	rpm->kdev = kdev;
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 1c14a07eba7d..4caee4d5c120 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1780,7 +1780,7 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 static int uncore_mmio_setup(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
-	struct pci_dev *pdev = i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int mmio_bar;
 	int mmio_size;
 
@@ -1812,7 +1812,7 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 
 static void uncore_mmio_cleanup(struct intel_uncore *uncore)
 {
-	struct pci_dev *pdev = uncore->i915->drm.pdev;
+	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
 
 	pci_iounmap(pdev, uncore->regs);
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index e946bd2087d8..52513d5b7d03 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -148,7 +148,6 @@ struct drm_i915_private *mock_gem_device(void)
 	}
 
 	pci_set_drvdata(pdev, i915);
-	i915->drm.pdev = pdev;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index 7270fc8ca801..5c7ae40bba63 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	ppgtt->vm.i915 = i915;
 	ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
 	ppgtt->vm.file = ERR_PTR(-ENODEV);
-	ppgtt->vm.dma = &i915->drm.pdev->dev;
+	ppgtt->vm.dma = i915->drm.dev;
 
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
 
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
