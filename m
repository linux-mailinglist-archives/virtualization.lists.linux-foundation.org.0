Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7A6C27C9
	for <lists.virtualization@lfdr.de>; Tue, 21 Mar 2023 03:06:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EAE81F1B;
	Tue, 21 Mar 2023 02:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EAE81F1B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=kn/EgPcV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjA0zZyySa_g; Tue, 21 Mar 2023 02:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9E48181EBA;
	Tue, 21 Mar 2023 02:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E48181EBA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9F67C0089;
	Tue, 21 Mar 2023 02:06:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20689C0090
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0758A41816
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0758A41816
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=kn/EgPcV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfADEHfXBcoC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C547D417E5
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C547D417E5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 02:06:33 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KM4PPJ017062; Tue, 21 Mar 2023 02:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=ICr6JzllCR1YW+fQxz7qhwf/ZHRNWHHojOVxIp7h5Q4=;
 b=kn/EgPcVAhsLSIqVULY+HZA0wyfSWr+dvbIuaomq9Wi+F3YWDfb2Y1/pfFf9KIFGVl+E
 9b8AXJKTYruNSb6dv7aJR9pqfX1pIo1G29wx/JTfxEBZgVzwce7abs/x7cmDAmj1Hqv4
 bYJZ5IY6YzYczO86vILwUV015m9hQcN+6F7fztEb+uNKn2Lr9xWxTEzlDQuuxODcuIvp
 I4M8tjQFfhkFzGn9H3/ZCjMt2DrKBMNYNofS0SsGZD2mVG/RrQ5qyIzoGv6WzGo61wuc
 Wf9lFBC+/HIU4dlvm0INonMaOocRA7PlUIFYfUhqYZmuR6+yX2IDm1N0GcFP68SBWw42 6w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd5bcd14c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 02:06:32 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32KNGEQa010416; Tue, 21 Mar 2023 02:06:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3peqjn4c38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 02:06:31 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32L26T9U007440;
 Tue, 21 Mar 2023 02:06:31 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-165-250.vpn.oracle.com
 [10.154.165.250])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3peqjn4c0v-3; Tue, 21 Mar 2023 02:06:30 +0000
From: Mike Christie <michael.christie@oracle.com>
To: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org,
 stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com,
 sgarzare@redhat.com, virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/7] vhost-scsi: Fix crash during LUN unmapping
Date: Mon, 20 Mar 2023 21:06:19 -0500
Message-Id: <20230321020624.13323-3-michael.christie@oracle.com>
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
X-Proofpoint-ORIG-GUID: nfcE546NliwODiwmeltDLuD_vdtg3kGS
X-Proofpoint-GUID: nfcE546NliwODiwmeltDLuD_vdtg3kGS
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

We normally clear the endpoint then unmap LUNs so the devices are fully
shutdown when the LUN is unmapped, but it's legal to unmap before
clearing. If the user does that while TMFs are running then we can end
up crashing.

vhost_scsi_port_unlink assumes that the LUN's tmf struct will always be on
the tmf_queue list. However, if a TMF is running then it will have been
removed while it's executing. If we do a LUN unmap at this time, then
we assume the entry is on the list and just start accessing it and free
it.

