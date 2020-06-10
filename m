Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD571F536C
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8FA388093;
	Wed, 10 Jun 2020 11:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxE5p8FlK70C; Wed, 10 Jun 2020 11:36:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAA2C8810E;
	Wed, 10 Jun 2020 11:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD87AC088C;
	Wed, 10 Jun 2020 11:36:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C94C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D274C87FED
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ix30O9KKp7Q
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 317D588093
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=OEzjN2FxH15PLi8yuz9UCOtxvN4Eu5l/ARH2uho30fxJbiO88TF4FGObcAmvLvkGsJV4VT
 ZDLpNp3igpDgY1BuXvMVjVYk6SPpauigr1TSFfeJAkNV+QUnBYQSfjjF/pI90fAzyhP8SB
 LAphuv+k0oaCbpfkRHtrdtRcRkzPDpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-rzOJeFMcO0O9suGBEZbXCQ-1; Wed, 10 Jun 2020 07:36:25 -0400
X-MC-Unique: rzOJeFMcO0O9suGBEZbXCQ-1
Received: by mail-wm1-f72.google.com with SMTP id a18so335009wmm.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=H63QZOt0JVAJ86BlNT5iEogXQPCh5z4yNLueAzl73Id1OT9Qr9BoEQRXFmfN+CQBsf
 Y9ZhtONFj1Ha/CPOlxi6cH0I9ANYlUUZcPE3sO0qBDqDZMWDnZv98Gi0ibrkz/OJ5Nei
 uIE8SKn4InHhFM31J8OQiHCDQeklR4ACVlBnZZHWd4lag2H1ZMNCjvMT7leBu1QTgRsF
 cjdNW1z6diATAcO4atnq+TwsXxopnVnzt50Q8mmQ/dhbtT2l3bNFgww0adGBKtgwlmXL
 ZK5V90extOvrD1trcDZDFVTIbxw4ZBCcJKde2zZqbobZboAqlKgfIdFU8nE/sFXFu2BD
 N8lA==
X-Gm-Message-State: AOAM5317WrsjTeEU3jBiQd6hjknv0UkOR6mqDKK0Tm+/nwnyJCPr/tfD
 xjhcfjiadCrCZSY/GZIwcAe0He02QxcZdL6WPSw5tvn8GFWr0j0oz5zI3p6ssGNA6tlzNrEBxZ8
 oJvqZKe1XfqHRghWIcP/cONtvHU1yyOjT3xhBY219dQ==
X-Received: by 2002:adf:f611:: with SMTP id t17mr3115448wrp.69.1591788984597; 
 Wed, 10 Jun 2020 04:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySUb6SmdRetYLS6/lDFnA63vhXBdDD3cCFK65tVJXhEwb5+hLdb3cRehsL9GzZU3pDEV7NVg==
X-Received: by 2002:adf:f611:: with SMTP id t17mr3115431wrp.69.1591788984381; 
 Wed, 10 Jun 2020 04:36:24 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id x8sm7694296wrs.43.2020.06.10.04.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:23 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:36:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 10/14] vhost/net: avoid iov length math
Message-ID: <20200610113515.1497099-11-mst@redhat.com>
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
