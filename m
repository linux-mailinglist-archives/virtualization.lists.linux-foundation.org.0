Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A45023655DA
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 12:07:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383AE401E4;
	Tue, 20 Apr 2021 10:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxGB6fQQlMLX; Tue, 20 Apr 2021 10:07:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9EE402D4;
	Tue, 20 Apr 2021 10:07:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88983C000B;
	Tue, 20 Apr 2021 10:07:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61323C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421544052A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVIsunAyUt9V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C875640524
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dywaIrimntGHtXMPexJC2bdCK/i5J9mjfxsn18CX8A0=;
 b=VWt+aFTOigdSC+0dSgqPjPY8Er01yEZtHsaoMaJgsuML2uJJJHHjdYvwHEdYZ1gMpZaWnb
 dUEuGS8wWby55Jbf6W4yiyV2gg4drR28bO5uZIOKUx9RMgzrRj4QIGC2UfpIKTinPC2Lax
 4WZh6joxb6cttxtmYPFjaElxRB/blSQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-uJ1PPWHmP4GzEy8scQoHcQ-1; Tue, 20 Apr 2021 06:07:38 -0400
X-MC-Unique: uJ1PPWHmP4GzEy8scQoHcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso4949113wmr.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 03:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dywaIrimntGHtXMPexJC2bdCK/i5J9mjfxsn18CX8A0=;
 b=m1jpFQGn/uUco5sTnqpLXUAPZNcC2S1avVLUtjJpQxvj+gni1cuPs3gI1FjgiLzoQP
 v+zws74oG03DkpnAW8/CQUiGJ/4gEgKuzRgFy7vLym16reCo4viQAu4a2LwL8scCaSMn
 TLf2FC5qlFX44GUDMVmb2BnLtm6XlTp5G1B7GyyPkhooryRLJ/3jJWqL/bpS1/PBUlcM
 INWXNCsWog/U8J4HEC0EbD/u7X/PbeohY+FJfWP4RLoJUuqEz5Smi8tVMwf7FEfpIhlA
 2ToAbpfDI8tzV+GcoBSsj+zV74Qhe57EvwsBf456D/SMAAZG0cStD8gZl5cxK0wTUPWg
 CLNw==
X-Gm-Message-State: AOAM53145jyLvYpser8oGAsxv/5bY2Ug7KtUFVw/Amm7VovvBZ2aEfu/
 6/STZdnCq1GwBcUVyCKvnBkyEdAKog9ls4/tJldvT1YJW1YATrq6PZSA+Al/3w4V+pNgMCuyFXw
 V9cfTXKDLrPCNDnG/4Q4S4VHZq9jQzfntsehB8/wIGw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr19800072wrq.167.1618913257148; 
 Tue, 20 Apr 2021 03:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzylBHKjaYkdj2ID3wez0kTYdtoOuUKNSm38xMKbXTkQM0o2Cry8DF33FvRPX7WNnbWeH3P+g==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr19800063wrq.167.1618913257010; 
 Tue, 20 Apr 2021 03:07:37 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id t20sm2686479wmi.35.2021.04.20.03.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:07:36 -0700 (PDT)
Date: Tue, 20 Apr 2021 06:07:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net-next] virtio-net: fix use-after-free in page_to_skb()
Message-ID: <20210420060715-mutt-send-email-mst@kernel.org>
References: <20210420094341.3259328-1-eric.dumazet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210420094341.3259328-1-eric.dumazet@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev <netdev@vger.kernel.org>,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 syzbot <syzkaller@googlegroups.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
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

On Tue, Apr 20, 2021 at 02:43:41AM -0700, Eric Dumazet wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> KASAN/syzbot had 4 reports, one of them being:
> 
> BUG: KASAN: slab-out-of-bounds in memcpy include/linux/fortify-string.h:191 [inline]
> BUG: KASAN: slab-out-of-bounds in page_to_skb+0x5cf/0xb70 drivers/net/virtio_net.c:480
> Read of size 12 at addr ffff888014a5f800 by task systemd-udevd/8445
> 
> CPU: 0 PID: 8445 Comm: systemd-udevd Not tainted 5.12.0-rc8-next-20210419-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x141/0x1d7 lib/dump_stack.c:120
>  print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:233
>  __kasan_report mm/kasan/report.c:419 [inline]
>  kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:436
>  check_region_inline mm/kasan/generic.c:180 [inline]
>  kasan_check_range+0x13d/0x180 mm/kasan/generic.c:186
>  memcpy+0x20/0x60 mm/kasan/shadow.c:65
>  memcpy include/linux/fortify-string.h:191 [inline]
>  page_to_skb+0x5cf/0xb70 drivers/net/virtio_net.c:480
>  receive_mergeable drivers/net/virtio_net.c:1009 [inline]
>  receive_buf+0x2bc0/0x6250 drivers/net/virtio_net.c:1119
>  virtnet_receive drivers/net/virtio_net.c:1411 [inline]
>  virtnet_poll+0x568/0x10b0 drivers/net/virtio_net.c:1516
>  __napi_poll+0xaf/0x440 net/core/dev.c:6962
>  napi_poll net/core/dev.c:7029 [inline]
>  net_rx_action+0x801/0xb40 net/core/dev.c:7116
>  __do_softirq+0x29b/0x9fe kernel/softirq.c:559
>  invoke_softirq kernel/softirq.c:433 [inline]
>  __irq_exit_rcu+0x136/0x200 kernel/softirq.c:637
>  irq_exit_rcu+0x5/0x20 kernel/softirq.c:649
>  common_interrupt+0xa4/0xd0 arch/x86/kernel/irq.c:240
> 
> Fixes: fb32856b16ad ("virtio-net: page_to_skb() use build_skb when there's sufficient tailroom")
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Reported-by: Mat Martineau <mathew.j.martineau@linux.intel.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/net/virtio_net.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 8cd76037c72481200ea3e8429e9fdfec005dad85..2e28c04aa6351d2b4016f7d277ce104c4970069d 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -385,6 +385,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	struct sk_buff *skb;
>  	struct virtio_net_hdr_mrg_rxbuf *hdr;
>  	unsigned int copy, hdr_len, hdr_padded_len;
> +	struct page *page_to_free = NULL;
>  	int tailroom, shinfo_size;
>  	char *p, *hdr_p;
>  
> @@ -445,7 +446,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  		if (len)
>  			skb_add_rx_frag(skb, 0, page, offset, len, truesize);
>  		else
> -			put_page(page);
> +			page_to_free = page;
>  		goto ok;
>  	}
>  
> @@ -479,6 +480,8 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  		hdr = skb_vnet_hdr(skb);
>  		memcpy(hdr, hdr_p, hdr_len);
>  	}
> +	if (page_to_free)
> +		put_page(page_to_free);
>  
>  	if (metasize) {
>  		__skb_pull(skb, metasize);
> -- 
> 2.31.1.368.gbe11c130af-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
