Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2366CB3B2
	for <lists.virtualization@lfdr.de>; Tue, 28 Mar 2023 04:17:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AB6E61103;
	Tue, 28 Mar 2023 02:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB6E61103
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nLUrTbEr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4CvgMb697pZ; Tue, 28 Mar 2023 02:17:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F72861108;
	Tue, 28 Mar 2023 02:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F72861108
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C9E5C008F;
	Tue, 28 Mar 2023 02:17:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94DA9C008D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 02:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 605E540A89
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 02:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 605E540A89
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nLUrTbEr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVq00kpY1_B9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 02:17:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8B840597
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC8B840597
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 02:17:29 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32S24iLE015658; Tue, 28 Mar 2023 02:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=wc+Pf9SWQS7/61Y+NpyR1cKQu6xp+7taKfAm8CHM57Q=;
 b=nLUrTbEriohqhK8Njff3mibJkJc7hR4rpG2DLRGDCWHwhqhlP1Hz8nVWhC0jpH9J7rG2
 gafWACiIGkrce0J+qoVOpyaNJwcLl98aUegFlo7lkXvIgRiNLA+JhYtAcR+n/3tlBWX1
 kNncFy1dndtL3tktXM+u+zWDuFFP1g3hi49iadkYD+78YRiXHmfxCD9T68kZykdjVSpY
 /1WksgZawomvU2lcwEpaInCTFtj1UuefSLFar+K2J3Xa6YK0CxxCCi0oj0G5tg893kgs
 0zlZsckXQtsLDtfL7+yaPwA4t5IwNj+2qtD4j82wBNTsPsUn8KUTlkQiI2uICZVB14wG MA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pkq4gr0fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 02:17:28 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32S0cMpf020281; Tue, 28 Mar 2023 02:17:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqd61brx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 02:17:27 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S2FZln038246;
 Tue, 28 Mar 2023 02:17:27 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-123-40.vpn.oracle.com
 [10.154.123.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3phqd61bky-7; Tue, 28 Mar 2023 02:17:27 +0000
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com,
 sgarzare@redhat.com, virtualization@lists.linux-foundation.org
Subject: [PATCH v6 06/11] vhost-sock: convert to vhost_vq_work_queue
Date: Mon, 27 Mar 2023 21:17:12 -0500
Message-Id: <20230328021717.42268-7-michael.christie@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328021717.42268-1-michael.christie@oracle.com>
References: <20230328021717.42268-1-michael.christie@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280016
X-Proofpoint-GUID: mVUgRlshRH48pfsf79lLUFz9sstW4yKA
X-Proofpoint-ORIG-GUID: mVUgRlshRH48pfsf79lLUFz9sstW4yKA
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
 drivers/vhost/vsock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index c8e6087769a1..1dcbc8669f95 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -285,7 +285,7 @@ vhost_transport_send_pkt(struct sk_buff *skb)
 		atomic_inc(&vsock->queued_replies);
 
 	virtio_vsock_skb_queue_tail(&vsock->send_pkt_queue, skb);
-	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
+	vhost_vq_work_queue(&vsock->vqs[VSOCK_VQ_RX], &vsock->send_pkt_work);
 
 	rcu_read_unlock();
 	return len;
@@ -582,7 +582,7 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
 	/* Some packets may have been queued before the device was started,
 	 * let's kick the send worker to send them.
 	 */
-	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
+	vhost_vq_work_queue(&vsock->vqs[VSOCK_VQ_RX], &vsock->send_pkt_work);
 
 	mutex_unlock(&vsock->dev.mutex);
 	return 0;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
