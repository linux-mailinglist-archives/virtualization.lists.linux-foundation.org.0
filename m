Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D3165422624
	for <lists.virtualization@lfdr.de>; Tue,  5 Oct 2021 14:16:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B5D1407EF;
	Tue,  5 Oct 2021 12:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfPqBylOw6KT; Tue,  5 Oct 2021 12:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 44EA7407EE;
	Tue,  5 Oct 2021 12:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DADBCC000D;
	Tue,  5 Oct 2021 12:16:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80720C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 12:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60AE14020D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 12:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nAAEOxFOUHX
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 12:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73F604034D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633436207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNI9g9wwmQcdN9iXnExKxfHZe2dTuiVg+oq/PzETzdk=;
 b=UcY48XgkpPwIp3OqMCvxJE5kCfDlgHdIpVWKZWLXnbQJfUkh+yJXVXwbH96eU+7HxbnsLI
 3QbxSyhKRliGSHRh4dElFbBbrotN2ulxqeELqoOhHaaWFOgB+tI3++qviDU9yweW83ZTm3
 eFnAeXatucqIe2VlBn5itqHbZKL47ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-fIbnxzTSOKeOo2Y7cHkiOw-1; Tue, 05 Oct 2021 08:16:46 -0400
X-MC-Unique: fIbnxzTSOKeOo2Y7cHkiOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A66F1084683;
 Tue,  5 Oct 2021 12:16:44 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A421F436;
 Tue,  5 Oct 2021 12:16:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] x86/xen: print a warning when HVMOP_get_mem_type fails
Date: Tue,  5 Oct 2021 14:14:24 +0200
Message-Id: <20211005121430.30136-4-david@redhat.com>
In-Reply-To: <20211005121430.30136-1-david@redhat.com>
References: <20211005121430.30136-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Michal Hocko <mhocko@suse.com>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 kexec@lists.infradead.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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

HVMOP_get_mem_type is not expected to fail, "This call failing is
indication of something going quite wrong and it would be good to know
about this." [1]

Let's add a pr_warn_once().

[1] https://lkml.kernel.org/r/3b935aa0-6d85-0bcd-100e-15098add3c4c@oracle.com

Suggested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/xen/mmu_hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_hvm.c b/arch/x86/xen/mmu_hvm.c
index d1b38c77352b..6ba8826dcdcc 100644
--- a/arch/x86/xen/mmu_hvm.c
+++ b/arch/x86/xen/mmu_hvm.c
@@ -22,8 +22,10 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
 		.pfn = pfn,
 	};
 
-	if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
+	if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a)) {
+		pr_warn_once("Unexpected HVMOP_get_mem_type failure\n");
 		return -ENXIO;
+	}
 	return a.mem_type != HVMMEM_mmio_dm;
 }
 #endif
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
