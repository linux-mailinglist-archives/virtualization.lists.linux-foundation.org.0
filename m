Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C1140E1B7
	for <lists.virtualization@lfdr.de>; Thu, 16 Sep 2021 18:52:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEEE61407;
	Thu, 16 Sep 2021 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgXb7zGB9qk1; Thu, 16 Sep 2021 16:52:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 37B3D60812;
	Thu, 16 Sep 2021 16:52:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5D7BC000D;
	Thu, 16 Sep 2021 16:52:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE125C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 16:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C015240825
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 16:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1R-O75I42Uc
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 16:52:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF1CB407F1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 16:52:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0A526325F;
 Thu, 16 Sep 2021 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631811161;
 bh=We1WAH98abIdQl6WDRwYDdwBqGyJa6AdZyPB/uCcD+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GlelumZY/s755cilsg6uAkNT07moi4pCLjpKd+eXda4UYQbg3BgyemZPthLeUjKUG
 Xd8QOlG4FdsnDWMfryawWUD3s7BhF1bq4oVPZ0RhDccqG93U/wWTaDGLDWIKiOG8Sw
 VECUIVa2BlLNeYOCQw05vVHAah54SRwHRWGP0CoU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.14 404/432] mm/memory_hotplug: use "unsigned long" for PFN
 in zone_for_pfn_range()
Date: Thu, 16 Sep 2021 18:02:33 +0200
Message-Id: <20210916155824.533541303@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916155810.813340753@linuxfoundation.org>
References: <20210916155810.813340753@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Michel Lespinasse <michel@lespinasse.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anton Blanchard <anton@ozlabs.org>, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Nicholas Piggin <npiggin@gmail.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Borislav Petkov <bp@alien8.de>, Sergei Trofimovich <slyfox@gentoo.org>,
 Andy Lutomirski <luto@kernel.org>, Muchun Song <songmuchun@bytedance.com>,
 Jia He <justin.he@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Scott Cheloha <cheloha@linux.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Joe Perches <joe@perches.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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

From: David Hildenbrand <david@redhat.com>

commit 7cf209ba8a86410939a24cb1aeb279479a7e0ca6 upstream.

Patch series "mm/memory_hotplug: preparatory patches for new online policy and memory"

These are all cleanups and one fix previously sent as part of [1]:
[PATCH v1 00/12] mm/memory_hotplug: "auto-movable" online policy and memory
groups.

These patches make sense even without the other series, therefore I pulled
them out to make the other series easier to digest.

[1] https://lkml.kernel.org/r/20210607195430.48228-1-david@redhat.com

This patch (of 4):

Checkpatch complained on a follow-up patch that we are using "unsigned"
here, which defaults to "unsigned int" and checkpatch is correct.

As we will search for a fitting zone using the wrong pfn, we might end
up onlining memory to one of the special kernel zones, such as ZONE_DMA,
which can end badly as the onlined memory does not satisfy properties of
these zones.

Use "unsigned long" instead, just as we do in other places when handling
PFNs.  This can bite us once we have physical addresses in the range of
multiple TB.

Link: https://lkml.kernel.org/r/20210712124052.26491-2-david@redhat.com
Fixes: e5e689302633 ("mm, memory_hotplug: display allowed zones in the preferred ordering")
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: virtualization@lists.linux-foundation.org
Cc: Andy Lutomirski <luto@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jia He <justin.he@arm.com>
Cc: Joe Perches <joe@perches.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Michel Lespinasse <michel@lespinasse.org>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Rich Felker <dalias@libc.org>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Sergei Trofimovich <slyfox@gentoo.org>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/memory_hotplug.h |    4 ++--
 mm/memory_hotplug.c            |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -339,8 +339,8 @@ extern void sparse_remove_section(struct
 		unsigned long map_offset, struct vmem_altmap *altmap);
 extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
 					  unsigned long pnum);
-extern struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
-		unsigned long nr_pages);
+extern struct zone *zone_for_pfn_range(int online_type, int nid,
+		unsigned long start_pfn, unsigned long nr_pages);
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -708,8 +708,8 @@ static inline struct zone *default_zone_
 	return movable_node_enabled ? movable_zone : kernel_zone;
 }
 
-struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
-		unsigned long nr_pages)
+struct zone *zone_for_pfn_range(int online_type, int nid,
+		unsigned long start_pfn, unsigned long nr_pages)
 {
 	if (online_type == MMOP_ONLINE_KERNEL)
 		return default_kernel_zone_for_pfn(nid, start_pfn, nr_pages);


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
