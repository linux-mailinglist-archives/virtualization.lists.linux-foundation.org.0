Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBAB3CF829
	for <lists.virtualization@lfdr.de>; Tue, 20 Jul 2021 12:44:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5619B6083B;
	Tue, 20 Jul 2021 10:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seTITTp-Wb9W; Tue, 20 Jul 2021 10:44:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 345AA60834;
	Tue, 20 Jul 2021 10:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC3BC0022;
	Tue, 20 Jul 2021 10:44:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 711DEC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F44940383
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2DxrohzDztB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:44:06 +0000 (UTC)
X-Greylist: delayed 00:15:03 by SQLgrey-1.8.0
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4F8C40293
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:44:06 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 20 Jul 2021 03:28:59 -0700
Received: from sc-dbc2166.eng.vmware.com (sc-dbc2166.eng.vmware.com
 [10.182.28.66])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 86F0C200DE;
 Tue, 20 Jul 2021 03:29:01 -0700 (PDT)
From: Jorgen Hansen <jhansen@vmware.com>
To: <linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH] MAINTAINERS: Update for VMCI driver
Date: Tue, 20 Jul 2021 03:29:01 -0700
Message-ID: <1626776941-9163-1-git-send-email-jhansen@vmware.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: jhansen@vmware.com does not
 designate permitted sender hosts)
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
 Jorgen Hansen <jhansen@vmware.com>
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

Add maintainer info for the VMware VMCI driver.

Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3..7e7c6fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19792,6 +19792,14 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/ptp/ptp_vmw.c
 
+VMWARE VMCI DRIVER
+M:	Jorgen Hansen <jhansen@vmware.com>
+M:	Vishnu Dasa <vdasa@vmware.com>
+M:	"VMware, Inc." <pv-drivers@vmware.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/misc/vmw_vmci/
+
 VMWARE VMMOUSE SUBDRIVER
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
-- 
2.6.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
