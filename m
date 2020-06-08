Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF01F193A
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:53:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E1A6880E0;
	Mon,  8 Jun 2020 12:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxT6Bt8JxXkX; Mon,  8 Jun 2020 12:53:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7220288166;
	Mon,  8 Jun 2020 12:53:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A912C016F;
	Mon,  8 Jun 2020 12:53:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B94E3C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B614D86E89
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTRd5kFIJSdm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9F4F086DDE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53ZvoqSQRb7zo4P/bKE7PS6beB3wyT4RaZMP+gyjZts=;
 b=hOTw0c8TQrYD8fwTe11orABRd59qSwRlBGJaD051xDgrRkr+Kxmp1TSJAIRjNGnbnWiVnM
 A0pXoXeZsWfZRTK55bfUVqJZw0SkLkBen3/HgnQteCCfo02I/PASfwUJBGyg20vv4fI4Lz
 IVTf9AjO1ksNAHseG2LZmucjCoCV4q8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-m47VKC2oNFuAZTd4dCNIRQ-1; Mon, 08 Jun 2020 08:53:18 -0400
X-MC-Unique: m47VKC2oNFuAZTd4dCNIRQ-1
Received: by mail-wr1-f70.google.com with SMTP id s17so7079645wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53ZvoqSQRb7zo4P/bKE7PS6beB3wyT4RaZMP+gyjZts=;
 b=Xig6HA0BWLo6GuTipZAVM1/VsJ+4msYBnKShW1qLg3qnXP6edqZI+b2/SZjh8oal4X
 Wbaa1/1IL+V1Vljv8s87h6+OC8h+6pbfUNwHPZO6neTvwnNP/xEuAkxmjHCnLLgsAenB
 TI6vj5uY4VZLN65iHuJ8uOE9H/0gIEFe1vgIydmeILmckCP3oCCSfE6X8KgYxI9RsTkO
 qtragU1eW71O60aegEEkb9NfeHGB2jCPn++RVxP0wN3YYaLybw2tJyYvmltsd4nlO0Xb
 ih8aSO9maobkr7XSaoifhCHK8Q9bAf2ge9gKugMvJQNPx0DYTogvtlurIf+Xe+6uLPxI
 WhPg==
X-Gm-Message-State: AOAM533Zwc98F+EJBjwp4fbX/RX/6Hm1pJs3+/5TVBh+35MV6onfJ7Wv
 1dFVCm25KJEZed9lyWHUKiPu2qjrzqZWjgAlLze9hmJnQhZ8jO+kI2KJitHAKxE2CDD718PyeSC
 7TGxMf8k5nkTeQ0DgE419t8ezhGjPZ5j8SL2nGrwWhg==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr23319162wru.102.1591620797778; 
 Mon, 08 Jun 2020 05:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqxu8B0D+dmfKRmG6m0k8N+mfH4DtG2okPcTFiiTciSa1DwJ+py71/ReHBdaFke8bA3qVg4w==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr23319147wru.102.1591620797545; 
 Mon, 08 Jun 2020 05:53:17 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 c16sm8782123wml.45.2020.06.08.05.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:53:17 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:53:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 11/11] vhost: drop head based APIs
Message-ID: <20200608125238.728563-12-mst@redhat.com>
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

Everyone's using buf APIs, no need for head based ones anymore.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 43 ++++++++-----------------------------------
 drivers/vhost/vhost.h | 12 ------------
 2 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index f4a6ff9ef77a..7bd4bc581fc9 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2429,18 +2429,11 @@ EXPORT_SYMBOL_GPL(vhost_get_avail_buf);
 void vhost_discard_avail_bufs(struct vhost_virtqueue *vq,
 			      struct vhost_buf *buf, unsigned count)
 {
-	vhost_discard_vq_desc(vq, count);
+	unfetch_descs(vq);
+	vq->last_avail_idx -= count;
 }
 EXPORT_SYMBOL_GPL(vhost_discard_avail_bufs);
 
-/* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
-void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
-{
-	unfetch_descs(vq);
-	vq->last_avail_idx -= n;
-}
-EXPORT_SYMBOL_GPL(vhost_discard_vq_desc);
-
 static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
 			    unsigned count)
@@ -2473,8 +2466,7 @@ static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 	return 0;
 }
 
-/* After we've used one of their buffers, we tell them about it.  We'll then
- * want to notify the guest, using eventfd. */
+static
 int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
 		     unsigned count)
 {
@@ -2508,10 +2500,8 @@ int vhost_add_used_n(struct vhost_virtqueue *vq, struct vring_used_elem *heads,
 	}
 	return r;
 }
