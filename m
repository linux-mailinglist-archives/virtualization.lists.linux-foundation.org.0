Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 905111807B7
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 20:13:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4402A87557;
	Tue, 10 Mar 2020 19:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGFr2haOlTcL; Tue, 10 Mar 2020 19:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D4E3874B3;
	Tue, 10 Mar 2020 19:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A964C0177;
	Tue, 10 Mar 2020 19:13:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70A29C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4EC42203A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hz9h62OXb1e7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:13:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id A3A7520392
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583867613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QW5g7lbmMvTsHzYHlNqdZQJfE2pRMb6b/7YHKXkWnFI=;
 b=Uk3i+0HggwS7vZBgll7jGlQ+OddxbUYE4oyLr3kGmSgPvS4h/LWJoKE6EmIaLmVmrMvLa+
 mYFX4LPkFhcyO63LUj6MvbTFxFLRoLD/zxdXCayG2ey5jzdh4Kuo3kkvFHq1eEGv73K6V6
 Rl6F3v6Wdy5l/Q+8aZjcRbCsmD/PcRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-P4jqKqzSNMWqPo85VCXTUA-1; Tue, 10 Mar 2020 15:13:27 -0400
X-MC-Unique: P4jqKqzSNMWqPo85VCXTUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2E4213F7;
 Tue, 10 Mar 2020 19:13:25 +0000 (UTC)
Received: from [10.36.116.71] (ovpn-116-71.ams2.redhat.com [10.36.116.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 315BD84779;
 Tue, 10 Mar 2020 19:13:20 +0000 (UTC)
Subject: Re: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
To: David Rientjes <rientjes@google.com>
References: <20200310113854.11515-1-david@redhat.com>
 <alpine.DEB.2.21.2003101204590.90377@chino.kir.corp.google.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <890da35b-1ac2-9c2e-b42d-96d24d3e0f4c@redhat.com>
Date: Tue, 10 Mar 2020 20:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003101204590.90377@chino.kir.corp.google.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

On 10.03.20 20:05, David Rientjes wrote:
> On Tue, 10 Mar 2020, David Hildenbrand wrote:
> 
>> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
>> changed the behavior when deflation happens automatically. Instead of
>> deflating when called by the OOM handler, the shrinker is used.
>>
>> However, the balloon is not simply some other slab cache that should be
>> shrunk when under memory pressure. The shrinker does not have a concept of
>> priorities yet, so this behavior cannot be configured. Eventually once
>> that is in place, we might want to switch back after doing proper
>> testing.
>>
>> There was a report that this results in undesired side effects when
>> inflating the balloon to shrink the page cache. [1]
>> 	"When inflating the balloon against page cache (i.e. no free memory
>> 	 remains) vmscan.c will both shrink page cache, but also invoke the
>> 	 shrinkers -- including the balloon's shrinker. So the balloon
>> 	 driver allocates memory which requires reclaim, vmscan gets this
>> 	 memory by shrinking the balloon, and then the driver adds the
>> 	 memory back to the balloon. Basically a busy no-op."
>>
>> The name "deflate on OOM" makes it pretty clear when deflation should
>> happen - after other approaches to reclaim memory failed, not while
>> reclaiming. This allows to minimize the footprint of a guest - memory
>> will only be taken out of the balloon when really needed.
>>
>> Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
>> this has no such side effects. Always register the shrinker with
>> VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
>> pages that are still to be processed by the guest. The hypervisor takes
>> care of identifying and resolving possible races between processing a
>> hinting request and the guest reusing a page.
>>
>> In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
>> notifier with shrinker"), don't add a moodule parameter to configure the
>> number of pages to deflate on OOM. Can be re-added if really needed.
>> Also, pay attention that leak_balloon() returns the number of 4k pages -
>> convert it properly in virtio_balloon_oom_notify().
>>
>> Testing done by Tyler for future reference:
>>   Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
>>   GB file full of random bytes that we continually cat to /dev/null.
>>   This fills the page cache as the file is read. Meanwhile we trigger
>>   the balloon to inflate, with a target size of 53 GB. This setup causes
>>   the balloon inflation to pressure the page cache as the page cache is
>>   also trying to grow. Afterwards we shrink the balloon back to zero (so
>>   total deflate = total inflate).
>>
>>   Without patch (kernel 4.19.0-5):
>>   Inflation never reaches the target until we stop the "cat file >
>>   /dev/null" process. Total inflation time was 542 seconds. The longest
>>   period that made no net forward progress was 315 seconds (see attached
>>   graph).
>>   Result of "grep balloon /proc/vmstat" after the test:
>>   balloon_inflate 154828377
>>   balloon_deflate 154828377
>>
>>   With patch (kernel 5.6.0-rc4+):
>>   Total inflation duration was 63 seconds. No deflate-queue activity
>>   occurs when pressuring the page-cache.
>>   Result of "grep balloon /proc/vmstat" after the test:
>>   balloon_inflate 12968539
>>   balloon_deflate 12968539
>>
>>   Conclusion: This patch fixes the issue. In the test it reduced
>>   inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
>>   But more importantly, if we hadn't killed the "grep balloon
>>   /proc/vmstat" process then, without the patch, the inflation process
>>   would never reach the target.
>>
>> [1] https://www.spinics.net/lists/linux-virtualization/msg40863.html
>>
>> Reported-by: Tyler Sanderson <tysand@google.com>
>> Tested-by: Tyler Sanderson <tysand@google.com>
>> Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Wei Wang <wei.w.wang@intel.com>
>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> Cc: David Rientjes <rientjes@google.com>
>> Cc: Nadav Amit <namit@vmware.com>
>> Cc: Michal Hocko <mhocko@kernel.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Acked-by: David Rientjes <rientjes@google.com>
> 

Thanks!

> Should this have:
> 
> Cc: stable@vger.kernel.org # 4.19+

I guess as nothing will actually "crash" it's not worth stable.

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
