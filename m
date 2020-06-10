Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A91F5367
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 13:36:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB2FF875BE;
	Wed, 10 Jun 2020 11:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G+DgBR8QPpe1; Wed, 10 Jun 2020 11:36:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D27E8851F;
	Wed, 10 Jun 2020 11:36:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27053C088C;
	Wed, 10 Jun 2020 11:36:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C86B5C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B7BB988398
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUwO-FMnTCNl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A0A9875BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591788982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nqpRKPPRu97i04+lEwiVZnVP4RAISD6OyeyY71/1iaw=;
 b=PD3DXviUIXZSvLoLAGuF692PzUijlWhppV55ZYxp5ZvJhdv/oOyKxnqycdlsIKlAl05Ro9
 vJXmZKpt9/tjiRcITzJF7kZ+lqnPFaDR6sRdKl9FT8WvPsPF/3XlmhxsbBVFUDAcD1u2C4
 Q8BCO1YTt5uaGYZRw8wu8KRy9OYKJWc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-k7z2khQEMim1CAytCnxA5A-1; Wed, 10 Jun 2020 07:36:20 -0400
X-MC-Unique: k7z2khQEMim1CAytCnxA5A-1
Received: by mail-wr1-f70.google.com with SMTP id w4so965088wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 04:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nqpRKPPRu97i04+lEwiVZnVP4RAISD6OyeyY71/1iaw=;
 b=cF505WVmYM01W+X5q7kpyvCDHPURE4Z3N8Q4vPePKayx93HkuxMeGr7L7jK/5XUFTR
 qx3RcZq4lji6FoIM34cnBprHgawlZvCTNgMMWdXNBWqsuYKHapr662e3HSXzF1w4bqEb
 AzxbUF2zmf3oSadsAtiWJOduzeHEa9QAVQgbqkS/szze/MhuiYX7BmIvty1zZydUMs//
 RWoXmyPxzkm+nWmgQBZTMmERvVfoluIA9BVimMC/fQGzqcKegFirin4/HnwdEzyy02o2
 Srl7POCTyWBZvSDwSjLvisWaJ/SHUcsfQTc7waaCEBkLBdpC7E2djtP9FWSbiCrJL5mT
 22ZA==
X-Gm-Message-State: AOAM533GRAF3JVm1BVl2u1UZRUnGnublfq8J4lgWRaijfcHBwY0CD6+w
 aYEMf+/JiUoeA0Qcwetv/6rn+zb+YNckC6wys0zjCNOVorATwPDAYDSJsc3izjE2UJFLZz/pJFv
 IALud259rNFvGBAN7dLIga/b0t/8R4k1tMdXSmicbIQ==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr2749317wma.148.1591788979281; 
 Wed, 10 Jun 2020 04:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk/lBSoKqQEzUm0ygb+JThKfl+fyQkS7QcmVzzuz7sF0aMX0Q8Jh3FrRflgePDOX+1hNCqVA==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr2749304wma.148.1591788979097; 
 Wed, 10 Jun 2020 04:36:19 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id d63sm6775894wmc.22.2020.06.10.04.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:36:18 -0700 (PDT)
Date: Wed, 10 Jun 2020 07:36:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 08/14] fixup! vhost: use batched get_vq_desc version
Message-ID: <20200610113515.1497099-9-mst@redhat.com>
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
 drivers/vhost/vhost.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 7a587b13095c..03e6bca02288 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2205,10 +2205,6 @@ static int fetch_buf(struct vhost_virtqueue *vq)
 	last_avail_idx = vq->last_avail_idx;
 
 	if (unlikely(vq->avail_idx == vq->last_avail_idx)) {
-		/* If we already have work to do, don't bother re-checking. */
-		if (likely(vq->ndescs))
-			return 1;
-
 		if (unlikely(vhost_get_avail_idx(vq, &avail_idx))) {
 			vq_err(vq, "Failed to access avail idx at %p\n",
 				&vq->avail->idx);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
