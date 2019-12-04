Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8C1136BB
	for <lists.virtualization@lfdr.de>; Wed,  4 Dec 2019 21:48:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78A50884F0;
	Wed,  4 Dec 2019 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zQxhVOuvKWw; Wed,  4 Dec 2019 20:48:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A87CD8850A;
	Wed,  4 Dec 2019 20:48:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74359C077D;
	Wed,  4 Dec 2019 20:48:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7CB9C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 20:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A3D9187D36
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 20:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmYRYTB2NJle
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 20:48:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A22CB87678
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575492499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HGdo0QqEvgrVy6Dmn+cWHHGQsiAPEZt7SK6V5tCrwOc=;
 b=gdlRrs8iKDoB6WHPw1NCdt6h51cYhTkB1kXRzh1CeeVtFY6P8eaugSxRA6RMAoqRhd8zwI
 WiAfrIkoryynVp2WxgEQafrGN76dZOmzG7jme3jjNd++o1Z/d+azzyudgJfcFiaNJhPIJi
 9/KBvLqgWdGHxFOzu+MqWa0nCFg6t/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-SaLO2BmOPTq01o2R3QT5JQ-1; Wed, 04 Dec 2019 15:48:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C6619057A1;
 Wed,  4 Dec 2019 20:48:14 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-80.ams2.redhat.com [10.36.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF40F1001B28;
 Wed,  4 Dec 2019 20:48:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio-balloon: fix managed page counts when migrating pages
 between zones
Date: Wed,  4 Dec 2019 21:48:07 +0100
Message-Id: <20191204204807.8025-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: SaLO2BmOPTq01o2R3QT5JQ-1
X-Mimecast-Spam-Score: 0
Cc: Yumei Huang <yuhuang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Jiang Liu <liuj97@gmail.com>
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

In case we have to migrate a ballon page to a newpage of another zone, the
managed page count of both zones is wrong. Paired with memory offlining
(which will adjust the managed page count), we can trigger kernel crashes
and all kinds of different symptoms.

One way to reproduce:
1. Start a QEMU guest with 4GB, no NUMA
2. Hotplug a 1GB DIMM and only the memory to ZONE_NORMAL
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

Fix it by properly adjusting the managed page count when migrating. The
managed page count of the zones now looks after unplug of the DIMM
(and after deflating the balloon) just like before inflating the balloon
(and plugging+onlining the DIMM).

Reported-by: Yumei Huang <yuhuang@redhat.com>
Fixes: 3dcc0571cd64 ("mm: correctly update zone->managed_pages")
Cc: <stable@vger.kernel.org> # v3.11+
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Jiang Liu <liuj97@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 15b7f1d8c334..1089b07679cf 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -742,6 +742,12 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 
 	mutex_unlock(&vb->balloon_lock);
 
+	/* fixup the managed page count (esp. of the zone) */
+	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
+		adjust_managed_page_count(page, 1);
+		adjust_managed_page_count(newpage, -1);
+	}
+
 	put_page(page); /* balloon reference */
 
 	return MIGRATEPAGE_SUCCESS;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
