Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB37D614F
	for <lists.virtualization@lfdr.de>; Wed, 25 Oct 2023 07:50:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A56D703A4;
	Wed, 25 Oct 2023 05:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A56D703A4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRg6HQCi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWlEbP-Y3SXU; Wed, 25 Oct 2023 05:49:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 52B077079C;
	Wed, 25 Oct 2023 05:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52B077079C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A13AC008C;
	Wed, 25 Oct 2023 05:49:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4E73C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 05:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8DE6FCCD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 05:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8DE6FCCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQxyhZzegsEb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 05:49:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94BF06FC0E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 05:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BF06FC0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698212991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZmdyaZ9qXbYT3M7CCj4FId0OwQhVUrEnLkY5RdWbyec=;
 b=CRg6HQCibJX+092jcd7We3wd6c9HR1taiWXMMWVI9SoNR4eRWIKbnkJ+l5upioIvh2k3HU
 HEmS6ZM2qwNPv6B4Vf4Em+DeW0ISikdjlOqpXlaccKQHPLyyBSxhizItqpG9VJQO3131lA
 vGwqAyVXsPxBfh1PF2Mbh7hopxKsuEw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-hn_lGLysN1aqSiXT38YjFQ-1; Wed, 25 Oct 2023 01:49:49 -0400
X-MC-Unique: hn_lGLysN1aqSiXT38YjFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-408f9e9e9b0so23845725e9.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 22:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698212988; x=1698817788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmdyaZ9qXbYT3M7CCj4FId0OwQhVUrEnLkY5RdWbyec=;
 b=rp6WC8bW6lZlPU6OZxOGgK3k5fqOQReIWtbONLaxL2pmwcxxsTQk7AM6oYqFsOdk3x
 u4JPx72OtwwDhcPKDxZ+ucTrTQlTSmrPqLZ0qIGUr4X3e/kp2C/qjbH4ziUgh5lknJOy
 tA32WCUvayYCjzx5Y/cT0qPGscvQDlqGcU6pILfN5bQSGz+/m61U4tKLG6OxdhTNm4IA
 xGkD4g6kbUKE9aWG8sgnuWSwEa19g5QWLZ4hlF9OxJSE4xMfzvkHSXz5w1nwmuD9b9Ty
 8yN81kq5E4pJRwzctmDxV3R7y117TkNY1dhppllUF0FlggahtU3L9BViJK7AWKq70jzx
 buhA==
X-Gm-Message-State: AOJu0YzURyDYFiymNAoYI4hp6JkDAMj/vwVH3RR6eF6Amos68smhWjnf
 uyCOKzwEw1Qkt7j44ErzhiICIPpCpZU2jplMKGJZ/hMLJn2XRznXIpjvUDoHoP2h83O1XUJOP2K
 OKytgCNqU8PvB/LB6LAtnrXou6lQ7vii78WYZDI7Ljg==
X-Received: by 2002:a05:600c:468c:b0:408:3ea0:3026 with SMTP id
 p12-20020a05600c468c00b004083ea03026mr10594934wmo.11.1698212988464; 
 Tue, 24 Oct 2023 22:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErtELIfss3EdE6wkMvrrbrNfMHdzx0+gPrTXpCzna2cPiuLf5sUwd9EudZdDacqgHXNu1zHw==
X-Received: by 2002:a05:600c:468c:b0:408:3ea0:3026 with SMTP id
 p12-20020a05600c468c00b004083ea03026mr10594920wmo.11.1698212988006; 
 Tue, 24 Oct 2023 22:49:48 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f1:7547:f72e:6bd0:1eb2:d4b5])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b0032da471c0c1sm11303905wrx.7.2023.10.24.22.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 22:49:47 -0700 (PDT)
Date: Wed, 25 Oct 2023 01:49:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Subject: Re: [PATCH net-next 0/5] virtio-net: support dynamic coalescing
 moderation
Message-ID: <20231025014821-mutt-send-email-mst@kernel.org>
References: <cover.1697093455.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <cover.1697093455.git.hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Liu, Yujie" <yujie.liu@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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

On Thu, Oct 12, 2023 at 03:44:04PM +0800, Heng Qi wrote:
> Now, virtio-net already supports per-queue moderation parameter
> setting. Based on this, we use the netdim library of linux to support
> dynamic coalescing moderation for virtio-net.
> 
> Due to hardware scheduling issues, we only tested rx dim.

So patches 1 to 4 look ok but patch 5 is untested - we should
probably wait until it's tested properly.


> @Test env
> rxq0 has affinity to cpu0.
> 
> @Test cmd
> client: taskset -c 0 sockperf tp -i ${IP} -t 30 --tcp -m ${msg_size}
> server: taskset -c 0 sockperf sr --tcp
> 
> @Test res
> The second column is the ratio of the result returned by client
> when rx dim is enabled to the result returned by client when
> rx dim is disabled.
> 	--------------------------------------
> 	| msg_size |  rx_dim=on / rx_dim=off |
> 	--------------------------------------
> 	|   14B    |         + 3%            |   
> 	--------------------------------------
> 	|   100B   |         + 16%           |
> 	--------------------------------------
> 	|   500B   |         + 25%           |
> 	--------------------------------------
> 	|   1400B  |         + 28%           |
> 	--------------------------------------
> 	|   2048B  |         + 22%           |
> 	--------------------------------------
> 	|   4096B  |         + 5%            |
> 	--------------------------------------
> 
> ---
> This patch set was part of the previous netdim patch set[1].
> [1] was split into a merged bugfix set[2] and the current set.
> The previous relevant commentators have been Cced.
> 
> [1] https://lore.kernel.org/all/20230811065512.22190-1-hengqi@linux.alibaba.com/
> [2] https://lore.kernel.org/all/cover.1696745452.git.hengqi@linux.alibaba.com/
> 
> Heng Qi (5):
>   virtio-net: returns whether napi is complete
>   virtio-net: separate rx/tx coalescing moderation cmds
>   virtio-net: extract virtqueue coalescig cmd for reuse
>   virtio-net: support rx netdim
>   virtio-net: support tx netdim
> 
>  drivers/net/virtio_net.c | 394 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 322 insertions(+), 72 deletions(-)
> 
> -- 
> 2.19.1.6.gb485710b

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
