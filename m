Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058862D1B5
	for <lists.virtualization@lfdr.de>; Thu, 17 Nov 2022 04:33:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF75882030;
	Thu, 17 Nov 2022 03:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF75882030
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VgvSoN74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoiROYQgi_VV; Thu, 17 Nov 2022 03:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8733D82032;
	Thu, 17 Nov 2022 03:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8733D82032
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5CE1C0077;
	Thu, 17 Nov 2022 03:33:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C72BC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 03:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6229760B73
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 03:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6229760B73
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VgvSoN74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lwOo4P6mnTC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 03:33:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C5E60B55
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C5E60B55
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668655992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bEgs6r6K75N0WtORy2wa6jb70ubQdjOl8NHUGJWWq+I=;
 b=VgvSoN74mniSlVgoIdFPT4ZCfPEomFYA1urtIDY2brzT0K5njG78KAsOc31Nebf8YkAQO5
 +CUPcLHEU3Ogt+wUBkOFDzeEPshAOW+MSvKwew6x08KRf8bMhfZQD2XMct0Al10vFHphxm
 bBij9nM4VOOFijwEWZ3wgsXUvfgjpA0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-0HmsnkxuP5erzPkSKma_lg-1; Wed, 16 Nov 2022 22:33:11 -0500
X-MC-Unique: 0HmsnkxuP5erzPkSKma_lg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A09223C01DED;
 Thu, 17 Nov 2022 03:33:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-248.pek2.redhat.com
 [10.72.13.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7E7475060;
 Thu, 17 Nov 2022 03:33:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: dsahern@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH V2] vdpa: allow provisioning device features
Date: Thu, 17 Nov 2022 11:33:03 +0800
Message-Id: <20221117033303.16870-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, elic@nvidia.com
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

This patch allows device features to be provisioned via vdpa. This
will be useful for preserving migration compatibility between source
and destination:

# vdpa dev add name dev1 mgmtdev pci/0000:02:00.0 device_features 0x300020000
# dev1: mac 52:54:00:12:34:56 link up link_announce false mtu 65535
      negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since v1:
- Use uint64_t instead of __u64 for device_features
- Fix typos and tweak the manpage
- Add device_features to the help text
---
 man/man8/vdpa-dev.8            | 15 +++++++++++++++
 vdpa/include/uapi/linux/vdpa.h |  1 +
 vdpa/vdpa.c                    | 32 +++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/man/man8/vdpa-dev.8 b/man/man8/vdpa-dev.8
index 9faf3838..43e5bf48 100644
--- a/man/man8/vdpa-dev.8
+++ b/man/man8/vdpa-dev.8
@@ -31,6 +31,7 @@ vdpa-dev \- vdpa device configuration
 .I NAME
 .B mgmtdev
 .I MGMTDEV
+.RI "[ device_features " DEVICE_FEATURES " ]"
 .RI "[ mac " MACADDR " ]"
 .RI "[ mtu " MTU " ]"
 .RI "[ max_vqp " MAX_VQ_PAIRS " ]"
@@ -74,6 +75,15 @@ Name of the new vdpa device to add.
 Name of the management device to use for device addition.
 
 .PP
+.BI device_features " DEVICE_FEATURES"
+Specifies the virtio device features bit-mask that is provisioned for the new vdpa device.
+
+The bits can be found under include/uapi/linux/virtio*h.
+
+see macros such as VIRTIO_F_ and VIRTIO_XXX(e.g NET)_F_ for specific bit values.
+
+This is optional.
+
 .BI mac " MACADDR"
 - specifies the mac address for the new vdpa device.
 This is applicable only for the network type of vdpa device. This is optional.
@@ -127,6 +137,11 @@ vdpa dev add name foo mgmtdev vdpa_sim_net
 Add the vdpa device named foo on the management device vdpa_sim_net.
 .RE
 .PP
+vdpa dev add name foo mgmtdev vdpa_sim_net device_features 0x300020000
+.RS 4
+Add the vdpa device named foo on the management device vdpa_sim_net with device_features of 0x300020000
+.RE
+.PP
 vdpa dev add name foo mgmtdev vdpa_sim_net mac 00:11:22:33:44:55
 .RS 4
 Add the vdpa device named foo on the management device vdpa_sim_net with mac address of 00:11:22:33:44:55.
