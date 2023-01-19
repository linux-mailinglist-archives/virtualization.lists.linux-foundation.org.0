Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4E673293
	for <lists.virtualization@lfdr.de>; Thu, 19 Jan 2023 08:37:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB801822B2;
	Thu, 19 Jan 2023 07:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB801822B2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlPkS2k/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCGrNKteFtFn; Thu, 19 Jan 2023 07:37:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E897D822B6;
	Thu, 19 Jan 2023 07:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E897D822B6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15232C0078;
	Thu, 19 Jan 2023 07:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4E8EC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 07:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BFFA41982
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 07:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFFA41982
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JlPkS2k/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nPyRvEtWZUN
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 07:37:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C823A41981
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C823A41981
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Jan 2023 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674113822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S06AqGlmEUyC3/e/k2djDq5Ra/fFhZAiE0FaXodErl0=;
 b=JlPkS2k/OjmsWHCmI4dZ1M87DK43KrgqQgAhun8VSFaj/dU7zcTHSU0gDBaRmhAkfG5h27
 iETq+IBTPVlOcBoIriuEFqVcMx+qiyOJ1LWwz0kShBylbSBepB+1EXbNlStp1cSpSWy3KP
 ah3xwwR6Yws8LCG0jMxgKuQnzVDHV7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-FQU6fZupOA2w6g_MqcapeA-1; Thu, 19 Jan 2023 02:36:55 -0500
X-MC-Unique: FQU6fZupOA2w6g_MqcapeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB249183B3C8;
 Thu, 19 Jan 2023 07:36:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-175.pek2.redhat.com
 [10.72.12.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC656492B00;
 Thu, 19 Jan 2023 07:36:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2] vhost-scsi: unbreak any layout for response
Date: Thu, 19 Jan 2023 15:36:47 +0800
Message-Id: <20230119073647.76467-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bcodding@redhat.com,
 Al Viro <viro@zeniv.linux.org.uk>, stefanha@redhat.com, pbonzini@redhat.com
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

Al Viro said:

"""
Since "vhost/scsi: fix reuse of &vq->iov[out] in response"
we have this:
                cmd->tvc_resp_iov = vq->iov[vc.out];
                cmd->tvc_in_iovs = vc.in;
combined with
                iov_iter_init(&iov_iter, ITER_DEST, &cmd->tvc_resp_iov,
                              cmd->tvc_in_iovs, sizeof(v_rsp));
in vhost_scsi_complete_cmd_work().  We used to have ->tvc_resp_iov
_pointing_ to vq->iov[vc.out]; back then iov_iter_init() asked to
set an iovec-backed iov_iter over the tail of vq->iov[], with
length being the amount of iovecs in the tail.

Now we have a copy of one element of that array.  Fortunately, the members
following it in the containing structure are two non-NULL kernel pointers,
so copy_to_iter() will not copy anything beyond the first iovec - kernel
pointer is not (on the majority of architectures) going to be accepted by
access_ok() in copyout() and it won't be skipped since the "length" (in
reality - another non-NULL kernel pointer) won't be zero.

So it's not going to give a guest-to-qemu escalation, but it's definitely
a bug.  Frankly, my preference would be to verify that the very first iovec
is long enough to hold rsp_size.  Due to the above, any users that try to
give us vq->iov[vc.out].iov_len < sizeof(struct virtio_scsi_cmd_resp)
would currently get a failure in vhost_scsi_complete_cmd_work()
anyway.
"""

However, the spec doesn't say anything about the legacy descriptor
layout for the respone. So this patch tries to not assume the response
to reside in a single separate descriptor which is what commit
79c14141a487 ("vhost/scsi: Convert completion path to use") tries to
achieve towards to ANY_LAYOUT.

This is done by allocating and using dedicate resp iov in the
command. To be safety, start with UIO_MAXIOV to be consistent with the
limitation that we advertise to the vhost_get_vq_desc().

