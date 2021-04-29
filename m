Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89036EA6C
	for <lists.virtualization@lfdr.de>; Thu, 29 Apr 2021 14:27:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C42984D66;
	Thu, 29 Apr 2021 12:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lGF-XvepThU; Thu, 29 Apr 2021 12:27:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFCC84D72;
	Thu, 29 Apr 2021 12:27:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E99BC0001;
	Thu, 29 Apr 2021 12:27:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE489C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 12:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABB3F41942
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 12:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anBfhFcz6IQB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 12:27:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF2AB4194C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619699248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8j9mBor07Cs8M7oV014u0wi5MvoFT2r3E+Kj0uohzbw=;
 b=atzWh2EhlbxeMnDtrXOZlAGyrrQp0IH2zOCnyg6vAviRtoeF8AhXyjN2Ru40OCmB7Top8F
 /SE2x8DyhmUUA50efYpeADr2kZ47mkXRbkt3SMAvkv9wNnrm8OIdedLnRspKGxmde92NwP
 uLeL2ofdOl0yFiortdI5b7bmMnCQukg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-mextiE51O4S-F0gnYD4sAg-1; Thu, 29 Apr 2021 08:27:26 -0400
X-MC-Unique: mextiE51O4S-F0gnYD4sAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097B8108BD0C;
 Thu, 29 Apr 2021 12:27:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62B318811;
 Thu, 29 Apr 2021 12:26:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] fs/proc/kcore: use page_offline_(freeze|unfreeze)
Date: Thu, 29 Apr 2021 14:25:19 +0200
Message-Id: <20210429122519.15183-8-david@redhat.com>
In-Reply-To: <20210429122519.15183-1-david@redhat.com>
References: <20210429122519.15183-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Aili Yao <yaoaili@kingsoft.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Jiri Bohac <jbohac@suse.cz>, Haiyang Zhang <haiyangz@microsoft.com>,
 Oscar Salvador <osalvador@suse.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <guro@fb.com>, Mike Rapoport <rppt@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
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

Let's properly synchronize with drivers that set PageOffline(). Unfreeze
every now and then, so drivers that want to set PageOffline() can make
progress.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/proc/kcore.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 92ff1e4436cb..3d7531f47389 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -311,6 +311,7 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
 static ssize_t
 read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 {
+	size_t page_offline_frozen = 0;
 	char *buf = file->private_data;
 	size_t phdrs_offset, notes_offset, data_offset;
 	size_t phdrs_len, notes_len;
@@ -509,6 +510,18 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 			pfn = __pa(start) >> PAGE_SHIFT;
 			page = pfn_to_online_page(pfn);
 
+			/*
+			 * Don't race against drivers that set PageOffline()
+			 * and expect no further page access.
+			 */
+			if (page_offline_frozen == MAX_ORDER_NR_PAGES) {
+				page_offline_unfreeze();
+				page_offline_frozen = 0;
+				cond_resched();
+			}
+			if (!page_offline_frozen++)
+				page_offline_freeze();
+
 			/*
 			 * Don't read offline sections, logically offline pages
 			 * (e.g., inflated in a balloon), hwpoisoned pages,
@@ -565,6 +578,8 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 	}
 
 out:
+	if (page_offline_frozen)
+		page_offline_unfreeze();
 	up_read(&kclist_lock);
 	if (ret)
 		return ret;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