diff --git a/vdpa/include/uapi/linux/vdpa.h b/vdpa/include/uapi/linux/vdpa.h
index 94e4dad1..7c961991 100644
--- a/vdpa/include/uapi/linux/vdpa.h
+++ b/vdpa/include/uapi/linux/vdpa.h
@@ -51,6 +51,7 @@ enum vdpa_attr {
 	VDPA_ATTR_DEV_QUEUE_INDEX,              /* u32 */
 	VDPA_ATTR_DEV_VENDOR_ATTR_NAME,		/* string */
 	VDPA_ATTR_DEV_VENDOR_ATTR_VALUE,        /* u64 */
+	VDPA_ATTR_DEV_FEATURES,                 /* u64 */
 
 	/* new attributes must be added above here */
 	VDPA_ATTR_MAX,
diff --git a/vdpa/vdpa.c b/vdpa/vdpa.c
index b73e40b4..d0ce5e22 100644
--- a/vdpa/vdpa.c
+++ b/vdpa/vdpa.c
@@ -27,6 +27,7 @@
 #define VDPA_OPT_VDEV_MTU		BIT(5)
 #define VDPA_OPT_MAX_VQP		BIT(6)
 #define VDPA_OPT_QUEUE_INDEX		BIT(7)
+#define VDPA_OPT_VDEV_FEATURES		BIT(8)
 
 struct vdpa_opts {
 	uint64_t present; /* flags of present items */
@@ -38,6 +39,7 @@ struct vdpa_opts {
 	uint16_t mtu;
 	uint16_t max_vqp;
 	uint32_t queue_idx;
+	uint64_t device_features;
 };
 
 struct vdpa {
@@ -187,6 +189,17 @@ static int vdpa_argv_u32(struct vdpa *vdpa, int argc, char **argv,
 	return get_u32(result, *argv, 10);
 }
 
+static int vdpa_argv_u64_hex(struct vdpa *vdpa, int argc, char **argv,
+			     uint64_t *result)
+{
+	if (argc <= 0 || !*argv) {
+		fprintf(stderr, "number expected\n");
+		return -EINVAL;
+	}
+
+	return get_u64(result, *argv, 16);
+}
+
 struct vdpa_args_metadata {
 	uint64_t o_flag;
 	const char *err_msg;
@@ -244,6 +257,10 @@ static void vdpa_opts_put(struct nlmsghdr *nlh, struct vdpa *vdpa)
 		mnl_attr_put_u16(nlh, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, opts->max_vqp);
 	if (opts->present & VDPA_OPT_QUEUE_INDEX)
 		mnl_attr_put_u32(nlh, VDPA_ATTR_DEV_QUEUE_INDEX, opts->queue_idx);
+	if (opts->present & VDPA_OPT_VDEV_FEATURES) {
+		mnl_attr_put_u64(nlh, VDPA_ATTR_DEV_FEATURES,
+				opts->device_features);
+	}
 }
 
 static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
@@ -329,6 +346,14 @@ static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
 
 			NEXT_ARG_FWD();
 			o_found |= VDPA_OPT_QUEUE_INDEX;
+		} else if (!strcmp(*argv, "device_features") &&
+			   (o_optional & VDPA_OPT_VDEV_FEATURES)) {
+			NEXT_ARG_FWD();
+			err = vdpa_argv_u64_hex(vdpa, argc, argv,
+						&opts->device_features);
+			if (err)
+				return err;
+			o_found |= VDPA_OPT_VDEV_FEATURES;
 		} else {
 			fprintf(stderr, "Unknown option \"%s\"\n", *argv);
 			return -EINVAL;
@@ -615,8 +640,9 @@ static int cmd_mgmtdev(struct vdpa *vdpa, int argc, char **argv)
 static void cmd_dev_help(void)
 {
 	fprintf(stderr, "Usage: vdpa dev show [ DEV ]\n");
-	fprintf(stderr, "       vdpa dev add name NAME mgmtdev MANAGEMENTDEV [ mac MACADDR ] [ mtu MTU ]\n");
-	fprintf(stderr, "                                                    [ max_vqp MAX_VQ_PAIRS ]\n");
+	fprintf(stderr, "       vdpa dev add name NAME mgmtdevMANAGEMENTDEV [ device_features DEVICE_FEATURES]\n");
+	fprintf(stderr, "                                                   [ mac MACADDR ] [ mtu MTU ]\n");
+	fprintf(stderr, "                                                   [ max_vqp MAX_VQ_PAIRS ]\n");
 	fprintf(stderr, "       vdpa dev del DEV\n");
 	fprintf(stderr, "Usage: vdpa dev config COMMAND [ OPTIONS ]\n");
 	fprintf(stderr, "Usage: vdpa dev vstats COMMAND\n");
@@ -708,7 +734,7 @@ static int cmd_dev_add(struct vdpa *vdpa, int argc, char **argv)
 	err = vdpa_argv_parse_put(nlh, vdpa, argc, argv,
 				  VDPA_OPT_VDEV_MGMTDEV_HANDLE | VDPA_OPT_VDEV_NAME,
 				  VDPA_OPT_VDEV_MAC | VDPA_OPT_VDEV_MTU |
-				  VDPA_OPT_MAX_VQP);
+				  VDPA_OPT_MAX_VQP | VDPA_OPT_VDEV_FEATURES);
 	if (err)
 		return err;
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
