Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDDF34033D
	for <lists.virtualization@lfdr.de>; Thu, 18 Mar 2021 11:29:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF704328E;
	Thu, 18 Mar 2021 10:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkgD8EerXWjg; Thu, 18 Mar 2021 10:29:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B66643297;
	Thu, 18 Mar 2021 10:29:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F54C001C;
	Thu, 18 Mar 2021 10:29:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95A91C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7234284242
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpRE9htg7NUy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52F9D83D85
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0D3FAC1E;
 Thu, 18 Mar 2021 10:29:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net
Subject: [PATCH v2 09/10] drm/simpledrm: Acquire regulators from DT device node
Date: Thu, 18 Mar 2021 11:29:20 +0100
Message-Id: <20210318102921.21536-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
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

Make sure required hardware regulators are enabled while the firmware
framebuffer is in use.

The basic code has been taken from the simplefb driver and adapted
to DRM. Regulators are released automatically via devres helpers.

v2:
	* use strscpy()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 10ca3373b61f..2e27eeb791a1 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -4,6 +4,7 @@
 #include <linux/of_clk.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -197,6 +198,11 @@ struct simpledrm_device {
 	unsigned int clk_count;
 	struct clk **clks;
 #endif
+	/* regulators */
+#if defined CONFIG_OF && defined CONFIG_REGULATOR
+	unsigned int regulator_count;
+	struct regulator **regulators;
+#endif
 
 	/* simplefb settings */
 	struct drm_display_mode mode;
@@ -316,6 +322,125 @@ static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_REGULATOR
+
+#define SUPPLY_SUFFIX "-supply"
+
+/*
+ * Regulator handling code.
+ *
+ * Here we handle the num-supplies and vin*-supply properties of our
+ * "simple-framebuffer" dt node. This is necessary so that we can make sure
+ * that any regulators needed by the display hardware that the bootloader
+ * set up for us (and for which it provided a simplefb dt node), stay up,
+ * for the life of the simplefb driver.
+ *
+ * When the driver unloads, we cleanly disable, and then release the
+ * regulators.
+ *
+ * We only complain about errors here, no action is taken as the most likely
+ * error can only happen due to a mismatch between the bootloader which set
+ * up simplefb, and the regulator definitions in the device tree. Chances are
+ * that there are no adverse effects, and if there are, a clean teardown of
+ * the fb probe will not help us much either. So just complain and carry on,
+ * and hope that the user actually gets a working fb at the end of things.
+ */
+
+static void simpledrm_device_release_regulators(void *res)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(res);
+	unsigned int i;
+
+	for (i = 0; i < sdev->regulator_count; ++i) {
+		if (sdev->regulators[i]) {
+			regulator_disable(sdev->regulators[i]);
+			regulator_put(sdev->regulators[i]);
+		}
+	}
+}
+
+static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
+{
+	struct drm_device *dev = &sdev->dev;
+	struct platform_device *pdev = sdev->pdev;
+	struct device_node *of_node = pdev->dev.of_node;
+	struct property *prop;
+	struct regulator *regulator;
+	const char *p;
+	unsigned int count = 0, i = 0;
+	int ret;
+
+	if (dev_get_platdata(&pdev->dev) || !of_node)
+		return 0;
+
+	/* Count the number of regulator supplies */
+	for_each_property_of_node(of_node, prop) {
+		p = strstr(prop->name, SUPPLY_SUFFIX);
+		if (p && p != prop->name)
+			++count;
+	}
+
+	if (!count)
+		return 0;
+
+	sdev->regulators = drmm_kzalloc(dev,
+					count * sizeof(sdev->regulators[0]),
+					GFP_KERNEL);
+	if (!sdev->regulators)
+		return -ENOMEM;
+
+	for_each_property_of_node(of_node, prop) {
+		char name[32]; /* 32 is max size of property name */
+		size_t len;
+
+		p = strstr(prop->name, SUPPLY_SUFFIX);
+		if (!p || p == prop->name)
+			continue;
+		len = strlen(prop->name) - strlen(SUPPLY_SUFFIX) + 1;
+		strscpy(name, prop->name, min(sizeof(name), len));
+
+		regulator = regulator_get_optional(&pdev->dev, name);
+		if (IS_ERR(regulator)) {
+			ret = PTR_ERR(regulator);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			drm_err(dev, "regulator %s not found: %d\n",
+				name, ret);
+			continue;
+		}
+
+		ret = regulator_enable(regulator);
+		if (ret) {
+			drm_err(dev, "failed to enable regulator %u: %d\n",
+				i, ret);
+			regulator_put(regulator);
+		}
+
+		sdev->regulators[i++] = regulator;
+	}
+	sdev->regulator_count = i;
+
+	return devm_add_action_or_reset(&pdev->dev,
+					simpledrm_device_release_regulators,
+					sdev);
+
+err:
+	while (i) {
+		--i;
+		if (sdev->regulators[i]) {
+			regulator_disable(sdev->regulators[i]);
+			regulator_put(sdev->regulators[i]);
+		}
+	}
+	return ret;
+}
+#else
+static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  *  Simplefb settings
  */
@@ -640,6 +765,9 @@ simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
 	sdev->pdev = pdev;
 
 	ret = simpledrm_device_init_clocks(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_init_regulators(sdev);
 	if (ret)
 		return ERR_PTR(ret);
 	ret = simpledrm_device_init_fb(sdev);
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
