Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C21BA85C
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 17:47:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 31FB3220C1;
	Mon, 27 Apr 2020 15:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aC6rcy+BF1D; Mon, 27 Apr 2020 15:47:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1DBB022091;
	Mon, 27 Apr 2020 15:47:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC5E9C0172;
	Mon, 27 Apr 2020 15:47:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12F9FC0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3BC1866CA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9PWYb-D0zC6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F09B8663C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:47:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k23so4073546ios.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fb5C1G4j2tWIMBF6YcLV1deCFkYy43SYgorcEkz2VVw=;
 b=flrWyv5VdlYzt4Sam0nIa5QcVmGuUFUKO6+P5mdYHEbAwO35pKLf00FJrvpjpKBipH
 dCc4nvagHzKtc/TOfMAi6B6u2iLcGX3DOsR0k3htcteBjrhM4VrncRU0dt0yL7qR365Z
 /+zVnpD5+SIbsgIMQUrsrSEvhPlu7anwTqdIXMlnvQk4X0Q+NftV8c5Y0kRmHcG/VfBt
 hbpuzzPZMHhgvlKlpy2KitL3PHAujPT2kGIHmLDWS8L76Ns+fD7cb5VRIxB7fICKCxhN
 4aa6z8OOUVco/+lLw67pxeZ1gDMrTNGqvzaqIwl3lzB24p13AAHv8rY7RQXzVB7HPAfQ
 /ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fb5C1G4j2tWIMBF6YcLV1deCFkYy43SYgorcEkz2VVw=;
 b=GMNWQmUpqRpsc8IERstK15Tk0qd4XVV9mbekp/shz6CnpAvCah7KYNpUk4eN5kol71
 Ptw6Pn2wEiUej93j5X5m/4PTmTa5yXLh3Ik+x4OnL0sinzfedKKPUEJ8+E1keHpevxo0
 /g64Ti6v2+a9aFJPzGClzs50Xv5I6v5G7kGx5OXT4SlIvs786uTkk8DJuZwvO9+WB+LS
 HtEB5vgyE6N5rcXvx7rTgLtqJAJMncnT6kTy/bVImjygofIUnhoBteS7DwKu8Brl7bmp
 rVW2Y5R5ygEL2PpiqagUM+5ircGHAu1nK+sE/Or/mN+nAc+jC/HhMBs47IwmW0IoXVS9
 xZfw==
X-Gm-Message-State: AGi0PubeBkadhNas1zklupF65yGX5YaCexUrf4xZ4Dm404KiKHmgov4c
 44AjxS7YupgmlFPgICpgoQCxevA+njGmz7077+7ndsYP
X-Google-Smtp-Source: APiQypKxRjM6hDljYuyf1eig0UXcJKdcVaVx6D9pIbObF9uH8Xt7xd4OaBu8Y2Leqh5+9qfay3oq23973jDfdfYfE4k=
X-Received: by 2002:a02:9642:: with SMTP id c60mr20407884jai.87.1588002432013; 
 Mon, 27 Apr 2020 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200424162103.6681.436.stgit@localhost.localdomain>
 <31bc73ea-5d33-a79d-5f30-dc91b85f9b63@redhat.com>
 <CAKgT0UfhH3pyOqaTcO3yyEE94NsFkgZvVzNDNsyyVqNDgHzGdQ@mail.gmail.com>
 <9d92de1d-5af5-e8e6-23b9-e61d34bbf677@redhat.com>
In-Reply-To: <9d92de1d-5af5-e8e6-23b9-e61d34bbf677@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 27 Apr 2020 08:47:01 -0700
Message-ID: <CAKgT0UcEUnT1_VEp4ByzcF38jxg7yPUqsZ6VKDUm82HKhHZSwA@mail.gmail.com>
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

