Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 406881E2525
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 17:13:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9326F86208;
	Tue, 26 May 2020 15:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tW6jMqnmJbEF; Tue, 26 May 2020 15:13:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 005F286211;
	Tue, 26 May 2020 15:13:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC1A0C016F;
	Tue, 26 May 2020 15:13:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB0E1C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 15:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9984D86204
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 15:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iFG83uZ-wjh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 15:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E39AC861F4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 15:13:21 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j8so22303198iog.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTbr5Gd+jRJf9FiG44Z6X8xHdlfbg01JeQmaECWX6ZE=;
 b=PAe3XVLz2ucreGMGhGIBsczdN9pJDLjxBIavxfns9DH3SFqTKXIEhMhwf2OTWX73rV
 4Djv3QOI4vbetfaKAe6S+fHAYlBmj0JfPBNFemj+MzRHp9wXyMD2SfQ4epIXwuN47B0V
 1DLXwaoClb/XsYdg/VEAKw6QC1MrXCeB4IFSoUth7vL/SfKwD/Rwer6QVlUDNn+3QsfT
 xFZ9GcVYadMkeqKxMTwhQmStGxePGCDszXykshicLJDMBLj/Yvo3zBAuQgfnFukEqk1g
 PggjBCYwD8oD+CAv7eoeKua8/Gvyuj0tA09gfjBns8gbGNS3JXE7qDZZNy6LRdlliYd0
 W6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTbr5Gd+jRJf9FiG44Z6X8xHdlfbg01JeQmaECWX6ZE=;
 b=dg6q7JFXRBpHcAhs7DJpGIrgUVIVjUNKEZERcavqVDof/K1ELFax7PSrq1dlgO9RuT
 j8+mWmq1cwDsYTJ6C1azS3nzYtPgwVNJ6YIGe9wT0L0gFZyg60s7p6e2T8BohJy4//XJ
 5UEw3R4l6lIG0MQBy+58mqjyiOOrnYBTr63dkp2lcwfZDnrZxwfZ1VOBMyZLSwYaSCEk
 wCYSr0KjRgu3yj5NqNEPJe/uAxc8LSGj3LKhSvIKwXj/hbTtklC3A/4i/tKF2nosaJ64
 TZr1JldPoHClgaB9eNWzUXGW9q4tk14kDF57fRZ24rFgwZw96k58h977K7oCy+JDUgBI
 RiYg==
X-Gm-Message-State: AOAM531R6nx4iTKHvnktYQVsFZYJ8sjapaDVcPT6m1YvJHLbPcwokK+D
 9p+P/Au58Tg+adaVt6zDxFzPPpnHk0aBNHNKU6o=
X-Google-Smtp-Source: ABdhPJwVZvudtC5gFrbrr8Dus5LcVQJZN2gj/PT2rqOK5I+dNCwwl2NLYa+felYH95ESgpPq3Y1H5pNIQ7XmOG9lQpE=
X-Received: by 2002:a05:6602:95:: with SMTP id
 h21mr10086321iob.138.1590505999756; 
 Tue, 26 May 2020 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200508173732.17877.85060.stgit@localhost.localdomain>
 <CAKgT0Uce78v1tA6=KHuLNx7pTX324rokprNs32dE2UtsxWnXUg@mail.gmail.com>
In-Reply-To: <CAKgT0Uce78v1tA6=KHuLNx7pTX324rokprNs32dE2UtsxWnXUg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 26 May 2020 08:13:08 -0700
Message-ID: <CAKgT0UeGgeAExQRGsnJ0qmK_wqosdrmqUmYVtCw4aeSQ3APffg@mail.gmail.com>
Subject: Re: [PATCH v2 resubmit] virtio-balloon: Disable free page reporting
 if page poison reporting is not enabled
To: Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

Do I need to resubmit this patch? It has been over two weeks now since
it was originally submitted, and a week and a half since I last sent
out an email following up. I'm just wondering if there is some list I
missed as I am assuming the maintainers and lists I contacted here are
correct? It looks like we are at RC7 now so I am worried this won't
make it in before LInus releases 5.7.

Thanks.

- Alex

On Fri, May 15, 2020 at 10:02 AM Alexander Duyck
<alexander.duyck@gmail.com> wrote:
>
> Just following up. It has been a week since I submitted this. I was
> hoping we could get it in for 5.7 since this affects free page
> reporting which will be introduced with that kernel release.
>
> Thanks.
>
> - Alex
>
> On Fri, May 8, 2020 at 10:40 AM Alexander Duyck
> <alexander.duyck@gmail.com> wrote:
> >
> > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> > We should disable free page reporting if page poisoning is enabled but we
> > cannot report it via the balloon interface. This way we can avoid the
> > possibility of corrupting guest memory. Normally the page poisoning feature
> > should always be present when free page reporting is enabled on the
> > hypervisor, however this allows us to correctly handle a case of the
> > virtio-balloon device being possibly misconfigured.
> >
> > Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > ---
> >
> > Changes since v1:
> > Originally this patch also modified free page hinting, that has been removed.
> > Updated patch title and description.
> > Added a comment explaining reasoning for disabling free page reporting.
> >
> > Resbumitting v2 w/ Ack from David Hildebrand.
> >
> >  drivers/virtio/virtio_balloon.c |    9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > index 51086a5afdd4..1f157d2f4952 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
> >
> >  static int virtballoon_validate(struct virtio_device *vdev)
> >  {
> > -       /* Tell the host whether we care about poisoned pages. */
> > +       /*
> > +        * Inform the hypervisor that our pages are poisoned or
> > +        * initialized. If we cannot do that then we should disable
> > +        * page reporting as it could potentially change the contents
> > +        * of our free pages.
> > +        */
> >         if (!want_init_on_free() &&
> >             (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
> >              !page_poisoning_enabled()))
> >                 __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > +       else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
> > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> >
> >         __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >         return 0;
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
