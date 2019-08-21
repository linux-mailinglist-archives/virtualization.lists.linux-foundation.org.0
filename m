Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A6980EF
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 19:03:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 15455C9E;
	Wed, 21 Aug 2019 17:02:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 73CF8C79
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 17:02:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 32E5289E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 17:02:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id m9so1641728pls.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 10:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U6z5UAUGFghdvzjH4C6pX/4JXep5tUCHLfsHPzlx9LA=;
	b=Xnral9tOYeLFMgsJ7nzH6//EiMyIxSB07AuX97bWzysqwPJZJ9bX4xi5AcC7rEx40j
	myXJNdDMBi5vkqKwpIgKVNxySajVqRi5FTAPJnVHxtBJuUPx8qUYftE6wNaydaX6qHXI
	NZL0dZcmWycTTwhAz1r3S6y2Pazt4ZOwvlLQprLfXvruV7sqSDKV93lNhLKBWns+Zu6K
	GnibRkLuHiJ+e8oYCRusNsLmQTuIsmY2vVyIaQ46k0a2mmh/51oOccGF2+NBDpY/hfxk
	wUyPdtG2fH+y+bKAkAJJuS194ezRNh051Aa8eJroeiWjdEmjau3HILVzdKJ+3zH23j9i
	xz/A==
X-Gm-Message-State: APjAAAWVTrx0CJapRiF6f0xU8BwHhiV4jyOqgrQHiRIKeZIr2VoaCnSG
	zF0oks8kwF0fimkv4eY0G9s=
X-Google-Smtp-Source: APXvYqwSHmzMs89oPrC2mo0cPIKVAkb2F9Ln2a5cPO2U0/JORRLOHxSXJwFKQGFE12cP6dDufj9BgA==
X-Received: by 2002:a17:902:e407:: with SMTP id
	ci7mr20821703plb.326.1566406971488; 
	Wed, 21 Aug 2019 10:02:51 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	b18sm15151398pfi.128.2019.08.21.10.02.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 10:02:50 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] mm/balloon_compaction: Informative allocation warnings
Date: Wed, 21 Aug 2019 02:41:59 -0700
Message-Id: <20190821094159.40795-1-namit@vmware.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Nadav Amit <namit@vmware.com>
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
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

There is no reason to print generic warnings when balloon memory
allocation fails, as failures are expected and can be handled
gracefully. Since VMware balloon now uses balloon-compaction
infrastructure, and suppressed these warnings before, it is also
beneficial to suppress these warnings to keep the same behavior that the
balloon had before.

Since such warnings can still be useful to indicate that the balloon is
over-inflated, print more informative and less frightening warning if
allocation fails instead.

Cc: David Hildenbrand <david@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Nadav Amit <namit@vmware.com>

---

v1->v2:
  * Print informative warnings instead suppressing [David]
---
 mm/balloon_compaction.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 798275a51887..0c1d1f7689f0 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -124,7 +124,12 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
 struct page *balloon_page_alloc(void)
 {
 	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
-				       __GFP_NOMEMALLOC | __GFP_NORETRY);
+				       __GFP_NOMEMALLOC | __GFP_NORETRY |
+				       __GFP_NOWARN);
+
+	if (!page)
+		pr_warn_ratelimited("memory balloon: memory allocation failed");
+
 	return page;
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
