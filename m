Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3313082D
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 14:11:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F4448633B;
	Sun,  5 Jan 2020 13:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K91hcf53iSgt; Sun,  5 Jan 2020 13:11:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1F40860FC;
	Sun,  5 Jan 2020 13:11:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EBA8C0881;
	Sun,  5 Jan 2020 13:11:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56DECC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4D1BA20435
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGg-lDKMnLH8
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:11:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 1EA2420427
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578229913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyYUzIHEBzvMmT9xAB0gUkIWrPMEuu7IviISm1YnXRw=;
 b=Jrg5AMR7AhXgI3YS4Ge3ezsBy1bf/uMcdRXaQ9U1K3A7FAR8edhaaFhdpVjMeZuyGqun/v
 kth+s57WEujP3a54Bfu+n1/nN6ZBV8bfLDU5cIEYnEdQo7wDwqDvXDwdG69sZzmvaN5o1X
 S+Poi2/eUTwcMftWPiroJ8C6rXBdxB4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-xJzeMXpeOe2Zyf5Ca_M69A-1; Sun, 05 Jan 2020 08:11:50 -0500
Received: by mail-qk1-f199.google.com with SMTP id f124so27920805qkb.22
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 05:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iyYUzIHEBzvMmT9xAB0gUkIWrPMEuu7IviISm1YnXRw=;
 b=PDxgNdFN+PXrEkJIwPGhjV9Wv/g4hPFslUnXkDsQukBgArz2meEZMEWGldzzqL2MtD
 NWii9pN9mXFPyzX5/opmr0LfW2eLQw+Bf99QlLVGKhwLIRLUcdzXPGCjPMj5C1hWHVCj
 h0SF+4CBKUFA+08z9Dc9daD6xBNKrGxgT5UOV9ERqvVf5HZ5qoLHosvn5y1Cfy3nM5W2
 xSKY+oOCcf1PG4yqLYlJJuSmx1dbAmUmXnMdSJMe3A/F3wsIu4AC/4RG6gmEdsGHSVlb
 s2QZPKw4vGlkJ3oaLvHyk98+SF9bDetjdoS1T42b6hC/joQv/c30CeGSpQIplkeH170q
 N5Dw==
X-Gm-Message-State: APjAAAW402eZMjMK8ihBIGw/d8Cqv6eUdnEFqconYpTIN8FaItIb6dEU
 h+a1GL7UKorkstxDpO4DkiwDgWxGMzezH29s199u262TnzuxZM99sAWz1cqe92phBwxLpdAHdbu
 3c/4MWYKnSndbOz9ddSbWqQFf2GuSvOqiMmAdwBmVLw==
X-Received: by 2002:a37:4b8b:: with SMTP id
 y133mr78104272qka.210.1578229909725; 
 Sun, 05 Jan 2020 05:11:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrCL6RBFjmX9xJsJ45MZDzlT2zeFXkFnFsnHGjIbM3E+IYUvdGdsKolBDECkX6lm0VqOHfQQ==
X-Received: by 2002:a37:4b8b:: with SMTP id
 y133mr78104255qka.210.1578229909431; 
 Sun, 05 Jan 2020 05:11:49 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id v4sm21599657qtd.24.2020.01.05.05.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 05:11:48 -0800 (PST)
Date: Sun, 5 Jan 2020 08:11:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Delva <adelva@google.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
Message-ID: <20200105081111-mutt-send-email-mst@kernel.org>
References: <20191220212207.76726-1-adelva@google.com>
MIME-Version: 1.0
In-Reply-To: <20191220212207.76726-1-adelva@google.com>
X-MC-Unique: xJzeMXpeOe2Zyf5Ca_M69A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kernel-team@android.com, "David S . Miller" <davem@davemloft.net>
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

On Fri, Dec 20, 2019 at 01:22:07PM -0800, Alistair Delva wrote:
> On devices without control virtqueue support, such as the virtio_net
> implementation in crosvm[1], attempting to configure LRO will panic the
> kernel:
> 
> kernel BUG at drivers/net/virtio_net.c:1591!
> invalid opcode: 0000 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> Hardware name: ChromiumOS crosvm, BIOS 0
> RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  ? preempt_count_add+0x58/0xb0
>  ? _raw_spin_lock_irqsave+0x36/0x70
>  ? _raw_spin_unlock_irqrestore+0x1a/0x40
>  ? __wake_up+0x70/0x190
>  virtnet_set_features+0x90/0xf0 [virtio_net]
>  __netdev_update_features+0x271/0x980
>  ? nlmsg_notify+0x5b/0xa0
>  dev_disable_lro+0x2b/0x190
>  ? inet_netconf_notify_devconf+0xe2/0x120
>  devinet_sysctl_forward+0x176/0x1e0
>  proc_sys_call_handler+0x1f0/0x250
>  proc_sys_write+0xf/0x20
>  __vfs_write+0x3e/0x190
>  ? __sb_start_write+0x6d/0xd0
>  vfs_write+0xd3/0x190
>  ksys_write+0x68/0xd0
>  __ia32_sys_write+0x14/0x20
>  do_fast_syscall_32+0x86/0xe0
>  entry_SYSENTER_compat+0x7c/0x8e
> 
> This happens because virtio_set_features() does not check the presence
> of the control virtqueue feature, which is sanity checked by a BUG_ON
> in virtnet_send_command().
> 
> Fix this by skipping any feature processing if the control virtqueue is
> missing. This should be OK for any future feature that is added, as
> presumably all of them would require control virtqueue support to notify
> the endpoint that offload etc. should begin.
> 
> [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> 
> Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> Cc: stable@vger.kernel.org [4.20+]
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: kernel-team@android.com
> Cc: virtualization@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Alistair Delva <adelva@google.com>
> ---
>  drivers/net/virtio_net.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..709bcd34e485 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
>  	u64 offloads;
>  	int err;
>  
> +	if (!vi->has_cvq)
> +		return 0;
> +

So should this return an error then?

>  	if ((dev->features ^ features) & NETIF_F_LRO) {
>  		if (vi->xdp_queue_pairs)
>  			return -EBUSY;
> -- 
> 2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
