Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63D7A50F5
	for <lists.virtualization@lfdr.de>; Mon, 18 Sep 2023 19:28:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA53C404B6;
	Mon, 18 Sep 2023 17:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA53C404B6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YWcb9uvR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYEfC4rvTkTO; Mon, 18 Sep 2023 17:27:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E50C640874;
	Mon, 18 Sep 2023 17:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50C640874
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21CA3C0DD3;
	Mon, 18 Sep 2023 17:27:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95CA1C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Sep 2023 17:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC8E404E8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Sep 2023 17:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC8E404E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTD8ZsLIlI5W
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Sep 2023 17:27:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFB97404B6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Sep 2023 17:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB97404B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695058068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4mO3T2+ldSwa/yZAn9slxFEvO1YZrGLXM+EycGDV9no=;
 b=YWcb9uvRxrqS10TngfAAxDxcU9tJQa1/ScxHpHukL+IdvvlEo+80OVfuKLGILDKkI8Vceq
 bCQ41CCdw+Ujwkos+yf0//pJ8E5s6/4l9tQ6YQNxopSOcBImaMj3JbE6QkxQ6kXtZ1+Dqi
 EzUuGdCLjYssTmwkjwSWGasKjxn4SLY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-8bkJUZ7uPUupqchiIkP9FA-1; Mon, 18 Sep 2023 13:27:47 -0400
X-MC-Unique: 8bkJUZ7uPUupqchiIkP9FA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a9d7a801a3so338777466b.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Sep 2023 10:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695058066; x=1695662866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mO3T2+ldSwa/yZAn9slxFEvO1YZrGLXM+EycGDV9no=;
 b=tQFnEHIsY9nUfqWqK3SkWNyczSTWYlayndZoTPgCiPB8uClKAxpwSFACg/4QoZaaUO
 eb8H3TGwA4DCIHCVOky4ltoUy3PpdSCZUel632VkMX42I3XHclPLcwaPyEJlbOz7X3Xv
 veMEY3fwokpFgVVD24PKWeGaY3gdsnFQbn5pwcN87VYrJF5Ck/IyUasp23avP04Td4e6
 URclhV4uKNBMC+TFHLDk2Nd4i2R8DS4oG+ha5M8e+glRlygIZZPqnxoHfboi6tanShZk
 XqFg3xE8L8VRIUF6TnJzMMete41Bkfq5UMwV1pSH8xBQKRANQAe+gfiOTvSWFw94CisF
 JdUg==
X-Gm-Message-State: AOJu0Yx+H8AcoegsG31RqSExfPaZJWSC0uYovtK92LZF0pQLf+U5bADc
 CMm3f241t3U5YU2Slgugv1D2qcxzqKbZQNKJRhP4IA9lXqlazyVtYGS1CsOnc1todT0/YxnynnR
 Hw+ofE4cKlX7au/+TPiIdcwClP2EbKJPsVzqoDlv9+w==
X-Received: by 2002:a17:906:7685:b0:9a2:1e03:1572 with SMTP id
 o5-20020a170906768500b009a21e031572mr8451783ejm.19.1695058066277; 
 Mon, 18 Sep 2023 10:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpPy2kzt5JnkJCTcgB2EButqNerXTfWD1GcDkHlaa0llvCnOfY2tEEWBZorUMvFHNoEJTWng==
X-Received: by 2002:a17:906:7685:b0:9a2:1e03:1572 with SMTP id
 o5-20020a170906768500b009a21e031572mr8451755ejm.19.1695058065892; 
 Mon, 18 Sep 2023 10:27:45 -0700 (PDT)
Received: from redhat.com ([2.52.3.35]) by smtp.gmail.com with ESMTPSA id
 rp15-20020a170906d96f00b009a1b857e3a5sm6739045ejb.54.2023.09.18.10.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 10:27:45 -0700 (PDT)
Date: Mon, 18 Sep 2023 13:27:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH net-next v9 0/4] vsock/virtio/vhost: MSG_ZEROCOPY
 preparations
