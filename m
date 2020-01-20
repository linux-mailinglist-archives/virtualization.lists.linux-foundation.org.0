Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3C1429FE
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 13:03:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 365111FFC1;
	Mon, 20 Jan 2020 12:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVZAxXLaccMj; Mon, 20 Jan 2020 12:03:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 89AFE20012;
	Mon, 20 Jan 2020 12:03:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DC5BC0174;
	Mon, 20 Jan 2020 12:03:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCAAFC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA12A1FFC1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaWUBwJaI7rp
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F11220012
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579521811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0FYwpPvJVwXX6WibGdKe3t8GmO0Q/BB/ry3XOYj5v4=;
 b=IUsagC+QT7o8Lg7F1pqLCJbSApDaimaTwWR2DDCb+EFmTbNbyTERf0ROeQzX6iE2e3fthU
 8F+yuUTDv9de3lrQaArYnjglILK+XcLEWnwlYCnFXQssRlJpkb5HigEHVl5nJCAVc7o+4f
 e3mDKsdzEwwtdJ/I6u5d9fFXZCzJ1GM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2ehTjIyJPESUAThyT3J7dg-1; Mon, 20 Jan 2020 07:03:28 -0500
Received: by mail-qk1-f199.google.com with SMTP id 143so20224198qkg.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 04:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i0FYwpPvJVwXX6WibGdKe3t8GmO0Q/BB/ry3XOYj5v4=;
 b=mCFTDhuvgpSsU4ZUENSPSHaJ/e6iyuB5dgsLTNk7hYbgYqY4XRiZCS3rdJhz0a3SsW
 upfwhraYnyT9rhO5aqxDm1mrmShwHgwNSXwt3ADlFFM3YMpJ/TLTao6TFjp1vd+EE6UK
 xGckczFOiBsxmSYBCrm2tKdfE/aq/wdEcqng6aRJmih6OYHZJgp0qtARI9hdUfBjwEsG
 SQ4nh8YaBSc8x1QT4/01Lpmrhi4cahf+uXWy9wSSlBlBu+aC7KBU2zKS9rYCgjW6ZKlL
 T7vF1rEyXHrk2G1A0Mna8k63eMURN3pCbM2SMUTx2MK5ddz5kdIrzsTOYLEJ4AJq5tQT
 a1pQ==
X-Gm-Message-State: APjAAAWhh+n/et1DwrqV/S1R3I/Z19dk6kf6CZ/DebpYyBtTgvt6Z9wI
 z17dUlB6UM5XWDBle1DjQH3hxaIbPrDIiOtGxqMt+v44JqmIQGqsycYdtUNlwD+YSbz37mYh9nH
 zNd467kz+bqvgcBIzjBPclGF8JNHXzU5uuvZAe1kHiQ==
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr20372312qta.196.1579521807751; 
 Mon, 20 Jan 2020 04:03:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBOvpzVbluzRk2PBevjR+yTn5PHKpCN1mkjbfx/S5QQmnZyFB/1WiP+Ct1GD9bo9yvXG9y7A==
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr20372288qta.196.1579521807486; 
 Mon, 20 Jan 2020 04:03:27 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id h8sm17044762qtm.51.2020.01.20.04.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 04:03:26 -0800 (PST)
Date: Mon, 20 Jan 2020 07:03:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 1/3] vsock: add network namespace support
Message-ID: <20200120060601-mutt-send-email-mst@kernel.org>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200116172428.311437-2-sgarzare@redhat.com>
 <20200120.100610.546818167633238909.davem@davemloft.net>
 <20200120101735.uyh4o64gb4njakw5@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200120101735.uyh4o64gb4njakw5@steredhat>
X-MC-Unique: 2ehTjIyJPESUAThyT3J7dg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 decui@microsoft.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 David Miller <davem@davemloft.net>, jhansen@vmware.com
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

On Mon, Jan 20, 2020 at 11:17:35AM +0100, Stefano Garzarella wrote:
> On Mon, Jan 20, 2020 at 10:06:10AM +0100, David Miller wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > Date: Thu, 16 Jan 2020 18:24:26 +0100
> > 
> > > This patch adds 'netns' module param to enable this new feature
> > > (disabled by default), because it changes vsock's behavior with
> > > network namespaces and could break existing applications.
> > 
> > Sorry, no.
> > 
> > I wonder if you can even design a legitimate, reasonable, use case
> > where these netns changes could break things.
> 
> I forgot to mention the use case.
> I tried the RFC with Kata containers and we found that Kata shim-v1
> doesn't work (Kata shim-v2 works as is) because there are the following
> processes involved:
> - kata-runtime (runs in the init_netns) opens /dev/vhost-vsock and
>   passes it to qemu
> - kata-shim (runs in a container) wants to talk with the guest but the
>   vsock device is assigned to the init_netns and kata-shim runs in a
>   different netns, so the communication is not allowed
> But, as you said, this could be a wrong design, indeed they already
> found a fix, but I was not sure if others could have the same issue.
> 
> In this case, do you think it is acceptable to make this change in
> the vsock's behavior with netns and ask the user to change the design?

David's question is what would be a usecase that's broken
(as opposed to fixed) by enabling this by default.

If it does exist, you need a way for userspace to opt-in,
module parameter isn't that.

> 
> > 
> > I am totally against adding a module parameter for this, it's
> > incredibly confusing for users and will create a test scenerio
> > that is strongly less likely to be covered.
> > 
> 
> Got it, I'll remove the module parameter!
> 
> Thanks,
> Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
