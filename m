Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6751E967F
	for <lists.virtualization@lfdr.de>; Sun, 31 May 2020 11:15:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D98BF86CE1;
	Sun, 31 May 2020 09:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stA-NyUoDIGv; Sun, 31 May 2020 09:15:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D99BF86CC7;
	Sun, 31 May 2020 09:15:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B81BCC0176;
	Sun, 31 May 2020 09:15:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45A41C0176
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 39F31847F8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDx9lHgKsIOS
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:15:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6591E847DD
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590916535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p0NYd1+7UKRaFAg35jruA5eBkZJmH5VET3sAZwV29QU=;
 b=co7Krkt8UbHmCgOrXaZbqQrE8ZxqZG7EEKVcTq/VZhfXIWbh01koYGA3ibldW+op5E1DCo
 4Ov3pfZ6FvKKxlL+o/6+hHkw3uWmgYgbLrUcPxrMR51G6CqNdvZifUsccPnJ4AMtyXIion
 IupQPG+nlPI04TmfDrLTiu8CRfNfhlI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-aX0Tl589NOOuJV99q0IroA-1; Sun, 31 May 2020 05:15:34 -0400
X-MC-Unique: aX0Tl589NOOuJV99q0IroA-1
Received: by mail-wr1-f72.google.com with SMTP id m14so1424505wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 02:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p0NYd1+7UKRaFAg35jruA5eBkZJmH5VET3sAZwV29QU=;
 b=LPHfaMNHR8RJlSJnnJifelsA8tpj8og3rINhSqxHlIm363gDtm75c5JKxVPpLCNMf1
 haEA2NTA4OaxIm+zGMJ/AdnBzFq3x68DmEjLqbvB5eHo9iRlb7YXQ6vQQQmBTPTDWqeA
 ZcvqdTuambrWo16p6Q9T7THbZfaZuyvWsBn8DZgMwvB9eEr3PDjpBbsdM98HAwzoUkox
 YonxggteqAdyLUTM0jBOb1/XgRjTmUR0yd+uRpCM9rm8GRjNsvtulPu5wXzfsFqguAvG
 5S0OrfoXD5lCnUMwLIQ1KkODrhWcLBcY0OdRYB2ZiPa+kBpQtILehWOxAhy7Z01QjaKZ
 6tWQ==
X-Gm-Message-State: AOAM530vIKzyZJMKV/Lp1H5LEvB83hUgckfnpB+sT7kXmgzn50L3ryg1
 kca7epu9yw2HwhH9gaOcC5eSrflMUYVnDI3VcDEFckqtfSSZ0nDoas3232OUcrvFgry8BKhSYb+
 4y9zo+rtS4Q7QihOoHFVI38cGgSEXVoirrj4kanO3tQ==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr15887298wmc.76.1590916532996; 
 Sun, 31 May 2020 02:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBOdc5dCTvcJbml9Q35JVVqx3avon+BPBjJRhSUraYSzJ6buTOzyyc6ceKzwT5vAn04mhxLg==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr15887285wmc.76.1590916532771; 
 Sun, 31 May 2020 02:15:32 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 q5sm16390089wrm.62.2020.05.31.02.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 02:15:32 -0700 (PDT)
Date: Sun, 31 May 2020 05:15:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v2 resubmit] virtio-balloon: Disable free page reporting
 if page poison reporting is not enabled
Message-ID: <20200531051357-mutt-send-email-mst@kernel.org>
References: <20200508173732.17877.85060.stgit@localhost.localdomain>
 <CAKgT0Uce78v1tA6=KHuLNx7pTX324rokprNs32dE2UtsxWnXUg@mail.gmail.com>
 <CAKgT0UeGgeAExQRGsnJ0qmK_wqosdrmqUmYVtCw4aeSQ3APffg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0UeGgeAExQRGsnJ0qmK_wqosdrmqUmYVtCw4aeSQ3APffg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

Oh. A mail misconfig on my part caused me to miss this. Sorry.
Unfortunately it means it will miss 5.7.
I'll queue this and CC stable. Thanks!

On Tue, May 26, 2020 at 08:13:08AM -0700, Alexander Duyck wrote:
> Do I need to resubmit this patch? It has been over two weeks now since
> it was originally submitted, and a week and a half since I last sent
> out an email following up. I'm just wondering if there is some list I
> missed as I am assuming the maintainers and lists I contacted here are
> correct? It looks like we are at RC7 now so I am worried this won't
> make it in before LInus releases 5.7.
> 
> Thanks.
> 
> - Alex
> 
> On Fri, May 15, 2020 at 10:02 AM Alexander Duyck
> <alexander.duyck@gmail.com> wrote:
> >
> > Just following up. It has been a week since I submitted this. I was
> > hoping we could get it in for 5.7 since this affects free page
> > reporting which will be introduced with that kernel release.
> >
> > Thanks.
> >
> > - Alex
> >
> > On Fri, May 8, 2020 at 10:40 AM Alexander Duyck
> > <alexander.duyck@gmail.com> wrote:
> > >
> > > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > >
> > > We should disable free page reporting if page poisoning is enabled but we
> > > cannot report it via the balloon interface. This way we can avoid the
> > > possibility of corrupting guest memory. Normally the page poisoning feature
> > > should always be present when free page reporting is enabled on the
> > > hypervisor, however this allows us to correctly handle a case of the
> > > virtio-balloon device being possibly misconfigured.
> > >
> > > Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> > > Acked-by: David Hildenbrand <david@redhat.com>
> > > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > ---
> > >
> > > Changes since v1:
> > > Originally this patch also modified free page hinting, that has been removed.
> > > Updated patch title and description.
> > > Added a comment explaining reasoning for disabling free page reporting.
> > >
> > > Resbumitting v2 w/ Ack from David Hildebrand.
> > >
> > >  drivers/virtio/virtio_balloon.c |    9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > > index 51086a5afdd4..1f157d2f4952 100644
> > > --- a/drivers/virtio/virtio_balloon.c
> > > +++ b/drivers/virtio/virtio_balloon.c
> > > @@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
> > >
> > >  static int virtballoon_validate(struct virtio_device *vdev)
> > >  {
> > > -       /* Tell the host whether we care about poisoned pages. */
> > > +       /*
> > > +        * Inform the hypervisor that our pages are poisoned or
> > > +        * initialized. If we cannot do that then we should disable
> > > +        * page reporting as it could potentially change the contents
> > > +        * of our free pages.
> > > +        */
> > >         if (!want_init_on_free() &&
> > >             (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
> > >              !page_poisoning_enabled()))
> > >                 __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > > +       else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
> > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> > >
> > >         __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > >         return 0;
> > >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
