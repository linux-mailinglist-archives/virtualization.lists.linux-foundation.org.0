Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A66C21D40B
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 12:54:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18349888D4;
	Mon, 13 Jul 2020 10:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYjCV63NdkAF; Mon, 13 Jul 2020 10:54:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FDC38878E;
	Mon, 13 Jul 2020 10:54:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1074C0733;
	Mon, 13 Jul 2020 10:54:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC043C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAF2188732
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FfTSxoGn-NE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:54:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 954618876B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594637689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0NLlKHEztDWyj5cXVFVh6qpf88cHYugGxDnOHI6njCI=;
 b=DB0zPGTa6Wq2+Q7g9DkAy1CqH6pMSftFU6pCGX8nhPGmV18xNPTNI8mPN0nOzXigrx2n2W
 7N8EXVA6u4Qq8J2nGQTekmCngnV155eqMhlNHWbYlkBae9j9THcJKZpuiV0wZJMxiCKWWh
 +9PxlqH8aZa8jg6+aAO72IHgTYpzP08=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-3nJkCnpkNA6b77au3SjmgA-1; Mon, 13 Jul 2020 06:54:47 -0400
X-MC-Unique: 3nJkCnpkNA6b77au3SjmgA-1
Received: by mail-wr1-f70.google.com with SMTP id 89so17297907wrr.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0NLlKHEztDWyj5cXVFVh6qpf88cHYugGxDnOHI6njCI=;
 b=LjV0+RKri796ho0MF30gFHHakogHirF0RNpxRBORU2BjpoCL/MgoVxTVuYVwNeokcP
 p+eqENedHaxuUTYL0FXWkCAsO6vUWvaGF2+bCL88Xuy6omaZd3Sfh4/O+y1Nm1460krl
 otx58S48Fh/dwa6nJJKqiW/Ui+k5WpE8BI+YsCMsnriVpskMw5g/T648AQy05j4fhcax
 ThIf5Fh6K65iYj/26JZPcUnI34N+UrvP96RCmEjXtfI+1d3p23r1SissL/WHqvpLRBGS
 mGHTPDxkHbR6Ce6zRYcZ9ngfnlNV5w4FUWgSqaGxOuUrwPMw3wZMcorJT+wthu6GArLa
 lrHA==
X-Gm-Message-State: AOAM531qfFnh2qUVBuHV/+WklgpfnY2Y2FPwAk7eunuBpJZ6eojndICx
 Ej4njo/EL/00MYxY1oDko9kSIWEkTAJoPIiNlDuYdl0YerZ9PERYbgFSgBeTulcZwKvQ4Sb15xB
 sIcDROZ+Nn4pzz1nBjCPHrtKbKD5yopDA4bG6jpWdjg==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr87517226wrn.157.1594637686804; 
 Mon, 13 Jul 2020 03:54:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAncOEl2kEHA0hOXAsJ7SmP/xoYe30HIdDfYymthuFQE102T/NGVomRy+ErWMsZJ86/tL52g==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr87517218wrn.157.1594637686635; 
 Mon, 13 Jul 2020 03:54:46 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id 1sm21378309wmf.0.2020.07.13.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 03:54:46 -0700 (PDT)
Date: Mon, 13 Jul 2020 06:54:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vsock/virtio: annotate 'the_virtio_vsock' RCU pointer
Message-ID: <20200713065423-mutt-send-email-mst@kernel.org>
References: <20200710121243.120096-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710121243.120096-1-sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net
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

On Fri, Jul 10, 2020 at 02:12:43PM +0200, Stefano Garzarella wrote:
> Commit 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free
> on the_virtio_vsock") starts to use RCU to protect 'the_virtio_vsock'
> pointer, but we forgot to annotate it.
> 
> This patch adds the annotation to fix the following sparse errors:
> 
>     net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
>     net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in comparison expression (different address spaces):
>     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noderef] __rcu *
>     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *
> 
> Fixes: 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free on the_virtio_vsock")
> Reported-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this? Dave?

> ---
>  net/vmw_vsock/virtio_transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index dfbaf6bd8b1c..2700a63ab095 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -22,7 +22,7 @@
>  #include <net/af_vsock.h>
>  
>  static struct workqueue_struct *virtio_vsock_workqueue;
> -static struct virtio_vsock *the_virtio_vsock;
> +static struct virtio_vsock __rcu *the_virtio_vsock;
>  static DEFINE_MUTEX(the_virtio_vsock_mutex); /* protects the_virtio_vsock */
>  
>  struct virtio_vsock {
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
