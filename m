Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90A23AE8B
	for <lists.virtualization@lfdr.de>; Mon,  3 Aug 2020 22:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B93C87774;
	Mon,  3 Aug 2020 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrdRWy66MK2q; Mon,  3 Aug 2020 20:58:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA4B287917;
	Mon,  3 Aug 2020 20:58:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 998FFC004C;
	Mon,  3 Aug 2020 20:58:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF67DC004C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBD828776C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZ63JqtxGUTA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 828D287766
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596488324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Gl2dylMgFGi0Gx2NZhfogviRtCkoLcQlgV/aPlSIlQ=;
 b=XempRGuLUhWUfHD0b5CVaO0O3iGWlOxalYeRakJmwOD1VOO9HDWB6RVkENRXJQXMbZjThz
 UagFoOrDkOOZ3/bQGQrl3fDk1drkLadfyrVAXSFsLCO7u3U00MIwXrVuFn0UUrRroS0+0q
 rtih3PawaCI+h7vqSp1h31sCk8qaeW4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-m1053RBrP46cgne2yc-7-A-1; Mon, 03 Aug 2020 16:58:43 -0400
X-MC-Unique: m1053RBrP46cgne2yc-7-A-1
Received: by mail-qt1-f199.google.com with SMTP id d2so24283892qtn.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Aug 2020 13:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Gl2dylMgFGi0Gx2NZhfogviRtCkoLcQlgV/aPlSIlQ=;
 b=Rzd0/oI5xZLkPpbtaFhv7UGJP++VIWz2ZgcxoW/wcPQouiTg63Um3oyCqeRsdatW32
 H3T7Y+zTZ9F+UjMxqsGUuVxy9ZrBOjoSe+nHmuzCLzHp202EeeWJ/gq6naKuqg3DU1Cs
 L+FD+PdJMkjy290RxPJ4vo2YOKyY24a118dNvhXtWPUJcTWY5+wjb18bvsNA6L1DbxN2
 rU+gERJWO8bV1+D4K0TPijsDP0DlUjY6rGBN+8qtIaluFpFG8ucB9vQquGnHZiStSWQW
 WE0XH+baPPA4zjoIoYTc2ER0N7tmfsqyZVA4zQAeejJHQNzmEckDNZPSSiIZQlZrh4HT
 Pouw==
X-Gm-Message-State: AOAM5305K+udPZhy6mH4OubAYMzXHFOodG9fDKVQFbXtMJPsPq24FhV0
 Xre+AVHifb4b1gUDp4O1yOnRqxLeX4Rqf0Pk4L+9FAwc9a2GSb3K1I9pYrT4ktINoJX20fsPSpC
 Vv+p8lkun7mMbRH9JIobMN+EUr6gmPvxbGE7nb9rHrg==
X-Received: by 2002:a05:620a:151:: with SMTP id
 e17mr18106848qkn.173.1596488321810; 
 Mon, 03 Aug 2020 13:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEzdxjjAwaWwjwF+kSAMNrLrHcU+XPWDiBIGO+tn5kBn2karRqLrbCrl8SKBeGaGBSURQVuw==
X-Received: by 2002:a05:620a:151:: with SMTP id
 e17mr18106835qkn.173.1596488321605; 
 Mon, 03 Aug 2020 13:58:41 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id x3sm20452087qkx.3.2020.08.03.13.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:58:41 -0700 (PDT)
Date: Mon, 3 Aug 2020 16:58:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/24] virtio_balloon: fix sparse warning
Message-ID: <20200803205814.540410-2-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

balloon uses virtio32_to_cpu instead of cpu_to_virtio32
to convert a native endian number to virtio.
No practical difference but makes sparse warn.
Fix it up.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 54fd989f9353..8bc1704ffdf3 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -600,7 +600,7 @@ static int send_cmd_id_start(struct virtio_balloon *vb)
 	while (virtqueue_get_buf(vq, &unused))
 		;
 
-	vb->cmd_id_active = virtio32_to_cpu(vb->vdev,
+	vb->cmd_id_active = cpu_to_virtio32(vb->vdev,
 					virtio_balloon_cmd_id_received(vb));
 	sg_init_one(&sg, &vb->cmd_id_active, sizeof(vb->cmd_id_active));
 	err = virtqueue_add_outbuf(vq, &sg, 1, &vb->cmd_id_active, GFP_KERNEL);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
