Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 440651B69DC
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 01:32:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC65E86E75;
	Thu, 23 Apr 2020 23:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MCjNl3fuiXn; Thu, 23 Apr 2020 23:32:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E8AC086E5C;
	Thu, 23 Apr 2020 23:32:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B22E4C0175;
	Thu, 23 Apr 2020 23:32:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54B36C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 23:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4FDA287FED
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 23:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejmK7fnGcayp
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 23:32:20 +0000 (UTC)
X-Greylist: delayed 00:25:34 by SQLgrey-1.7.6
Received: from shadbolt.e.decadent.org.uk (shadbolt.e.decadent.org.uk
 [88.96.1.126])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB8CF87FE8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 23:32:19 +0000 (UTC)
Received: from [192.168.4.242] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1jRkvP-0004fj-PI; Fri, 24 Apr 2020 00:06:31 +0100
Received: from ben by deadeye with local (Exim 4.93)
 (envelope-from <ben@decadent.org.uk>)
 id 1jRkvO-00E6mV-As; Fri, 24 Apr 2020 00:06:30 +0100
Content-Disposition: inline
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 24 Apr 2020 00:05:20 +0100
Message-ID: <lsq.1587683028.561359725@decadent.org.uk>
X-Mailer: LinuxStableQueue (scripts by bwh)
X-Patchwork-Hint: ignore
Subject: [PATCH 3.16 093/245] virtio-balloon: fix managed page counts when
 migrating pages between zones
In-Reply-To: <lsq.1587683027.831233700@decadent.org.uk>
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk);
 SAEximRunCond expanded to false
Cc: Yumei Huang <yuhuang@redhat.com>, Denis Kirjanov <kda@linux-powerpc.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, Jiang Liu <liuj97@gmail.com>
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

3.16.83-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: David Hildenbrand <david@redhat.com>

commit 63341ab03706e11a31e3dd8ccc0fbc9beaf723f0 upstream.

In case we have to migrate a ballon page to a newpage of another zone, the
managed page count of both zones is wrong. Paired with memory offlining
(which will adjust the managed page count), we can trigger kernel crashes
and all kinds of different symptoms.

One way to reproduce:
1. Start a QEMU guest with 4GB, no NUMA
2. Hotplug a 1GB DIMM and online the memory to ZONE_NORMAL
3. Inflate the balloon to 1GB
4. Unplug the DIMM (be quick, otherwise unmovable data ends up on it)
5. Observe /proc/zoneinfo
  Node 0, zone   Normal
    pages free     16810
          min      24848885473806
          low      18471592959183339
          high     36918337032892872
          spanned  262144
          present  262144
          managed  18446744073709533486
