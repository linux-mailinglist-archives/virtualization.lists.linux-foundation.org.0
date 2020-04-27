Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CA1BAAFA
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 19:18:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E63C8733B;
	Mon, 27 Apr 2020 17:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpSZwDWBhH3g; Mon, 27 Apr 2020 17:18:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 26DF7872A6;
	Mon, 27 Apr 2020 17:18:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ACFEC0172;
	Mon, 27 Apr 2020 17:18:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4C51C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 937BE85FEF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuECt01j1Ub4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:18:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2870885FAD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:18:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1092D15D4A682;
 Mon, 27 Apr 2020 10:18:20 -0700 (PDT)
Date: Mon, 27 Apr 2020 10:18:19 -0700 (PDT)
Message-Id: <20200427.101819.498317950218972559.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH net v2 0/2] vsock/virtio: fixes about packet delivery
 to monitoring devices
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200424150830.183113-1-sgarzare@redhat.com>
References: <20200424150830.183113-1-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 27 Apr 2020 10:18:20 -0700 (PDT)
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, kuba@kernel.org
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

From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 24 Apr 2020 17:08:28 +0200

> During the review of v1, Stefan pointed out an issue introduced by
> that patch, where replies can appear in the packet capture before
> the transmitted packet.
> 
> While fixing my patch, reverting it and adding a new flag in
> 'struct virtio_vsock_pkt' (patch 2/2), I found that we already had
> that issue in vhost-vsock, so I fixed it (patch 1/2).
> 
> v1 -> v2:
> - reverted the v1 patch, to avoid that replies can appear in the
>   packet capture before the transmitted packet [Stefan]
> - added patch to fix packet delivering to monitoring devices in
>   vhost-vsock
> - added patch to check if the packet is already delivered to
>   monitoring devices
> 
> v1: https://patchwork.ozlabs.org/project/netdev/patch/20200421092527.41651-1-sgarzare@redhat.com/

Series applied, thank you.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
