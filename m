Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E340F1F66C3
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:34:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E162895FC;
	Thu, 11 Jun 2020 11:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mgsj0qQ5QTSn; Thu, 11 Jun 2020 11:34:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2037B8960C;
	Thu, 11 Jun 2020 11:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECD41C0865;
	Thu, 11 Jun 2020 11:34:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3689C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6AB99879C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoJ-kLYID4qe
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A78A8879C2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=GdF1UaXpd2XFc7NACGwxjeT3PZg6r6tCu+MG/rvcZOEEhb4Dkec9p0s7HicXcuYC/WZu2V
 IkM5EtJdm9di5Q7zBEfa8ot5UW1TKFL1w7Ixau1SXt37phwB8gucmDFUKjyatcWz0kfsfZ
 sMkzI7uWAA2HJl+ydzoyPrW1q2mT3XA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-IJHyrnHoM1WiEMvexw3sYw-1; Thu, 11 Jun 2020 07:34:35 -0400
X-MC-Unique: IJHyrnHoM1WiEMvexw3sYw-1
Received: by mail-wr1-f70.google.com with SMTP id j16so2424462wre.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=MYFNKeE7SJKcCIil+u7sHkYOLmMzdYIEb3UITcmiuVqjal+Ajv1PD8qf2841Yb9iC3
 0QD5bg8f6ep891SAkywMiksg9DCStD0pE9eCfNeW4XQrge4m8GSAZX1gOsvuyNGuNF84
 RLvNHPPPzC8iuH0WTKYaOMH24H75fNmIYzZuwS1gN6yXlj8E9apSH/6A2uV2d02xDYk/
 108fhrlRASLw6H1EM+nQGFW6ZDp7qR2Ucn4+ZrK8XLaMbusbwmoLoMGN5c7soLEXHoJB
 TMqEIlM2P68Q+fOMfoyBwiwbAao0oNXY5Sr8XfW+Sx3XaquSlYRwxHE41FRHToLoBPcM
 Khdw==
X-Gm-Message-State: AOAM530+4XpUvWhIUjSV+VWE8YE5l0KbF68AKoMl4gu8/6OWlPfqBzBn
 lYVqvK4q88l4kBpVG0XFqKSCAuhvBCKyaX+bPfifeaFjkRzdLx7E+sI/axK3NkFII09jxIaRjnU
 inzP7JpUDxInrxWCU5wNwop+eefKj2UtudwLZAYZkKQ==
X-Received: by 2002:adf:e381:: with SMTP id e1mr8683441wrm.320.1591875274094; 
 Thu, 11 Jun 2020 04:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP1H7ZA1p3aDr58BVHo1lTwD6nnLZ5xDw5t6ge7P3fJgEClZF0S1h1hQVZzkshTgxNN4ZDtw==
X-Received: by 2002:adf:e381:: with SMTP id e1mr8683426wrm.320.1591875273921; 
 Thu, 11 Jun 2020 04:34:33 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id o6sm3634582wmc.39.2020.06.11.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:34:32 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:34:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v8 07/11] vhost/net: avoid iov length math
Message-ID: <20200611113404.17810-8-mst@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200611113404.17810-1-mst@redhat.com>
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

Now that API exposes buffer length, we no longer need to
scan IOVs to figure it out.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 830fe84912a5..0b509be8d7b1 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -607,11 +607,9 @@ static bool vhost_exceeds_maxpend(struct vhost_net *net)
 }
 
 static size_t init_iov_iter(struct vhost_virtqueue *vq, struct iov_iter *iter,
-			    size_t hdr_size, int out)
+			    size_t len, size_t hdr_size, int out)
 {
 	/* Skip header. TODO: support TSO. */
-	size_t len = iov_length(vq->iov, out);
-
 	iov_iter_init(iter, WRITE, vq->iov, out, len);
 	iov_iter_advance(iter, hdr_size);
 
@@ -640,7 +638,7 @@ static int get_tx_bufs(struct vhost_net *net,
 	}
 
 	/* Sanity check */
-	*len = init_iov_iter(vq, &msg->msg_iter, nvq->vhost_hlen, *out);
+	*len = init_iov_iter(vq, &msg->msg_iter, buf->out_len, nvq->vhost_hlen, *out);
 	if (*len == 0) {
 		vq_err(vq, "Unexpected header len for TX: %zd expected %zd\n",
 			*len, nvq->vhost_hlen);
@@ -1080,7 +1078,7 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 			nlogs += *log_num;
 			log += *log_num;
 		}
-		len = iov_length(vq->iov + seg, in);
+		len = bufs[bufcount].in_len;
 		datalen -= len;
 		++bufcount;
 		seg += in;
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
