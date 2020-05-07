Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3521C8736
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 12:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 068C38935A;
	Thu,  7 May 2020 10:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKyqjOgc6KaK; Thu,  7 May 2020 10:47:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B1768935B;
	Thu,  7 May 2020 10:47:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67C0AC07FF;
	Thu,  7 May 2020 10:47:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 926BEC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D09388493
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2e1+OsVBgU0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:47:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2DD7C8849B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588848459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GBZ1BPaYoUZGlKv+l0CXQxh4T9djzRMOd1T5tvSABs=;
 b=QbKXJKbB1MkI06PS2+PwYfsG7LATq18yKcePAHwHhGA34r6qPUbcaVzO7OAeCuDVjybSZH
 Gy55vXi3ArhKoAX5rLC7x/IgjnT2z1t9sdbgjnbm2wXkXkvOy/V23kJL9Tv5VaVh1MytD1
 rRb0/q/Cj02Oe4TW1hFatfjnlsFNhH4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-NU5cj33xPT2uLJorVD3t4w-1; Thu, 07 May 2020 06:47:37 -0400
X-MC-Unique: NU5cj33xPT2uLJorVD3t4w-1
Received: by mail-wm1-f70.google.com with SMTP id h184so3137814wmf.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 03:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5GBZ1BPaYoUZGlKv+l0CXQxh4T9djzRMOd1T5tvSABs=;
 b=dfanKqICn8HjU5YjkBw0k5i3Eybv8z/HfLfXOLoJT36Lyo5PUUzv15EnXkDw30KLhd
 TAwZyzOXMoaDgPZPejkdif2j0JY4BeYxa6m9r3Xg87/k10nybYJwuooDkU7BBUEQ0LQm
 Iz5f9vBTTlPPGYnjyMlJzTUhx0c/E55niU9IqCULmpe7GEs2nY4cKAWP6hD8ladOV0Ah
 yFWHBhhsPjHGsJrOqwLEYU/Mj+F1EnqK63gtRFYeyprhYHaCNCoJW4Ze3mY3RhJneDCZ
 hzpoiZIKjQClrj1Nnfxisz5vDioHXsXQGoamtP0UGFdHYSa45jjO+6So8fVkEH8CGQ9V
 UTwg==
X-Gm-Message-State: AGi0PuZCgRq/v4UitfZ7cV1Ad6YJWwfsMo5qOd2ifums2yyrjjmDRLey
 M+vuk15fg1D/rJJEkyDQuyXOV285plfoWM+CofAXrvRVK4wncnzUikmRUSaMXcD3wfVq3Z3Wy6E
 xU+jsnRJCsnWeJ3wubkvzhLDfM+4CWVxwgq4xQJZMag==
X-Received: by 2002:adf:e751:: with SMTP id c17mr15873039wrn.351.1588848456326; 
 Thu, 07 May 2020 03:47:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypLG5sLX7vjTBpzQVJYqyJozq0EEasF4Ci+xsJ7MLTLakuqA8erklYkKxDwmmh/F0jhS05XJgw==
X-Received: by 2002:adf:e751:: with SMTP id c17mr15873017wrn.351.1588848456163; 
 Thu, 07 May 2020 03:47:36 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 a9sm7225179wmm.38.2020.05.07.03.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 03:47:35 -0700 (PDT)
Date: Thu, 7 May 2020 06:47:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 10/15] MAINTAINERS: Add myself as virtio-mem maintainer
Message-ID: <20200507064709-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
 <20200507103119.11219-11-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507103119.11219-11-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org
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

On Thu, May 07, 2020 at 12:31:14PM +0200, David Hildenbrand wrote:
> Let's make sure patches/bug reports find the right person.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Make this patch 2 in the series, or even squash into patch 1.

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d43ea5468b5..ad2b34f4dd66 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18037,6 +18037,13 @@ S:	Maintained
>  F:	drivers/iommu/virtio-iommu.c
>  F:	include/uapi/linux/virtio_iommu.h
>  
> +VIRTIO MEM DRIVER
> +M:	David Hildenbrand <david@redhat.com>
> +L:	virtualization@lists.linux-foundation.org
> +S:	Maintained
> +F:	drivers/virtio/virtio_mem.c
> +F:	include/uapi/linux/virtio_mem.h
> +
>  VIRTUAL BOX GUEST DEVICE DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  M:	Arnd Bergmann <arnd@arndb.de>
> -- 
> 2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
