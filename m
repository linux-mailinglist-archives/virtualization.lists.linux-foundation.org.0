Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E93A0BAE
	for <lists.virtualization@lfdr.de>; Wed,  9 Jun 2021 06:50:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22AE360685;
	Wed,  9 Jun 2021 04:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prUSfvm-gObu; Wed,  9 Jun 2021 04:50:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11B676059F;
	Wed,  9 Jun 2021 04:50:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 949F4C000B;
	Wed,  9 Jun 2021 04:50:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574D6C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 04:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C474013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 04:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Gn0OzqD4AYH
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 04:50:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 242C640136
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 04:50:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 069C261287;
 Wed,  9 Jun 2021 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623214214;
 bh=G6QDDNn3+r21im4Pl2kiSv1GcKtQ+/5AqTQSbVrmM0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2EUG65o6C3VdlBkFse68F37GLtREPT60SPu0V0Fxt0TzuNQumQlVVZDgOU6hLwRy/
 /kKOe7ffd4YfOEve5Qm7Pe2I/bc0b9iqIqdsmjdOS7FpnFyhu1kC9g5vmqoj9+tjaq
 3MJIe2MZJ4fwpnaswxsw1/nzpyCOj7Kyv502nJNI=
Date: Wed, 9 Jun 2021 06:50:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YMBIghQaTelAvXOY@kroah.com>
References: <YL9f9uFoPGj2Q9Zl@kroah.com>
 <1623203313.4303577-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623203313.4303577-1-xuanzhuo@linux.alibaba.com>
Cc: regressions@lists.linux.dev, "Michael S.Tsirkin" <mst@redhat.com>,
 Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>
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

On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > With this patch and the latest net branch I no longer get crashes.
> >
> > Did this ever get properly submitted to the networking tree to get into
> > 5.13-final?
> 
> The patch has been submitted.
> 
> 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode

Submitted where?  Do you have a lore.kernel.org link somewhere?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
