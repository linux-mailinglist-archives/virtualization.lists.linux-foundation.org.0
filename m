Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C36C27CF
	for <lists.virtualization@lfdr.de>; Tue, 21 Mar 2023 03:06:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FF6610BC;
	Tue, 21 Mar 2023 02:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FF6610BC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=aocPJm8l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iod3JECha-l; Tue, 21 Mar 2023 02:06:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7468061097;
	Tue, 21 Mar 2023 02:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7468061097
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1D65C0032;
	Tue, 21 Mar 2023 02:06:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D31F0C0089
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E01A610A8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E01A610A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-yWaHATHABx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D774A610A3
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D774A610A3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:40 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KM4jhZ002767; Tue, 21 Mar 2023 02:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=aTJJ4weWrYnJIs0IA7nCgrrq0FlpDP7lnLmNUEHvhDg=;
 b=aocPJm8lojy/LfEo1SQFAY3lxfvKAgDihPO/Hs0y4kbyK70+JA/kTCF3rSN9+iZ3npF7
 fpAZeyhT9wiAPGZ8vH1MGkmU0Iq3BqqGFVkhPTDpCVqULZ8JhM47rBkZC9VFWsXJDzeo
 zjPLrKkyd18anBQ+3udwQqW/Zj/50w1+3d3w7s0HGARROLrpnmRetfd518EWx6e4PWsA
 39VjWH2L5gpa1IKBC0FgmwJ7NSk7IthV1jyjgZpAnDfc9qqvt7cgRwM3BiQc0Rt7vb4n
 XtrMNYejmjz7+9DcXPoVz+sSHXc6uAv06/VF5WpXxEs6Qnu+cYeoStC+4CdD2rntyJzc vA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd5uucvcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 02:06:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32KNL7pw010476; Tue, 21 Mar 2023 02:06:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3peqjn4c53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 02:06:38 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32L26T9c007440;
 Tue, 21 Mar 2023 02:06:38 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-165-250.vpn.oracle.com
 [10.154.165.250])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3peqjn4c0v-7; Tue, 21 Mar 2023 02:06:38 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com,
 sgarzare@redhat.com, virtualization@lists.linux-foundation.org
Subject: [PATCH v2 6/7] vhost-scsi: Drop vhost_scsi_mutex use in port callouts
Date: Mon, 20 Mar 2023 21:06:23 -0500
Message-Id: <20230321020624.13323-7-michael.christie@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321020624.13323-1-michael.christie@oracle.com>
References: <20230321020624.13323-1-michael.christie@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_18,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210017
X-Proofpoint-GUID: el6c7okFz3kL4d464xOqzS6IgehnEWXR
X-Proofpoint-ORIG-GUID: el6c7okFz3kL4d464xOqzS6IgehnEWXR
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

We are using the vhost_scsi_mutex to make sure vhost_scsi_port_link and
vhost_scsi_port_unlink see if vhost_scsi_clear_endpoint has cleared
tpg->vhost_scsi and it can't be freed while they are using.
 
However, we currently set the tpg->vhost_scsi pointer while holding
tv_tpg_mutex. So, we can just hold that while calling
vhost_scsi_hotplug/hotunplug. We then don't need to hold the
vhost_scsi_mutex while vhost_scsi_clear_endpoint is holding it and doing
a flush which could cause the LUN map/unmap to have to wait on another
device's flush.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index ba8097fcea43..d4372a4aff49 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -2040,15 +2040,10 @@ static int vhost_scsi_port_link(struct se_portal_group *se_tpg,
 	struct vhost_scsi_tpg *tpg = container_of(se_tpg,
 				struct vhost_scsi_tpg, se_tpg);
 
-	mutex_lock(&vhost_scsi_mutex);
-
 	mutex_lock(&tpg->tv_tpg_mutex);
 	tpg->tv_tpg_port_count++;
-	mutex_unlock(&tpg->tv_tpg_mutex);
-
 	vhost_scsi_hotplug(tpg, lun);
-
-	mutex_unlock(&vhost_scsi_mutex);
+	mutex_unlock(&tpg->tv_tpg_mutex);
 
 	return 0;
 }
@@ -2059,15 +2054,10 @@ static void vhost_scsi_port_unlink(struct se_portal_group *se_tpg,
 	struct vhost_scsi_tpg *tpg = container_of(se_tpg,
 				struct vhost_scsi_tpg, se_tpg);
 
-	mutex_lock(&vhost_scsi_mutex);
-
 	mutex_lock(&tpg->tv_tpg_mutex);
 	tpg->tv_tpg_port_count--;
-	mutex_unlock(&tpg->tv_tpg_mutex);
-
 	vhost_scsi_hotunplug(tpg, lun);
-
-	mutex_unlock(&vhost_scsi_mutex);
+	mutex_unlock(&tpg->tv_tpg_mutex);
 }
 
 static ssize_t vhost_scsi_tpg_attrib_fabric_prot_type_store(
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
