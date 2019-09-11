Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CCAFC43
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 14:10:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A260513B7;
	Wed, 11 Sep 2019 12:10:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 319FF13AF
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:10:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6297896
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:10:07 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61ED976555
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:10:06 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id o133so24796994qke.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 05:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=nO3SYHGDRWEzxT3/abFXM0Gu89GIuWvlxuxu/SDZ8iw=;
	b=MoKy1ywyEiK00ruBmtIpL/UvH7rE2hf0hUKpAg1badVQYMuIN2s4+wB+rNdkNNCNaL
	fBW0+e8NFNGGDcOiKBKbHHkU6S5EpwaOMtAFppIqsfrrbBefn7ulf/02orLnxRWOCydh
	8XiUlgs37ReCLKvLeDm4L0NYjLSArgmAipq2HJsvj70jgqg37mls16BcybVAZK/t0tB9
	tl7OtsBfFZALUIGfD6dN2y4f6hTW6dJr4JF5AwunzRznCPWS5MW7fGcW2WyDgt3vTyLy
	LkZnmXWx4xF8C8M66fjPi0F/yWlBtx03HgwNkz+a4KSpT445X7pLb6VkPdCbRLA0v76W
	c+mA==
X-Gm-Message-State: APjAAAUouTB3Wtm0zOsY4aSkFnGTaE+5YR8BbFsQI92eTeRatq1J5ZCP
	qmUv0mtn9DhxUja8WgS9ZgOSEaRey5HSa4Z0jhOjnWeI6c7z5jvoqNWupe4jH6BlJxxLBKidrAd
	lTmd7db2swWYIPgVjjJgLO0iaRPnlHzv9MYgHSoHhMA==
X-Received: by 2002:ad4:5494:: with SMTP id q20mr21893383qvy.8.1568203805669; 
	Wed, 11 Sep 2019 05:10:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpfN8qjonuIyL61v7mAfTW2LcQ+Fqop0jhY4LwumZnvN9ZVZG/z8lBS94ag/ZEibKr7bFsQA==
X-Received: by 2002:ad4:5494:: with SMTP id q20mr21893369qvy.8.1568203805473; 
	Wed, 11 Sep 2019 05:10:05 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	h29sm12975276qtb.46.2019.09.11.05.10.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 05:10:04 -0700 (PDT)
Date: Wed, 11 Sep 2019 08:10:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911120908.28410-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
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
Acked-by: Jason Wang <jasowang@redhat.com>
Tested-by: Jason Wang <jasowang@redhat.com>
---

changes from v1: fix build on 32 bit

 drivers/vhost/vhost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 5dc174ac8cac..34ea219936e3 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2071,8 +2071,10 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
 		_iov = iov + ret;
 		size = node->size - addr + node->start;
 		_iov->iov_len = min((u64)len - s, size);
-		_iov->iov_base = (void __user *)(unsigned long)
-			(node->userspace_addr + addr - node->start);
+		_iov->iov_base = (void __user *)
+			((unsigned long)node->userspace_addr +
+			 array_index_nospec((unsigned long)(addr - node->start),
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
