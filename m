Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCEF1B0C9A
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 15:28:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4522385D90;
	Mon, 20 Apr 2020 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-eCKDV3wArX; Mon, 20 Apr 2020 13:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BC5985D7D;
	Mon, 20 Apr 2020 13:28:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56104C0177;
	Mon, 20 Apr 2020 13:28:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2331BC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1BA4B2040D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nElgTxpSorLQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:28:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D91F020035
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587389301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZZVQvohHU0YXRihexRS8tCu9Lmw/x2owH09F+zRYmX8=;
 b=JxjuPVxSW3xLIzPGdcbEFHRMk4F5xWSYaP7aztl8/y6xKtrlvImTbqL8z9MLL26E9j4wkJ
 SOzHDqNxPSvfl4Ar9NhRnn0s0bf7zFiVVsNMuZp/OnhkNjwENZiPo5nRBCch0XmxrSbx+E
 2jLCE0YCuZS0YNGavqEEJsHNlU3kIQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-aQQe-vTuP22ZaqlfKgl__g-1; Mon, 20 Apr 2020 09:28:19 -0400
X-MC-Unique: aQQe-vTuP22ZaqlfKgl__g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2FF4802561;
 Mon, 20 Apr 2020 13:28:18 +0000 (UTC)
Received: from [10.36.114.7] (ovpn-114-7.ams2.redhat.com [10.36.114.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 174EA10013A1;
 Mon, 20 Apr 2020 13:28:14 +0000 (UTC)
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
To: Alexander Duyck <alexander.duyck@gmail.com>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
 <CAKgT0UdV5+yknti+W4jDLmo9CH+BeS82pm9vDcy47nV8pkEwcw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <93ccb738-4480-4c31-69c9-5fc349e2a278@redhat.com>
Date: Mon, 20 Apr 2020 15:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0UdV5+yknti+W4jDLmo9CH+BeS82pm9vDcy47nV8pkEwcw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

>>> Now we are talking about what's safe to do with the page.
>>>
>>> If POISON flag is set by hypervisor but clear by guest,
>>> or poison_val is 0, then it's clear it's safe to blow
>>> away the page if we can figure out it's unused.
>>>
>>> Otherwise, it's much less clear :)
>>
>> Hah! Agreed :D
> 
> That isn't quite true. The problem is in the case of hinting it isn't
> setting the page to 0. It is simply not migrating it. So if there is
> data from an earlier pass it is stuck at that value. So the balloon
> will see the poison/init on some pages cleared, however I suppose the
> balloon doesn't care about the contents of the page. For the pages
> that are leaked back out via the shrinker they will be dirtied so they
> will end up being migrated with the correct value eventually.

Right, I think current Linux guests are fine. The critical piece we are
talking about is

1) Guest balloon allocates and hints a page
2) Hypervisor does not process hinting request
3) Guest frees the page and reuses it (especially, writes it).
4) Hypervisor processes the hinting request.

AFAIU, as soon as the guest writes the page (e.g., zeroes it/poisons it
in the buddy, or somebody who allocated it), the page *will* get
migrated, even if 4) happens after 3). That's guaranteed by the 2-bitmap
magic.



Now, assume the following happens (in some future Linux version) (due to
your "simply not migrating it" comment):

1) Guest balloon allocates and hints a page. Assume the page is zero due
to want_init_on_free().
2) Hypervisor processes the hinting request.
3) Guest frees the page. Assume we are implementing some magic to "skip"
zeroing, as we assume it is still zero.

Due to 2), the page won't get migrated. In 3) we expect the page to be
0. QEMU would have to make sure that we always get either the original,
or a zero page on the destination. Otherwise, this smells like data
corruption.


> 
>>> I'll have to come back and re-read the rest next week, this
>>> is complex stuff and I'm too rushed with other things today.
>>
>> Yeah, I'm also loaded with other stuff. Maybe Alex has time to
>> understand the details as well.
> 
> So after looking it over again it makes a bit more sense why this
> hasn't caused any issues so far, and I can see why the poison enabled
> setup and hinting can work. The problem is I am left wondering what
> assumptions we are allowed to leave in place.
> 
> 1. Can we assume that we don't care about the contents in the pages in
> the balloon changing?

I think, we should define valid ways for the hypervisor to change it.

"Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT might get replaced by
a zero page. However, as soon as the page is written by the guest (even
before the hinting request was processed by the host), the modified page
will stay - whereby the unwritten parts might either be from the old, or
from the zero page."

I think the debatable part is "whereby the unwritten parts might either
be from the old, or from the zero page". AFAIU, you think it could
happen in QEMU, that we have neither the old, nor the zero page, but
instead some previous content. The question is if that's valid, or if
that's a BUG in QEMU. If it's valid, we can do no optimizations in the
guest (e.g., skip zeroing in the buddy). And I agree that this smells
like "data corruption" as Michael said.


> 2. Can we assume that the guest will always rewrite the page after the
> deflate in the case of init_on_free or poison?

Depends on what we think is the right way to do - IOW if we think "some
other content" as mentioned above is a BUG or not.

> 3. Can we assume that free page hinting will always function as a
> balloon setup, so no moving it over to a page reporting type setup?

I think we have to define the valid semantics. That implies what would
be valid to do with it. Unfortunately, we have to reverse-engineer here.

> 
> If we assume the above 3 items then there isn't any point in worrying
> about poison when it comes to free page hinting. It doesn't make sense
> to since they essentially negate it. As such I could go through this
> patch and the QEMU patches and clean up any associations since the to
> are not really tied together in any way.

The big question is, if we want to support VIRTIO_BALLOON_F_PAGE_POISON
with free page hinting. e.g.,:

"Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT might get replaced by
a page full of X. However, as soon as the page is written by the guest
(even before the hinting request was processed by the host), the
modified page will stay - whereby the unwritten parts might either be
from the old, or from a page filled with X. Without
VIRTIO_BALLOON_F_PAGE_POISON, X is zero, otherwise it is poison_val."

The current QEMU implementation would be to simply migrate all hinted
pages. In the future we could optimize. Not sure if it's worth the trouble.

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
