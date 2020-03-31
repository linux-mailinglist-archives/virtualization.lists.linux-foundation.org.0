Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498D1999A4
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 17:28:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFF598695F;
	Tue, 31 Mar 2020 15:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unhWOo4Wipr3; Tue, 31 Mar 2020 15:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDE198681B;
	Tue, 31 Mar 2020 15:28:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC489C07FF;
	Tue, 31 Mar 2020 15:28:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 723F0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 15:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F3AE864F3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 15:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYbLn0mpdnZA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 15:28:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7714C86483
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585668528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbjZ/8kYKp7eRMJMyV+34cf5N5B3hMsmVB1uhWILGRg=;
 b=J83VKOyh5usWlVEy/v56Tkqn/5Z+dKJgSNdugxjyaBtD2yJ3lD6CV99Cgf8Z/poYuPItSY
 0WKrOZYWEOmxc6HgAckycEAE2JcxpwHxYyTT2YkCgpyyPSigRRKOr4unzkXgGri23egAPZ
 XpR+BZzyIW43o2BkOisEYePcBeLMPv0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-6ptMItAuPHKG_nfBrfST_Q-1; Tue, 31 Mar 2020 11:28:46 -0400
X-MC-Unique: 6ptMItAuPHKG_nfBrfST_Q-1
Received: by mail-wr1-f70.google.com with SMTP id q14so3533138wro.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wbjZ/8kYKp7eRMJMyV+34cf5N5B3hMsmVB1uhWILGRg=;
 b=flNargPBM/Hj5k2yub4w6FT3937DOoKJGuNeCAwvpqfHl/KB5hHOAstU2YfIILdYuo
 4E7S4NDS0yMMtQ9SEPiWQ24Y0uyI8LD1pCYJnjPtB6C6VVRz1t4d4M6gJVWh+NoSzTHv
 RKMiEGedLrJokG9SwJxOGv8o0+almbH0NZrNwxkaTD3XbLmqq1NzKGpH2uMPEqMHDbaV
 2ZTC6iAiWOpAIeUsu6CD09hYCbrk8bxnAo6sjlZq4ppcX8jner3NJa9kScVxmhtclE0t
 6ys8D7cBZktaaXNq5wreVQ06wM2VPbwc8vOtvorWXWVAEvS0PalrcL/pr+/UB8pzUmoF
 hNjQ==
X-Gm-Message-State: ANhLgQ2bD+TPqjkf2l1XM8CG/TxVWQm5Y69xhfJFekJeu1vK4O+AEenh
 s6YpquUVIO/WVsOJ6ewhr5QRRka9FLnhcxBLBVRb7xhwoVr+G/no0/XbqD4JCZ4O71QnsrwG8Ft
 4eye39wA2Izzg1f573A+0BP2GN962p3Al4R1QSKOFUQ==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr4069849wmf.160.1585668525069; 
 Tue, 31 Mar 2020 08:28:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMBsfYL4fBH/dyfa7LMsqKN06EtOubW3BDQDDF16qT0lG1gYEHk80ZPDmqIeS9K1EOzGhzsw==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr4069822wmf.160.1585668524863; 
 Tue, 31 Mar 2020 08:28:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w7sm26825926wrr.60.2020.03.31.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 08:28:44 -0700 (PDT)
Date: Tue, 31 Mar 2020 11:28:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200331112730-mutt-send-email-mst@kernel.org>
References: <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
 <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
 <20200331101117-mutt-send-email-mst@kernel.org>
 <118bc13b-76b2-f5a1-6aca-65bd10a22f6c@redhat.com>
 <00dc8bad-05e5-6085-525c-ce9fded672cc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <00dc8bad-05e5-6085-525c-ce9fded672cc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

On Tue, Mar 31, 2020 at 04:34:48PM +0200, David Hildenbrand wrote:
> On 31.03.20 16:29, David Hildenbrand wrote:
> > On 31.03.20 16:18, Michael S. Tsirkin wrote:
> >> On Tue, Mar 31, 2020 at 04:09:59PM +0200, David Hildenbrand wrote:
> >>
> >> ...
> >>
> >>>>>>>>>>>>>> So if we want to address this, IMHO this calls for a new API.
> >>>>>>>>>>>>>> Along the lines of
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>    struct page *alloc_page_range(gfp_t gfp, unsigned int min_order,
> >>>>>>>>>>>>>>                    unsigned int max_order, unsigned int *order)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> the idea would then be to return at a number of pages in the given
> >>>>>>>>>>>>>> range.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> What do you think? Want to try implementing that?
> >>
> >> ..
> >>
> >>> I expect the whole "steal huge pages from your guest" to be problematic,
> >>> as I already mentioned to Alex. This needs a performance evaluation.
> >>>
> >>> This all smells like a lot of workload dependent fine-tuning. :)
> >>
> >>
> >> So that's why I proposed the API above.
> >>
> >> The idea is that *if we are allocating a huge page anyway*,
> >> rather than break it up let's send it whole to the device.
> >> If we have smaller pages, return smaller pages.
> >>
> > 
> > Sorry, I still fail to see why you cannot do that with my version of
> > balloon_pages_alloc(). But maybe I haven't understood the magic you
> > expect to happen in alloc_page_range() :)
> > 
> > It's just going via a different inflate queue once we have that page, as
> > I stated in front of my draft patch "but with an
> > optimized reporting interface".
> > 
> >> That seems like it would always be an improvement, whatever the
> >> workload.
> >>
> > 
> > Don't think so. Assume there are plenty of 4k pages lying around. It
> > might actually be *bad* for guest performance if you take a huge page
> > instead of all the leftover 4k pages that cannot be merged. Only at the
> > point where you would want to break a bigger page up and report it in
> > pieces, where it would definitely make no difference.
> 
> I just understood what you mean :) and now it makes sense - it avoids
> exactly that. Basically
> 
> 1. Try to allocate order-0. No split necessary? return the page
> 2. Try to allocate order-1. No split necessary? return the page
> ...
> 
> up to MAX_ORDER - 1.
> 
> Yeah, I guess this will need a new kernel API.

Exactly what I meant. And whever we fail and block for reclaim, we
restart this.

> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
