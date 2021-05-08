Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 103913771AC
	for <lists.virtualization@lfdr.de>; Sat,  8 May 2021 14:22:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA444012B;
	Sat,  8 May 2021 12:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EukuAtzzmRVN; Sat,  8 May 2021 12:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B5D40404;
	Sat,  8 May 2021 12:22:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29A02C0001;
	Sat,  8 May 2021 12:22:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 701F3C0001
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 May 2021 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F94F40F7C
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 May 2021 12:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eo-4vGRWj8Xf
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 May 2021 12:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D92C414FC
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 May 2021 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620476557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqIHXF/RzgI6RicHORDy0FfhUzmOMaZdt2NO6pcWHTE=;
 b=COJbkSoj4j1qOHBsqPkw575AO9W+UYTDGAafdpeBYqM1CWY+nrAVgikc+s/8pVDiOLzmsC
 QvKHxyPouyR4Q0PhJpQejDkSVKr133QCztJlYxWhEkh+vsZTiNV28v5J3pt6x5suglO5wq
 7UDMoHLov8620p7ukgrZM/RtdvCVIV8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-Y_-UVcpaPqO_5e68ayhvkA-1; Sat, 08 May 2021 08:22:35 -0400
X-MC-Unique: Y_-UVcpaPqO_5e68ayhvkA-1
Received: by mail-ot1-f71.google.com with SMTP id
 u14-20020a056830248eb02902a5e3432ae9so6975158ots.12
 for <virtualization@lists.linux-foundation.org>;
 Sat, 08 May 2021 05:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XqIHXF/RzgI6RicHORDy0FfhUzmOMaZdt2NO6pcWHTE=;
 b=ivMpVWesypPuX+yjn8dGbgwpouG2rAD26dGKjchth2VNFBlHsneag5iT3i5OecdwEC
 G5ggiobFsG1IETfAEgG7+PQvFB99NGVZEnneWwqywNA3aaHwRbnIvtFwMQS1LqP3siKx
 RBEjUnsMJGNexKI3jbVfjNE/AsanX9PBR5ha8RIP0TWTZG2l/KR/UViDkgzcURBAiCyH
 ct/ybHHjKGafG1wNaJR9NVj3yO2+YL6ctXjPnJvIBMRzR8VadrWjGC0UphKRKel+wgot
 4KC+qk5awztoFzh2zIzxCC1oIcdtP0n+hH7rgMiXYllVhgNF9awclvCpKUCFu8Jt20+D
 1rsQ==
X-Gm-Message-State: AOAM532bJbD3GSeM7WZrZMFpzk5+k3lCbM1G/fX73Myl+NwymlRX76zs
 pkuYcjzppcQHJ1JVg9PsET6PmrvF1gHXcsIKWsimYZFAiWZRjWOw+9j7ZGmCP5FaL4qyVz63G8L
 KWgwwhf31er2Rw/I9jSleJfH6/kiuioK+R40kY5wzhQ==
X-Received: by 2002:aca:c402:: with SMTP id u2mr11001589oif.139.1620476554666; 
 Sat, 08 May 2021 05:22:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCaPhvMNHUP48XCcuNXFvnwBEM6JmWvAjl7sIYqItYIsYwDPp1DaYba66prqr9etqJ/4m3QQ==
X-Received: by 2002:aca:c402:: with SMTP id u2mr11001579oif.139.1620476554493; 
 Sat, 08 May 2021 05:22:34 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 z4sm1744288otq.65.2021.05.08.05.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 05:22:34 -0700 (PDT)
Subject: Re: [PATCH] virtiofs: Enable multiple request queues
From: Connor Kuehl <ckuehl@redhat.com>
To: virtio-fs@redhat.com
References: <20210507221527.699516-1-ckuehl@redhat.com>
Message-ID: <9b9c8779-84b4-5c6d-8dc2-c16f18c68c70@redhat.com>
Date: Sat, 8 May 2021 07:22:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507221527.699516-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Vivek Goyal <vgoyal@redhat.com>
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

On 5/7/21 5:15 PM, Connor Kuehl wrote:
> Distribute requests across the multiqueue complex automatically based
> on the IRQ affinity.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index bcb8a02e2d8b..dcdc8b7b1ad5 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -30,6 +30,10 @@
>  static DEFINE_MUTEX(virtio_fs_mutex);
>  static LIST_HEAD(virtio_fs_instances);
>  
> +struct virtio_fs_vq;
> +
> +DEFINE_PER_CPU(struct virtio_fs_vq *, this_cpu_fsvq);
> [..]
> +
> +		for_each_cpu(cpu, mask) {
> +			struct virtio_fs_vq **cpu_vq = per_cpu_ptr(&this_cpu_fsvq, cpu);
> +			*cpu_vq = &fs->vqs[i];
> +		}
> +	}

Hmm, actually, it's just occurred to me that the per-CPU state could be
problematic with multiple virtio-fs mounts.

I'll workshop this some more.

Connor

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
