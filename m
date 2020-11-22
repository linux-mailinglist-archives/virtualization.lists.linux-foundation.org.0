Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 125CC2BC48D
	for <lists.virtualization@lfdr.de>; Sun, 22 Nov 2020 09:42:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10A0D85F0A;
	Sun, 22 Nov 2020 08:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-QuchwHMgFa; Sun, 22 Nov 2020 08:42:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FAD485F15;
	Sun, 22 Nov 2020 08:42:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 561DEC0052;
	Sun, 22 Nov 2020 08:42:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94C41C0052
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Nov 2020 08:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 88E6A870AC
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Nov 2020 08:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dsnn8f7r5J1n
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Nov 2020 08:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0AFB870A2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Nov 2020 08:41:59 +0000 (UTC)
Received: from localhost (thunderhill.nvidia.com [216.228.112.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53DED2075A;
 Sun, 22 Nov 2020 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606034519;
 bh=l8+ZhTDh9F9fWsYimVJSkhEdbr4s9CuLuORatF5DjRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIK6wam1X04xW00TxhlMW5iOTZCcnxPOBkpV3uwmoy1cL49LYxWslltAvNRH2Opfc
 9fQEhGf1iWmWfw4VGEUt61McdMKrYGXdXnRjLzqZoAhkc62wruHR718cGl3YiqpyFo
 wsfjeeTh9An4A7F8Nk1GEyhRIy8mxCQ81xlp+2mg=
Date: Sun, 22 Nov 2020 10:41:52 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: netconsole deadlock with virtnet
Message-ID: <20201122084152.GB3159@unreal>
References: <20201117102341.GR47002@unreal>
 <20201117093325.78f1486d@gandalf.local.home>
 <X7ZrWZ0UJoh+vQXm@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7ZrWZ0UJoh+vQXm@alley>
Cc: Itay Aveksis <itayav@nvidia.com>, John Ogness <john.ogness@linutronix.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux-foundation.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ran Rozenstein <ranro@nvidia.com>
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

On Thu, Nov 19, 2020 at 01:55:53PM +0100, Petr Mladek wrote:
> On Tue 2020-11-17 09:33:25, Steven Rostedt wrote:
> > On Tue, 17 Nov 2020 12:23:41 +0200
> > Leon Romanovsky <leon@kernel.org> wrote:
> >
> > > Hi,
> > >
> > > Approximately two weeks ago, our regression team started to experience those
> > > netconsole splats. The tested code is Linus's master (-rc4) + netdev net-next
> > > + netdev net-rc.
> > >
> > > Such splats are random and we can't bisect because there is no stable reproducer.
> > >
> > > Any idea, what is the root cause?
> > >
> > > [   21.149739]                       __do_sys_finit_module+0xbc/0x12c
> > > [   21.149740]                       __arm64_sys_finit_module+0x28/0x34
> > > [   21.149741]                       el0_svc_common.constprop.0+0x84/0x200
> > > [   21.149742]                       do_el0_svc+0x2c/0x90
> > > [   21.149743]                       el0_svc+0x18/0x50
> > > [   21.149744]                       el0_sync_handler+0xe0/0x350
> > > [   21.149745]                       el0_sync+0x158/0x180
> > > [   21.149746]  }
> > > [   21.149747]  ... key      at: [<ffff8000093d4018>] target_list_lock+0x18/0xfffffffffffff000 [netconsole]
> > > [   21.149748]  ..
> > > [   21.149750] Lost 190 message(s)!
> >
> > It really sucks that we lose 190 messages that would help to decipher this
> > more. :-p
>
> The message commes from the printk_safe code. The size can be
> increased by CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT.
>
> > Because I'm not sure where the xmit_lock is taken while holding the
> > target_list_lock. But the above does show that printk() calls write_msg()
> > while holding the console_lock, and write_msg() takes the target_list_lock.
> >
> > Thus, the fix would ether require disabling interrupts every time the
> > xmit_lock is taken, or to get it from being taken while holding the
> > target_list_lock.
>
> It seems that the missing messages might help to find the root of
> the problem.

Sorry for not being very responsive, I was in internet-free zone :).

I'll increase CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT from 13 to be 26, let's
see what night run will give us.

Thanks

>
> Best Regards,
> Petr
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
