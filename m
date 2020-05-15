Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1C1D54CF
	for <lists.virtualization@lfdr.de>; Fri, 15 May 2020 17:34:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 31B5B204E4;
	Fri, 15 May 2020 15:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgQyoFfmxZn7; Fri, 15 May 2020 15:34:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4D4212E61D;
	Fri, 15 May 2020 15:34:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2446AC016F;
	Fri, 15 May 2020 15:34:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85FE9C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6BFFB8869D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvNUdCW9Idip
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:33:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F54D885D4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589556835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=0q1Y8ePvKhM4R3+rVYPWm7Pu+FP0VGkrqM/os2Y0oAI=;
 b=a1eDNabfdJ/mv/Wkdl9a8WVvXIvQ2iR9P+ZHXEFFxw/gD7Utw4ma+5HHtBD8kyF7JYxg4y
 urdKdsMBpLavQHdav0U/M3GmwBIr5XibOEGmDsW0WhTG2ZXy5r8bA9uGw7bMDPHzSh02ro
 6CkkwG4R++jABGnc/opUj0oxRdvFVjU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-ruqGMuPIOiadyDkN6mzVCg-1; Fri, 15 May 2020 11:33:54 -0400
X-MC-Unique: ruqGMuPIOiadyDkN6mzVCg-1
Received: by mail-wr1-f69.google.com with SMTP id e14so1356330wrv.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 08:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0q1Y8ePvKhM4R3+rVYPWm7Pu+FP0VGkrqM/os2Y0oAI=;
 b=Lq+5vdX/Z8sL1yZys/ZKO44xGQ6jaC6QzroocSnoWaVdr3I7OGSl0E/CkDhdw6WW7B
 vMOw3MObuLM42gPkG5/5dVIBnQKB7FSmAsXQLez6C/u2lhthhRC2w9yDw3quSXc4vZe7
 kjhE2gskmy0wJXwoZdvQ2oq2geEXitVjwKAwy34vTWE98kYRXDHp+H+9I4aC50d/gnho
 QYDbVlJgh2qMZrxOduhN+P84GFuMOT+rBHm+KnkXDqkm/r9DjK22sDEK+CdaTqjMDrKO
 xEwC3L7t1AFC0cRtBNVf+VmUZgquLJ6ppjH1ZYdtUyDR3fU58ScByy5LODCr7QMsxAtc
 IJ3Q==
X-Gm-Message-State: AOAM5317hliPu7+MR641c9KjGSsenVYYTiJAVDhS1trc9fmct+WZEH+u
 9/RAUxGvAVIIHZHt5hlHbzsNcRQEFKkp62+cIQWzbJ8v+jZ/aTBNG34FydAO5Xy/dCytC4gyIl9
 r0cyrfA8iUyS2fWySBbkcv/wvW6fLqegc5fQvlHKamA==
X-Received: by 2002:a1c:2087:: with SMTP id g129mr4503996wmg.126.1589556832765; 
 Fri, 15 May 2020 08:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz/KlciQFx1rHU1J+UL9igbunQtTe0UZESWhBj7gKnvBR65GITM/RzOMxXTQwccrKqsnawtA==
X-Received: by 2002:a1c:2087:: with SMTP id g129mr4503978wmg.126.1589556832581; 
 Fri, 15 May 2020 08:33:52 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id c16sm4048373wrv.62.2020.05.15.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 08:33:51 -0700 (PDT)
Date: Fri, 15 May 2020 11:33:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: missing __user tags
Message-ID: <20200515153347.1092235-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kbuild test robot <lkp@intel.com>,
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

sparse warns about converting void * to void __user *. This is not new
but only got noticed now that vhost is built on more systems.
This is just a question of __user tags missing in a couple of places,
so fix it up.

Fixes: f88949138058 ("vhost: introduce O(1) vq metadata cache")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d450e16c5c25..21a59b598ed8 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -730,7 +730,7 @@ static inline void __user *vhost_vq_meta_fetch(struct vhost_virtqueue *vq,
 	if (!map)
 		return NULL;
 
-	return (void *)(uintptr_t)(map->addr + addr - map->start);
+	return (void __user *)(uintptr_t)(map->addr + addr - map->start);
 }
 
 /* Can we switch to this memory table? */
@@ -869,7 +869,7 @@ static void __user *__vhost_get_user_slow(struct vhost_virtqueue *vq,
  * not happen in this case.
  */
 static inline void __user *__vhost_get_user(struct vhost_virtqueue *vq,
-					    void *addr, unsigned int size,
+					    void __user *addr, unsigned int size,
 					    int type)
 {
 	void __user *uaddr = vhost_vq_meta_fetch(vq,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
