Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BFF42659E
	for <lists.virtualization@lfdr.de>; Fri,  8 Oct 2021 10:07:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3E4E404D4;
	Fri,  8 Oct 2021 08:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxEm6CEjtEQT; Fri,  8 Oct 2021 08:07:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 76D74404D8;
	Fri,  8 Oct 2021 08:07:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EBB2C0022;
	Fri,  8 Oct 2021 08:07:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF181C000D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF1B404D9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Qrt7GA0JE3S
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34776404D5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 421E16103C;
 Fri,  8 Oct 2021 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633680419;
 bh=kGwVpcF3zNihtrnLcERvX+ksKyNuVpUrUUXYJeskBBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbN+xLK01FyhYXntRsjNk0Lc0PeHB8E7rIeffLJwg55YhmntjMsMrtsKXe47417QT
 lRetSuu6gjBSLFIaf1qIvPNx75DaYggOI4ukaKt45ejDKjZU0pTKRTTm8g1omiPAM5
 UEu+QjF2IDfBH/B7YAUNM4lJKjwgBUCbAlcPP4r8=
Date: Fri, 8 Oct 2021 10:06:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YV/8Ia1d9zXvMqqc@kroah.com>
References: <YV8RTqGSTuVLMFOP@kroah.com>
 <1633623446.6192446-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1633623446.6192446-1-xuanzhuo@linux.alibaba.com>
Cc: regressions@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Oct 08, 2021 at 12:17:26AM +0800, Xuan Zhuo wrote:
> On Thu, 7 Oct 2021 17:25:02 +0200, Greg KH <gregkh@linuxfoundation.org> w=
rote:
> > On Thu, Oct 07, 2021 at 11:06:12PM +0800, Xuan Zhuo wrote:
> > > On Thu, 07 Oct 2021 14:04:22 +0200, Corentin No=EBl <corentin.noel@co=
llabora.com> wrote:
> > > > I've been experiencing crashes with 5.14-rc1 and above that do not
> > > > occur with 5.13,
> > >
> > > I should have fixed this problem before. I don't know why, I just loo=
ked at the
> > > latest net code, and this commit seems to be lost.
> > >
> > >      1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for skb=
_over_panic inside big mode
> > >
> > > Can you test this patch again?
> >
> > That commit showed up in 5.13-rc5, so 5.14-rc1 and 5.13 should have had
> > it in it, right?
> >
> =

> Yes, it may be lost due to conflicts during a certain merge.

Really?  I tried to apply that again to 5.14 and it did not work.  So I
do not understand what to do here, can you try to explain it better?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
