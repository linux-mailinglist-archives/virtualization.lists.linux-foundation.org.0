Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CDACC54
	for <lists.virtualization@lfdr.de>; Sun,  8 Sep 2019 13:05:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19A1DE7F;
	Sun,  8 Sep 2019 11:05:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D51D3E41
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 11:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D88EE6
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 11:05:45 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F27AD69086
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 11:05:44 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id y13so12208895qtn.6
	for <virtualization@lists.linux-foundation.org>;
	Sun, 08 Sep 2019 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=mJ79VyQiPMiGxBu7/NgWOAdwnTdH8zf8E/dxV83oJIQ=;
	b=KGtM7cPJsDQycmCAHkgTmEPPx9I64i53n88UHjgxi34/UR94AQf5WiSipbZSQTjbFk
	zpN7XTr48svwi8R5sxDsUN9n+qTbf3D0uD3bMpv2o3wzOhcnEikn0Q+Jvn/UKzkTTJDF
	KANdGkrwC7OZXLxPTXxhxWqh2463FnxS3x1j9GgdAjQsnTbdBqMwJd8Nalww6t9bJF6E
	zu1dM0+AMkevCGTPH3hNpRuEY8eUTCJi/EvUi0g++ldyYiOdndSi9Tdy9L68HghN/49M
	XPdsGSEaon00+P9/bng0dPCkYP0izepYi6+m6bVZDR++we4J920/7e5b3I4QJ1HVyFMQ
	TiPQ==
X-Gm-Message-State: APjAAAWvZpCmevHXfKoVvKxuSWp2ds0Du5i7byd/YwTs+mGATvzZGN+z
	WauQWpj1ySMck+cJcpAZdKrPw+FXOcnM1b12aP22Q1N35qLhZt2No+imgPo4Vf06SW7jvQpl+0i
	Av9pNvcCazMSI98wJsUAHVw17Pnn3nV5Mq10HZ3vWFg==
X-Received: by 2002:ac8:845:: with SMTP id x5mr18054488qth.42.1567940744063;
	Sun, 08 Sep 2019 04:05:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWSBaHX6xbj2IMf12T1d2jOLe4XYAW+o7heTvxil6hRKkUH9dOz/sVHUORF99wcOY9BFlSSQ==
X-Received: by 2002:ac8:845:: with SMTP id x5mr18054478qth.42.1567940743938;
	Sun, 08 Sep 2019 04:05:43 -0700 (PDT)
Received: from redhat.com ([212.92.124.241]) by smtp.gmail.com with ESMTPSA id
	139sm5217532qkf.14.2019.09.08.04.05.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 04:05:43 -0700 (PDT)
Date: Sun, 8 Sep 2019 07:05:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
Message-ID: <20190908110521.4031-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

iovec addresses coming from vhost are assumed to be
pre-validated, but in fact can be speculated to a value
out of range.

Userspace address are later validated with array_index_nospec so we can
be sure kernel info does not leak through these addresses, but vhost
must also not leak userspace info outside the allowed memory table to
guests.

Following the defence in depth principle, make sure
the address is not validated out of node range.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 5dc174ac8cac..0ee375fb7145 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2072,7 +2072,9 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
 		size = node->size - addr + node->start;
 		_iov->iov_len = min((u64)len - s, size);
 		_iov->iov_base = (void __user *)(unsigned long)
-			(node->userspace_addr + addr - node->start);
+			(node->userspace_addr +
+			 array_index_nospec(addr - node->start,
+					    node->size));
 		s += size;
 		addr += size;
 		++ret;
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
