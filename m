Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7426412C
	for <lists.virtualization@lfdr.de>; Thu, 10 Sep 2020 11:14:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7865487647;
	Thu, 10 Sep 2020 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h78xSUKaB4kL; Thu, 10 Sep 2020 09:14:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04FF58767A;
	Thu, 10 Sep 2020 09:14:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBED8C0051;
	Thu, 10 Sep 2020 09:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14C39C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 09:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0199386EDB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkVqKqkhQTRe
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 09:14:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 24FC286F42
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsfsAQ2XAkLrSeK5gDaCbmO+kEOKaYFgY1Wng1dGBy0=;
 b=Q69G4RFVHHK/W6Jrw+wNa65ycMJjAmBmaW3xOxkEpTGSl0xBiwjvm1OfIiVqeU2V7/fTqi
 bu2SG5ZJ7kG5IcEuV76jf0YAixLfxzAJUlLd7nZdIz2EA+F/SWmu0yz6f2svtPyElxWJu6
 JHtp/swa2vFmsY39t0x8vSJT5pGxWg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-HBflxYiUOtC-j12zoJgTEQ-1; Thu, 10 Sep 2020 05:14:47 -0400
X-MC-Unique: HBflxYiUOtC-j12zoJgTEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A191D109106C;
 Thu, 10 Sep 2020 09:14:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445081A8EC;
 Thu, 10 Sep 2020 09:14:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] hv_balloon: try to merge system ram resources
Date: Thu, 10 Sep 2020 11:13:40 +0200
Message-Id: <20200910091340.8654-8-david@redhat.com>
In-Reply-To: <20200910091340.8654-1-david@redhat.com>
References: <20200910091340.8654-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-s390@vger.kernel.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-acpi@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Wei Yang <richardw.yang@linux.intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>
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

Let's try to merge system ram resources we add, to minimize the number
of resources in /proc/iomem. We don't care about the boundaries of
individual chunks we added.

Reviewed-by: Wei Liu <wei.liu@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/hv/hv_balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 3c0d52e244520..b64d2efbefe71 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
 
 		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret = add_memory(nid, PFN_PHYS((start_pfn)),
-				(HA_CHUNK << PAGE_SHIFT), MHP_NONE);
+				(HA_CHUNK << PAGE_SHIFT), MEMHP_MERGE_RESOURCE);
 
 		if (ret) {
 			pr_err("hot_add memory failed error is %d\n", ret);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
