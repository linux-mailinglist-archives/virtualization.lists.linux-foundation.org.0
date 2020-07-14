Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9399E21F83E
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 19:32:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1146880D5;
	Tue, 14 Jul 2020 17:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJZX+3ZFnqTO; Tue, 14 Jul 2020 17:32:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19BC388E52;
	Tue, 14 Jul 2020 17:32:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB7ACC08A9;
	Tue, 14 Jul 2020 17:32:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E67ABC0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 17:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D5E3187A6B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 17:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZYkDkzVbaIK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 17:32:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 53FB488E52
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 17:32:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l17so6645707iok.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyd1Yem61aBK9j4xH0v8TMCTQl2WFmnBvLzZWnwdnEc=;
 b=tHaFTot19KPHp0MlA0uocYvaOfJzaYZ5AoPy3T9fENTCX/ku/bwFYSdr5A461u5H/B
 xbGJA30Vt6hsgAc6nl3XF22cNxedx4Px4/vwAsBod5/hmk8YP1vE0/hHw7zP03NEGraw
 D/siRebVYWD9N+/1mOlVmPN/7TlJ77LGx7Ynxyi4kBO2svfB7/D8lvqexWnc4oV1x2Bh
 zRs9q+7R218hm3SarF5+KQ8/toBryohiSFcxyv6Ij/7Dt2YZi2KlyEkc430bayEZPYhF
 OhbWsp2jJ2VNZjFuSBvyM6plx4Gq4PtxhHrRtqIatdjHSuqJKUegDO0Sy28+QlYoD6sW
 JPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyd1Yem61aBK9j4xH0v8TMCTQl2WFmnBvLzZWnwdnEc=;
 b=XEBL08hWjRwofd8a3LyvCX9FGTG3slQ/pa9FQoa7vQU3DBe+J7C8QnCV5VcI0weYJY
 R7IuTKkA+3B+9DXZrokItJStrRgyhOXcKsbeAHE37bZNFcpRZ9gOgkNJz/6rNkuoBgXS
 c+nSexTCJ4+pt9olhHPS5IjcOUQr/tBpJyBsBHdQCxMzstl+996msaFoHlHHp5SiKeo2
 4KdnglUzZ8or7ZSGJxQZ8ksL0vO6xoRLPr0xWpk+PRs/jqQ1jYBHrexsYJW7GQB1zMMC
 vCLJO+e0BA8+u+jaPrdEFxs26GuytjeMS8jrtZvHOt7jYB0lUZtgkoguIr+bOj0f3kyR
 Fb6Q==
X-Gm-Message-State: AOAM530pkqkSxMmjtpxlowvfcuz4gT6RhH+WLvHfueX4HLjnlRub4YZY
 b3vg1my3F4sU8Kd1M4KPRnVmLQhhexVhGis3sQY=
X-Google-Smtp-Source: ABdhPJx1N5E0GF7/F0ba6GbZ0mPoX1MKXs80ni9M2TowfvxnnTLsD0VvV0KlxZLoPSUGdtczPlbRSc4bn9Y0Z5hlfSg=
X-Received: by 2002:a6b:2b12:: with SMTP id r18mr5852785ior.88.1594747927418; 
 Tue, 14 Jul 2020 10:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200710113046.421366-1-mst@redhat.com>
 <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
 <20200712105926-mutt-send-email-mst@kernel.org>
 <CAKgT0UdY1xpEH1Hg4HWJEkGwH5s64sm1y4O_XmHe8P_f=tDhpg@mail.gmail.com>
 <20200714044017-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200714044017-mutt-send-email-mst@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 14 Jul 2020 10:31:56 -0700
Message-ID: <CAKgT0Ud_AFpB-=uCB_3qY8pFvG9Kj7OFSmFG76LZC9K91oUG2w@mail.gmail.com>
Subject: Re: [PATCH] virtio_balloon: clear modern features under legacy
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
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

On Tue, Jul 14, 2020 at 1:45 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jul 13, 2020 at 08:10:14AM -0700, Alexander Duyck wrote:
> > On Sun, Jul 12, 2020 at 8:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 09:13:41AM -0700, Alexander Duyck wrote:
> > > > On Fri, Jul 10, 2020 at 4:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >

<snip>

> > > As you say correctly the command id is actually assumed native endian:
> > >
> > >
> > > static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
> > > {
> > >         if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
> > >                                &vb->config_read_bitmap))
> > >                 virtio_cread(vb->vdev, struct virtio_balloon_config,
> > >                              free_page_hint_cmd_id,
> > >                              &vb->cmd_id_received_cache);
> > >
> > >         return vb->cmd_id_received_cache;
> > > }
> > >
> > >
> > > So guest assumes native, host assumes LE.
> >
> > This wasn't even the one I was talking about, but now that you point
> > it out this is definately bug. The command ID I was talking about was
> > the one being passed via the descriptor ring. That one I believe is
> > native on both sides.
>
> Well qemu swaps it for modern devices:
>
>         virtio_tswap32s(vdev, &id);
>
> guest swaps it too:
>         vb->cmd_id_active = cpu_to_virtio32(vb->vdev,
>                                         virtio_balloon_cmd_id_received(vb));
>         sg_init_one(&sg, &vb->cmd_id_active, sizeof(vb->cmd_id_active));
>         err = virtqueue_add_outbuf(vq, &sg, 1, &vb->cmd_id_active, GFP_KERNEL);
>
> So it's native for legacy.

Okay, that makes sense. I just wasn't familiar with the virtio32 type.

I guess that just means we need to fix the original issue you found
where the guest was assuming native for the command ID in the config.
Do you plan to patch that or should I?

> > >
> > >
> > >
> > > > > ---
> > > > >  drivers/virtio/virtio_balloon.c | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > > > > index 5d4b891bf84f..b9bc03345157 100644
> > > > > --- a/drivers/virtio/virtio_balloon.c
> > > > > +++ b/drivers/virtio/virtio_balloon.c
> > > > > @@ -1107,6 +1107,15 @@ static int virtballoon_restore(struct virtio_device *vdev)
> > > > >
> > > > >  static int virtballoon_validate(struct virtio_device *vdev)
> > > > >  {
> > > > > +       /*
> > > > > +        * Legacy devices never specified how modern features should behave.
> > > > > +        * E.g. which endian-ness to use? Better not to assume anything.
> > > > > +        */
> > > > > +       if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
> > > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> > > > > +       }
> > > > >         /*
> > > > >          * Inform the hypervisor that our pages are poisoned or
> > > > >          * initialized. If we cannot do that then we should disable
> > > >
> > > > The patch content itself I am fine with since odds are nobody would
> > > > expect to use these features with a legacy device.
> > > >
> > > > Acked-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > >
> > > Hmm so now you pointed out it's just cmd id, maybe I should just fix it
> > > instead? what do you say?
> >
> > So the config issues are bugs, but I don't think you saw the one I was
> > talking about. In the function send_cmd_id_start the cmd_id_active
> > value which is initialized as a virtio32 is added as a sg entry and
> > then sent as an outbuf to the device. I'm assuming virtio32 is a host
> > native byte ordering.
>
> IIUC it isn't :) virtio32 is guest native if device is legacy, and LE if
> device is modern.

Okay. So I should probably document that for the spec I have been
working on. It looks like there is an example of similar documentation
for the memory statistics so it should be pretty straight forward.

Thanks.

- Alex
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
