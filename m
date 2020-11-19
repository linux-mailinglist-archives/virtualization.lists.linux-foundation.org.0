Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED32B92E4
	for <lists.virtualization@lfdr.de>; Thu, 19 Nov 2020 13:56:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F03585BCE;
	Thu, 19 Nov 2020 12:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBQ6Xig7aAr8; Thu, 19 Nov 2020 12:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 834D086D06;
	Thu, 19 Nov 2020 12:55:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 587B4C0891;
	Thu, 19 Nov 2020 12:55:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF3F3C0891
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C76D486C70
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzxtUCoG1zo6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:55:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A5EB85BCE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:55:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605790553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39x7fJFPPlLakp3YlNqlFaUvUant6cOCVinlnWmWyyo=;
 b=kXknShMZ9JYzOFD8KKPKumZ9SVWfeSx9B1q+pi1bKr5PIsCF4MzkCvNdfUdyahFAWdJtL/
 oaD413PEhhtxcDkOnnxuQeTt81xvOlVdYXi9DhfF4/8L4GJ8nq0YLtDAHu2lt8rq1WY0Nq
 NkOOhk7OZzZwJr2r5r6JTGG0HVzwCOI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD94FAF10;
 Thu, 19 Nov 2020 12:55:53 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:55:53 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: netconsole deadlock with virtnet
Message-ID: <X7ZrWZ0UJoh+vQXm@alley>
References: <20201117102341.GR47002@unreal>
 <20201117093325.78f1486d@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117093325.78f1486d@gandalf.local.home>
Cc: Itay Aveksis <itayav@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Amit Shah <amit@kernel.org>, virtualization@lists.linux-foundation.org,
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
From: Petr Mladek via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue 2020-11-17 09:33:25, Steven Rostedt wrote:
> On Tue, 17 Nov 2020 12:23:41 +0200
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > Hi,
> > 
> > Approximately two weeks ago, our regression team started to experience those
> > netconsole splats. The tested code is Linus's master (-rc4) + netdev net-next
> > + netdev net-rc.
> > 
> > Such splats are random and we can't bisect because there is no stable reproducer.
> > 
> > Any idea, what is the root cause?
> > 
> > [   21.149739]                       __do_sys_finit_module+0xbc/0x12c
> > [   21.149740]                       __arm64_sys_finit_module+0x28/0x34
> > [   21.149741]                       el0_svc_common.constprop.0+0x84/0x200
> > [   21.149742]                       do_el0_svc+0x2c/0x90
> > [   21.149743]                       el0_svc+0x18/0x50
> > [   21.149744]                       el0_sync_handler+0xe0/0x350
> > [   21.149745]                       el0_sync+0x158/0x180
> > [   21.149746]  }
> > [   21.149747]  ... key      at: [<ffff8000093d4018>] target_list_lock+0x18/0xfffffffffffff000 [netconsole]
> > [   21.149748]  ..
> > [   21.149750] Lost 190 message(s)!
> 
> It really sucks that we lose 190 messages that would help to decipher this
> more. :-p

The message commes from the printk_safe code. The size can be
increased by CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT.

> Because I'm not sure where the xmit_lock is taken while holding the
> target_list_lock. But the above does show that printk() calls write_msg()
> while holding the console_lock, and write_msg() takes the target_list_lock.
> 
> Thus, the fix would ether require disabling interrupts every time the
> xmit_lock is taken, or to get it from being taken while holding the
> target_list_lock.

It seems that the missing messages might help to find the root of
the problem.

Best Regards,
Petr
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
