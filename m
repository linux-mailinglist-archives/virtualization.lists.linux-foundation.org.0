Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B03801F66C2
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5223E266DD;
	Thu, 11 Jun 2020 11:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRP+4kaWzdX3; Thu, 11 Jun 2020 11:34:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 838B22667F;
	Thu, 11 Jun 2020 11:34:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62CA5C016F;
	Thu, 11 Jun 2020 11:34:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF22C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4864526661
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82wDfokomZme
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 1994D25AB8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591875271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSaMCS1O17u0g9bd8e2z58Dc9EOg+CQGapBL2hGbMuM=;
 b=iBEdhmzSjZFDxnBNycnh8JR6p3upf1szzKrLlHaKg5E0+O1BSdwJdG7SbrerHQWYhJkZcY
 cgdtSm0O8OEZ63wTj/6i6YKqBYqQYlkJWiP3m6Ph4qwLx/z1RkQ17IA6S8CCsvr2uqRk+L
 dHgK3nfJKC9PK3umFoNUQxjncctMgi8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-U5dxm05SOIKO26EDGc3ZHg-1; Thu, 11 Jun 2020 07:34:30 -0400
X-MC-Unique: U5dxm05SOIKO26EDGc3ZHg-1
Received: by mail-wr1-f70.google.com with SMTP id d6so2458106wrn.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 04:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LSaMCS1O17u0g9bd8e2z58Dc9EOg+CQGapBL2hGbMuM=;
 b=guuXwTMyieUY+PfULkCwhKV0lchydXGl8bZFXJlOVic6j6qLeXRmqfMsB3IPLBubJY
 JkC9eo5fkukUWK5bKWD/a0bOvv73QbrPvyQNu9tMbdI5YLpisJrFf6O5EguXeZ3ggDWE
 PRSnRXlM5OTRnFc0qaSpA5HCD8JG0Hq/kXs4+/zXI4e7/cmL2beGea7jSjVjEU+mKGFD
 GBfEIjMgiNBsvFA1Du37W3KT8gxKFybVblJ40y9zQm0S4i6wX3OHbxJ5jUpa2/pCpLqx
 PiKYTcjok9KGRlIYh4UOO1X2Sl5ruMt1hf7lR9OXO6LppkCyFNTf/+YY5fQe7of/ej6x
 dTEg==
X-Gm-Message-State: AOAM532oT3ND6uTD0JP6MRog6kGl23+k3d2oxfTYROGtSoFtsl108EJA
 KvkUE9fODQ5HDYCd9SBT5ADHkoU3nm39CzBkd9IJJT5PuIJ7WUFTo1MIGsaeh6/+iPzxapqHO6m
 oIZV2ChcrUI8hfaAB3Oeh2UzwEz9hMUAMkBvpL5VfjQ==
X-Received: by 2002:a1c:4c12:: with SMTP id z18mr8168935wmf.155.1591875268742; 
 Thu, 11 Jun 2020 04:34:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRruNuuWVHeVObfkjvydTwC1u/cRDZVYXDLJqDViLWy8eeCG8AzgDjmH1RnLu55gQ/LJierw==
X-Received: by 2002:a1c:4c12:: with SMTP id z18mr8168909wmf.155.1591875268378; 
 Thu, 11 Jun 2020 04:34:28 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id t129sm4130286wmf.41.2020.06.11.04.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:34:27 -0700 (PDT)
Date: Thu, 11 Jun 2020 07:34:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v8 05/11] vhost: format-independent API for used buffers
Message-ID: <20200611113404.17810-6-mst@redhat.com>
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

Add a new API that doesn't assume used ring, heads, etc.
For now, we keep the old APIs around to make it easier
to convert drivers.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 73 +++++++++++++++++++++++++++++++++++++------
 drivers/vhost/vhost.h | 17 +++++++++-
 2 files changed, 79 insertions(+), 11 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index c38605b01080..03e6bca02288 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2335,13 +2335,12 @@ static void unfetch_descs(struct vhost_virtqueue *vq)
  * number of output then some number of input descriptors, it's actually two
  * iovecs, but we pack them into one and note how many of each there were.
  *
