Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA211189FA
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:38:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF5AA876BF;
	Tue, 10 Dec 2019 13:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYtsUNVhmhIP; Tue, 10 Dec 2019 13:38:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFA48872E9;
	Tue, 10 Dec 2019 13:38:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2933C0881;
	Tue, 10 Dec 2019 13:38:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A31DC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95B3D869E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzk3vCQ2CdjF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F5D8868F4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575985119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ICU/qv3QFgBW4Idwiq/961SjK5Wrq/hnSWnvE7BJyKQ=;
 b=MnzrkO95exLljzLWs0MgCq7etcy7MmsD50QE1YiehkX8ZaV3ktumQ8ywoxnozEp1RPJFkJ
 c6b83jw2qI1BMk+wqcdRKPPNN2jC0ebFXbiD3QX7QUf6P311oPNjXa/cOzoKW63qSLDAtZ
 okM0NJymVqn7rFPMXwuTDKQ5Ss0m7G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-mIoTVwnTOzuiKQZOi3vAew-1; Tue, 10 Dec 2019 08:38:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6030A800EB8;
 Tue, 10 Dec 2019 13:38:34 +0000 (UTC)
Received: from [10.36.117.222] (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1038B19C69;
 Tue, 10 Dec 2019 13:38:29 +0000 (UTC)
Subject: Re: [PATCH] virtio-balloon: fix managed page counts when migrating
 pages between zones
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191204204807.8025-1-david@redhat.com>
 <20191210082940-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <707a8e63-ff71-1847-22cb-4880a566f3c5@redhat.com>
Date: Tue, 10 Dec 2019 14:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191210082940-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mIoTVwnTOzuiKQZOi3vAew-1
X-Mimecast-Spam-Score: 0
Cc: Yumei Huang <yuhuang@redhat.com>, linux-kernel@vger.kernel.org,
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

On 10.12.19 14:31, Michael S. Tsirkin wrote:
> On Wed, Dec 04, 2019 at 09:48:07PM +0100, David Hildenbrand wrote:
>> In case we have to migrate a ballon page to a newpage of another zone, the
>> managed page count of both zones is wrong. Paired with memory offlining
>> (which will adjust the managed page count), we can trigger kernel crashes
>> and all kinds of different symptoms.
>>
>> One way to reproduce:
>> 1. Start a QEMU guest with 4GB, no NUMA
>> 2. Hotplug a 1GB DIMM and only the memory to ZONE_NORMAL
>> 3. Inflate the balloon to 1GB
>> 4. Unplug the DIMM (be quick, otherwise unmovable data ends up on it)
>> 5. Observe /proc/zoneinfo
>>   Node 0, zone   Normal
>>     pages free     16810
>>           min      24848885473806
>>           low      18471592959183339
>>           high     36918337032892872
>>           spanned  262144
>>           present  262144
>>           managed  18446744073709533486
>> 6. Do anything that requires some memory (e.g., inflate the balloon some
>> more). The OOM goes crazy and the system crashes
>>   [  238.324946] Out of memory: Killed process 537 (login) total-vm:27584kB, anon-rss:860kB, file-rss:0kB, shmem-rss:00
>>   [  238.338585] systemd invoked oom-killer: gfp_mask=0x100cca(GFP_HIGHUSER_MOVABLE), order=0, oom_score_adj=0
>>   [  238.339420] CPU: 0 PID: 1 Comm: systemd Tainted: G      D W         5.4.0-next-20191204+ #75
>>   [  238.340139] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu4
>>   [  238.341121] Call Trace:
>>   [  238.341337]  dump_stack+0x8f/0xd0
>>   [  238.341630]  dump_header+0x61/0x5ea
>>   [  238.341942]  oom_kill_process.cold+0xb/0x10
>>   [  238.342299]  out_of_memory+0x24d/0x5a0
>>   [  238.342625]  __alloc_pages_slowpath+0xd12/0x1020
>>   [  238.343024]  __alloc_pages_nodemask+0x391/0x410
>>   [  238.343407]  pagecache_get_page+0xc3/0x3a0
>>   [  238.343757]  filemap_fault+0x804/0xc30
>>   [  238.344083]  ? ext4_filemap_fault+0x28/0x42
>>   [  238.344444]  ext4_filemap_fault+0x30/0x42
>>   [  238.344789]  __do_fault+0x37/0x1a0
>>   [  238.345087]  __handle_mm_fault+0x104d/0x1ab0
>>   [  238.345450]  handle_mm_fault+0x169/0x360
>>   [  238.345790]  do_user_addr_fault+0x20d/0x490
>>   [  238.346154]  do_page_fault+0x31/0x210
>>   [  238.346468]  async_page_fault+0x43/0x50
>>   [  238.346797] RIP: 0033:0x7f47eba4197e
>>   [  238.347110] Code: Bad RIP value.
>>   [  238.347387] RSP: 002b:00007ffd7c0c1890 EFLAGS: 00010293
>>   [  238.347834] RAX: 0000000000000002 RBX: 000055d196a20a20 RCX: 00007f47eba4197e
>>   [  238.348437] RDX: 0000000000000033 RSI: 00007ffd7c0c18c0 RDI: 0000000000000004
>>   [  238.349047] RBP: 00007ffd7c0c1c20 R08: 0000000000000000 R09: 0000000000000033
>>   [  238.349660] R10: 00000000ffffffff R11: 0000000000000293 R12: 0000000000000001
>>   [  238.350261] R13: ffffffffffffffff R14: 0000000000000000 R15: 00007ffd7c0c18c0
>>   [  238.350878] Mem-Info:
>>   [  238.351085] active_anon:3121 inactive_anon:51 isolated_anon:0
>>   [  238.351085]  active_file:12 inactive_file:7 isolated_file:0
>>   [  238.351085]  unevictable:0 dirty:0 writeback:0 unstable:0
>>   [  238.351085]  slab_reclaimable:5565 slab_unreclaimable:10170
>>   [  238.351085]  mapped:3 shmem:111 pagetables:155 bounce:0
>>   [  238.351085]  free:720717 free_pcp:2 free_cma:0
>>   [  238.353757] Node 0 active_anon:12484kB inactive_anon:204kB active_file:48kB inactive_file:28kB unevictable:0kB iss
>>   [  238.355979] Node 0 DMA free:11556kB min:36kB low:48kB high:60kB reserved_highatomic:0KB active_anon:152kB inactivB
>>   [  238.358345] lowmem_reserve[]: 0 2955 2884 2884 2884
>>   [  238.358761] Node 0 DMA32 free:2677864kB min:7004kB low:10028kB high:13052kB reserved_highatomic:0KB active_anon:0B
>>   [  238.361202] lowmem_reserve[]: 0 0 72057594037927865 72057594037927865 72057594037927865
>>   [  238.361888] Node 0 Normal free:193448kB min:99395541895224kB low:73886371836733356kB high:147673348131571488kB reB
>>   [  238.364765] lowmem_reserve[]: 0 0 0 0 0
>>   [  238.365101] Node 0 DMA: 7*4kB (U) 5*8kB (UE) 6*16kB (UME) 2*32kB (UM) 1*64kB (U) 2*128kB (UE) 3*256kB (UME) 2*512B
>>   [  238.366379] Node 0 DMA32: 0*4kB 1*8kB (U) 2*16kB (UM) 2*32kB (UM) 2*64kB (UM) 1*128kB (U) 1*256kB (U) 1*512kB (U)B
>>   [  238.367654] Node 0 Normal: 1985*4kB (UME) 1321*8kB (UME) 844*16kB (UME) 524*32kB (UME) 300*64kB (UME) 138*128kB (B
>>   [  238.369184] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
>>   [  238.369915] 130 total pagecache pages
>>   [  238.370241] 0 pages in swap cache
>>   [  238.370533] Swap cache stats: add 0, delete 0, find 0/0
>>   [  238.370981] Free swap  = 0kB
>>   [  238.371239] Total swap = 0kB
>>   [  238.371488] 1048445 pages RAM
>>   [  238.371756] 0 pages HighMem/MovableOnly
>>   [  238.372090] 306992 pages reserved
>>   [  238.372376] 0 pages cma reserved
>>   [  238.372661] 0 pages hwpoisoned
>>
>> In another instance (older kernel), I was able to observe this
>> (negative page count :/):
>>   [  180.896971] Offlined Pages 32768
>>   [  182.667462] Offlined Pages 32768
>>   [  184.408117] Offlined Pages 32768
>>   [  186.026321] Offlined Pages 32768
>>   [  187.684861] Offlined Pages 32768
>>   [  189.227013] Offlined Pages 32768
>>   [  190.830303] Offlined Pages 32768
>>   [  190.833071] Built 1 zonelists, mobility grouping on.  Total pages: -36920272750453009
>>
>> In another instance (older kernel), I was no longer able to start any
>> process:
>>   [root@vm ~]# [  214.348068] Offlined Pages 32768
>>   [  215.973009] Offlined Pages 32768
>>   cat /proc/meminfo
>>   -bash: fork: Cannot allocate memory
>>   [root@vm ~]# cat /proc/meminfo
>>   -bash: fork: Cannot allocate memory
>>
>> Fix it by properly adjusting the managed page count when migrating. The
>> managed page count of the zones now looks after unplug of the DIMM
>> (and after deflating the balloon) just like before inflating the balloon
>> (and plugging+onlining the DIMM).
>>
>> Reported-by: Yumei Huang <yuhuang@redhat.com>
>> Fixes: 3dcc0571cd64 ("mm: correctly update zone->managed_pages")
>> Cc: <stable@vger.kernel.org> # v3.11+
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Jiang Liu <liuj97@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: virtualization@lists.linux-foundation.org
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  drivers/virtio/virtio_balloon.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
>> index 15b7f1d8c334..1089b07679cf 100644
>> --- a/drivers/virtio/virtio_balloon.c
>> +++ b/drivers/virtio/virtio_balloon.c
>> @@ -742,6 +742,12 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
>>  
>>  	mutex_unlock(&vb->balloon_lock);
>>  
>> +	/* fixup the managed page count (esp. of the zone) */
>> +	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
> 
> That comment's isn't great ;) it repeats the obvious thing, but does

I don't think it's obvious that the zone is involved. Open for suggestions.

> not explain why it's done. Also, what does it have to do
> with VIRTIO_BALLOON_F_DEFLATE_ON_OOM?

As replied to Igor already, we only mess with the managed page count
when we don't have VIRTIO_BALLOON_F_DEFLATE_ON_OOM (check the other
callers in this file).

Please see v2 of this patch as well. Thanks


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
