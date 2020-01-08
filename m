Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC43133CA6
	for <lists.virtualization@lfdr.de>; Wed,  8 Jan 2020 09:08:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0391520337;
	Wed,  8 Jan 2020 08:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6KdJ8RfUu6R; Wed,  8 Jan 2020 08:08:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D09A2203E3;
	Wed,  8 Jan 2020 08:08:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B046DC0881;
	Wed,  8 Jan 2020 08:08:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7DACC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8F39320337
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iHPMHo4z31i
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B690C1FE32
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jan 2020 08:08:06 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a67so1891698oib.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Jan 2020 00:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9lAK3bszh6tWp/dVwz4gJZ7NIZBKvl8mgEWhJz1N9U=;
 b=YRY/Q5a43XVSnHtWgybDpuZVki0PA6JVx9x+4lqSxIL5NglhDjqyWWkBkvwCVjMg4z
 vHgA5h8BEfT2p2gQbzmYW1RbECBusIlikKwTRGzLbObGzSkQOrZInhMMBj6ITFG1sFbT
 FfCyK1mzQd0GNPSa3VVYAjdHrPtulStSRe+SZxp/Qid3JMrYx8p1vk4QVCDf73t6EE29
 TVTuqfK4hXNKOcvRd0/9GhZRHcCOu4uiihYUBzK2a2dgkY52+cjEokmgTt6xXDQZMbY5
 dJjKMcKF5ld1f44DlY84h+EHfnK4EPa1Iz1iA9MMCbMrhTtUmQYAabdPsrCWDiclGQuv
 5Wsw==
X-Gm-Message-State: APjAAAVIzBCNJrEoYytcFJhlF8mwZ6/U8Q5D/civQADs9DkVVIIp91FW
 OhI1XQzgN6oNiv/UH5yCE+xnD4dn1Wd9PwoIM0o=
X-Google-Smtp-Source: APXvYqyHxa8fgIJDObTLOZ73RoRUdvNM74muiuZsOkTaJvwYlT+0s8R5nYIen4AoxoDKsD4fs/oquvfeWacJQ1YKaqA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1987025oia.148.1578470885935; 
 Wed, 08 Jan 2020 00:08:05 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-1-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:07:54 +0100
Message-ID: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
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

Hi Krzysztof,

On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The ioread8/16/32() and others have inconsistent interface among the
> architectures: some taking address as const, some not.
>
> It seems there is nothing really stopping all of them to take
> pointer to const.

Shouldn't all of them take const volatile __iomem pointers?
It seems the "volatile" is missing from all but the implementations in
include/asm-generic/io.h.

> Patchset was really tested on all affected architectures.
> Build testing is in progress - I hope auto-builders will point any issues.
>
>
> Todo
> ====
> Convert also string versions (ioread16_rep() etc) if this aproach looks OK.
>
>
> Merging
> =======
> The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
> via one tree, or even squashed into one.

Yes, they should be squashed, cfr. Arnd's comment.
I also wouldn't bother doing the updates in patches 6-10.

The rest looks good to me.
Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
