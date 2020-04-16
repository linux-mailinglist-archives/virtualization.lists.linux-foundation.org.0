Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D21AD29A
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 00:13:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 761C720517;
	Thu, 16 Apr 2020 22:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dyuf8Gw0Cst; Thu, 16 Apr 2020 22:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7743920352;
	Thu, 16 Apr 2020 22:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C150C1D88;
	Thu, 16 Apr 2020 22:13:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86191C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 70B608448C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buIoO9GN1utl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E7CD83626
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587075203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/u0LPtyLoWqHhu031obH5mrCOMBmS5JL1NEWxB3Ztc4=;
 b=Ynhd8ovwNhciGBi1YJzRmK+YoOSkzQzGYqMemEutBW/BwwlX2vMDWlUOu1oYLDZ9lSm8pf
 W/suIskx9awcUSz9jCvPYIh5rkQ2GIIzMRyoOqv9BAtJ+OPlF0z+C8ZZxOqZAoblBi0J8S
 HT1mFNNbVDB4MofOGUic4icU7dfgBNk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-zxcYSysDP4O7A2gPaAzBYQ-1; Thu, 16 Apr 2020 18:13:20 -0400
X-MC-Unique: zxcYSysDP4O7A2gPaAzBYQ-1
Received: by mail-wr1-f72.google.com with SMTP id f2so2467269wrm.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/u0LPtyLoWqHhu031obH5mrCOMBmS5JL1NEWxB3Ztc4=;
 b=ALFONbdJJVI7cX9ijaouM+0MWOzXCLKDgDqick8KkFx47NtW6Sob7XldQ8I8VVZXh3
 vGw5ql2wGBUlUcbdRAdbqbXv3Rlmo+fT+o36n/sfNaBYP2bvExgsPUDchUDhLYyWgUJO
 9woU1T0UMZzyCApAsd286+KnououFgwVI3O5SGUssyGXDGzbZQGl1AvQaGUqVyR+Yd8N
 CcFh6cr+kA4vWfuo9v+vYGO7fzvHp5wB2FPmetFRdUKO7Lnh3WBQyj+Kpsixqk69XHf3
 8GuYzqJcOzAu9K1Fqd4bTKgMMUirxQ1Q1RLI/BwTE2fxZJ5tvbxYRnhVNA4A1yeoc+5M
 iVQw==
X-Gm-Message-State: AGi0PuYmb9SokXg3FtWj3/ftwQnoM73q8EvTK2PrP3ar5amSk6Bao1o0
 kYQETjE0L7+vo6tYn7pQuTyBNrMMwIGnmNdCk927OGArVK0fIZDsk9vE4hiT71FrJbeMue27Cae
 iM+tr60w/PPu/KVMLrMl3mhpbQCqSqy0P0h5c/0E9MQ==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr383371wrt.98.1587075199422;
 Thu, 16 Apr 2020 15:13:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKv0p5buaBX3vhQ8hr7H5MgNq9hRFz2M9F9m5LbknHurFD2+E6Mz7IvdEMLjnBJvhTU6gTRwg==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr383343wrt.98.1587075199174;
 Thu, 16 Apr 2020 15:13:19 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id v19sm24124066wra.57.2020.04.16.15.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 15:13:18 -0700 (PDT)
Date: Thu, 16 Apr 2020 18:13:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH] virtio-balloon: Disable free page hinting/reporting if
 page poison is disabled
Message-ID: <20200416180845-mutt-send-email-mst@kernel.org>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200416192809.8763.19308.stgit@localhost.localdomain>
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

On Thu, Apr 16, 2020 at 12:30:38PM -0700, Alexander Duyck wrote:
> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> 
> If we have free page hinting or page reporting enabled we should disable it
> if the pages are poisoned or initialized on free and we cannot notify the
> hypervisor.
> 
> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> 
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>


Why not put this logic in the hypervisor?
We don't know what hypervisor uses the hints for.
Yes you can not just drop them but you can maybe do
other things such as MADV_SOFT_OFFLINE.

Finally, VIRTIO_BALLOON_F_FREE_PAGE_HINT does nothing
at all unless guest gets the command from hypervisor,
so there isn't even any overhead.



> ---
>  drivers/virtio/virtio_balloon.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 95d9c2f0a7be..08bc86a6e468 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -1110,8 +1110,12 @@ static int virtballoon_validate(struct virtio_device *vdev)
>  	/* Tell the host whether we care about poisoned pages. */
>  	if (!want_init_on_free() &&
>  	    (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
> -	     !page_poisoning_enabled()))
> +	     !page_poisoning_enabled())) {
>  		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> +	} else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
> +		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
> +		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
> +	}
>  
>  	__virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
>  	return 0;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
