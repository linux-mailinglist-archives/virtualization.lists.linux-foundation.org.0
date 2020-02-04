Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E71151E81
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 17:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2835E84EB9;
	Tue,  4 Feb 2020 16:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HeX1xZiXH+6; Tue,  4 Feb 2020 16:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EFC884016;
	Tue,  4 Feb 2020 16:50:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAE2AC0174;
	Tue,  4 Feb 2020 16:50:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1D0DC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DA2CD85E7C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 16:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24EgyFpv4MAV
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 16:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B948385DE0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 16:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580835027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=33tLdh2GltAiz5pndS3UXxNtn0Ze5hBZUDNBHu9k9MY=;
 b=Z8T/acYgCiukZLjFH+jszgJa96GBZbfqpkG9J68um5nhqsbjk6P2IRkPU7ROYYxQK8mMeL
 ngg6IjiFeVN2S4dxmffYgsZsH9mbLMt200KBn8TUnWmG/O2vHna1SZhcG7+LhwW+cLK39Q
 elv6IhoG3eOOvuaO5E3GHiRMvCtGkc4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-X2C7rHRkMQivGNrwwWXRHQ-1; Tue, 04 Feb 2020 11:50:26 -0500
Received: by mail-qt1-f200.google.com with SMTP id t4so12761440qtd.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 08:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=33tLdh2GltAiz5pndS3UXxNtn0Ze5hBZUDNBHu9k9MY=;
 b=bub9JqGaAcq8hiX4oWw3UpkXKACp5ePGypvOaBMZL/MhIACLn2NJQJQnGJn9c+9U1C
 BmGhqw1d4rSSjqg6cBuLgUO6KuO2u+EyVzw9SpRNqkN52RH0Bqpk8G/K8UQseqNkGffe
 3FrLpva2/0Vk9tCZOlfi90pHa+JUYjwnd/YZ43LapQ+pGo/pj9Kl9XU5ELEDlaYoY0bv
 I18QuVruu46ciJRjvBSFuVcl7TTZ0l1SIk6UCkHaMW06wJkPOGVzu2A9FQXa2YQdEMOl
 E3aiVdjEXgTkKWkk91pG7QnWykbnLbCVb4eNb0i8mGC97YXapnQHY+fqxPD7PV5Dz1jd
 4Rsg==
X-Gm-Message-State: APjAAAWPaPdrQnNx4RznGMpFmI+g7I0EH5XKADKt8nqzMW0YObzonNJ7
 +oBWLT7iu6FF1GzXrXwB1b0sm29Mp/x67CT6/K4kAXfLARxcrAGvDLlPBLCzORLk5lvKjm59aNn
 eqRiz9Xp82C3qcwrg2XMHIezUJfKx6X225Xr/xo/2Iw==
X-Received: by 2002:ac8:5149:: with SMTP id h9mr29597983qtn.123.1580835025494; 
 Tue, 04 Feb 2020 08:50:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkZGN4l+MS+r8NdRjTaKfTv3b91i9pRUKwIyWvPi+sOl829vka10ykcKudAzcuY3xKv1kS4g==
X-Received: by 2002:ac8:5149:: with SMTP id h9mr29597929qtn.123.1580835024810; 
 Tue, 04 Feb 2020 08:50:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id p126sm11126768qke.108.2020.02.04.08.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 08:50:23 -0800 (PST)
Date: Tue, 4 Feb 2020 11:50:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200204114336-mutt-send-email-mst@kernel.org>
References: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
X-MC-Unique: X2C7rHRkMQivGNrwwWXRHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
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

On Tue, Feb 04, 2020 at 03:30:19PM +0100, David Hildenbrand wrote:
> On 04.02.20 09:40, Michael S. Tsirkin wrote:
> > On Tue, Feb 04, 2020 at 09:35:21AM +0100, David Hildenbrand wrote:
> >>>>> I would say reverting probably makes sense. I'm not sure there is much
> >>>>> value to having a shrinker running deflation when you are actively trying
> >>>>> to increase the balloon. It would make more sense to wait until you are
> >>>>> actually about to start hitting oom.
> >>>>
> >>>> I think the shrinker makes sense for free page hinting feature
> >>>> (everything on free_page_list).
> >>>>
> >>>> So instead of only reverting, I think we should split it up and always
> >>>> register the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT and the OOM
> >>>> notifier (as before) for VIRTIO_BALLOON_F_MUST_TELL_HOST.
> >>
> >> s/VIRTIO_BALLOON_F_MUST_TELL_HOST/VIRTIO_BALLOON_F_DEFLATE_ON_OOM/
> >>
> >> :)
> > 
> > Well VIRTIO_BALLOON_F_MUST_TELL_HOST is also broken by shrinker
> > with VIRTIO_BALLOON_F_FREE_PAGE_HINT as that code adds buffers
> > but does not wait for them to be used even with VIRTIO_BALLOON_F_MUST_TELL_HOST.
> > We never noticed because QEMU does not advertize
> > VIRTIO_BALLOON_F_MUST_TELL_HOST.
> 
> So, I am trying to understand how the code is intended to work, but I
> am afraid I am missing something (or to rephrase: I think I found a BUG :) and
> there is lack of proper documentation about this feature).
> 
> a) We allocate pages and add them to the list as long as we are told to do so.
>    We send these pages to the host one by one.
> b) We free all pages once we get a STOP signal. Until then, we keep pages allocated.
> c) When called via the shrinker, we want to free pages from the list, even
> though the hypervisor did not notify us to do so.
> 
> 
> Issue 1: When we unload the balloon driver in the guest in an unlucky event,
> we won't free the pages. We are missing something like (if I am not wrong):
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index b1d2068fa2bd..e2b0925e1e83 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -929,6 +929,10 @@ static void remove_common(struct virtio_balloon *vb)
>                 leak_balloon(vb, vb->num_pages);
>         update_balloon_size(vb);
>  
> +       /* There might be free pages that are being reported: release them. */
> +       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> +               return_free_pages_to_mm(vb, ULONG_MAX);
> +
>         /* Now we reset the device so we can clean up the queues. */
>         vb->vdev->config->reset(vb->vdev);


Indeed.

> 
> Issue 2: When called via the shrinker, (but also to fix Issue 1), it could be
> that we do have VIRTIO_BALLOON_F_MUST_TELL_HOST. I assume this means
> (-ENOCLUE) that we have to wait until the hypervisor notifies us via the STOP? Or
> for which event do we have to wait? Because there is no way to *tell host* here
> that we want to reuse a page. The hypervisor will *tell us* when we can reuse pages.
> For the shrinker it is simple: Don't use the shrinker with
> VIRTIO_BALLOON_F_MUST_TELL_HOST :) . But to fix Issue 1, we *would* have to wait
> until we get a STOP signal. That is not really possible because it might
> take an infinite amount of time.
> 
> Michael, any clue on which event we have to wait with
> VIRTIO_BALLOON_F_MUST_TELL_HOST? IMHO, I don't think
> VIRTIO_BALLOON_F_MUST_TELL_HOST applies to VIRTIO_BALLOON_F_FREE_PAGE_HINT and
> we'd better document that. It introduces complexity with no clear benefit.

I meant that we must wait for host to see the hint. Signalled via using
the buffer.  But maybe that's too far in the meaning from
VIRTIO_BALLOON_F_MUST_TELL_HOST and we need a separate new flag for
that. Then current code won't be broken (yay!) but we need to
document another flag that's pretty similar.

> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
