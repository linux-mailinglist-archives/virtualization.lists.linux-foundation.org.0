Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7FA19FFD0
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3364E86566;
	Mon,  6 Apr 2020 21:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b347WssW5ylb; Mon,  6 Apr 2020 21:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13086867FF;
	Mon,  6 Apr 2020 21:02:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EED32C0177;
	Mon,  6 Apr 2020 21:02:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B74EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1561D865D3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75qvBIw9zcrW
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D612186704
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gsX4/uiATHelCKsBMIlXghxuNFH80tbOl5hoEmAyk0c=;
 b=hCIfWZvrcyVpwlWDhQKbJHrGZSTH4H3TrSbeQ5jUEAcsRzuuIwJi+J5EGI26gtpTF6VJ3w
 aCw+lbgYsudwhgdYM1k3n00p9rc5UcVkscLQX3DXcKkHYsH9OIBaiB4LW2xFwsO1lGsEsG
 bNrndaZKCSIua0izhv/sIQBqj2ijKAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-0lOhoV8nNp-dnNmIg5CWGg-1; Mon, 06 Apr 2020 17:02:13 -0400
X-MC-Unique: 0lOhoV8nNp-dnNmIg5CWGg-1
Received: by mail-wr1-f69.google.com with SMTP id o10so529568wrj.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gsX4/uiATHelCKsBMIlXghxuNFH80tbOl5hoEmAyk0c=;
 b=JSwUuhthn40qhswixsfq+wZgPrFF9v7MDhmOMaMX48AehYOHGGXNWWZmIeBSOv0TIk
 wDpI/uZ4qy1yvXH3iTK6V0FKNCSjv1XNPbzjGMKeDYQhw2juQoMyE6+e6M4SdLBikakn
 YKDnldpK28mjRZLowbU53aAKBzl8scIJBgotOGhcwViPommQmr6PFhSDWVV/pzbHXcn2
 nRxORRVu2asYMg6OUMeOPe09sriMic5/KNPDvTxnpcmUvcRZttPPU+2jOYYt04l/qJT0
 vviDw1yNe7BUK+PCoj5bG+8ku9wc3M7IGh5Yu638DIknX+4yDp7xk4PCJFmVJ4Gq5GJM
 k5UA==
X-Gm-Message-State: AGi0PubkxnFSrlsPHEb707CpKAKaGbjMljyMETM5Hh6YykeCoYeKrN2F
 e/CvmcJz3nf0HhAQsp2j+Yjt/EbsyjyhglGATN+2fQRvPEI/DoWJQ9JRW9dpISqGZjKNIv38pWM
 aTSbkUUPJ1zIyOQWnpLYcQm/bCmFsvw0efcx1woxzmw==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr941732wmg.50.1586206932421; 
 Mon, 06 Apr 2020 14:02:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrAMtLRrfuVr8wN4gelChhLvSGzSIzaDPjOk1jRzKn+MNgI1yukbYew3NVfW8Wuz2UpCoMfA==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr941716wmg.50.1586206932190; 
 Mon, 06 Apr 2020 14:02:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id x5sm934247wmk.29.2020.04.06.14.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:11 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:02:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/12] tools/virtio: switch to virtio_legacy_init/size
Message-ID: <20200406210108.148131-10-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
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

These are used for legacy ring format, switch to APIs that make this
explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/ringtest/virtio_ring_0_9.c |  6 +++---
 tools/virtio/virtio_test.c              |  6 +++---
 tools/virtio/vringh_test.c              | 18 +++++++++---------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/virtio/ringtest/virtio_ring_0_9.c b/tools/virtio/ringtest/virtio_ring_0_9.c
index 13a035a390e9..e2ab6ac53966 100644
--- a/tools/virtio/ringtest/virtio_ring_0_9.c
+++ b/tools/virtio/ringtest/virtio_ring_0_9.c
@@ -67,13 +67,13 @@ void alloc_ring(void)
 	int i;
 	void *p;
 
-	ret = posix_memalign(&p, 0x1000, vring_size(ring_size, 0x1000));
+	ret = posix_memalign(&p, 0x1000, vring_legacy_size(ring_size, 0x1000));
 	if (ret) {
 		perror("Unable to allocate ring buffer.\n");
 		exit(3);
 	}
-	memset(p, 0, vring_size(ring_size, 0x1000));
-	vring_init(&ring, ring_size, p, 0x1000);
+	memset(p, 0, vring_legacy_size(ring_size, 0x1000));
+	vring_legacy_init(&ring, ring_size, p, 0x1000);
 
 	guest.avail_idx = 0;
 	guest.kicked_avail_idx = -1;
diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
index 93d81cd64ba0..25be607d8711 100644
--- a/tools/virtio/virtio_test.c
+++ b/tools/virtio/virtio_test.c
@@ -102,10 +102,10 @@ static void vq_info_add(struct vdev_info *dev, int num)
 	info->idx = dev->nvqs;
 	info->kick = eventfd(0, EFD_NONBLOCK);
 	info->call = eventfd(0, EFD_NONBLOCK);
