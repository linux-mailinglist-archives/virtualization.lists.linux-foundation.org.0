Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E494714D9
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 11:17:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0BA79BBC;
	Tue, 23 Jul 2019 09:17:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C2D2A2C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D2C2FE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:34 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t8so30590912qkt.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 02:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=zIMuDv+zk7S1NCvH0qhLppn9YRoVaxQzRUcA6IGuXcs=;
	b=TwMeYTGhJJgp08zncUubjcF5DJnL180boAXhOBGgILXcU7ZYLNXDPNDDdetFirxgzv
	o1nqHoj2KLSkhZnEphUS4YDEOfqs5uU/zmuC4GHjLauWvUeU4AiAY88lEEL4bpLg1+rE
	ofK2uPFWheW9KHfw3UqE0hxkajNnz4XoOiPkrjBqNFkAD+sLevo0J9ZQlnf8ifFaY6eZ
	k4r0Uisn4SgPrMx9zd3xTCTXvb4PYR9wTHqAFzJjT1KYJnGyZZdvWgSq+wPT/pp6V0ci
	9zaATA0cc5sR4pmEsWEB9bYjoU8yZrj84eJtnNqE/hIb7JPeEkEK3bgsIup56nt2oNnC
	xIEw==
X-Gm-Message-State: APjAAAW9UGrxM/ULjcPpDWkm9aiWdFacKaP8nvHN8T5nIA2DUmALZ6dZ
	zW1Jpok95hKB+5yMqjpUQORx7unwYB4/JA==
X-Google-Smtp-Source: APXvYqxCxrHJb2/RQUMnbweSxs5Cq2YkuyrJJ0kQghMt/IAIFI53AquzBnAmUMtJGKkqG286t9N46w==
X-Received: by 2002:a37:646:: with SMTP id 67mr47571333qkg.287.1563873453656; 
	Tue, 23 Jul 2019 02:17:33 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	g54sm25451794qtc.61.2019.07.23.02.17.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 02:17:32 -0700 (PDT)
Date: Tue, 23 Jul 2019 05:17:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/6] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
Message-ID: <20190723042143-mutt-send-email-mst@kernel.org>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-5-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723075718.6275-5-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Jul 23, 2019 at 03:57:16AM -0400, Jason Wang wrote:
> The vhost_set_vring_num_addr() could be called in the middle of
> invalidate_range_start() and invalidate_range_end(). If we don't reset
> invalidate_count after the un-registering of MMU notifier, the
> invalidate_cont will run out of sync (e.g never reach zero). This will
> in fact disable the fast accessor path. Fixing by reset the count to
> zero.
> 
> Reported-by: Michael S. Tsirkin <mst@redhat.com>
> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/vhost.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 03666b702498..89c9f08b5146 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2074,6 +2074,10 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
>  		d->has_notifier = false;
>  	}
>  
> +	/* reset invalidate_count in case we are in the middle of
> +	 * invalidate_start() and invalidate_end().
> +	 */
> +	vq->invalidate_count = 0;

I think that the code is ok but the comments are not very clear:
- we are never in the middle since we just removed the notifier
- the result is not just disabling optimization:
  if notifier becomes negative, then later we
  can think it's ok to map when it isn't since
  notifier is active.

>  	vhost_uninit_vq_maps(vq);
>  #endif
>  
> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
