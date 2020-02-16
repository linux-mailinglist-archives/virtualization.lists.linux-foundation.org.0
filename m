Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 06024160334
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 10:47:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A78EB877AE;
	Sun, 16 Feb 2020 09:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbv5t20X4cqW; Sun, 16 Feb 2020 09:47:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA66C877A0;
	Sun, 16 Feb 2020 09:47:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D17A8C013E;
	Sun, 16 Feb 2020 09:47:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01D72C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F24B886762
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtzTI9LR+qhp
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:47:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 097FF8583C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581846440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3c/WN0m/fSra0TkxvPfDqbPdSXCm+vdA6iOX3UjbCRY=;
 b=Yn1MoOVEGr6lVgT10N4xC6zcG6vNX4qoE0zBN0BFOXdLdqlea5y/Gt94sHPaKYHGbICTlX
 +60ENbVL1ZOT96+YamgIC4q0mCxKf/sZ9tatB5uVwC28llZFsT5OqvXA4NQ0Ql41l0BrYd
 zMFlClwjzrA5LeoaOHR9jiWABhvJBZE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-2Jow0kZQPaK5TlCvjzGk0g-1; Sun, 16 Feb 2020 04:47:17 -0500
Received: by mail-wr1-f70.google.com with SMTP id v17so7006997wrm.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 01:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3c/WN0m/fSra0TkxvPfDqbPdSXCm+vdA6iOX3UjbCRY=;
 b=dq9BS5BWE2uKlzTXxsI4gyLhRWGgc8552SKyfbNVh3u2owTFyMPMPrPTuTP+rpYozz
 UW34caTMUIdKDgaMaSI3Yu2FbBYRMkHfCfAU9nZt3h+zcdff+I9dpEi/lzX1TD6owHhw
 jTVySO704Bpcb7SSt8yc7eezzNWQi/DDXZ6yKV6zUZMXCUlvu2ZMtIJF4ZMJlHfmhhZH
 LqDtFNCP0liCW/b5TqBmGPfLLfsjqSuxrgYJTQLHUfMDmIHOTFcjiH0VzXV7Tjro9A2L
 gQ6ofRpwcN0pbEIvFF761dOBeH8J2bl5913L3lWguUnMYxklgfq5TC9TL+1lcCYjZ4/9
 chGw==
X-Gm-Message-State: APjAAAWi2Ns5LV1CVQIMHxktip4I8UPoNJHRDu6AkuWN0b4K0gdlpfSD
 jFIm2aWfWoHzWQVcQA5SYCB90pJskkMfkDfkW1zAzWxXyGrqjLo14j7l7aKX41HW4fei+fTn6le
 mUti541yQqkVP/OqCJcJ7fs9Zh21VI4SIOBsMNgfHoQ==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr14899129wra.8.1581846435946;
 Sun, 16 Feb 2020 01:47:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzG6RrsUSe8N2Fvm+d5duF0MuB1svG4/FyfcHkv6fRCRbqtrjKVH9j/IKcsdYDYK8VCFBolkQ==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr14899111wra.8.1581846435739;
 Sun, 16 Feb 2020 01:47:15 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 a16sm14989900wrx.87.2020.02.16.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 01:47:15 -0800 (PST)
Date: Sun, 16 Feb 2020 04:47:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200216044641-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
X-MC-Unique: 2Jow0kZQPaK5TlCvjzGk0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Tyler Sanderson <tysand@google.com>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Fri, Feb 14, 2020 at 10:51:43AM +0100, David Hildenbrand wrote:
> On 05.02.20 17:34, David Hildenbrand wrote:
> > Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> > changed the behavior when deflation happens automatically. Instead of
> > deflating when called by the OOM handler, the shrinker is used.
> > 
> > However, the balloon is not simply some slab cache that should be
> > shrunk when under memory pressure. The shrinker does not have a concept of
> > priorities, so this behavior cannot be configured.
> > 
> > There was a report that this results in undesired side effects when
> > inflating the balloon to shrink the page cache. [1]
> > 	"When inflating the balloon against page cache (i.e. no free memory
> > 	 remains) vmscan.c will both shrink page cache, but also invoke the
> > 	 shrinkers -- including the balloon's shrinker. So the balloon
> > 	 driver allocates memory which requires reclaim, vmscan gets this
> > 	 memory by shrinking the balloon, and then the driver adds the
> > 	 memory back to the balloon. Basically a busy no-op."
> > 
> > The name "deflate on OOM" makes it pretty clear when deflation should
> > happen - after other approaches to reclaim memory failed, not while
> > reclaiming. This allows to minimize the footprint of a guest - memory
> > will only be taken out of the balloon when really needed.
> > 
> > Especially, a drop_slab() will result in the whole balloon getting
> > deflated - undesired. While handling it via the OOM handler might not be
> > perfect, it keeps existing behavior. If we want a different behavior, then
> > we need a new feature bit and document it properly (although, there should
> > be a clear use case and the intended effects should be well described).
> > 
> > Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
> > this has no such side effects. Always register the shrinker with
> > VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
> > pages that are still to be processed by the guest. The hypervisor takes
> > care of identifying and resolving possible races between processing a
> > hinting request and the guest reusing a page.
> > 
> > In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> > notifier with shrinker"), don't add a moodule parameter to configure the
> > number of pages to deflate on OOM. Can be re-added if really needed.
> > Also, pay attention that leak_balloon() returns the number of 4k pages -
> > convert it properly in virtio_balloon_oom_notify().
> > 
> > Note1: using the OOM handler is frowned upon, but it really is what we
> >        need for this feature.
> > 
> > Note2: without VIRTIO_BALLOON_F_MUST_TELL_HOST (iow, always with QEMU) we
> >        could actually skip sending deflation requests to our hypervisor,
> >        making the OOM path *very* simple. Besically freeing pages and
> >        updating the balloon. If the communication with the host ever
> >        becomes a problem on this call path.
> > 
> 
> @Michael, how to proceed with this?
> 

I'd like to see some reports that this helps people.
e.g. a tested-by tag.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
