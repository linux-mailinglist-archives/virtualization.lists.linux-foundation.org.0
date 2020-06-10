Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D31F536F
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F3FF88116;
	Wed, 10 Jun 2020 11:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LNkQODZ-21O; Wed, 10 Jun 2020 11:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 237C288070;
	Wed, 10 Jun 2020 11:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2920C088C;
	Wed, 10 Jun 2020 11:36:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BEB6C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 36FE625B22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMcwgMcBdwvV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id F368F25D1F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=P87VHWxuTfnukgUrCDq+ZV0PAsllRZt0SQGz7oPSEJGvWJ6OgpAfEvurLMcLmecsVBG4cD
 tF4fK64wtV+2U3CpTO7OccaVQySQYTOaWvfnwBdLFGUc9aFRX2wXFh1bprodYeFjPLwv6q
 aKpqCBFGoFb7qrgZVakyw/VECVnDzjI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-4XQUUy16OUmq136SXXFqcA-1; Wed, 10 Jun 2020 07:36:28 -0400
X-MC-Unique: 4XQUUy16OUmq136SXXFqcA-1
Received: by mail-wr1-f71.google.com with SMTP id l1so964646wrc.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNh1TL7xZUtXOusVSg8tIG35kTb/6beDbMDeGMbkL8c=;
 b=o9KGOaPwHwlks3ud08O4UfoN1mKVPAbDN1GVemN3h1frO9UnLp18KNKbYlS9Jmvyqz
 Ixvrg9zdEdwbkYimeifBCzJDi0BWKvMITu1jK3B+TXVPK0frmRwvIS3sOVatj+ykGt6D
 k7w+L/TPVMJL5SLasSmzuDQ58EnFGPq5dlnc+M2DsHq/C1oGFfnETtjf5WDM77hhSApB
 HUWT1shQDMQXeYPVRq4NndMTfX+r//VE3H2oe8IOVudoVZxrlw3vLHT/XRajuLH8GjjO
 D95GzGj41j3uc4fNUTea7z22dcsm3jSE9CpJd8LS3mm2y/VCFKsDXhQ88AxHLyxlf/Fr
 3vbA==
X-Gm-Message-State: AOAM533n20m5ZOjGDMMFmipp1vCjdzB12KyXsvSMce7LmdLsE7cv5D+Y
 1QyjwmHke8QBtDWrGbi+yudzFr3ftB88PVEqRKqj8fh55VOiBPbxJbqhfFbjFqzAiJasKuz3IHy
 M4SvzS5qwJ70HE+qSk+n9SNQUV65WmtctclLvdZB2tA==
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr3131426wrn.86.1591788987303; 
 Wed, 10 Jun 2020 04:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+fpU0gApAo9WdU2/MAJH8DR4JAaeeYujgzZhmzjJ0R2CYxZQQqTFJTYVCM7So04QnKQlLdw==
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr3131407wrn.86.1591788987053; 
 Wed, 10 Jun 2020 04:36:27 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id a16sm7675327wrx.8.2020.06.10.04.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:26 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:36:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 11/14] vhost/test: convert to the buf API
Message-ID: <20200610113515.1497099-12-mst@redhat.com>
References: <20200610113515.1497099-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610113515.1497099-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 7d69778aaa26..12304eb8da15 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -44,9 +44,10 @@ static void handle_vq(struct vhost_test *n)
 {
 	struct vhost_virtqueue *vq = &n->vqs[VHOST_TEST_VQ];
 	unsigned out, in;
-	int head;
+	int ret;
 	size_t len, total_len = 0;
 	void *private;
+	struct vhost_buf buf;
 
 	mutex_lock(&vq->mutex);
 	private = vhost_vq_get_backend(vq);
@@ -58,15 +59,15 @@ static void handle_vq(struct vhost_test *n)
 	vhost_disable_notify(&n->dev, vq);
 
 	for (;;) {
-		head = vhost_get_vq_desc(vq, vq->iov,
-					 ARRAY_SIZE(vq->iov),
-					 &out, &in,
-					 NULL, NULL);
+		ret = vhost_get_avail_buf(vq, &buf, vq->iov,
+					  ARRAY_SIZE(vq->iov),
+					  &out, &in,
+					  NULL, NULL);
 		/* On error, stop handling until the next kick. */
-		if (unlikely(head < 0))
+		if (unlikely(ret < 0))
 			break;
 		/* Nothing new?  Wait for eventfd to tell us they refilled. */
-		if (head == vq->num) {
+		if (!ret) {
 			if (unlikely(vhost_enable_notify(&n->dev, vq))) {
 				vhost_disable_notify(&n->dev, vq);
 				continue;
@@ -78,13 +79,14 @@ static void handle_vq(struct vhost_test *n)
 			       "out %d, int %d\n", out, in);
 			break;
 		}
-		len = iov_length(vq->iov, out);
+		len = buf.out_len;
 		/* Sanity check */
 		if (!len) {
 			vq_err(vq, "Unexpected 0 len for TX\n");
 			break;
 		}
-		vhost_add_used_and_signal(&n->dev, vq, head, 0);
+		vhost_put_used_buf(vq, &buf);
+		vhost_signal(&n->dev, vq);
 		total_len += len;
 		if (unlikely(vhost_exceeds_weight(vq, 0, total_len)))
 			break;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
