Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A53154063
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:36:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C37921513;
	Thu,  6 Feb 2020 08:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lt2RAzaaf3Sd; Thu,  6 Feb 2020 08:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D2D9921503;
	Thu,  6 Feb 2020 08:36:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B978FC013E;
	Thu,  6 Feb 2020 08:36:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6260FC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5126885D87
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdTRtPdTOfjb
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 96B9985CB8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580978193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=74n076s+3DHQh3T3bcXdZPPlzGYWoamkk1gc54HiO/8=;
 b=aLSDRmcZ2y9lV/rDRAVk0cTg0MNu+jbzh1YtuTvY7E+NMWSaMmNCzvK6s6vi+aY/3qKAzf
 DsX0Ne5fT2vcrmLog2+rB53ECslAXdueLgPpBZX49MCZz+cT9PeLohScVCov8PXi6bONZ4
 vDiH2XqHWHObmHzKF5fExVvpXU93I34=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-3-EeFsEkMYqjDrV_Kgkz5Q-1; Thu, 06 Feb 2020 03:36:31 -0500
Received: by mail-qt1-f198.google.com with SMTP id e37so3340477qtk.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 00:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74n076s+3DHQh3T3bcXdZPPlzGYWoamkk1gc54HiO/8=;
 b=SjsBwadDLFd1YwQzD7We9EK/xohq85HrfUDbHbipFblBo639OE9ninFdEzYzQyZvGN
 c04IzXGf/BhCuC3p/ymdhXGBX+cRfFY11O6LXSCaumAw+G32k2O5z1f2pAUfhZWO8G4w
 9oleyOY766miipuFLfhNVBA2ZO9aO93LabfOfbGdo/7+WvgCEoA1m7dwFV6qYQchpUqL
 rHkFRb/Xxb29xhONo75+N3ZEU4JqtXG2czMhZrZwoWCposXoXsGL2mgx1DtHZPvXyahS
 dTINKLjVzXDZzToJxwPWUvznRNg2jnhXcg8EwFNW6WYSCRkZgf2m6yNOElFXwfY5H88m
 2N3w==
X-Gm-Message-State: APjAAAXNUc9Ubm5WJ5IljzEFX1fgLFoqKexdU61a21q20Yhm1uuW+Vbr
 Aeg9ojJfVRYMaRsUg4vhJ9JB8W0aQ4CkhxBTi72SLY2G4biht6mceGGaNLrhPHAFSMN98b2tmYG
 fgcpe5uWyMMxSTWLxgUG3zR8zj90+za5rgSaVYjOG9g==
X-Received: by 2002:aed:204d:: with SMTP id 71mr1650675qta.116.1580978191352; 
 Thu, 06 Feb 2020 00:36:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOjwDIx6ECH63BTSKTS7qQDsEkSPH49BMWkAwLbEf63JTlbiX87dRDwKUJa0Z97Qca2pYdzw==
X-Received: by 2002:aed:204d:: with SMTP id 71mr1650665qta.116.1580978191144; 
 Thu, 06 Feb 2020 00:36:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id x126sm1099710qkc.42.2020.02.06.00.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:36:30 -0800 (PST)
Date: Thu, 6 Feb 2020 03:36:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] virtio-balloon: Fix memory leak when unloading
 while hinting is in progress
Message-ID: <20200206033617-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200205163402.42627-2-david@redhat.com>
X-MC-Unique: 3-EeFsEkMYqjDrV_Kgkz5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Liang Li <liang.z.li@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Wed, Feb 05, 2020 at 05:34:00PM +0100, David Hildenbrand wrote:
> When unloading the driver while hinting is in progress, we will not
> release the free page blocks back to MM, resulting in a memory leak.
> 
> Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Liang Li <liang.z.li@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Applied, thanks!

> ---
>  drivers/virtio/virtio_balloon.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 8e400ece9273..abef2306c899 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -968,6 +968,10 @@ static void remove_common(struct virtio_balloon *vb)
>  		leak_balloon(vb, vb->num_pages);
>  	update_balloon_size(vb);
>  
> +	/* There might be free pages that are being reported: release them. */
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> +		return_free_pages_to_mm(vb, ULONG_MAX);
> +
>  	/* Now we reset the device so we can clean up the queues. */
>  	vb->vdev->config->reset(vb->vdev);
>  
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