- * This function returns the descriptor number found, or vq->num (which is
- * never a valid descriptor number) if none was found.  A negative code is
- * returned on error. */
-int vhost_get_vq_desc(struct vhost_virtqueue *vq,
-		      struct iovec iov[], unsigned int iov_size,
-		      unsigned int *out_num, unsigned int *in_num,
-		      struct vhost_log *log, unsigned int *log_num)
+ * This function returns a value > 0 if a descriptor was found, or 0 if none were found.
+ * A negative code is returned on error. */
+int vhost_get_avail_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf,
+			struct iovec iov[], unsigned int iov_size,
+			unsigned int *out_num, unsigned int *in_num,
+			struct vhost_log *log, unsigned int *log_num)
 {
 	int ret = fetch_descs(vq);
 	int i;
@@ -2354,6 +2353,8 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 	*out_num = *in_num = 0;
 	if (unlikely(log))
 		*log_num = 0;
+	buf->in_len = buf->out_len = 0;
+	buf->descs = 0;
 
 	for (i = vq->first_desc; i < vq->ndescs; ++i) {
 		unsigned iov_count = *in_num + *out_num;
@@ -2383,6 +2384,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 			/* If this is an input descriptor,
 			 * increment that count. */
 			*in_num += ret;
+			buf->in_len += desc->len;
 			if (unlikely(log && ret)) {
 				log[*log_num].addr = desc->addr;
 				log[*log_num].len = desc->len;
@@ -2398,9 +2400,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 				goto err;
 			}
 			*out_num += ret;
+			buf->out_len += desc->len;
 		}
 
-		ret = desc->id;
+		buf->id = desc->id;
+		++buf->descs;
 
 		if (!(desc->flags & VRING_DESC_F_NEXT))
 			break;
@@ -2408,12 +2412,41 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 
 	vq->first_desc = i + 1;
 
-	return ret;
+	return 1;
 
 err:
 	unfetch_descs(vq);
 
-	return ret ? ret : vq->num;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vhost_get_avail_buf);
+
+/* Reverse the effect of vhost_get_avail_buf. Useful for error handling. */
+void vhost_discard_avail_bufs(struct vhost_virtqueue *vq,
+			      struct vhost_buf *buf, unsigned count)
+{
+	vhost_discard_vq_desc(vq, count);
+}
+EXPORT_SYMBOL_GPL(vhost_discard_avail_bufs);
+
+/* This function returns the descriptor number found, or vq->num (which is
+ * never a valid descriptor number) if none was found.  A negative code is
+ * returned on error. */
+int vhost_get_vq_desc(struct vhost_virtqueue *vq,
+		      struct iovec iov[], unsigned int iov_size,
+		      unsigned int *out_num, unsigned int *in_num,
+		      struct vhost_log *log, unsigned int *log_num)
+{
+	struct vhost_buf buf;
+	int ret = vhost_get_avail_buf(vq, &buf,
+				      iov, iov_size, out_num, in_num,
+				      log, log_num);
+
+	if (likely(ret > 0))
+		return buf->id;
+	if (likely(!ret))
+		return vq->num;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
 
@@ -2507,6 +2540,26 @@ int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
 }
 EXPORT_SYMBOL_GPL(vhost_add_used);
 
+int vhost_put_used_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf)
+{
+	return vhost_add_used(vq, buf->id, buf->in_len);
+}
+EXPORT_SYMBOL_GPL(vhost_put_used_buf);
+
+int vhost_put_used_n_bufs(struct vhost_virtqueue *vq,
+			  struct vhost_buf *bufs, unsigned count)
+{
+	unsigned i;
+
+	for (i = 0; i < count; ++i) {
+		vq->heads[i].id = cpu_to_vhost32(vq, bufs[i].id);
+		vq->heads[i].len = cpu_to_vhost32(vq, bufs[i].in_len);
+	}
+
+	return vhost_add_used_n(vq, vq->heads, count);
+}
+EXPORT_SYMBOL_GPL(vhost_put_used_n_bufs);
+
 static bool vhost_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
 	__u16 old, new;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index fed36af5c444..28eea0155efb 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -67,6 +67,13 @@ struct vhost_desc {
 	u16 id;
 };
 
+struct vhost_buf {
+	u32 out_len;
+	u32 in_len;
+	u16 descs;
+	u16 id;
+};
+
 /* The virtqueue structure describes a queue attached to a device. */
 struct vhost_virtqueue {
 	struct vhost_dev *dev;
@@ -195,7 +202,12 @@ int vhost_get_vq_desc(struct vhost_virtqueue *,
 		      unsigned int *out_num, unsigned int *in_num,
 		      struct vhost_log *log, unsigned int *log_num);
 void vhost_discard_vq_desc(struct vhost_virtqueue *, int n);
-
+int vhost_get_avail_buf(struct vhost_virtqueue *, struct vhost_buf *buf,
+			struct iovec iov[], unsigned int iov_count,
+			unsigned int *out_num, unsigned int *in_num,
+			struct vhost_log *log, unsigned int *log_num);
+void vhost_discard_avail_bufs(struct vhost_virtqueue *,
+			      struct vhost_buf *, unsigned count);
 int vhost_vq_init_access(struct vhost_virtqueue *);
 int vhost_add_used(struct vhost_virtqueue *, unsigned int head, int len);
 int vhost_add_used_n(struct vhost_virtqueue *, struct vring_used_elem *heads,
@@ -204,6 +216,9 @@ void vhost_add_used_and_signal(struct vhost_dev *, struct vhost_virtqueue *,
 			       unsigned int id, int len);
 void vhost_add_used_and_signal_n(struct vhost_dev *, struct vhost_virtqueue *,
 			       struct vring_used_elem *heads, unsigned count);
+int vhost_put_used_buf(struct vhost_virtqueue *, struct vhost_buf *buf);
+int vhost_put_used_n_bufs(struct vhost_virtqueue *,
+			  struct vhost_buf *bufs, unsigned count);
 void vhost_signal(struct vhost_dev *, struct vhost_virtqueue *);
 void vhost_disable_notify(struct vhost_dev *, struct vhost_virtqueue *);
 bool vhost_vq_avail_empty(struct vhost_dev *, struct vhost_virtqueue *);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
