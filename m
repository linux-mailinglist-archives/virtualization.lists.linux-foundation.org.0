Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA786F1CA5
	for <lists.virtualization@lfdr.de>; Fri, 28 Apr 2023 18:31:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E703842C4;
	Fri, 28 Apr 2023 16:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E703842C4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=RJWf+ufD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Dw8iDPvxcVn; Fri, 28 Apr 2023 16:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AB882842D3;
	Fri, 28 Apr 2023 16:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB882842D3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E4E0C008A;
	Fri, 28 Apr 2023 16:31:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88F9CC0090
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 569B26FEE5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569B26FEE5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=RJWf+ufD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znpasklzqZTD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACAFF6FED8
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACAFF6FED8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Apr 2023 16:31:51 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SF4GKL004432; Fri, 28 Apr 2023 16:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=t3Ax7z5G+zDR9rNUEOABQcp+vj+e6Xofb3dwY8N22s0=;
 b=RJWf+ufDDKxnmJl+L0BRpqnVQf585u+fSKHQG8IqcGDAJAvoIMhxro/mxvWZqmtJL5om
 1n2p+tTBUqZaXH/i6CN/tj7JiVa+26ozbeiQS/zWTcNis637X3etoX/AxPO3QUYj6zpr
 Ainh987E/XcsbpvOWGmTXMRbdekBdQeUMv90iVJxzZXGsktoOr5U8d0jTlzxSLetNt8O
 s2/eTyJWGANTIDBtryPqCOI8ggyrZHNahF48amnAH6mM3O3nOURR2lx+/RlMMADeBLfX
 THJGQvEtNNHm+rvOUIGpuuMDju9k5BzzdLPnVzkTXhpzDdH2o16LlL6ucdbvyniG4vAr Ow== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q47faxpqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 16:31:50 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33SFwuo1020280; Fri, 28 Apr 2023 16:31:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3q461h8mgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 16:31:49 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SGVYPr023567;
 Fri, 28 Apr 2023 16:31:49 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-109-59.vpn.oracle.com
 [10.154.109.59])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3q461h8m7j-11; Fri, 28 Apr 2023 16:31:48 +0000
From: Mike Christie <michael.christie@oracle.com>
To: virtualization@lists.linux-foundation.org, mst@redhat.com,
 sgarzare@redhat.com, jasowang@redhat.com, stefanha@redhat.com
Subject: [PATCH 11/14] vhost: add helper to parse userspace vring state/file
Date: Fri, 28 Apr 2023 11:31:28 -0500
Message-Id: <20230428163131.92777-11-michael.christie@oracle.com>
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
X-Proofpoint-ORIG-GUID: mb05fzqO3OyqNyK32UU-5ilOikWAmQJq
X-Proofpoint-GUID: mb05fzqO3OyqNyK32UU-5ilOikWAmQJq
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

The next patches add new vhost worker ioctls which will need to get a
vhost_virtqueue from a userspace struct which specifies the vq's index.
This moves the vhost_vring_ioctl code to do this to a helper so it can
be shared.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/vhost.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 2e27d24634f5..930b703eb6b6 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -604,6 +604,27 @@ static struct vhost_worker *vhost_worker_create(struct vhost_dev *dev)
 	return NULL;
 }
 
+static int vhost_get_vq_from_user(struct vhost_dev *dev, void __user *argp,
+				  struct vhost_virtqueue **vq, u32 *id)
+{
+	u32 __user *idxp = argp;
+	u32 idx;
+	long r;
+
+	r = get_user(idx, idxp);
+	if (r < 0)
+		return r;
+
+	if (idx >= dev->nvqs)
+		return -ENOBUFS;
+
+	idx = array_index_nospec(idx, dev->nvqs);
+
+	*vq = dev->vqs[idx];
+	*id = idx;
+	return 0;
+}
+
 /* Caller should have device mutex */
 long vhost_dev_set_owner(struct vhost_dev *dev)
 {
@@ -1614,21 +1635,15 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *arg
 	struct file *eventfp, *filep = NULL;
 	bool pollstart = false, pollstop = false;
 	struct eventfd_ctx *ctx = NULL;
-	u32 __user *idxp = argp;
 	struct vhost_virtqueue *vq;
 	struct vhost_vring_state s;
 	struct vhost_vring_file f;
 	u32 idx;
 	long r;
 
-	r = get_user(idx, idxp);
+	r = vhost_get_vq_from_user(d, argp, &vq, &idx);
 	if (r < 0)
 		return r;
-	if (idx >= d->nvqs)
-		return -ENOBUFS;
-
-	idx = array_index_nospec(idx, d->nvqs);
-	vq = d->vqs[idx];
 
 	if (ioctl == VHOST_SET_VRING_NUM ||
 	    ioctl == VHOST_SET_VRING_ADDR) {
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
