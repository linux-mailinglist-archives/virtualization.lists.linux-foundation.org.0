Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9574411521
	for <lists.virtualization@lfdr.de>; Mon, 20 Sep 2021 15:00:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CBC4044A;
	Mon, 20 Sep 2021 12:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfjbEZR3xzIp; Mon, 20 Sep 2021 12:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8F1944021B;
	Mon, 20 Sep 2021 12:59:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29F8BC000D;
	Mon, 20 Sep 2021 12:59:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87233C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 12:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6866A60676
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 12:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiKvQURJSugF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 12:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FCB2605A7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 12:59:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83981610A0;
 Mon, 20 Sep 2021 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632142794;
 bh=eLNoLb3ufI49vJ8VasARzhhU2JvHecHjaYQWCs05OOE=;
 h=Subject:To:Cc:From:Date:From;
 b=2NwWxYXuKXEYuUKSrNOtIIfH6d+oAII9I4RrSsG8KPik2E2SMb5RMExXkc5xOFj+6
 PP3cvyjMUtSh5FxwznD4Rfb4jfCelfJxLoEGgd8EO8ByZ/jeoN048xezc72Kgx7PKz
 2MYBLbm/nAU0grcXo4kUiyll0s+p6Qp9ziUPz08s=
Subject: Patch "mm/memory_hotplug: use "unsigned long" for PFN in
 zone_for_pfn_range()" has been added to the 5.10-stable tree
To: 20210607195430.48228-1-david@redhat.com, akpm@linux-foundation.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, anton@ozlabs.org,
 ardb@kernel.org, bauerman@linux.ibm.com, benh@kernel.crashing.org,
 bhe@redhat.com, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com,
 cheloha@linux.ibm.com, christophe.leroy@c-s.fr, dalias@libc.org,
 dan.j.williams@intel.com, dave.hansen@linux.intel.com, dave.jiang@intel.com,
 david@redhat.com, gor@linux.ibm.com, gregkh@linuxfoundation.org,
 hca@linux.ibm.com, hpa@zytor.com, jasowang@redhat.com, joe@perches.com,
 justin.he@arm.com, ldufour@linux.ibm.com, lenb@kernel.org, luto@kernel.org,
 mhocko@kernel.org, michel@lespinasse.org, mingo@redhat.com, mpe@ellerman.id.au,
 mst@redhat.com, nathanl@linux.ibm.com, npiggin@gmail.com, osalvador@suse.de,
 pankaj.gupta.linux@gmail.com, pankaj.gupta@ionos.com,
 pasha.tatashin@soleen.com, paulus@samba.org, peterz@infradead.org,
 pmorel@linux.ibm.com, rafael.j.wysocki@intel.com,
 richard.weiyang@linux.alibaba.com, rjw@rjwysocki.net, rppt@kernel.org, 
 slyfox@gentoo.org, songmuchun@bytedance.com, tglx@linutronix.de,
 torvalds@linux-foundation.org, vbabka@suse.cz,
 virtualization@lists.linux-foundation.org, vishal.l.verma@intel.com,
 vkuznets@redhat.com, wangkefeng.wang@huawei.com, will@kernel.org,
 ysato@users.sourceforge.jp
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Sep 2021 14:59:51 +0200
Message-ID: <1632142791152121@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    mm/memory_hotplug: use "unsigned long" for PFN in zone_for_pfn_range()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-memory_hotplug-use-unsigned-long-for-pfn-in-zone_for_pfn_range.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7cf209ba8a86410939a24cb1aeb279479a7e0ca6 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 7 Sep 2021 19:54:59 -0700
Subject: mm/memory_hotplug: use "unsigned long" for PFN in zone_for_pfn_range()

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
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/memory_hotplug.h |    4 ++--
 mm/memory_hotplug.c            |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -359,8 +359,8 @@ extern void sparse_remove_section(struct
 		unsigned long map_offset, struct vmem_altmap *altmap);
 extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
 					  unsigned long pnum);
-extern struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
-		unsigned long nr_pages);
+extern struct zone *zone_for_pfn_range(int online_type, int nid,
+		unsigned long start_pfn, unsigned long nr_pages);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -765,8 +765,8 @@ static inline struct zone *default_zone_
 	return movable_node_enabled ? movable_zone : kernel_zone;
 }
 
-struct zone * zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
-		unsigned long nr_pages)
+struct zone *zone_for_pfn_range(int online_type, int nid,
+		unsigned long start_pfn, unsigned long nr_pages)
 {
 	if (online_type == MMOP_ONLINE_KERNEL)
 		return default_kernel_zone_for_pfn(nid, start_pfn, nr_pages);


Patches currently in stable-queue which might be from david@redhat.com are

queue-5.10/x86-mm-fix-kern_addr_valid-to-cope-with-existing-but-not-present-entries.patch
queue-5.10/x86-pat-pass-valid-address-to-sanitize_phys.patch
queue-5.10/mm-memory_hotplug-use-unsigned-long-for-pfn-in-zone_for_pfn_range.patch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