On Mon, Apr 27, 2020 at 8:09 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 27.04.20 16:58, Alexander Duyck wrote:
> > On Mon, Apr 27, 2020 at 1:08 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 24.04.20 18:24, Alexander Duyck wrote:
> >>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>>
> >>> We should disable free page reporting if page poisoning is enabled in the
> >>> kernel but we cannot report it via the balloon interface. This way we can
> >>> avoid the possibility of corrupting guest memory. Normally the page poison
> >>> reporting feature should always be present when free page reporting is
> >>> enabled on the hypervisor, however this allows us to correctly handle a
> >>> case of the virtio-balloon device being possibly misconfigured.
> >>>
> >>> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> >>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>> ---
> >>>
> >>> Changes since v1:
> >>> Originally this patch also modified free page hinting, that has been removed.
> >>> Updated patch title and description.
> >>> Added a comment explaining reasoning for disabling free page reporting.
> >>>
> >>>  drivers/virtio/virtio_balloon.c |    9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> >>> index 51086a5afdd4..1f157d2f4952 100644
> >>> --- a/drivers/virtio/virtio_balloon.c
> >>> +++ b/drivers/virtio/virtio_balloon.c
> >>> @@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
> >>>
> >>>  static int virtballoon_validate(struct virtio_device *vdev)
> >>>  {
> >>> -     /* Tell the host whether we care about poisoned pages. */
> >>> +     /*
> >>> +      * Inform the hypervisor that our pages are poisoned or
> >>> +      * initialized. If we cannot do that then we should disable
> >>> +      * page reporting as it could potentially change the contents
> >>> +      * of our free pages.
> >>> +      */
> >>>       if (!want_init_on_free() &&
> >>>           (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
> >>>            !page_poisoning_enabled()))
> >>>               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> >>> +     else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
> >>> +             __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> >>>
> >>>       __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >>>       return 0;
> >>>
> >>
> >> Did you see my feedback on v1?
> >>
> >> https://www.spinics.net/lists/linux-virtualization/msg42783.html
> >>
> >> In case of want_init_on_free(), we don't really need VIRTIO_BALLOON_F_PAGE_POISON.
> >
> > I believe we do. We had discussions earlier in which Michael had
> > mentioned that the guest should not assume implementation details of
> > the host/hypervisor.
>
> We can simply document this, as I suggested already ("either the old
> page, or a page filled with zero"). Perfectly fine IMHO.
>
> >
> > The PAGE_POISON feature is being used to indicate that we expect the
> > page to contain a certain value when it is returned to us. With the
> > current implementation in QEMU if that value is zero we can work with
> > it because that is the effect that MADV_DONTNEED has. However if there
> > were some other effect being used by QEMU we would want to know that
> > the guest is expecting us to write a 0 page. So I believe it makes
> > sense to inform the hypervisor that we are doing something that
> > expects us to fill the page with zeros in the case of
>
> Informing makes sense, yes. And we inform it via the poison feature, if
> possible. This discussion is about "what happens if the poison feature
> is not there, but we do have want_init_on_free()."

My preference is to err on the side of caution.  I view want_init_on
free() as equivalent to page_poison_enabled with
CONFIG_PAGE_POISONING_ZERO and treated the same way. So if we are
going to let one by then we would want to let the other by as well.

> > want_init_on_free rather than not providing that information to QEMU.
> > This way, if in the future we decide to change the implementation in
> > some way that might effect the value contained in the pages, we might
>
> If the hypervisor can no longer guarantee "either the old page, or a
> page filled with zero", it would have to disable the feature. I don't
> see that happening, really.

My concern is we can never see how things might be used in the future.
The advantage of setting the poison feature flag and leaving the value
as 0 is that it indicates that we are strictly expecting a zero page
versus allowing the page to contain some other content. I'm expecting
that in most cases that we should see that the page poisoning feature
will be present if page reporting is present so my thought is it is
safer to put the limitation on the guest rather than on the host as it
allows us more flexibility for future implementations.

> > have the flexibility to identify the want_init_on_free case so we can
> > work around it.
>
> I don't have a too strong opinion here, but this sounds like one of the
> improvements we wanted to have for free page hinting, but learned that
> it's not possible because it was *underspecified*.

Right. For free page hinting it is underspecified. By defining a tight
relationship between free page reporting and page poison we might be
able to better handle those sorts of cases. I suspect there may be
interest in having free page reporting eventually take on many of the
responsibilities of free page hinting as it doesn't have the extra
complication of having to consume all of the guests memory. If we
dictate that free page reporting has to have a very clear definition
in relation to any page initialization it lays the groundwork for us
to be able to eventually handle those kind of cases.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
