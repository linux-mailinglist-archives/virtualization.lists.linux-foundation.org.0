Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1BEF987
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 10:35:41 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1154D198F;
	Tue,  5 Nov 2019 09:35:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE15D1985
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 09:35:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5A11527B
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572946531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=kyIvhY3BXMqZ4TEtR3KTmpEF86AeFHO8xa0fKWzJeAE=;
	b=cuBY46yaKkkgRzyTHANatBlK/jcMqCt7aXwPYvbKyE8qnazUZkq60/+s2juvIGLIdfBcIb
	FxczS0h/r1iRwLm5/IPEXjaSesapWEHsfTIUtzxT4Xc8kMjV72+PwdZwGmt0c3ZG8/Pim0
	oS4IvIUzTfwL7UHQh+3k4ztC+jLmVW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-3k4XrvtANoupEgdGxq9KMA-1; Tue, 05 Nov 2019 04:35:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310D8107ACC2;
	Tue,  5 Nov 2019 09:35:22 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-252.pek2.redhat.com [10.72.12.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5F955C28D;
	Tue,  5 Nov 2019 09:34:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V8 2/6] modpost: add support for mdev class id
Date: Tue,  5 Nov 2019 17:32:36 +0800
Message-Id: <20191105093240.5135-3-jasowang@redhat.com>
In-Reply-To: <20191105093240.5135-1-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3k4XrvtANoupEgdGxq9KMA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, stefanha@redhat.com,
	akrowiak@linux.ibm.com, netdev@vger.kernel.org,
	cohuck@redhat.com, oberpar@linux.ibm.com,
	maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Add support to parse mdev class id table.

Reviewed-by: Parav Pandit <parav@mellanox.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vfio/mdev/vfio_mdev.c     |  2 ++
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 38431e9ef7f5..a6641cd8b5a3 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -125,6 +125,8 @@ static const struct mdev_class_id vfio_id_table[] = {
 	{ 0 },
 };
 
+MODULE_DEVICE_TABLE(mdev, vfio_id_table);
+
 static struct mdev_driver vfio_mdev_driver = {
 	.name	= "vfio_mdev",
 	.probe	= vfio_mdev_probe,
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 054405b90ba4..6cbb1062488a 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -231,5 +231,8 @@ int main(void)
 	DEVID(wmi_device_id);
 	DEVID_FIELD(wmi_device_id, guid_string);
 
+	DEVID(mdev_class_id);
+	DEVID_FIELD(mdev_class_id, id);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c91eba751804..45f1c22f49be 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1335,6 +1335,16 @@ static int do_wmi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* looks like: "mdev:cN" */
+static int do_mdev_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, mdev_class_id, id);
+
+	sprintf(alias, "mdev:c%02X", id);
+	add_wildcard(alias);
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1407,6 +1417,7 @@ static const struct devtable devtable[] = {
 	{"typec", SIZE_typec_device_id, do_typec_entry},
 	{"tee", SIZE_tee_client_device_id, do_tee_entry},
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
+	{"mdev", SIZE_mdev_class_id, do_mdev_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
