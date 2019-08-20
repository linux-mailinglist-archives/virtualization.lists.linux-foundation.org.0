Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8799F96686
	for <lists.virtualization@lfdr.de>; Tue, 20 Aug 2019 18:37:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 347D3DB3;
	Tue, 20 Aug 2019 16:37:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6879A95
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 16:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6250387
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 16:37:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d16so3232332wme.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 09:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E4X7QCNLqGFBsy/7pYjpRVoBo5sZi0bTAtJeoQQ6ohc=;
	b=D+qY/Zq4iJ+emZ4f/HQvAVDpO0T0x78BEQShzT5ZX0gwCMyzXylf2aBAIhztUrCFzv
	jADLfONHyHol247RORNf2Uhi4HTXLNNNWahqGpTCyjzv9n6wOqRtOMcLgHg2DWg1Ocec
	Xt3NJTwga4uRdlvxn61Sf+IyeiYrx45oOyjL2wL4ZT5cfhBnEqaozqB4qf8lC6bWlJPv
	vHrZVLu9QOgLat4oHMqUiYhzSDR+SCo1vbwV8Z5b3KlI+Pj1mrm6ht0mF6QSfzNnLxiY
	16dKFW2B22VZ4G3jZcXrN6c06gc6bhys2pe0dXJgZLR+1Z2kJP5HRZ3NLQbs/MKcJGL1
	B0rg==
X-Gm-Message-State: APjAAAV6oOCtnW5b4oP4d0rEG/sOTbRxnJZkKmvFjLnNofwyvaa3UyL9
	GqgUKV9gn4+TkuhONfhLmUA=
X-Google-Smtp-Source: APXvYqyWdL5QMRDrlWABWdxtx+qi5mJSVMhKc+4wusrmLOkgTE8w+/nuZlj5Jc1f8al4Vo4HPQPOEQ==
X-Received: by 2002:a1c:2dcf:: with SMTP id t198mr858820wmt.147.1566319051721; 
	Tue, 20 Aug 2019 09:37:31 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
	by smtp.gmail.com with ESMTPSA id
	n14sm58485385wra.75.2019.08.20.09.37.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 09:37:31 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] mm/balloon_compaction: suppress allocation warnings
Date: Tue, 20 Aug 2019 02:16:46 -0700
Message-Id: <20190820091646.29642-1-namit@vmware.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

There is no reason to print warnings when balloon page allocation fails,
as they are expected and can be handled gracefully.  Since VMware
balloon now uses balloon-compaction infrastructure, and suppressed these
warnings before, it is also beneficial to suppress these warnings to
keep the same behavior that the balloon had before.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 mm/balloon_compaction.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 798275a51887..26de020aae7b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -124,7 +124,8 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
 struct page *balloon_page_alloc(void)
 {
 	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
-				       __GFP_NOMEMALLOC | __GFP_NORETRY);
+				       __GFP_NOMEMALLOC | __GFP_NORETRY |
+				       __GFP_NOWARN);
 	return page;
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
