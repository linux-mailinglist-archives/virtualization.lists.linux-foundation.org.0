Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA621BA81
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 18:13:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49CE989CC9;
	Fri, 10 Jul 2020 16:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epnEHV6tgli3; Fri, 10 Jul 2020 16:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B74BB89CC3;
	Fri, 10 Jul 2020 16:13:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EAB0C016F;
	Fri, 10 Jul 2020 16:13:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FFF6C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7BDEA89341
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9+QPz5g8VWw9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:13:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 74E3889CC3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 16:13:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v6so6603923iob.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WOhf446wJmxhSKkuBEXjNKDj0Wuq9FxTK5pl2IxYUo0=;
 b=sJa06UKM1+tO3r4eAbDLBv9bXXClhzFRxkegCiDxEJbmtUDvZCW1uUBnLLBTTyh/zE
 Rl4lVOU7+/193Vtc2nkutgU1WNoQNrWRQ1BLALf9HGy9QVIz35TE8CCK7kXeo9MPDKDT
 cneX9FInNfpziwB1+LUUnQLf3xcRcg5c4SJLy0ry0FkHQ4eGPGAk4LsWP9+3NygdQ16E
 wLOF36w3+SB6lGY5/3A4szmcBXDkxDj0roU0fLgByOM7hXUM9cQWdVVsRBgViNGwj84E
 Mzgx8Yj9J+nEtAmDmuXcNr9UvGHp3yecuKNDfCyfyJpT4j4QItLMjNx6dnZgsetZEl9i
 mKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WOhf446wJmxhSKkuBEXjNKDj0Wuq9FxTK5pl2IxYUo0=;
 b=iE9geOGdBYL67ouR1RskBvNnUZ4X5YEmtfYhbqZmERARUnZhyEecRB2QISo2b95E+t
 kLPlDpN/7m/wH5bgEixSIhU4R5Lc81wSgPHRGIbB+Q0UaWefk17tJo4ITxqfFLwh+yrm
 FkZTDTDtMZtw1fpl911QN+xfzHO/eSa2eVwbsYHYTjGxzNKUtl55q8rXkzbfo5BYBYf9
 MDo6vfL/0dnWVPNprU+iLcI+3kSyNT5GpUXQfYycKgLQVxhgaPWqdE5P106Z1zfUzbQ9
 CAZtN0TEROHCUzmaWwedXJMwvimcWRVc1gh7zn0tIEGigFb2XMPhxpu1kKWbSxFzlyJB
 9dXg==
X-Gm-Message-State: AOAM533nHvclTd4G9RgZ+hJMux/oKg1FTSBVKzjVrMn/jjTUXX53xmNJ
 1N06hzS0EvLJ5Hpo12KxOedyxO2hSPLsaYOHwN1Q4z85c70=
X-Google-Smtp-Source: ABdhPJzxzpeui/g+zr/T9LgsOLWJ4FhpwovVifV20h0MRkNFwN7pWOffL2KkOwb/4uyQusMd/fNH2vaqb4pS7pGVbgw=
X-Received: by 2002:a05:6638:771:: with SMTP id
 y17mr40786162jad.96.1594397632555; 
 Fri, 10 Jul 2020 09:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200710113046.421366-1-mst@redhat.com>
In-Reply-To: <20200710113046.421366-1-mst@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 10 Jul 2020 09:13:41 -0700
Message-ID: <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
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

On Fri, Jul 10, 2020 at 4:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Page reporting features were never supported by legacy hypervisors.
> Supporting them poses a problem: should we use native endian-ness (like
> current code assumes)? Or little endian-ness like the virtio spec says?
> Rather than try to figure out, and since results of
> incorrect endian-ness are dire, let's just block this configuration.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

So I am not sure about the patch description. In the case of page
poison and free page reporting I don't think we are defining anything
that doesn't already have a definition of how to use in legacy.
Specifically the virtio_balloon_config is already defined as having
all fields as little endian in legacy mode, and there is a definition
for all of the fields in a virtqueue and how they behave in legacy
mode.

As far as I can see the only item that may be an issue is the command
ID being supplied via the virtqueue for free page hinting, which
appears to be in native endian-ness. Otherwise it would have fallen
into the same category since it is making use of virtio_balloon_config
and a virtqueue for supplying the page location and length.

> ---
>  drivers/virtio/virtio_balloon.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 5d4b891bf84f..b9bc03345157 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -1107,6 +1107,15 @@ static int virtballoon_restore(struct virtio_device *vdev)
>
>  static int virtballoon_validate(struct virtio_device *vdev)
>  {
> +       /*
> +        * Legacy devices never specified how modern features should behave.
> +        * E.g. which endian-ness to use? Better not to assume anything.
> +        */
> +       if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
> +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> +       }
>         /*
>          * Inform the hypervisor that our pages are poisoned or
>          * initialized. If we cannot do that then we should disable

The patch content itself I am fine with since odds are nobody would
expect to use these features with a legacy device.

Acked-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
