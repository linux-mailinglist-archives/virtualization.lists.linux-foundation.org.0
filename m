Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8101EBC66
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08AC587668;
	Tue,  2 Jun 2020 13:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hw4PIhxU8xA2; Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B822876B4;
	Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED0F1C016E;
	Tue,  2 Jun 2020 13:06:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1133CC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F3E6A85C19
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-Wms2K_Iwke
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7673C85E9B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0y1VAVnqSFAPeWWtS5RcheCrLnqiQBKbwiujoWwz9Qo=;
 b=HHqX5UVkP+KdIlkTkq+pYxu8MSp7bcm094wcRVwhPiZTtP0F4Ngy/NcR9eRCTALek1cHGw
 sJ2l2rpcVyu/MbE5CWbZ2/8xKJ2M4Yg0ADBtBpNftOThyfpdYZkQ4yiZbv1oagZEJRwwe1
 cJHVE1Kx7pwno8sHkcUlnbFm8XhjFxA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-eMws4PhdPk-N0P7RfOC3aQ-1; Tue, 02 Jun 2020 09:06:18 -0400
X-MC-Unique: eMws4PhdPk-N0P7RfOC3aQ-1
Received: by mail-wr1-f69.google.com with SMTP id z10so1391673wrs.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0y1VAVnqSFAPeWWtS5RcheCrLnqiQBKbwiujoWwz9Qo=;
 b=J33drHWuHw9Fwe3Kx2SVkLF6rBGDZZhKlRVAVA2TNP4scpJ0v5ydX6SyCFDb/aTK2i
 2jCXuAsTdWtw28qAscejjT3lTNZQUkrsZy9VvO2/F9ZDY8/ZzI20ps0i/JqoHqMz5QHM
 /joayCSIE8zTVRB/6h1KTh6uhXJKpKJacT61a1ScCMvFjytjPi7XaVzcql53Ri5hVXHV
 9yFpsj6wucm0g+pUGK+IkGsA5iTEU+7RJCb1/reGWQFdGsoOpagkIQgSAxsaiNKRbW1V
 FQ5AkHCQJ5NRj54D7pYqpn0KXEzIOvPAPfKW4X4KbaIkQ3BrvyXcqvZo1JbDE0P1c6XJ
 L3zw==
X-Gm-Message-State: AOAM533oPdoft/xdbgvKRaKc36gHHP0A/QImq4B4Xb1olGvoLexm0J0E
 crObglUMHvp73kC7PsH6PxEJRhO80VnBOFVaRT3yjgNFWn0S3mJpyezAwioC9vmIe5tLB1V88yo
 Dbv7rplK1i042N/CsvchpxXDlvc4zetI0hw2ELuG9RA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr4037605wma.101.1591103177425; 
 Tue, 02 Jun 2020 06:06:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIsLUicCN2EL2xmA9MPBvEHkJ+pLyVHS9KUoRtpMVFDzcdIynBCr8beMEJGbnVq7BNGALRIw==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr4037575wma.101.1591103177147; 
 Tue, 02 Jun 2020 06:06:17 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 s8sm3988621wrm.96.2020.06.02.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:16 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 09/13] vhost/net: avoid iov length math
Message-ID: <20200602130543.578420-10-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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
index 47af3d1ce3dd..36843058182b 100644
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
