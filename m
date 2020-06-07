Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011C1F0BB5
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C596786A1E;
	Sun,  7 Jun 2020 14:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olGiRXBkqXIO; Sun,  7 Jun 2020 14:11:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00FD786A02;
	Sun,  7 Jun 2020 14:11:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD316C016F;
	Sun,  7 Jun 2020 14:11:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AABE6C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8FC7B203ED
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iq4fzGdbW8+P
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id AD3FF20336
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=Y18W4etLZxOVWK+oWzASjub4NeNEz8mfo8eA7e9mry5dbniwuL1UPdX3jyRaanvuvSajHy
 HtvYQXjRjXH6GA5h1iRyA6tjsWbIFmxmB5jlpERngWyA/cRHn/idwq/pVG3Odm8PXig3XO
 35KktU+HVeAv2BTUnBKCEJAv2jf19Do=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-FkXnGPBsMDCmtK5SoqkRKA-1; Sun, 07 Jun 2020 10:11:45 -0400
X-MC-Unique: FkXnGPBsMDCmtK5SoqkRKA-1
Received: by mail-wr1-f69.google.com with SMTP id f4so6051633wrp.21
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yeTF/4xoJH8JkJEZ+aqTMVrfSsZomUNfl5tfcaaPRM=;
 b=chLbB8j2E0qJSBmw0Nji9KmmCS1x8qeBJP9eWg2QymbAufejnFSCoBk/1Q4W7xWgCx
 xsIEAGZoIKoUAE/sR+OtNFBLOs25j6fNd8Mjc5uKC89JGN2M5LSZjK/D5TM6GEHiY4MK
 Jdd3zWuJUd9U+vLc45Zckj4jK1qtDKhAj19Tomkd3kf+pAXiHCmn3qk9qdGNO7Xeyk33
 kmXcBXuoVEDWJ0CXFr7AOIdT+6kB9dlJnlJLXbDWh0xKqTHMvq3pBdGt4y8P0+Xm1oBx
 hOna80UDco7VGfIY693V8v5eNbT4ygj8vIWyOiBcHJKu8WS/EKdKcOjAOndvPmNgPBYW
 OCyg==
X-Gm-Message-State: AOAM533UGtsa164bs7rr7cdE5wM9R3Mcm3oJ1x2lKYicFF+uQ0/OuI3x
 sJHMyeQ+1jzIsiDkSRJkkoliF5P4NGorYDYujVNbNzFWDCbs8sRFcvefiImj4Quk9mLxteg02XV
 gKXXEa1vY3qvN9kUUOogqhJu8CxGOdoshv146OsUwaw==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr12417399wmi.165.1591539104515; 
 Sun, 07 Jun 2020 07:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw57J09cTKbeRmJVX90+N+R46OyNEvndsO7VwU1Ip6tS22b7zKgKAjdQddCV5K1/YT0vuS/Pg==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr12417393wmi.165.1591539104370; 
 Sun, 07 Jun 2020 07:11:44 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id h5sm20290400wrw.85.2020.06.07.07.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:44 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 09/13] vhost/net: avoid iov length math
Message-ID: <20200607141057.704085-10-mst@redhat.com>
References: <20200607141057.704085-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-1-mst@redhat.com>
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