Testing with the hacked virtio-scsi driver that use 1 descriptor for 1
byte in the response.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Cc: Benjamin Coddington <bcodding@redhat.com>
Cc: Nicholas Bellinger <nab@linux-iscsi.org>
Fixes: a77ec83a5789 ("vhost/scsi: fix reuse of &vq->iov[out] in response")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V1:
- tweak the changelog
- fix the allocation size for tvc_resp_iov (should be sizeof(struct iovec))
---
 drivers/vhost/scsi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index dca6346d75b3..d5ecb8876fc9 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -80,7 +80,7 @@ struct vhost_scsi_cmd {
 	struct scatterlist *tvc_prot_sgl;
 	struct page **tvc_upages;
 	/* Pointer to response header iovec */
-	struct iovec tvc_resp_iov;
+	struct iovec *tvc_resp_iov;
 	/* Pointer to vhost_scsi for our device */
 	struct vhost_scsi *tvc_vhost;
 	/* Pointer to vhost_virtqueue for the cmd */
@@ -563,7 +563,7 @@ static void vhost_scsi_complete_cmd_work(struct vhost_work *work)
 		memcpy(v_rsp.sense, cmd->tvc_sense_buf,
 		       se_cmd->scsi_sense_length);
 
-		iov_iter_init(&iov_iter, ITER_DEST, &cmd->tvc_resp_iov,
+		iov_iter_init(&iov_iter, ITER_DEST, cmd->tvc_resp_iov,
 			      cmd->tvc_in_iovs, sizeof(v_rsp));
 		ret = copy_to_iter(&v_rsp, sizeof(v_rsp), &iov_iter);
 		if (likely(ret == sizeof(v_rsp))) {
@@ -594,6 +594,7 @@ vhost_scsi_get_cmd(struct vhost_virtqueue *vq, struct vhost_scsi_tpg *tpg,
 	struct vhost_scsi_cmd *cmd;
 	struct vhost_scsi_nexus *tv_nexus;
 	struct scatterlist *sg, *prot_sg;
+	struct iovec *tvc_resp_iov;
 	struct page **pages;
 	int tag;
 
@@ -613,6 +614,7 @@ vhost_scsi_get_cmd(struct vhost_virtqueue *vq, struct vhost_scsi_tpg *tpg,
 	sg = cmd->tvc_sgl;
 	prot_sg = cmd->tvc_prot_sgl;
 	pages = cmd->tvc_upages;
+	tvc_resp_iov = cmd->tvc_resp_iov;
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->tvc_sgl = sg;
 	cmd->tvc_prot_sgl = prot_sg;
@@ -625,6 +627,7 @@ vhost_scsi_get_cmd(struct vhost_virtqueue *vq, struct vhost_scsi_tpg *tpg,
 	cmd->tvc_data_direction = data_direction;
 	cmd->tvc_nexus = tv_nexus;
 	cmd->inflight = vhost_scsi_get_inflight(vq);
+	cmd->tvc_resp_iov = tvc_resp_iov;
 
 	memcpy(cmd->tvc_cdb, cdb, VHOST_SCSI_MAX_CDB_SIZE);
 
@@ -935,7 +938,7 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
 	struct iov_iter in_iter, prot_iter, data_iter;
 	u64 tag;
 	u32 exp_data_len, data_direction;
-	int ret, prot_bytes, c = 0;
+	int ret, prot_bytes, i, c = 0;
 	u16 lun;
 	u8 task_attr;
 	bool t10_pi = vhost_has_feature(vq, VIRTIO_SCSI_F_T10_PI);
@@ -1092,7 +1095,8 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
 		}
 		cmd->tvc_vhost = vs;
 		cmd->tvc_vq = vq;
-		cmd->tvc_resp_iov = vq->iov[vc.out];
+		for (i = 0; i < vc.in ; i++)
+			cmd->tvc_resp_iov[i] = vq->iov[vc.out + i];
 		cmd->tvc_in_iovs = vc.in;
 
 		pr_debug("vhost_scsi got command opcode: %#02x, lun: %d\n",
@@ -1461,6 +1465,7 @@ static void vhost_scsi_destroy_vq_cmds(struct vhost_virtqueue *vq)
 		kfree(tv_cmd->tvc_sgl);
 		kfree(tv_cmd->tvc_prot_sgl);
 		kfree(tv_cmd->tvc_upages);
+		kfree(tv_cmd->tvc_resp_iov);
 	}
 
 	sbitmap_free(&svq->scsi_tags);
@@ -1508,6 +1513,14 @@ static int vhost_scsi_setup_vq_cmds(struct vhost_virtqueue *vq, int max_cmds)
 			goto out;
 		}
 
+		tv_cmd->tvc_resp_iov = kcalloc(UIO_MAXIOV,
+					       sizeof(struct iovec),
+					       GFP_KERNEL);
+		if (!tv_cmd->tvc_resp_iov) {
+			pr_err("Unable to allocate tv_cmd->tvc_resp_iov\n");
+			goto out;
+		}
+
 		tv_cmd->tvc_prot_sgl = kcalloc(VHOST_SCSI_PREALLOC_PROT_SGLS,
 					       sizeof(struct scatterlist),
 					       GFP_KERNEL);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
