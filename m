Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC81F0BAC
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 16:11:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47AAC869CA;
	Sun,  7 Jun 2020 14:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbYUZzYMSHFG; Sun,  7 Jun 2020 14:11:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8C6D85BCA;
	Sun,  7 Jun 2020 14:11:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98CFAC016F;
	Sun,  7 Jun 2020 14:11:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24CEAC016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1489D85751
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_I94F7R30vy
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 76892855A1
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591539097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JQR7Mpm9OBikwgtvyKeD/N9hz5sz6YikG7pS21JFzQo=;
 b=bpROrwDoGrfk/f22tIGoDnQQdwnk3dxKKY6ASNFC9bLdHKR2BIsIV9HUP8aHfl+lxSLj8p
 RNxpjQgPKpXmXnmplaF0TBCaL6KgC7a7hxanY8Z4wYpF2oVs30+c7d3GZGckHKsPGvSBBD
 ChUEd8+Sy3PtHlMiEzeVo3I6YPrUO18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-IKi49-dmPJ2IuUtg3xlpAQ-1; Sun, 07 Jun 2020 10:11:35 -0400
X-MC-Unique: IKi49-dmPJ2IuUtg3xlpAQ-1
Received: by mail-wm1-f69.google.com with SMTP id c4so453133wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 07:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JQR7Mpm9OBikwgtvyKeD/N9hz5sz6YikG7pS21JFzQo=;
 b=a7O+na1UUHO5LAu3IymWDMAW/5qUyxpAsaMSfrJnmmhi4977cOhhblSuXzpepueTr5
 W8n5jxhoMceh1BsyxSt1351ShSk2EtPe2hZBTapaGSHomzTWE2o1AOgHjy+9WxbwRbKb
 KC517sm2ONEWKXabC34ohoT1cK4yJa40AHRSwn7b/w7go5dBSgwluufLCjtVqJhuFmVi
 LOW3T3xVIYVOelkGfwErDl46vJiwsifZkG0YQv73Km9u8mcj/j5KoN7VUOSAeLntjjai
 sH8HS0XhjHp+beMdfkyaHmzCVROnz+VzK0UHJ92FIEALDai+YqiKJXJQIjr2IKD+ccZk
 3ndg==
X-Gm-Message-State: AOAM531FYXgCrYk8Fase1cMsIjGqoEf23muXmC4AG+nFecs8RCGHIKk5
 SDRkkR1a90jFQ46wCeVoBbbydNDFIxr+iAwlu5qZq0p6/H5Gfgl1suJaflyJbMTXFLyCsOHWMWC
 q8d1QqsGjlqmrRQKFrcFdzBdglZxDMssKoowF/R6RVw==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr18094715wrj.333.1591539094201; 
 Sun, 07 Jun 2020 07:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqzRAoAIzc/LlIJf21AHME4RusNkUCf33IpFFYIMKnPoUw8fHgwURZWyZ6ZiKcq55sRTypMg==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr18094706wrj.333.1591539094004; 
 Sun, 07 Jun 2020 07:11:34 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id k17sm18626832wmj.15.2020.06.07.07.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 07:11:33 -0700 (PDT)
Date: Sun, 7 Jun 2020 10:11:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v5 04/13] vhost: cleanup fetch_buf return code handling
Message-ID: <20200607141057.704085-5-mst@redhat.com>
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

Return code of fetch_buf is confusing, so callers resort to
tricks to get to sane values. Let's switch to something standard:
0 empty, >0 non-empty, <0 error.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 3b0609801381..5075505cfe55 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2189,6 +2189,8 @@ static int fetch_indirect_descs(struct vhost_virtqueue *vq,
 	return 0;
 }
 
+/* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
+ * A negative code is returned on error. */
 static int fetch_buf(struct vhost_virtqueue *vq)
 {
 	unsigned int i, head, found = 0;
@@ -2205,7 +2207,7 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	if (unlikely(vq->avail_idx == vq->last_avail_idx)) {
 		/* If we already have work to do, don't bother re-checking. */
 		if (likely(vq->ndescs))
-			return vq->num;
+			return 0;
 
 		if (unlikely(vhost_get_avail_idx(vq, &avail_idx))) {
 			vq_err(vq, "Failed to access avail idx at %p\n",
@@ -2224,7 +2226,7 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 		 * invalid.
 		 */
 		if (vq->avail_idx == last_avail_idx)
-			return vq->num;
+			return 0;
 
 		/* Only get avail ring entries after they have been
 		 * exposed by guest.
@@ -2294,12 +2296,14 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	/* On success, increment avail index. */
 	vq->last_avail_idx++;
 
-	return 0;
+	return 1;
 }
 
+/* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
+ * A negative code is returned on error. */
 static int fetch_descs(struct vhost_virtqueue *vq)
 {
-	int ret = 0;
+	int ret;
 
 	if (unlikely(vq->first_desc >= vq->ndescs)) {
 		vq->first_desc = 0;
@@ -2309,10 +2313,14 @@ static int fetch_descs(struct vhost_virtqueue *vq)
 	if (vq->ndescs)
 		return 0;
 
-	while (!ret && vq->ndescs <= vhost_vq_num_batch_descs(vq))
-		ret = fetch_buf(vq);
+	for (ret = 1;
+	     ret > 0 && vq->ndescs <= vhost_vq_num_batch_descs(vq);
+	     ret = fetch_buf(vq))
+		;
 
-	return vq->ndescs ? 0 : ret;
+	/* On success we expect some descs */
+	BUG_ON(ret > 0 && !vq->ndescs);
+	return ret;
 }
 
 /* This looks in the virtqueue and for the first available buffer, and converts
@@ -2331,7 +2339,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 	int ret = fetch_descs(vq);
 	int i;
 
-	if (ret)
+	if (ret <= 0)
 		return ret;
 
 	/* Now convert to IOV */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
