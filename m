Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA121EBB3
	for <lists.virtualization@lfdr.de>; Tue, 14 Jul 2020 10:45:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 137998A962;
	Tue, 14 Jul 2020 08:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbfI2UnoTgFd; Tue, 14 Jul 2020 08:45:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAD6B8A97D;
	Tue, 14 Jul 2020 08:45:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB448C0733;
	Tue, 14 Jul 2020 08:45:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6DB1C0733
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDFB58A96A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAyHOZhMkkuZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:45:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CA1E88A962
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594716327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8A2G5vizF7CgtfiIlPSYJUsYEYYmtXCXf3/59UQTo8=;
 b=EaMLpP3bjE55uQfKI5jvkpGfWVJ6z6dA/5weLfgcykjAbLSkBdXj0J5zjIcts7KWfzUYnc
 s1ffbm/reOkdbXo8iA/SWJyKOuYRZo30zp6cD1aWrEYgsrQ4seqcAVuA9s/NYX8Qr55zz3
 itltdjbWXYi3Q+A7h7mVGPw0vUIlOU8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-4Fj22_ZkN7Cdk_h_iTlz3g-1; Tue, 14 Jul 2020 04:45:26 -0400
X-MC-Unique: 4Fj22_ZkN7Cdk_h_iTlz3g-1
Received: by mail-wm1-f71.google.com with SMTP id g6so2925501wmk.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 01:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n8A2G5vizF7CgtfiIlPSYJUsYEYYmtXCXf3/59UQTo8=;
 b=oEyyx+J83c2B7W4z3qrYedWu749czwCs5rdOh2LFc0lj7/sgLNCXPd33y74o1okoBO
 LebQ/u3IgV9JTGCsNQPaon8hWwZ8u5olo1DT2/eRnNJvYZwfUl4eo8W0kp3+dgObmy0O
 C6Cz2NWuCj84lwGlyc6qpdWdSYzVWQvp6mPnKNrD6JG5PYyQaygp6KHWPV3W/PI3Y3IA
 sEFfJ/Oa0Sd4ZkOcA00y/Q/OvuWbkx1K4ufa4a6MM3ly/eNoEPFCgAoDS1hkPrSMdJ62
 06TNDCJ6J6yw8qgRua6t4qb+Cacue1hzeOICjC/hYzfDn75INi0PExL15t0U5qqQcsrs
 flOw==
X-Gm-Message-State: AOAM531MwyZvl71dfjfyqvS5yoYLNQdXDl2m8fMSpASuORfGqJhyFwpN
 A8pguVMzGrEy723obmFs3cLOIzyFkE7mb0Z+tAaZPD3GA3/LXBLfLXw3t0zZqNTstlOObZFaBz0
 P0AF+9Ziqr2iqzN/PhdasXgO3scdcc216g9mtddgDZA==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr3810343wrw.404.1594716324857; 
 Tue, 14 Jul 2020 01:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+aHKVdbP2Oys421PgxREy4EGx+JNbt1AzTEV/jQbfdeekPWnshfuJL9hywzi3Xa6CYgcomw==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr3810320wrw.404.1594716324605; 
 Tue, 14 Jul 2020 01:45:24 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id z10sm28691186wrm.21.2020.07.14.01.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 01:45:23 -0700 (PDT)
Date: Tue, 14 Jul 2020 04:45:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH] virtio_balloon: clear modern features under legacy
Message-ID: <20200714044017-mutt-send-email-mst@kernel.org>
References: <20200710113046.421366-1-mst@redhat.com>
 <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
 <20200712105926-mutt-send-email-mst@kernel.org>
 <CAKgT0UdY1xpEH1Hg4HWJEkGwH5s64sm1y4O_XmHe8P_f=tDhpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0UdY1xpEH1Hg4HWJEkGwH5s64sm1y4O_XmHe8P_f=tDhpg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Mon, Jul 13, 2020 at 08:10:14AM -0700, Alexander Duyck wrote:
> On Sun, Jul 12, 2020 at 8:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 10, 2020 at 09:13:41AM -0700, Alexander Duyck wrote:
> > > On Fri, Jul 10, 2020 at 4:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Page reporting features were never supported by legacy hypervisors.
> > > > Supporting them poses a problem: should we use native endian-ness (like
> > > > current code assumes)? Or little endian-ness like the virtio spec says?
> > > > Rather than try to figure out, and since results of
> > > > incorrect endian-ness are dire, let's just block this configuration.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > So I am not sure about the patch description. In the case of page
> > > poison and free page reporting I don't think we are defining anything
> > > that doesn't already have a definition of how to use in legacy.
> > > Specifically the virtio_balloon_config is already defined as having
> > > all fields as little endian in legacy mode, and there is a definition
> > > for all of the fields in a virtqueue and how they behave in legacy
> > > mode.
> > >
> > > As far as I can see the only item that may be an issue is the command
> > > ID being supplied via the virtqueue for free page hinting, which
> > > appears to be in native endian-ness. Otherwise it would have fallen
> > > into the same category since it is making use of virtio_balloon_config
> > > and a virtqueue for supplying the page location and length.
> >
> >
> >
> > So as you point out correctly balloon spec says all fields are little
> > endian.  Fair enough.
> > Problem is when virtio 1 is not negotiated, then this is not what the
> > driver assumes for any except a handlful of fields.
> >
> > But yes it mostly works out.
> >
> > For example:
> >
> >
> > static void update_balloon_size(struct virtio_balloon *vb)
> > {
> >         u32 actual = vb->num_pages;
> >
> >         /* Legacy balloon config space is LE, unlike all other devices. */
> >         if (!virtio_has_feature(vb->vdev, VIRTIO_F_VERSION_1))
> >                 actual = (__force u32)cpu_to_le32(actual);
> >
> >         virtio_cwrite(vb->vdev, struct virtio_balloon_config, actual,
> >                       &actual);
> > }
> >
> >
> > this is LE even without VIRTIO_F_VERSION_1, so matches spec.
> >
> >                 /* Start with poison val of 0 representing general init */
> >                 __u32 poison_val = 0;
> >
> >                 /*
> >                  * Let the hypervisor know that we are expecting a
> >                  * specific value to be written back in balloon pages.
> >                  */
> >                 if (!want_init_on_free())
> >                         memset(&poison_val, PAGE_POISON, sizeof(poison_val));
> >
> >                 virtio_cwrite(vb->vdev, struct virtio_balloon_config,
> >                               poison_val, &poison_val);
> >
> >
> > actually this writes a native endian-ness value. All bytes happen to be
> > the same though, and host only cares about 0 or non 0 ATM.
> 
> So we are safe assuming it is a repeating value, but for correctness
> maybe we should make certain to cast this as a le32 value. I can
> submit a patch to do that.

Thanks! But not yet - I am poking at the endian-ness things right now!

> > As you say correctly the command id is actually assumed native endian:
> >
> >
> > static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
> > {
> >         if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
> >                                &vb->config_read_bitmap))
> >                 virtio_cread(vb->vdev, struct virtio_balloon_config,
> >                              free_page_hint_cmd_id,
> >                              &vb->cmd_id_received_cache);
> >
> >         return vb->cmd_id_received_cache;
> > }
> >
> >
> > So guest assumes native, host assumes LE.
> 
> This wasn't even the one I was talking about, but now that you point
> it out this is definately bug. The command ID I was talking about was
> the one being passed via the descriptor ring. That one I believe is
> native on both sides.

Well qemu swaps it for modern devices:

        virtio_tswap32s(vdev, &id);

guest swaps it too:
        vb->cmd_id_active = cpu_to_virtio32(vb->vdev,
                                        virtio_balloon_cmd_id_received(vb));
        sg_init_one(&sg, &vb->cmd_id_active, sizeof(vb->cmd_id_active));
        err = virtqueue_add_outbuf(vq, &sg, 1, &vb->cmd_id_active, GFP_KERNEL);

So it's native for legacy.



> >
> >
> >
> > > > ---
> > > >  drivers/virtio/virtio_balloon.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > > > index 5d4b891bf84f..b9bc03345157 100644
> > > > --- a/drivers/virtio/virtio_balloon.c
> > > > +++ b/drivers/virtio/virtio_balloon.c
> > > > @@ -1107,6 +1107,15 @@ static int virtballoon_restore(struct virtio_device *vdev)
> > > >
> > > >  static int virtballoon_validate(struct virtio_device *vdev)
> > > >  {
> > > > +       /*
> > > > +        * Legacy devices never specified how modern features should behave.
> > > > +        * E.g. which endian-ness to use? Better not to assume anything.
> > > > +        */
> > > > +       if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
> > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > > > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> > > > +       }
> > > >         /*
> > > >          * Inform the hypervisor that our pages are poisoned or
> > > >          * initialized. If we cannot do that then we should disable
> > >
> > > The patch content itself I am fine with since odds are nobody would
> > > expect to use these features with a legacy device.
> > >
> > > Acked-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> > Hmm so now you pointed out it's just cmd id, maybe I should just fix it
> > instead? what do you say?
> 
> So the config issues are bugs, but I don't think you saw the one I was
> talking about. In the function send_cmd_id_start the cmd_id_active
> value which is initialized as a virtio32 is added as a sg entry and
> then sent as an outbuf to the device. I'm assuming virtio32 is a host
> native byte ordering.

IIUC it isn't :) virtio32 is guest native if device is legacy, and LE if
device is modern.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