This fixes the bug by just allocating the vhost_scsi_tmf struct when it's
needed like is done with the se_tmr struct that's needed when we submit
the TMF. In this path perf is not an issue and we can use GFP_KERNEL
since it won't swing directly back on us, so we don't need to preallocate
the struct.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 36 ++++--------------------------------
 1 file changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 5875241e1654..32d0be968103 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -125,7 +125,6 @@ struct vhost_scsi_tpg {
 	struct se_portal_group se_tpg;
 	/* Pointer back to vhost_scsi, protected by tv_tpg_mutex */
 	struct vhost_scsi *vhost_scsi;
-	struct list_head tmf_queue;
 };
 
 struct vhost_scsi_tport {
@@ -206,10 +205,8 @@ struct vhost_scsi {
 
 struct vhost_scsi_tmf {
 	struct vhost_work vwork;
-	struct vhost_scsi_tpg *tpg;
 	struct vhost_scsi *vhost;
 	struct vhost_scsi_virtqueue *svq;
-	struct list_head queue_entry;
 
 	struct se_cmd se_cmd;
 	u8 scsi_resp;
@@ -352,12 +349,9 @@ static void vhost_scsi_release_cmd_res(struct se_cmd *se_cmd)
 
 static void vhost_scsi_release_tmf_res(struct vhost_scsi_tmf *tmf)
 {
-	struct vhost_scsi_tpg *tpg = tmf->tpg;
 	struct vhost_scsi_inflight *inflight = tmf->inflight;
 
-	mutex_lock(&tpg->tv_tpg_mutex);
-	list_add_tail(&tpg->tmf_queue, &tmf->queue_entry);
-	mutex_unlock(&tpg->tv_tpg_mutex);
+	kfree(tmf);
 	vhost_scsi_put_inflight(inflight);
 }
 
@@ -1194,19 +1188,11 @@ vhost_scsi_handle_tmf(struct vhost_scsi *vs, struct vhost_scsi_tpg *tpg,
 		goto send_reject;
 	}
 
-	mutex_lock(&tpg->tv_tpg_mutex);
-	if (list_empty(&tpg->tmf_queue)) {
-		pr_err("Missing reserve TMF. Could not handle LUN RESET.\n");
-		mutex_unlock(&tpg->tv_tpg_mutex);
+	tmf = kzalloc(sizeof(*tmf), GFP_KERNEL);
+	if (!tmf)
 		goto send_reject;
-	}
-
-	tmf = list_first_entry(&tpg->tmf_queue, struct vhost_scsi_tmf,
-			       queue_entry);
-	list_del_init(&tmf->queue_entry);
-	mutex_unlock(&tpg->tv_tpg_mutex);
 
-	tmf->tpg = tpg;
+	vhost_work_init(&tmf->vwork, vhost_scsi_tmf_resp_work);
 	tmf->vhost = vs;
 	tmf->svq = svq;
 	tmf->resp_iov = vq->iov[vc->out];
@@ -2035,19 +2021,11 @@ static int vhost_scsi_port_link(struct se_portal_group *se_tpg,
 {
 	struct vhost_scsi_tpg *tpg = container_of(se_tpg,
 				struct vhost_scsi_tpg, se_tpg);
-	struct vhost_scsi_tmf *tmf;
-
-	tmf = kzalloc(sizeof(*tmf), GFP_KERNEL);
-	if (!tmf)
-		return -ENOMEM;
-	INIT_LIST_HEAD(&tmf->queue_entry);
-	vhost_work_init(&tmf->vwork, vhost_scsi_tmf_resp_work);
 
 	mutex_lock(&vhost_scsi_mutex);
 
 	mutex_lock(&tpg->tv_tpg_mutex);
 	tpg->tv_tpg_port_count++;
-	list_add_tail(&tmf->queue_entry, &tpg->tmf_queue);
 	mutex_unlock(&tpg->tv_tpg_mutex);
 
 	vhost_scsi_hotplug(tpg, lun);
@@ -2062,16 +2040,11 @@ static void vhost_scsi_port_unlink(struct se_portal_group *se_tpg,
 {
 	struct vhost_scsi_tpg *tpg = container_of(se_tpg,
 				struct vhost_scsi_tpg, se_tpg);
-	struct vhost_scsi_tmf *tmf;
 
 	mutex_lock(&vhost_scsi_mutex);
 
 	mutex_lock(&tpg->tv_tpg_mutex);
 	tpg->tv_tpg_port_count--;
-	tmf = list_first_entry(&tpg->tmf_queue, struct vhost_scsi_tmf,
-			       queue_entry);
-	list_del(&tmf->queue_entry);
-	kfree(tmf);
 	mutex_unlock(&tpg->tv_tpg_mutex);
 
 	vhost_scsi_hotunplug(tpg, lun);
@@ -2332,7 +2305,6 @@ vhost_scsi_make_tpg(struct se_wwn *wwn, const char *name)
 	}
 	mutex_init(&tpg->tv_tpg_mutex);
 	INIT_LIST_HEAD(&tpg->tv_tpg_list);
-	INIT_LIST_HEAD(&tpg->tmf_queue);
 	tpg->tport = tport;
 	tpg->tport_tpgt = tpgt;
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
