Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B0E1F192F
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:53:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBEC088127;
	Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJspBeEcRVNj; Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B3EC880CC;
	Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E9AFC0894;
	Mon,  8 Jun 2020 12:53:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB411C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BAF0C8607D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzVRXwI83q8d
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5E7E886084
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=XtDNveGuZPiBncvOQ1RUrUT3Bc9YXnjnBDkm/7WhzEVOnTUpV8cw+L64ZFvRs23YgYvvXQ
 40j99TiyGu9fgMl7OesPSP8StQcwGGYNG5v3vUXHvc/TQhc5W9Qzi7A5YUpZeMX12obfaD
 3NtUcRgkCHZfEyStvevob4LnIgvDX1g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-boSrioRzPOqmx41Zhaxp4w-1; Mon, 08 Jun 2020 08:53:09 -0400
X-MC-Unique: boSrioRzPOqmx41Zhaxp4w-1
Received: by mail-wr1-f69.google.com with SMTP id s17so7079520wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=MePV2Ctd7eWN6xogeGYTAvul04xEsTozDLyfs5YXIzuBkxIOal3+PkJfwCPhgAaVsY
 Axv2yL8anRjJkhSS2iIWGUAtlAz8oAF38q0XA3PmSTIWUfRnQiB/vi5vYVmJt8C2cHkm
 b3g0k2w3Fkq8XeQ2hElPCYFw3EFOAVbkMQcgtCL3czcePAFqt+ufhi75RWnbkZ1sZG3Y
 +o0hrXk8amZjzrOJLHzMuey3OBaCzdTd1hzW0tTVEN4ehd7zu8idMfCJicaIorSJQEmM
 jj+U/cxUkBcc8Zkc6A/3UeAxkdQjhVzBGF8+5nMlOv3hfr3Z+J7W4p5Tiu1HJXxjuDZa
 cSoQ==
X-Gm-Message-State: AOAM532D1g1awvKC3lp36Vz/qvszcHeJpToBUMmNwn6rGy+3atgwm0tO
 8HzOlyhn9WRc+hOh0uHPevG18Qjxk2MT6wIunucHtwt/RHT/+OdsHKLq0v97KdpBscLiQp1hVef
 sVx4wl9mMYjOagXX9oLv2NM1u83XtDqJ1Z3lBZfS0+A==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23127119wrv.112.1591620788703; 
 Mon, 08 Jun 2020 05:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy11gQF/NmEmSn0DK4pnAXz2ogVtvYom9rwdJUwvE7o5lVdYxjyVZYvm9PoiqoHGw3Jn2dmGA==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23127106wrv.112.1591620788527; 
 Mon, 08 Jun 2020 05:53:08 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 z16sm23295568wrm.70.2020.06.08.05.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:53:08 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:53:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 07/11] vhost/net: avoid iov length math
Message-ID: <20200608125238.728563-8-mst@redhat.com>
References: <20200608125238.728563-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608125238.728563-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
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
