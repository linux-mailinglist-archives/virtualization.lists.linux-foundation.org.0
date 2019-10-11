Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1145DD3B23
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 10:30:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D19910D9;
	Fri, 11 Oct 2019 08:30:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD775FFB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E72014D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:18:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D43618CB8E8;
	Fri, 11 Oct 2019 08:18:36 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-241.pek2.redhat.com [10.72.12.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C97D21001B08;
	Fri, 11 Oct 2019 08:18:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V3 3/7] modpost: add support for mdev class id
Date: Fri, 11 Oct 2019 16:15:53 +0800
Message-Id: <20191011081557.28302-4-jasowang@redhat.com>
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.63]);
	Fri, 11 Oct 2019 08:18:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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
	zhihong.wang@intel.com, akrowiak@linux.ibm.com,
	netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
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

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vfio/mdev/vfio_mdev.c     |  2 ++
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 10 ++++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index fd2a4d9a3f26..891cf83a2d9a 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -125,6 +125,8 @@ static struct mdev_class_id id_table[] = {
 	{ 0 },
 };
 
+MODULE_DEVICE_TABLE(mdev, id_table);
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
index c91eba751804..d365dfe7c718 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1335,6 +1335,15 @@ static int do_wmi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* looks like: "mdev:cN" */
+static int do_mdev_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, mdev_class_id, id);
+
+	sprintf(alias, "mdev:c%02X", id);
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1407,6 +1416,7 @@ static const struct devtable devtable[] = {
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
