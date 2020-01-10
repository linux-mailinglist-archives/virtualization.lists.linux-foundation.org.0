Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7BE13655D
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 03:33:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 531F4204C2;
	Fri, 10 Jan 2020 02:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MreJUOZ9gO1u; Fri, 10 Jan 2020 02:33:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 263F0204B0;
	Fri, 10 Jan 2020 02:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05B44C0881;
	Fri, 10 Jan 2020 02:33:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0FE3C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 02:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9828C8648E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 02:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBLGirj3PGwm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 02:33:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C52C3816F9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 02:33:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id ADA6615736417;
 Thu,  9 Jan 2020 18:33:39 -0800 (PST)
Date: Thu, 09 Jan 2020 18:33:39 -0800 (PST)
Message-Id: <20200109.183339.173768060466817001.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200105132120.92370-1-mst@redhat.com>
References: <20200105132120.92370-1-mst@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 09 Jan 2020 18:33:40 -0800 (PST)
Cc: adelva@google.com, willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Sun, 5 Jan 2020 08:22:07 -0500

> The only way for guest to control offloads (as enabled by
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) is by sending commands
> through CTRL_VQ. So it does not make sense to
> acknowledge VIRTIO_NET_F_CTRL_GUEST_OFFLOADS without
> VIRTIO_NET_F_CTRL_VQ.
> 
> The spec does not outlaw devices with such a configuration, so we have
> to support it. Simply clear VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> Note that Linux is still crashing if it tries to
> change the offloads when there's no control vq.
> That needs to be fixed by another patch.
> 
> Reported-by: Alistair Delva <adelva@google.com>
> Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Same patch as v1 but update documentation so it's clear it's not
> enough to fix the crash.

Where are we with this patch?  There seems to still be some unresolved
discussion about how we should actually handle this case.

Thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
