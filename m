Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A97261BA71D
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 16:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4887187648;
	Mon, 27 Apr 2020 14:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAmcxc+jtwDU; Mon, 27 Apr 2020 14:58:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 95036875BE;
	Mon, 27 Apr 2020 14:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F0ABC1D87;
	Mon, 27 Apr 2020 14:58:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26B6BC0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 14:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1459084949
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 14:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBnIx52mYvIK
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 14:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 373A58493F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 14:58:43 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id c16so16950863ilr.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zw1NwZkLibygSi1O/JJ/qB2qYr9WoY9HbvGVHwxj2Vs=;
 b=eI30t7cb1WcTQm/uIzaYCxTaWjnLcJ3y/KBSmuzvo0xII5UsFfLLTaNBUY88UufpAy
 ETNXr/7n/hz9kUsLN0aPHm6p19IB3cdzTYyGZIW6tsVgAyGUP5emolwsqU8Qgg22++8i
 svuCqK97tBBtM3KMhMIG2w58N6XkyFEvVeaFDrQqpQDTvBAXcXNtseIAKPQwiEnXsDD9
 mWh+zCcvdMcgkpf8qddk41MmlZanF7cfDGOFdMTpuFyuF+0MGlT6YgwQYUJmL1WlZ2PS
 GXiA63knm8ayNEp22W6Dyi9Ud8JBQ13xXOWjyRjyMFAppek1eIWzVpqwheRcpTrQfF8v
 ORVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zw1NwZkLibygSi1O/JJ/qB2qYr9WoY9HbvGVHwxj2Vs=;
 b=YLZimK15ylaZMRUGv9MIABNvPF+p77iqez6R1Tnn/4mtEn4nkqT+ccUXEsNz9ewfcX
 EKuCnq6ACmh3Duph/22lgCVErQmLrpRlXab5V5DJvVVl+hR9l8n8EWV3NYqZL27u4/DX
 rY3bqtaujDePAt6wPFQMvDXvURNydm54r+SyIe4/aiRFb/BmnCzrb1KlXCQBH+uJWVPi
 ddFImuR7mZguZx+VjKSQtktAaYaU7int2e4x/fDcQcnZ3zqEgH+ktI5OcD2st9Lt/ujj
 kVcenD37freAsnuQO7ucjsEHbAJFsAgSOPI2QSLIXvNyhRqq/vQ0sebX/KvAYnIxjI3i
 vElA==
X-Gm-Message-State: AGi0PualCzRYH0E429JBwpVcu/KnMfghp2K9SNd4O8y9ONkWW4D7WYeD
 XHGl8XYzleBGEjnagVIeqXod42AIPzVvX6UDqM4=
X-Google-Smtp-Source: APiQypJ3L/HGag8fzdlfjqNqKuUkniv4NyBLhlN8HKromrK3DCR1KffIEnzYAqeWo9zcid8KgVtrNXseifWCaCXOiYA=
X-Received: by 2002:a92:5f46:: with SMTP id t67mr20501739ilb.64.1587999522292; 
 Mon, 27 Apr 2020 07:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200424162103.6681.436.stgit@localhost.localdomain>
 <31bc73ea-5d33-a79d-5f30-dc91b85f9b63@redhat.com>
In-Reply-To: <31bc73ea-5d33-a79d-5f30-dc91b85f9b63@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 27 Apr 2020 07:58:31 -0700
Message-ID: <CAKgT0UfhH3pyOqaTcO3yyEE94NsFkgZvVzNDNsyyVqNDgHzGdQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-balloon: Disable free page reporting if page
 poison reporting is not enabled
To: David Hildenbrand <david@redhat.com>
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

On Mon, Apr 27, 2020 at 1:08 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 24.04.20 18:24, Alexander Duyck wrote:
> > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> > We should disable free page reporting if page poisoning is enabled in the
> > kernel but we cannot report it via the balloon interface. This way we can
> > avoid the possibility of corrupting guest memory. Normally the page poison
> > reporting feature should always be present when free page reporting is
> > enabled on the hypervisor, however this allows us to correctly handle a
> > case of the virtio-balloon device being possibly misconfigured.
> >
> > Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > ---
> >
> > Changes since v1:
> > Originally this patch also modified free page hinting, that has been removed.
> > Updated patch title and description.
> > Added a comment explaining reasoning for disabling free page reporting.
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
> > -     /* Tell the host whether we care about poisoned pages. */
> > +     /*
> > +      * Inform the hypervisor that our pages are poisoned or
> > +      * initialized. If we cannot do that then we should disable
> > +      * page reporting as it could potentially change the contents
> > +      * of our free pages.
> > +      */
> >       if (!want_init_on_free() &&
> >           (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
> >            !page_poisoning_enabled()))
> >               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > +     else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
> > +             __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> >
> >       __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >       return 0;
> >
>
> Did you see my feedback on v1?
>
> https://www.spinics.net/lists/linux-virtualization/msg42783.html
>
> In case of want_init_on_free(), we don't really need VIRTIO_BALLOON_F_PAGE_POISON.

I believe we do. We had discussions earlier in which Michael had
mentioned that the guest should not assume implementation details of
the host/hypervisor.

The PAGE_POISON feature is being used to indicate that we expect the
page to contain a certain value when it is returned to us. With the
current implementation in QEMU if that value is zero we can work with
it because that is the effect that MADV_DONTNEED has. However if there
were some other effect being used by QEMU we would want to know that
the guest is expecting us to write a 0 page. So I believe it makes
sense to inform the hypervisor that we are doing something that
expects us to fill the page with zeros in the case of
want_init_on_free rather than not providing that information to QEMU.
This way, if in the future we decide to change the implementation in
some way that might effect the value contained in the pages, we might
have the flexibility to identify the want_init_on_free case so we can
work around it.

In reality it isn't too different from informing QEMU that we are
performing poison with a value of 0 anyway which if I recall is what
led me to adding the want_init_on_free check as they are all lumped
together in free_pages_prezeroed():
https://elixir.bootlin.com/linux/v5.7-rc3/source/mm/page_alloc.c#L2134

Thanks.

- Alex
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
