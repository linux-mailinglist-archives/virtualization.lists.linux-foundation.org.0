Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 16539340339
	for <lists.virtualization@lfdr.de>; Thu, 18 Mar 2021 11:29:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF8884259;
	Thu, 18 Mar 2021 10:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFhdie-sEr07; Thu, 18 Mar 2021 10:29:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165AF8418A;
	Thu, 18 Mar 2021 10:29:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5039C0001;
	Thu, 18 Mar 2021 10:29:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29680C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E79606A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDmvDBryDW2u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC3C1606A5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50F52AD4A;
 Thu, 18 Mar 2021 10:29:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net
Subject: [PATCH v2 07/10] drm/simpledrm: Initialize framebuffer data from
 device-tree node
Date: Thu, 18 Mar 2021 11:29:18 +0100
Message-Id: <20210318102921.21536-8-tzimmermann@suse.de>
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

A firmware framebuffer might also be specified via device-tree files. If
no device platform data is given, try the DT device node.

v2:
	* add Device Tree match table
	* clean-up parser wrappers

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 4f0d4ec0b432..c9cef2b50de6 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -114,6 +114,74 @@ simplefb_get_format_pd(struct drm_device *dev,
 	return simplefb_get_validated_format(dev, pd->format);
 }
 
+static int
+simplefb_read_u32_of(struct drm_device *dev, struct device_node *of_node,
+		     const char *name, u32 *value)
+{
+	int ret = of_property_read_u32(of_node, name, value);
+
+	if (ret)
+		drm_err(dev, "simplefb: cannot parse framebuffer %s: error %d\n",
+			name, ret);
+	return ret;
+}
+
+static int
+simplefb_read_string_of(struct drm_device *dev, struct device_node *of_node,
+			const char *name, const char **value)
+{
+	int ret = of_property_read_string(of_node, name, value);
+
+	if (ret)
+		drm_err(dev, "simplefb: cannot parse framebuffer %s: error %d\n",
+			name, ret);
+	return ret;
+}
+
+static int
+simplefb_get_width_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 width;
+	int ret = simplefb_read_u32_of(dev, of_node, "width", &width);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int0(dev, "width", width);
+}
+
+static int
+simplefb_get_height_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 height;
+	int ret = simplefb_read_u32_of(dev, of_node, "height", &height);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int0(dev, "height", height);
+}
+
+static int
+simplefb_get_stride_of(struct drm_device *dev, struct device_node *of_node)
+{
+	u32 stride;
+	int ret = simplefb_read_u32_of(dev, of_node, "stride", &stride);
+
+	if (ret)
+		return ret;
+	return simplefb_get_validated_int(dev, "stride", stride);
+}
+
+static const struct drm_format_info *
+simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
+{
+	const char *format;
+	int ret = simplefb_read_string_of(dev, of_node, "format", &format);
+
+	if (ret)
+		return ERR_PTR(ret);
+	return simplefb_get_validated_format(dev, format);
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -166,6 +234,7 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
+	struct device_node *of_node = pdev->dev.of_node;
 
 	if (pd) {
 		width = simplefb_get_width_pd(dev, pd);
@@ -180,6 +249,19 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 		format = simplefb_get_format_pd(dev, pd);
 		if (IS_ERR(format))
 			return PTR_ERR(format);
+	} else if (of_node) {
+		width = simplefb_get_width_of(dev, of_node);
+		if (width < 0)
+			return width;
+		height = simplefb_get_height_of(dev, of_node);
+		if (height < 0)
+			return height;
+		stride = simplefb_get_stride_of(dev, of_node);
+		if (stride < 0)
+			return stride;
+		format = simplefb_get_format_of(dev, of_node);
+		if (IS_ERR(format))
+			return PTR_ERR(format);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return -ENODEV;
@@ -516,9 +598,16 @@ static int simpledrm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id simpledrm_of_match_table[] = {
+	{ .compatible = "simple-framebuffer", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, simpledrm_of_match_table);
+
 static struct platform_driver simpledrm_platform_driver = {
 	.driver = {
 		.name = "simple-framebuffer", /* connect to sysfb */
+		.of_match_table = simpledrm_of_match_table,
 	},
 	.probe = simpledrm_probe,
 	.remove = simpledrm_remove,
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
