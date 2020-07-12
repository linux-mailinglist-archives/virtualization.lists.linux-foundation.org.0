Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A221C9EC
	for <lists.virtualization@lfdr.de>; Sun, 12 Jul 2020 17:10:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 26131255A6;
	Sun, 12 Jul 2020 15:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aC6bkcpISJ1; Sun, 12 Jul 2020 15:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC4902582B;
	Sun, 12 Jul 2020 15:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99F24C0733;
	Sun, 12 Jul 2020 15:10:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A36DC0733
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 15:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 068A587553
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 15:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msIl3dLhlJ-b
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 15:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 021CB87565
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594566604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8OGhukfjv0ZT/IXCaPKeBoNY1caG5ABn5f3vkuZHJ7E=;
 b=OpDWSoNxFLJgrxzJIO2ia/2nQ94bk/ZoRQiZWcMc2rnUlzxBEPwxh1n0tgoLaqX9dR8pOT
 8BkwRmdESSW4qJN+xe0JNrzqzfhTLs+C1ZIWKYlX9UkrAvw4BzaJ87PtW/6xysdL9ipokx
 u/xZii8kGnsMs53FLIzJ6hTYXzWl+Pc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-f6655OupMnWwsCAtwDsrqg-1; Sun, 12 Jul 2020 11:10:02 -0400
X-MC-Unique: f6655OupMnWwsCAtwDsrqg-1
Received: by mail-wm1-f69.google.com with SMTP id g124so15124449wmg.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 08:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8OGhukfjv0ZT/IXCaPKeBoNY1caG5ABn5f3vkuZHJ7E=;
 b=CmaOgJrNizwNiWWDf8b2yXRgz5sk/mEZQMbGCaQoX+e9lL5PvR160TW3MDtu7DKvOQ
 idK7ej6hImi8639ohp570kwmf7VQO4JPvMWJ7Bf2lhgK6dJVB8qB1+XIQANnstkfXSOD
 WVx02q0NtxjIUgWwA41pmtvuQu28PjTjgxO9zzEMGdgEc5VgDuJ3udNttF+sXLDg0HwC
 aJd0zzRb+G+SI4Er3WYz5GfFcWck3bsOVZYV1yJXdHou7FWiRnh9TA0y/BTYuKVmeDhW
 X0xoK9MOS+9TDqfZhMSqcnCgVeam4CHmaymqEGAtg2lo5Hbl9fqZ82UJpBtvbHPiigqI
 wIIQ==
X-Gm-Message-State: AOAM533D2f9zbZNQ7rWNhETGyKvRntahrG1gP6ajjD4EkmozBGtIS5AY
 iYLwSRrQTpCMW7dIoSrHXebsvBv4hP/jw0RofYggXiPuvrLbEw+1npTwz9jcLfY/FIsSuvvw46D
 nCklTKBNoy78JhBPteFC4rX9MmmR0JDJI0ZplUhj5nw==
X-Received: by 2002:adf:9404:: with SMTP id 4mr73970072wrq.367.1594566601763; 
 Sun, 12 Jul 2020 08:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsm5CJXrrhFiC8BebofMz/Wct0oboZrATjejrICMcEce7n68CC5UryJkF6nTNDsvN2cKhCKw==
X-Received: by 2002:adf:9404:: with SMTP id 4mr73970062wrq.367.1594566601537; 
 Sun, 12 Jul 2020 08:10:01 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 k18sm19676458wrx.34.2020.07.12.08.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 08:10:00 -0700 (PDT)
Date: Sun, 12 Jul 2020 11:09:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH] virtio_balloon: clear modern features under legacy
Message-ID: <20200712105926-mutt-send-email-mst@kernel.org>
References: <20200710113046.421366-1-mst@redhat.com>
 <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
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

On Fri, Jul 10, 2020 at 09:13:41AM -0700, Alexander Duyck wrote:
> On Fri, Jul 10, 2020 at 4:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Page reporting features were never supported by legacy hypervisors.
> > Supporting them poses a problem: should we use native endian-ness (like
> > current code assumes)? Or little endian-ness like the virtio spec says?
> > Rather than try to figure out, and since results of
> > incorrect endian-ness are dire, let's just block this configuration.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> So I am not sure about the patch description. In the case of page
> poison and free page reporting I don't think we are defining anything
> that doesn't already have a definition of how to use in legacy.
> Specifically the virtio_balloon_config is already defined as having
> all fields as little endian in legacy mode, and there is a definition
> for all of the fields in a virtqueue and how they behave in legacy
> mode.
> 
> As far as I can see the only item that may be an issue is the command
> ID being supplied via the virtqueue for free page hinting, which
> appears to be in native endian-ness. Otherwise it would have fallen
> into the same category since it is making use of virtio_balloon_config
> and a virtqueue for supplying the page location and length.



So as you point out correctly balloon spec says all fields are little
endian.  Fair enough.
Problem is when virtio 1 is not negotiated, then this is not what the
driver assumes for any except a handlful of fields.

But yes it mostly works out.

For example:


static void update_balloon_size(struct virtio_balloon *vb)
{
        u32 actual = vb->num_pages;

        /* Legacy balloon config space is LE, unlike all other devices. */
        if (!virtio_has_feature(vb->vdev, VIRTIO_F_VERSION_1))
                actual = (__force u32)cpu_to_le32(actual);

        virtio_cwrite(vb->vdev, struct virtio_balloon_config, actual,
                      &actual);
}


this is LE even without VIRTIO_F_VERSION_1, so matches spec.

                /* Start with poison val of 0 representing general init */
                __u32 poison_val = 0;

                /*
                 * Let the hypervisor know that we are expecting a
                 * specific value to be written back in balloon pages.
                 */
                if (!want_init_on_free())
                        memset(&poison_val, PAGE_POISON, sizeof(poison_val));

                virtio_cwrite(vb->vdev, struct virtio_balloon_config,
                              poison_val, &poison_val);


actually this writes a native endian-ness value. All bytes happen to be
the same though, and host only cares about 0 or non 0 ATM.

As you say correctly the command id is actually assumed native endian:


static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
{
        if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
                               &vb->config_read_bitmap))
                virtio_cread(vb->vdev, struct virtio_balloon_config,
                             free_page_hint_cmd_id,
                             &vb->cmd_id_received_cache);

        return vb->cmd_id_received_cache;
}


So guest assumes native, host assumes LE.




> > ---
> >  drivers/virtio/virtio_balloon.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > index 5d4b891bf84f..b9bc03345157 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -1107,6 +1107,15 @@ static int virtballoon_restore(struct virtio_device *vdev)
> >
> >  static int virtballoon_validate(struct virtio_device *vdev)
> >  {
> > +       /*
> > +        * Legacy devices never specified how modern features should behave.
> > +        * E.g. which endian-ness to use? Better not to assume anything.
> > +        */
> > +       if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
> > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> > +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> > +       }
> >         /*
> >          * Inform the hypervisor that our pages are poisoned or
> >          * initialized. If we cannot do that then we should disable
> 
> The patch content itself I am fine with since odds are nobody would
> expect to use these features with a legacy device.
> 
> Acked-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Hmm so now you pointed out it's just cmd id, maybe I should just fix it
instead? what do you say?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