-EXPORT_SYMBOL_GPL(vhost_add_used_n);
 
-/* After we've used one of their buffers, we tell them about it.  We'll then
- * want to notify the guest, using eventfd. */
+static
 int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
 {
 	struct vring_used_elem heads = {
@@ -2521,14 +2511,17 @@ int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
 
 	return vhost_add_used_n(vq, &heads, 1);
 }
-EXPORT_SYMBOL_GPL(vhost_add_used);
 
+/* After we've used one of their buffers, we tell them about it.  We'll then
+ * want to notify the guest, using vhost_signal. */
 int vhost_put_used_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf)
 {
 	return vhost_add_used(vq, buf->id, buf->in_len);
 }
 EXPORT_SYMBOL_GPL(vhost_put_used_buf);
 
+/* After we've used one of their buffers, we tell them about it.  We'll then
+ * want to notify the guest, using vhost_signal. */
 int vhost_put_used_n_bufs(struct vhost_virtqueue *vq,
 			  struct vhost_buf *bufs, unsigned count)
 {
@@ -2589,26 +2582,6 @@ void vhost_signal(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 }
 EXPORT_SYMBOL_GPL(vhost_signal);
 
-/* And here's the combo meal deal.  Supersize me! */
-void vhost_add_used_and_signal(struct vhost_dev *dev,
-			       struct vhost_virtqueue *vq,
-			       unsigned int head, int len)
-{
-	vhost_add_used(vq, head, len);
-	vhost_signal(dev, vq);
-}
-EXPORT_SYMBOL_GPL(vhost_add_used_and_signal);
-
-/* multi-buffer version of vhost_add_used_and_signal */
-void vhost_add_used_and_signal_n(struct vhost_dev *dev,
-				 struct vhost_virtqueue *vq,
-				 struct vring_used_elem *heads, unsigned count)
-{
-	vhost_add_used_n(vq, heads, count);
-	vhost_signal(dev, vq);
-}
-EXPORT_SYMBOL_GPL(vhost_add_used_and_signal_n);
-
 /* return true if we're sure that avaiable ring is empty */
 bool vhost_vq_avail_empty(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 28eea0155efb..264a2a2fae97 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -197,11 +197,6 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *arg
 bool vhost_vq_access_ok(struct vhost_virtqueue *vq);
 bool vhost_log_access_ok(struct vhost_dev *);
 
-int vhost_get_vq_desc(struct vhost_virtqueue *,
-		      struct iovec iov[], unsigned int iov_count,
-		      unsigned int *out_num, unsigned int *in_num,
-		      struct vhost_log *log, unsigned int *log_num);
-void vhost_discard_vq_desc(struct vhost_virtqueue *, int n);
 int vhost_get_avail_buf(struct vhost_virtqueue *, struct vhost_buf *buf,
 			struct iovec iov[], unsigned int iov_count,
 			unsigned int *out_num, unsigned int *in_num,
@@ -209,13 +204,6 @@ int vhost_get_avail_buf(struct vhost_virtqueue *, struct vhost_buf *buf,
 void vhost_discard_avail_bufs(struct vhost_virtqueue *,
 			      struct vhost_buf *, unsigned count);
 int vhost_vq_init_access(struct vhost_virtqueue *);
-int vhost_add_used(struct vhost_virtqueue *, unsigned int head, int len);
-int vhost_add_used_n(struct vhost_virtqueue *, struct vring_used_elem *heads,
-		     unsigned count);
-void vhost_add_used_and_signal(struct vhost_dev *, struct vhost_virtqueue *,
-			       unsigned int id, int len);
-void vhost_add_used_and_signal_n(struct vhost_dev *, struct vhost_virtqueue *,
-			       struct vring_used_elem *heads, unsigned count);
 int vhost_put_used_buf(struct vhost_virtqueue *, struct vhost_buf *buf);
 int vhost_put_used_n_bufs(struct vhost_virtqueue *,
 			  struct vhost_buf *bufs, unsigned count);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