-	r = posix_memalign(&info->ring, 4096, vring_size(num, 4096));
+	r = posix_memalign(&info->ring, 4096, vring_legacy_size(num, 4096));
 	assert(r >= 0);
-	memset(info->ring, 0, vring_size(num, 4096));
-	vring_init(&info->vring, num, info->ring, 4096);
+	memset(info->ring, 0, vring_legacy_size(num, 4096));
+	vring_legacy_init(&info->vring, num, info->ring, 4096);
 	info->vq = vring_new_virtqueue(info->idx,
 				       info->vring.num, 4096, &dev->vdev,
 				       true, false, info->ring,
diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 293653463303..8ee2c9a6ad46 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -151,7 +151,7 @@ static int parallel_test(u64 features,
 		err(1, "Opening /tmp/vringh_test-file");
 
 	/* Extra room at the end for some data, and indirects */
-	mapsize = vring_size(RINGSIZE, ALIGN)
+	mapsize = vring_legacy_size(RINGSIZE, ALIGN)
 		+ RINGSIZE * 2 * sizeof(int)
 		+ RINGSIZE * 6 * sizeof(struct vring_desc);
 	mapsize = (mapsize + getpagesize() - 1) & ~(getpagesize() - 1);
@@ -185,7 +185,7 @@ static int parallel_test(u64 features,
 		close(to_guest[0]);
 		close(to_host[1]);
 
-		vring_init(&vrh.vring, RINGSIZE, host_map, ALIGN);
+		vring_legacy_init(&vrh.vring, RINGSIZE, host_map, ALIGN);
 		vringh_init_user(&vrh, features, RINGSIZE, true,
 				 vrh.vring.desc, vrh.vring.avail, vrh.vring.used);
 		CPU_SET(first_cpu, &cpu_set);
@@ -297,7 +297,7 @@ static int parallel_test(u64 features,
 		unsigned int finished = 0;
 
 		/* We pass sg[]s pointing into here, but we need RINGSIZE+1 */
-		data = guest_map + vring_size(RINGSIZE, ALIGN);
+		data = guest_map + vring_legacy_size(RINGSIZE, ALIGN);
 		indirects = (void *)data + (RINGSIZE + 1) * 2 * sizeof(int);
 
 		/* We are the guest. */
@@ -478,7 +478,7 @@ int main(int argc, char *argv[])
 	if (posix_memalign(&__user_addr_min, PAGE_SIZE, USER_MEM) != 0)
 		abort();
 	__user_addr_max = __user_addr_min + USER_MEM;
-	memset(__user_addr_min, 0, vring_size(RINGSIZE, ALIGN));
+	memset(__user_addr_min, 0, vring_legacy_size(RINGSIZE, ALIGN));
 
 	/* Set up guest side. */
 	vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true, false,
@@ -487,7 +487,7 @@ int main(int argc, char *argv[])
 				 "guest vq");
 
 	/* Set up host side. */
-	vring_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
+	vring_legacy_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
 	vringh_init_user(&vrh, vdev.features, RINGSIZE, true,
 			 vrh.vring.desc, vrh.vring.avail, vrh.vring.used);
 
@@ -506,7 +506,7 @@ int main(int argc, char *argv[])
 	sgs[1] = &guest_sg[1];
 
 	/* May allocate an indirect, so force it to allocate user addr */
-	__kmalloc_fake = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kmalloc_fake = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	err = virtqueue_add_sgs(vq, sgs, 1, 1, &err, GFP_KERNEL);
 	if (err)
 		errx(1, "virtqueue_add_sgs: %i", err);
@@ -556,7 +556,7 @@ int main(int argc, char *argv[])
 		errx(1, "vringh_complete_user: %i", err);
 
 	/* Guest should see used token now. */
-	__kfree_ignore_start = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kfree_ignore_start = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	__kfree_ignore_end = __kfree_ignore_start + 1;
 	ret = virtqueue_get_buf(vq, &i);
 	if (ret != &err)
@@ -575,7 +575,7 @@ int main(int argc, char *argv[])
 		((char *)__user_addr_max - USER_MEM/4)[i] = i;
 
 	/* This will allocate an indirect, so force it to allocate user addr */
-	__kmalloc_fake = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kmalloc_fake = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	err = virtqueue_add_outbuf(vq, guest_sg, RINGSIZE, &err, GFP_KERNEL);
 	if (err)
 		errx(1, "virtqueue_add_outbuf (large): %i", err);
@@ -680,7 +680,7 @@ int main(int argc, char *argv[])
 		if (err)
 			errx(1, "virtqueue_add_outbuf (indirect): %i", err);
 
-		vring_init(&vring, RINGSIZE, __user_addr_min, ALIGN);
+		vring_legacy_init(&vring, RINGSIZE, __user_addr_min, ALIGN);
 
 		/* They're used in order, but double-check... */
 		assert(vring.desc[0].addr == (unsigned long)d);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