Message-ID: <20230918132726-mutt-send-email-mst@kernel.org>
References: <20230916130918.4105122-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20230916130918.4105122-1-avkrasnov@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com,
 Eric Dumazet <edumazet@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 kernel@sberdevices.ru, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Sat, Sep 16, 2023 at 04:09:14PM +0300, Arseniy Krasnov wrote:
> Hello,
> 
> this patchset is first of three parts of another big patchset for
> MSG_ZEROCOPY flag support:
> https://lore.kernel.org/netdev/20230701063947.3422088-1-AVKrasnov@sberdevices.ru/
> 
> During review of this series, Stefano Garzarella <sgarzare@redhat.com>
> suggested to split it for three parts to simplify review and merging:
> 
> 1) virtio and vhost updates (for fragged skbs) <--- this patchset
> 2) AF_VSOCK updates (allows to enable MSG_ZEROCOPY mode and read
>    tx completions) and update for Documentation/.
> 3) Updates for tests and utils.
> 
> This series enables handling of fragged skbs in virtio and vhost parts.
> Newly logic won't be triggered, because SO_ZEROCOPY options is still
> impossible to enable at this moment (next bunch of patches from big
> set above will enable it).

Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> I've included changelog to some patches anyway, because there were some
> comments during review of last big patchset from the link above.
> 
> Head for this patchset is:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=f2fa1c812c91e99d0317d1fc7d845e1e05f39716
> 
> Link to v1:
> https://lore.kernel.org/netdev/20230717210051.856388-1-AVKrasnov@sberdevices.ru/
> Link to v2:
> https://lore.kernel.org/netdev/20230718180237.3248179-1-AVKrasnov@sberdevices.ru/
> Link to v3:
> https://lore.kernel.org/netdev/20230720214245.457298-1-AVKrasnov@sberdevices.ru/
> Link to v4:
> https://lore.kernel.org/netdev/20230727222627.1895355-1-AVKrasnov@sberdevices.ru/
> Link to v5:
> https://lore.kernel.org/netdev/20230730085905.3420811-1-AVKrasnov@sberdevices.ru/
> Link to v6:
> https://lore.kernel.org/netdev/20230814212720.3679058-1-AVKrasnov@sberdevices.ru/
> Link to v7:
> https://lore.kernel.org/netdev/20230827085436.941183-1-avkrasnov@salutedevices.com/
> Link to v8:
> https://lore.kernel.org/netdev/20230911202234.1932024-1-avkrasnov@salutedevices.com/


> Changelog:
>  v3 -> v4:
>  * Patchset rebased and tested on new HEAD of net-next (see hash above).
>  v4 -> v5:
>  * See per-patch changelog after ---.
>  v5 -> v6:
>  * Patchset rebased and tested on new HEAD of net-next (see hash above).
>  * See per-patch changelog after ---.
>  v6 -> v7:
>  * Patchset rebased and tested on new HEAD of net-next (see hash above).
>  * See per-patch changelog after ---.
>  v7 -> v8:
>  * Patchset rebased and tested on new HEAD of net-next (see hash above).
>  * See per-patch changelog after ---.
>  v8 -> v9:
>  * Patchset rebased and tested on new HEAD of net-next (see hash above).
>  * See per-patch changelog after ---.
> 
> Arseniy Krasnov (4):
>   vsock/virtio/vhost: read data from non-linear skb
>   vsock/virtio: support to send non-linear skb
>   vsock/virtio: non-linear skb handling for tap
>   vsock/virtio: MSG_ZEROCOPY flag support
> 
>  drivers/vhost/vsock.c                         |  14 +-
>  include/linux/virtio_vsock.h                  |  10 +
>  .../events/vsock_virtio_transport_common.h    |  12 +-
>  net/vmw_vsock/virtio_transport.c              |  92 +++++-
>  net/vmw_vsock/virtio_transport_common.c       | 307 ++++++++++++++----
>  5 files changed, 348 insertions(+), 87 deletions(-)
> 
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
