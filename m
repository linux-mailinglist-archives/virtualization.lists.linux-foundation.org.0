Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796F1EBC64
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F8AF81D62;
	Tue,  2 Jun 2020 13:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5W1GOxQykDg; Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 893CE81E56;
	Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7124FC0893;
	Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBBCDC0178
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B8BD386D39
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyCTwYA5rj2S
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95FBA86ADD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXfjPrDyqejhZJQKUWL2cxT5rK4Jnqa149Nn7T1gq18=;
 b=CPbemTDUxRW1cz61tKA8b6jjb223pEUaripanO2nQXHLV1upciBGtJF3YtBStKoetiTOoj
 gfYUQKdfGAnLjuPKeD+BevtZfWk/MPAyJFshG6JJh8e42KyP10v0Sx4H2kPJLhbm45Q2H3
 eMnPywRnTGrorvxx8Npq4r0eoutx23E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-_uIwhYp_NKKkpjdIBeiS2w-1; Tue, 02 Jun 2020 09:06:07 -0400
X-MC-Unique: _uIwhYp_NKKkpjdIBeiS2w-1
Received: by mail-wm1-f71.google.com with SMTP id b63so889345wme.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EXfjPrDyqejhZJQKUWL2cxT5rK4Jnqa149Nn7T1gq18=;
 b=fp7x1r6LNdnelWD11kEtkysutTkYGrLlYCp4pwWyv2HWl6e4msuGjrb+JlFzybnIa6
 eveReOAoxKbwnoyXcKkdoThrrf6LPy7+vVb6vOkwqy1+E7s1uONCVqTN5Oq8WwI+q0Ma
 RNK/o54RHiQSLpT6bk/AMLYKEE3BRbOYoa9ZLOfEOSu+LIFO1o6plGFsnfhXsLWminfU
 IKPLYO5EFtMGFNhWVLpaVlO9jrio/g8ECCJJ1R6uPe2g5AnpvrQ6mojtJcogJ/j5yi6J
 aXpVknS377cvIyQeoz47OLHi6/tcNRBz78VOIiZpS5WaO+hBt4zKzSDDcDrruGFnKh/n
 Kz9A==
X-Gm-Message-State: AOAM533EpGZsmWB3Vu3fFIA11DvZio7PNriInG9Aqka8pWWlcqyrDcAg
 StuYOmmHglCXxpXlVRpjdWBaiP0qHX7zr1cIb9E0jiGNGcXqOcfEdEjhubkH6KV/96H0FbXgtP6
 IG91tMLYiAymKCVPNrfUD0CxvI1vyS/WYp5DAbniydg==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr28295028wru.118.1591103165835; 
 Tue, 02 Jun 2020 06:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycUSkpBa2fgUPLZAf/ybOapg7EllouqLaj5tY/W/L7i8gJ0j5W3iBZNA/fqWHGkhJHN82J9A==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr28295007wru.118.1591103165610; 
 Tue, 02 Jun 2020 06:06:05 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 m129sm3760525wmf.2.2020.06.02.06.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:05 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 04/13] vhost: cleanup fetch_buf return code handling
Message-ID: <20200602130543.578420-5-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
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

Return code of fetch_buf is confusing, so callers resort to
tricks to get to sane values. Let's switch to something standard:
0 empty, >0 non-empty, <0 error.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index aca2a5b0d078..bd52b44b0d23 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2146,6 +2146,8 @@ static int fetch_indirect_descs(struct vhost_virtqueue *vq,
 	return 0;
 }
 
+/* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
+ * A negative code is returned on error. */
 static int fetch_buf(struct vhost_virtqueue *vq)
 {
 	unsigned int i, head, found = 0;
@@ -2162,7 +2164,7 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	if (unlikely(vq->avail_idx == vq->last_avail_idx)) {
 		/* If we already have work to do, don't bother re-checking. */
 		if (likely(vq->ndescs))
-			return vq->num;
+			return 0;
 
 		if (unlikely(vhost_get_avail_idx(vq, &avail_idx))) {
 			vq_err(vq, "Failed to access avail idx at %p\n",
@@ -2181,7 +2183,7 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 		 * invalid.
 		 */
 		if (vq->avail_idx == last_avail_idx)
-			return vq->num;
+			return 0;
 
 		/* Only get avail ring entries after they have been
 		 * exposed by guest.
@@ -2251,12 +2253,14 @@ static int fetch_buf(struct vhost_virtqueue *vq)
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
@@ -2266,10 +2270,14 @@ static int fetch_descs(struct vhost_virtqueue *vq)
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
@@ -2288,7 +2296,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
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
