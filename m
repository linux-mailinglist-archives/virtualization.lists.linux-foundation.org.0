Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784D18079D
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 20:05:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8C9C421543;
	Tue, 10 Mar 2020 19:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqBia1g823F6; Tue, 10 Mar 2020 19:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2561020442;
	Tue, 10 Mar 2020 19:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13F96C0177;
	Tue, 10 Mar 2020 19:05:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F75EC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EDC7C875FB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Deyd2Wjawt4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3A3EB875EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 19:05:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w12so5799903pll.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=v8GsiRik2mrX2L1ExptNFr8axv3wfoWM2X7VsCOjmKw=;
 b=jiD4hzkPe1Bx8wT0mrrukaMqHcSnjl3SW+PpVZW7NLFmNMmtXoMw2MQB4JIGlXUAoz
 PGdnwyNhU16axQ5mvCNaMXP0h+kzvPzKSQ+EkfkNirhZccYmQV/jihjJUubruSvCKerK
 Ggb1XpUS5kj17Rpt3/DLCPtsHy0wzFT8wFZHvYE9f5Dq1Jpqi6nqX+OJ8YXc1T4qJV4L
 ePcohJ846/f7iwq/rryRQN8QwD9POr/lMjiyrByRdkTIMHUiAmKWL4pSS7DJnz9QgIWG
 ARAIw8Qv4YyRSFfm4ANDKsGvJdV2kBURKKuqTthcsVIQXcF8m1+HoeB+hs8q9I903/OF
 VJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=v8GsiRik2mrX2L1ExptNFr8axv3wfoWM2X7VsCOjmKw=;
 b=cj9P9HtRNqUAzgPO1YjF3UbwDLo0BKJD3rasAOZbXlFDcxN3WivTqTWiZrFUlwS9sG
 oawEcZjqtzsZDhJnufp7Kq2A/UuokAVaDvU/eJM0iFnEfxJx/Em9/v37PQt1/a+zxstg
 AucN/SETpfzIxvsIMokcr2nNIdna8aGDClo8RwthFobWUSYyr7CxAggLI7jhOA3YXbZr
 VA9/dzRU1H2yFivozy/z1ovtS75iplki0tsRmP9Jgz5GhRnAFMyL3WGSRtfptPn0OD6Y
 WrP0NKIlzx+8QGThCCurOZ983tw7rrUUQjCWsuE0nnr8H4scNamGbSudE8aJnCDNlbfq
 j9WA==
X-Gm-Message-State: ANhLgQ2z5GkspjtJz6DppBLY+WRgnFgfpY5RO3sVuzgGYBnYspQiLYJO
 pVLu8NT1x8z+3GkShLZNFKNtvA==
X-Google-Smtp-Source: ADFU+vv3mVq93iP5Eam0h9fV6x3EIyC6U+vBhRlKIxBX+AVcP5oHlIrtsSv1JHwo1ZRt8kGQSLAx6Q==
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr3072909pjs.69.1583867134456; 
 Tue, 10 Mar 2020 12:05:34 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id j2sm13584896pfg.169.2020.03.10.12.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 12:05:33 -0700 (PDT)
Date: Tue, 10 Mar 2020 12:05:33 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
In-Reply-To: <20200310113854.11515-1-david@redhat.com>
Message-ID: <alpine.DEB.2.21.2003101204590.90377@chino.kir.corp.google.com>
References: <20200310113854.11515-1-david@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
From: David Rientjes via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 10 Mar 2020, David Hildenbrand wrote:

> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> changed the behavior when deflation happens automatically. Instead of
> deflating when called by the OOM handler, the shrinker is used.
> 
> However, the balloon is not simply some other slab cache that should be
> shrunk when under memory pressure. The shrinker does not have a concept of
> priorities yet, so this behavior cannot be configured. Eventually once
> that is in place, we might want to switch back after doing proper
> testing.
> 
> There was a report that this results in undesired side effects when
> inflating the balloon to shrink the page cache. [1]
> 	"When inflating the balloon against page cache (i.e. no free memory
> 	 remains) vmscan.c will both shrink page cache, but also invoke the
> 	 shrinkers -- including the balloon's shrinker. So the balloon
> 	 driver allocates memory which requires reclaim, vmscan gets this
> 	 memory by shrinking the balloon, and then the driver adds the
> 	 memory back to the balloon. Basically a busy no-op."
> 
> The name "deflate on OOM" makes it pretty clear when deflation should
> happen - after other approaches to reclaim memory failed, not while
> reclaiming. This allows to minimize the footprint of a guest - memory
> will only be taken out of the balloon when really needed.
> 
> Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
> this has no such side effects. Always register the shrinker with
> VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
> pages that are still to be processed by the guest. The hypervisor takes
> care of identifying and resolving possible races between processing a
> hinting request and the guest reusing a page.
> 
> In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> notifier with shrinker"), don't add a moodule parameter to configure the
> number of pages to deflate on OOM. Can be re-added if really needed.
> Also, pay attention that leak_balloon() returns the number of 4k pages -
> convert it properly in virtio_balloon_oom_notify().
> 
> Testing done by Tyler for future reference:
>   Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
>   GB file full of random bytes that we continually cat to /dev/null.
>   This fills the page cache as the file is read. Meanwhile we trigger
>   the balloon to inflate, with a target size of 53 GB. This setup causes
>   the balloon inflation to pressure the page cache as the page cache is
>   also trying to grow. Afterwards we shrink the balloon back to zero (so
>   total deflate = total inflate).
> 
>   Without patch (kernel 4.19.0-5):
>   Inflation never reaches the target until we stop the "cat file >
>   /dev/null" process. Total inflation time was 542 seconds. The longest
>   period that made no net forward progress was 315 seconds (see attached
>   graph).
>   Result of "grep balloon /proc/vmstat" after the test:
>   balloon_inflate 154828377
>   balloon_deflate 154828377
> 
>   With patch (kernel 5.6.0-rc4+):
>   Total inflation duration was 63 seconds. No deflate-queue activity
>   occurs when pressuring the page-cache.
>   Result of "grep balloon /proc/vmstat" after the test:
>   balloon_inflate 12968539
>   balloon_deflate 12968539
> 
>   Conclusion: This patch fixes the issue. In the test it reduced
>   inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
>   But more importantly, if we hadn't killed the "grep balloon
>   /proc/vmstat" process then, without the patch, the inflation process
>   would never reach the target.
> 
> [1] https://www.spinics.net/lists/linux-virtualization/msg40863.html
> 
> Reported-by: Tyler Sanderson <tysand@google.com>
> Tested-by: Tyler Sanderson <tysand@google.com>
> Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: David Rientjes <rientjes@google.com>

Should this have:

Cc: stable@vger.kernel.org # 4.19+

?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