6. Do anything that requires some memory (e.g., inflate the balloon some
more). The OOM goes crazy and the system crashes
  [  238.324946] Out of memory: Killed process 537 (login) total-vm:27584kB, anon-rss:860kB, file-rss:0kB, shmem-rss:00
  [  238.338585] systemd invoked oom-killer: gfp_mask=0x100cca(GFP_HIGHUSER_MOVABLE), order=0, oom_score_adj=0
  [  238.339420] CPU: 0 PID: 1 Comm: systemd Tainted: G      D W         5.4.0-next-20191204+ #75
  [  238.340139] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu4
  [  238.341121] Call Trace:
  [  238.341337]  dump_stack+0x8f/0xd0
  [  238.341630]  dump_header+0x61/0x5ea
  [  238.341942]  oom_kill_process.cold+0xb/0x10
  [  238.342299]  out_of_memory+0x24d/0x5a0
  [  238.342625]  __alloc_pages_slowpath+0xd12/0x1020
  [  238.343024]  __alloc_pages_nodemask+0x391/0x410
  [  238.343407]  pagecache_get_page+0xc3/0x3a0
  [  238.343757]  filemap_fault+0x804/0xc30
  [  238.344083]  ? ext4_filemap_fault+0x28/0x42
  [  238.344444]  ext4_filemap_fault+0x30/0x42
  [  238.344789]  __do_fault+0x37/0x1a0
  [  238.345087]  __handle_mm_fault+0x104d/0x1ab0
  [  238.345450]  handle_mm_fault+0x169/0x360
  [  238.345790]  do_user_addr_fault+0x20d/0x490
  [  238.346154]  do_page_fault+0x31/0x210
  [  238.346468]  async_page_fault+0x43/0x50
  [  238.346797] RIP: 0033:0x7f47eba4197e
  [  238.347110] Code: Bad RIP value.
  [  238.347387] RSP: 002b:00007ffd7c0c1890 EFLAGS: 00010293
  [  238.347834] RAX: 0000000000000002 RBX: 000055d196a20a20 RCX: 00007f47eba4197e
  [  238.348437] RDX: 0000000000000033 RSI: 00007ffd7c0c18c0 RDI: 0000000000000004
  [  238.349047] RBP: 00007ffd7c0c1c20 R08: 0000000000000000 R09: 0000000000000033
  [  238.349660] R10: 00000000ffffffff R11: 0000000000000293 R12: 0000000000000001
  [  238.350261] R13: ffffffffffffffff R14: 0000000000000000 R15: 00007ffd7c0c18c0
  [  238.350878] Mem-Info:
  [  238.351085] active_anon:3121 inactive_anon:51 isolated_anon:0
  [  238.351085]  active_file:12 inactive_file:7 isolated_file:0
  [  238.351085]  unevictable:0 dirty:0 writeback:0 unstable:0
  [  238.351085]  slab_reclaimable:5565 slab_unreclaimable:10170
  [  238.351085]  mapped:3 shmem:111 pagetables:155 bounce:0
  [  238.351085]  free:720717 free_pcp:2 free_cma:0
  [  238.353757] Node 0 active_anon:12484kB inactive_anon:204kB active_file:48kB inactive_file:28kB unevictable:0kB iss
  [  238.355979] Node 0 DMA free:11556kB min:36kB low:48kB high:60kB reserved_highatomic:0KB active_anon:152kB inactivB
  [  238.358345] lowmem_reserve[]: 0 2955 2884 2884 2884
  [  238.358761] Node 0 DMA32 free:2677864kB min:7004kB low:10028kB high:13052kB reserved_highatomic:0KB active_anon:0B
  [  238.361202] lowmem_reserve[]: 0 0 72057594037927865 72057594037927865 72057594037927865
  [  238.361888] Node 0 Normal free:193448kB min:99395541895224kB low:73886371836733356kB high:147673348131571488kB reB
  [  238.364765] lowmem_reserve[]: 0 0 0 0 0
  [  238.365101] Node 0 DMA: 7*4kB (U) 5*8kB (UE) 6*16kB (UME) 2*32kB (UM) 1*64kB (U) 2*128kB (UE) 3*256kB (UME) 2*512B
  [  238.366379] Node 0 DMA32: 0*4kB 1*8kB (U) 2*16kB (UM) 2*32kB (UM) 2*64kB (UM) 1*128kB (U) 1*256kB (U) 1*512kB (U)B
  [  238.367654] Node 0 Normal: 1985*4kB (UME) 1321*8kB (UME) 844*16kB (UME) 524*32kB (UME) 300*64kB (UME) 138*128kB (B
  [  238.369184] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
  [  238.369915] 130 total pagecache pages
  [  238.370241] 0 pages in swap cache
  [  238.370533] Swap cache stats: add 0, delete 0, find 0/0
  [  238.370981] Free swap  = 0kB
  [  238.371239] Total swap = 0kB
  [  238.371488] 1048445 pages RAM
  [  238.371756] 0 pages HighMem/MovableOnly
  [  238.372090] 306992 pages reserved
  [  238.372376] 0 pages cma reserved
  [  238.372661] 0 pages hwpoisoned

In another instance (older kernel), I was able to observe this
(negative page count :/):
  [  180.896971] Offlined Pages 32768
  [  182.667462] Offlined Pages 32768
  [  184.408117] Offlined Pages 32768
  [  186.026321] Offlined Pages 32768
  [  187.684861] Offlined Pages 32768
  [  189.227013] Offlined Pages 32768
  [  190.830303] Offlined Pages 32768
  [  190.833071] Built 1 zonelists, mobility grouping on.  Total pages: -36920272750453009

In another instance (older kernel), I was no longer able to start any
process:
  [root@vm ~]# [  214.348068] Offlined Pages 32768
  [  215.973009] Offlined Pages 32768
  cat /proc/meminfo
  -bash: fork: Cannot allocate memory
  [root@vm ~]# cat /proc/meminfo
  -bash: fork: Cannot allocate memory

Fix it by properly adjusting the managed page count when migrating if
the zone changed. The managed page count of the zones now looks after
unplug of the DIMM (and after deflating the balloon) just like before
inflating the balloon (and plugging+onlining the DIMM).

We'll temporarily modify the totalram page count. If this ever becomes a
problem, we can fine tune by providing helpers that don't touch
the totalram pages (e.g., adjust_zone_managed_page_count()).

Please note that fixing up the managed page count is only necessary when
we adjusted the managed page count when inflating - only if we
don't have VIRTIO_BALLOON_F_DEFLATE_ON_OOM. With that feature, the
managed page count is not touched when inflating/deflating.

Reported-by: Yumei Huang <yuhuang@redhat.com>
Fixes: 3dcc0571cd64 ("mm: correctly update zone->managed_pages")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Jiang Liu <liuj97@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
[bwh: Backported to 3.16: Deflate-on-OOM is not supported at all so don't
 check that flag]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -403,6 +403,16 @@ static int virtballoon_migratepage(struc
 
 	get_page(newpage); /* balloon reference */
 
+	/*
+	  * When we migrate a page to a different zone and adjusted the
+	  * managed page count when inflating, we have to fixup the count of
+	  * both involved zones.
+	  */
+	if (page_zone(page) != page_zone(newpage)) {
+		adjust_managed_page_count(page, 1);
+		adjust_managed_page_count(newpage, -1);
+	}
+
 	/* balloon's page migration 1st step  -- inflate "newpage" */
 	spin_lock_irqsave(&vb_dev_info->pages_lock, flags);
 	balloon_page_insert(newpage, mapping, &vb_dev_info->pages);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
