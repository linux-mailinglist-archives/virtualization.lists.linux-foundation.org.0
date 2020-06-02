Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F81EB43F
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 06:22:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AEE985EC4;
	Tue,  2 Jun 2020 04:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIMEC1Zz3g26; Tue,  2 Jun 2020 04:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B49A85E6E;
	Tue,  2 Jun 2020 04:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57DB9C0176;
	Tue,  2 Jun 2020 04:22:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5604C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BDBE185E6E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLvasmhT2fE8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DD88685817
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591071755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YDfsRlwfRR1nDcp4wd5hK1KujxFVRibBNSbBOaOrz2Q=;
 b=X8FnC/x9SCa5vJY15Os/NgB6nawcFpKJaDXreIB8m84EPDlTy9XHLAWv/Zny3K0FHi4Nb3
 8LdpUU/8m/eOLIxkEiiX9UFoTyhOTFaK/KJFTZMPWNZ3Let1L3FvT3iSJVQSnPTVqcc4R7
 i1c1lgV4k52xxGtwe+/HGiSPJXPtk+c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-KzxX-EOCPUKIkpcOBFRiqw-1; Tue, 02 Jun 2020 00:22:30 -0400
X-MC-Unique: KzxX-EOCPUKIkpcOBFRiqw-1
Received: by mail-wm1-f69.google.com with SMTP id x6so438336wmj.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 21:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YDfsRlwfRR1nDcp4wd5hK1KujxFVRibBNSbBOaOrz2Q=;
 b=VT41ZHxsxu9vIDwuQfmTZGNxN3ABVZiuDSs7hJ06rmw+Q7BWHu+extzsvnpVVfKk1h
 4UjcMxpWY9vh1pz95HJOTUAagbCp/LXYcq0Xqlgn8sBdB+DKHBdzO5UZXxnMs4gyQnXR
 YQ7jKUbC+g5iXyscdQQDUvSHPCqGL6Llp+3EJxXff411sgfBL4QmXDoxbKLtC6pdJHGS
 Im5jsMevETCZE6q0sI6jusJ74dA03l3ulcZ7YuqrQKtrIVHHcqWEqjIA2sipkWpOiipA
 W+A3VLWJT+WLPIvopSaGyE3W6Vu+TmPqHZsAy7WVTCPqhk70qaigbZdTpzctHSv5MRF7
 Dvmg==
X-Gm-Message-State: AOAM531teb/kPEki0AdkYGflSTyXdEpjkh8eSBxk9E5LnVSvp6EGi6KG
 S7EA39QxLzYSYB0dGyU8mQTjlqHuDDtERrgoxvSVDWGr/srNUs255RTb8KqmDmT53r4MQWghIMU
 Ci6i7TKhQBvAsl/u1vcr7A56zQTmjytiSrr4WocxFFQ==
X-Received: by 2002:a05:6000:1083:: with SMTP id
 y3mr23714185wrw.425.1591071749222; 
 Mon, 01 Jun 2020 21:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2SKrCnIib4b4OHp9esqIfnn8bX4FrOHyf8lEFnkhypfH/4sW2rsrN9doierFMkcN8evfSkA==
X-Received: by 2002:a05:6000:1083:: with SMTP id
 y3mr23714174wrw.425.1591071749030; 
 Mon, 01 Jun 2020 21:22:29 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 z2sm1731263wrs.87.2020.06.01.21.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 21:22:28 -0700 (PDT)
Date: Tue, 2 Jun 2020 00:22:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/2] vhost: convert get_user_pages() --> pin_user_pages()
Message-ID: <20200602002212-mutt-send-email-mst@kernel.org>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
 <20200529234309.484480-3-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20200529234309.484480-3-jhubbard@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
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

On Fri, May 29, 2020 at 04:43:09PM -0700, John Hubbard wrote:
> This code was using get_user_pages*(), in approximately a "Case 5"
> scenario (accessing the data within a page), using the categorization
> from [1]. That means that it's time to convert the get_user_pages*() +
> put_page() calls to pin_user_pages*() + unpin_user_pages() calls.
> 
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>     https://lwn.net/Articles/807108/
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vhost/vhost.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 21a59b598ed8..596132a96cd5 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -1762,15 +1762,14 @@ static int set_bit_to_user(int nr, void __user *addr)
>  	int bit = nr + (log % PAGE_SIZE) * 8;
>  	int r;
>  
> -	r = get_user_pages_fast(log, 1, FOLL_WRITE, &page);
> +	r = pin_user_pages_fast(log, 1, FOLL_WRITE, &page);
>  	if (r < 0)
>  		return r;
>  	BUG_ON(r != 1);
>  	base = kmap_atomic(page);
>  	set_bit(bit, base);
>  	kunmap_atomic(base);
> -	set_page_dirty_lock(page);
> -	put_page(page);
> +	unpin_user_pages_dirty_lock(&page, 1, true);
>  	return 0;
>  }
>  
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
