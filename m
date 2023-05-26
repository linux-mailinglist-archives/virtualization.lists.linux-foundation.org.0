Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBB711F4F
	for <lists.virtualization@lfdr.de>; Fri, 26 May 2023 07:46:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97E9D4045C;
	Fri, 26 May 2023 05:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E9D4045C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qUlQ8WHg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLele-YzLAxf; Fri, 26 May 2023 05:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B29B40482;
	Fri, 26 May 2023 05:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B29B40482
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2360C008C;
	Fri, 26 May 2023 05:46:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 032CEC002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 05:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD46F40482
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 05:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD46F40482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIYIFWCuyR3O
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 05:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBE54045C
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EBE54045C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 05:46:38 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso432941b3a.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 22:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685079998; x=1687671998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e5YxXu7+kAm16FYH0MM9J1g3Z4tXK64P/Yef0oEkw/I=;
 b=qUlQ8WHgMYaTUXyuLclzG5jl4IGHhzf8aaf6PDLaN5rgzB5eNdGCj32w/4dLzU8kMv
 2ChzWrBpmLTJE69zw4V5Njx0sHdYTnRqpCL6sdDsRoYtIjfXv4hJ6gIfgsyj36DDD8HJ
 DmassvZ0KvRsMYd9aSzBczk20prYxDmj0k014QHezqoeArDVDdCstj3FZa//ke5uIS1+
 XLkgy7ENSRoxqQkx9/oGHANG1Fy/kr4uQtPqbWlvwxLmm+0u2xK98Wsv90QJnVR7W5fY
 5HnBaDmB7Rifu5lSJdrCgoKUwPGK+fbanzM0J/1vOl5JwrjFi7K7Mzu/VcndTToJO3s3
 JXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685079998; x=1687671998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5YxXu7+kAm16FYH0MM9J1g3Z4tXK64P/Yef0oEkw/I=;
 b=QlDxv7rfRJJ49aecvp3NN3ScAvwgqaoj73vftxthtppHcY9thM10P9JJ6bSk8eCAt5
 g78leabO+aOn5lwhSth9BISi4Y4ylXsxBYO2rL8Ou+NZo9Ci/nPS+02XKdumTp/yH+vJ
 FNMSqaNdq7m5SLO+I1ifkiQFFj+imYaUdrHesRZsbVl4zEISdz9YgklcACLadSP4MQ9f
 Lk7FK6JTnV7vZ+VD+/NQn+LZtrXKtenqooev+ME8t3EbXZ5SIclPH/6KI5JGOMZQVQwK
 bs/XwNxNcpQEOYmrA/l1u808/ztv9dwahQ7ROu1FIPIakSe+gho5YX7T9tl3/KfXQ4KS
 uEhw==
X-Gm-Message-State: AC+VfDz7KNw9VX3HQ1IeKj39Fg93O7s4LeuKHI53xwEvvRg4OOWxZEMa
 XWO7VzpiRDCeW9+LBy0+9kw=
X-Google-Smtp-Source: ACHHUZ6rs6rJosyEPbVnZODyB6BU4l/3BiexMAim7sYthg1sjCSUBFQJgdexR9mr9iRDz9L8ysRpkQ==
X-Received: by 2002:a05:6a20:2584:b0:10f:3d02:863 with SMTP id
 k4-20020a056a20258400b0010f3d020863mr1035895pzd.9.1685079998416; 
 Thu, 25 May 2023 22:46:38 -0700 (PDT)
Received: from localhost.localdomain ([104.149.188.130])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a6567d7000000b0050a0227a4bcsm1836485pgs.57.2023.05.25.22.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 22:46:37 -0700 (PDT)
From: Liang Chen <liangchen.linux@gmail.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH net-next 1/5] virtio_net: Fix an unsafe reference to the page
 chain
Date: Fri, 26 May 2023 13:46:17 +0800
Message-Id: <20230526054621.18371-1-liangchen.linux@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: xuanzhuo@linux.alibaba.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

"private" of buffer page is currently used for big mode to chain pages.
But in mergeable mode, that offset of page could mean something else,
e.g. when page_pool page is used instead. So excluding mergeable mode to
avoid such a problem.

Signed-off-by: Liang Chen <liangchen.linux@gmail.com>
---
 drivers/net/virtio_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 5a7f7a76b920..c5dca0d92e64 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -497,7 +497,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 			return NULL;
 
 		page = (struct page *)page->private;
-		if (page)
+		if (!vi->mergeable_rx_bufs && page)
 			give_pages(rq, page);
 		goto ok;
 	}
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
