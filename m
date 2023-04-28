Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2E6F1CA4
	for <lists.virtualization@lfdr.de>; Fri, 28 Apr 2023 18:31:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6961D428A8;
	Fri, 28 Apr 2023 16:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6961D428A8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=pkG+/ucq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxfcfjsQm3D5; Fri, 28 Apr 2023 16:31:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 27DA8428A3;
	Fri, 28 Apr 2023 16:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27DA8428A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E91E8C008B;
	Fri, 28 Apr 2023 16:31:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A4B2C008C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2348E42890
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2348E42890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5oM-Uf1mlg1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CA34289D
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51CA34289D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:47 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SF4GUx004440; Fri, 28 Apr 2023 16:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=D4/MA0SuX0ACRCSrtE5WRSLq72R+JnfAvohlpxi+hYk=;
 b=pkG+/ucqbFt0uD4EwocTyEzzxqCS1Gs2/gkV2frWn3a4J5obnTvYmjQYpxiSsLybrM0F
 CvFnKOPeMtmtEvmMMZq/S1eV8zSfcf+8mS5ct1G0QP0IhsM+oronJSfVCQRINVBRTDp6
 xugX40Bz+F6emWBWouC7CkxxvNFXlr6F4qu4lk9lORZgfBGU7qWwp07rbDvGBLO+WmXQ
 CGQxmGh0EgRRLNNkbLXr3CypnzDExSBjLnsamMnYhX8MEyQbe9RyklCIgZPiBxVMYScU
 LvEXUKWyb39SJ/gXh9zDG67xVDgEom/qu5VuCmrK844U/SgUeTDqte8OQKiPGXvBjrMh vg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q47faxpq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 16:31:46 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33SFvVnF020354; Fri, 28 Apr 2023 16:31:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3q461h8mek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 16:31:45 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SGVYPl023567;
 Fri, 28 Apr 2023 16:31:44 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-109-59.vpn.oracle.com
 [10.154.109.59])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3q461h8m7j-8; Fri, 28 Apr 2023 16:31:44 +0000
From: Mike Christie <michael.christie@oracle.com>
To: virtualization@lists.linux-foundation.org, mst@redhat.com,
 sgarzare@redhat.com, jasowang@redhat.com, stefanha@redhat.com
Subject: [PATCH 08/14] vhost_scsi: convert to vhost_vq_work_queue
Date: Fri, 28 Apr 2023 11:31:25 -0500
Message-Id: <20230428163131.92777-8-michael.christie@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428163131.92777-1-michael.christie@oracle.com>
References: <20230428163131.92777-1-michael.christie@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280133
X-Proofpoint-ORIG-GUID: VxzZJzErAJG9xaPxnNr2xSAkdeCw7_JV
X-Proofpoint-GUID: VxzZJzErAJG9xaPxnNr2xSAkdeCw7_JV
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

Convert from vhost_work_queue to vhost_vq_work_queue.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index a77c53bb035a..1668009bd489 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -353,8 +353,9 @@ static void vhost_scsi_release_cmd(struct se_cmd *se_cmd)
 	if (se_cmd->se_cmd_flags & SCF_SCSI_TMR_CDB) {
 		struct vhost_scsi_tmf *tmf = container_of(se_cmd,
 					struct vhost_scsi_tmf, se_cmd);
+		struct vhost_virtqueue *vq = &tmf->svq->vq;
 
-		vhost_work_queue(&tmf->vhost->dev, &tmf->vwork);
+		vhost_vq_work_queue(vq, &tmf->vwork);
 	} else {
 		struct vhost_scsi_cmd *cmd = container_of(se_cmd,
 					struct vhost_scsi_cmd, tvc_se_cmd);
@@ -1332,11 +1333,9 @@ static void vhost_scsi_ctl_handle_kick(struct vhost_work *work)
 }
 
 static void
-vhost_scsi_send_evt(struct vhost_scsi *vs,
-		   struct vhost_scsi_tpg *tpg,
-		   struct se_lun *lun,
-		   u32 event,
-		   u32 reason)
+vhost_scsi_send_evt(struct vhost_scsi *vs, struct vhost_virtqueue *vq,
+		    struct vhost_scsi_tpg *tpg, struct se_lun *lun,
+		    u32 event, u32 reason)
 {
 	struct vhost_scsi_evt *evt;
 
@@ -1358,7 +1357,7 @@ vhost_scsi_send_evt(struct vhost_scsi *vs,
 	}
 
 	llist_add(&evt->list, &vs->vs_event_list);
-	vhost_work_queue(&vs->dev, &vs->vs_event_work);
+	vhost_vq_work_queue(vq, &vs->vs_event_work);
 }
 
 static void vhost_scsi_evt_handle_kick(struct vhost_work *work)
@@ -1372,7 +1371,8 @@ static void vhost_scsi_evt_handle_kick(struct vhost_work *work)
 		goto out;
 
 	if (vs->vs_events_missed)
-		vhost_scsi_send_evt(vs, NULL, NULL, VIRTIO_SCSI_T_NO_EVENT, 0);
+		vhost_scsi_send_evt(vs, vq, NULL, NULL, VIRTIO_SCSI_T_NO_EVENT,
+				    0);
 out:
 	mutex_unlock(&vq->mutex);
 }
@@ -1991,7 +1991,7 @@ vhost_scsi_do_plug(struct vhost_scsi_tpg *tpg,
 		goto unlock;
 
 	if (vhost_has_feature(vq, VIRTIO_SCSI_F_HOTPLUG))
-		vhost_scsi_send_evt(vs, tpg, lun,
+		vhost_scsi_send_evt(vs, vq, tpg, lun,
 				   VIRTIO_SCSI_T_TRANSPORT_RESET, reason);
 unlock:
 	mutex_unlock(&vq->mutex);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
