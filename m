Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2B19F9DE
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 18:12:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC512835DF;
	Mon,  6 Apr 2020 16:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaGBBE2OYqEa; Mon,  6 Apr 2020 16:12:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0A2884995;
	Mon,  6 Apr 2020 16:12:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D39FC0177;
	Mon,  6 Apr 2020 16:12:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F13EAC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA2C320027
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ir8vFankO0Ho
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 831191FEAB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586189525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbiY/JR8MT9j2mMaSuLVO6IuA/fdNeex6zTykRrl0fw=;
 b=UADOw6bCgz9awwPLBFZt78PKSECXCNASPpcO35kKTe08i3H18I/6X7ab/kyNf3Daviei8p
 O8w2PQA+HosOFU3ntlKDC91qYss0wP11pYyFW/Pgxjku7gbAAszlgIiVNsffQHhfi90mQT
 EdGCzEQl8Ha9hFDPmnEtkLnWet2lFvM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-_D5DccmkNoCQgAtegNbbNQ-1; Mon, 06 Apr 2020 12:12:03 -0400
X-MC-Unique: _D5DccmkNoCQgAtegNbbNQ-1
Received: by mail-wm1-f72.google.com with SMTP id s15so4452wmc.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XbiY/JR8MT9j2mMaSuLVO6IuA/fdNeex6zTykRrl0fw=;
 b=I/ficS8vIXOsTX61kQEbdIiASxve7aQKbULvcokEUKcw0T8R+o7N3D57TpKAmhEJu4
 cH6Bm9Dx7t0f10ctVmmLSFW7KRQ72I38A/IShFlEqodPTMVyBXEfPUaStISIKa3a+9Ys
 2G9NQbeG+0QotxIUm5KaIUl9bTAjqfuLavjrIe7AA5sSDeLD2P3sLcd6EE3PKXUqhrUO
 Eo1p6BQs16rRic6fL31RFVA4YPpsXN2Uh515LvrXxB8KChLVt3u8Qluv6kmwO87BhPkA
 1nBUiGlCXVQVRzJSlrFUQplaNBR1id+ATAV9W8dofM9iFUnkuT5AK5IYpasDebhhsF7a
 9j0w==
X-Gm-Message-State: AGi0PuY0jTqxzhAVPeseT64j004bZBIwINCP/Cw+IZa+HBxxL7kDJoiD
 N3DGIo66xDtk7+b8UApeUmrEHRXveBojTV5nekvk2D1bPrxH56InzQ1614FhO0zEUgkrx4COZyC
 iTfPNgLQ0ERweXeYBcfR+Ms6JwpJuNMsS4f67/XmnQA==
X-Received: by 2002:a05:6000:10c8:: with SMTP id
 b8mr23428079wrx.138.1586189520713; 
 Mon, 06 Apr 2020 09:12:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypK9E/zVoOtvHRhDKnJGgRYxI6xx0dA9XqHF79iYP2scWVdmchi1G81n7Ps6TU4rYWbySFSjWQ==
X-Received: by 2002:a05:6000:10c8:: with SMTP id
 b8mr23428046wrx.138.1586189520342; 
 Mon, 06 Apr 2020 09:12:00 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id 91sm21618242wrf.79.2020.04.06.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 09:11:59 -0700 (PDT)
Date: Mon, 6 Apr 2020 12:11:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] virtio: stop using legacy struct vring in kernel
Message-ID: <20200406161146.130741-2-mst@redhat.com>
References: <20200406161146.130741-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406161146.130741-1-mst@redhat.com>
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

struct vring (in the uapi directory) and supporting APIs are kept
around to solely avoid breaking old userspace builds.
It's not actually part of the UAPI - it was kept in the UAPI
header by mistake, and using it in kernel isn't necessary
and prevents us from making changes safely.
In particular, the APIs actually assume the legacy layout.

Add an internal kernel-only struct vring, add supporting legacy APIs and
switch everyone to use that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_ring.h             | 28 +++++++++++++++++++++++++
 include/uapi/linux/virtio_ring.h        | 26 ++++++++++++++---------
 tools/virtio/ringtest/virtio_ring_0_9.c |  6 +++---
 tools/virtio/vringh_test.c              | 20 +++++++++---------
 4 files changed, 57 insertions(+), 23 deletions(-)

diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 3dc70adfe5f5..b6a31b3cf87c 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -112,4 +112,32 @@ void vring_del_virtqueue(struct virtqueue *vq);
 void vring_transport_features(struct virtio_device *vdev);
 
 irqreturn_t vring_interrupt(int irq, void *_vq);
+
+struct vring {
+	unsigned int num;
+
+	struct vring_desc *desc;
+
+	struct vring_avail *avail;
+
+	struct vring_used *used;
+};
+
+static inline void vring_legacy_init(struct vring *vr, unsigned int num, void *p,
+				     unsigned long align)
+{
+	vr->num = num;
+	vr->desc = p;
+	vr->avail = (struct vring_avail *)((char *)p + num * sizeof(struct vring_desc));
+	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
+		+ align-1) & ~(align - 1));
+}
+
+static inline unsigned vring_legacy_size(unsigned int num, unsigned long align)
+{
+	return ((sizeof(struct vring_desc) * num + sizeof(__virtio16) * (3 + num)
+		 + align - 1) & ~(align - 1))
+		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
+}
+
 #endif /* _LINUX_VIRTIO_RING_H */
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 559f42e73315..59939ba30b06 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -118,16 +118,6 @@ struct vring_used {
 	struct vring_used_elem ring[];
 };
 
-struct vring {
-	unsigned int num;
-
-	struct vring_desc *desc;
-
-	struct vring_avail *avail;
-
-	struct vring_used *used;
-};
-
 /* Alignment requirements for vring elements.
  * When using pre-virtio 1.0 layout, these fall out naturally.
  */
@@ -164,6 +154,21 @@ struct vring {
 #define vring_used_event(vr) ((vr)->avail->ring[(vr)->num])
 #define vring_avail_event(vr) (*(__virtio16 *)&(vr)->used->ring[(vr)->num])
 
+#ifndef __KERNEL__
+/*
+ * The following definitions have been put in the UAPI header by mistake. We
+ * keep them around to avoid breaking old userspace builds.
+ */
+struct vring {
+	unsigned int num;
+
+	struct vring_desc *desc;
+
+	struct vring_avail *avail;
+
+	struct vring_used *used;
+};
+
 static inline void vring_init(struct vring *vr, unsigned int num, void *p,
 			      unsigned long align)
 {
@@ -180,6 +185,7 @@ static inline unsigned vring_size(unsigned int num, unsigned long align)
 		 + align - 1) & ~(align - 1))
 		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
 }
+#endif
 
 /* The following is used with USED_EVENT_IDX and AVAIL_EVENT_IDX */
 /* Assuming a given event_idx value from the other side, if
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
diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 293653463303..d26dc6530bd4 100644
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
@@ -660,7 +660,7 @@ int main(int argc, char *argv[])
 	if (__virtio_test_bit(&vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		char *data = __user_addr_max - USER_MEM/4;
 		struct vring_desc *d = __user_addr_max - USER_MEM/2;
-		struct vring vring;
+		struct vring_s vring;
 
 		/* Force creation of direct, which we modify. */
 		__virtio_clear_bit(&vdev, VIRTIO_RING_F_INDIRECT_DESC);
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
