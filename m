Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B830C1F5365
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65A3E8810E;
	Wed, 10 Jun 2020 11:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a101mFW2J7qm; Wed, 10 Jun 2020 11:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04E5B88093;
	Wed, 10 Jun 2020 11:36:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBB8DC016F;
	Wed, 10 Jun 2020 11:36:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C3F1C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 25F448810E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7Q73PZaV+iq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 56A0D88093
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g1mhrQ6NM5wYShJMoCPQWA/YwUtZgT5jddxZW0yxgs8=;
 b=e4exZrjI9HtnU7rNPcCffQSp6dcxNVzPTIOk9WOlEhevQmVFckVdD6wwrPz4beGBi294ot
 GjFTWLDX72WBmnpB0hJPN9LiHTo0iVrvnEclvOeUEX+xGkA7PpqXqYrhzlVXgqwx2LDFxi
 aDoHlxPegSPHT/43Gw5cVqlu6RSSu3w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-KoXw3EsYMuGmkUGKK-F5Cg-1; Wed, 10 Jun 2020 07:36:17 -0400
X-MC-Unique: KoXw3EsYMuGmkUGKK-F5Cg-1
Received: by mail-wr1-f69.google.com with SMTP id r5so968428wrt.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g1mhrQ6NM5wYShJMoCPQWA/YwUtZgT5jddxZW0yxgs8=;
 b=ppK2dRXXOh9Z07obfbKyHtOyBPWz8ZjgZm1reNKbL3UF17D1DWpUcD+vHq2zdU9HT9
 Zf27NynXMXlcfiw3oAD8YK+d+kLlguLgYrCBYp/hkNGlcj6Pq4WzH3eMEYIQT1gF2MQt
 2YTgg5uGEpcIWPA817gnmDoCd/KenI7WDCSEk/BokIBpu43pzxkSTZW17V21L56+pfJp
 FDCKQAhVU2Ek7e7fALWBHIYQ0NXbMB4U0MKfbECtEumyeaHIwRQ6Q0id4hiYG0gab6Yz
 5m3R6K738q/+txKrGMnIRqssu7UDBCCj46hIn7mNeWSsuLxfyhLtCgUv9Wblp06ovbmF
 UNFA==
X-Gm-Message-State: AOAM531jGjK6FDEAr56DSX7molD1F3ZuGgKaDnA6THhMbSXj7LX5zbYD
 YfM3O62GQIIcVoSjEwZYeA/Hvrb02MAAF8BAX1kArUBCudlHm4aHujmJgOLZqPINXyGsVSgxUi+
 288ZIWo+KVdvcUy21kXQRJCeXfFPpwe3f8yjs1RCbkA==
X-Received: by 2002:a1c:254:: with SMTP id 81mr2746857wmc.93.1591788976421;
 Wed, 10 Jun 2020 04:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFkt3Ubc8PKFjtb6gY/lDXcBZnr6E3I6m79bNAQFz95Fybj8NNv1w+aulFwppsq1zCYoyKZw==
X-Received: by 2002:a1c:254:: with SMTP id 81mr2746830wmc.93.1591788976169;
 Wed, 10 Jun 2020 04:36:16 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id z22sm6583776wmf.9.2020.06.10.04.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:15 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:36:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 07/14] fixup! vhost: format-independent API for used
 buffers
Message-ID: <20200610113515.1497099-8-mst@redhat.com>
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

---
 drivers/vhost/vhost.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index e5763d81bf0f..7a587b13095c 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2421,7 +2421,7 @@ int vhost_get_avail_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf,
 err:
 	unfetch_descs(vq);
 
-	return ret ? ret : vq->num;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vhost_get_avail_buf);
 
@@ -2433,6 +2433,27 @@ void vhost_discard_avail_bufs(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_discard_avail_bufs);
 
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
+}
+EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
+
 /* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
 void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
 {
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
