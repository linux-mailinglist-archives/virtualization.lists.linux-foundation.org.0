Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA0524E4A
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 15:30:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F2B60E5B;
	Thu, 12 May 2022 13:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBvqDgvm2Xnf; Thu, 12 May 2022 13:30:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 560CC610E4;
	Thu, 12 May 2022 13:30:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA9C2C007E;
	Thu, 12 May 2022 13:30:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EAC5C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1734183ED7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ellerman.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpSDGpVvpQOM
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 13:30:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13C678123F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 13:30:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KzXhR4ZhGz4xR7;
 Thu, 12 May 2022 23:30:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652362216;
 bh=OHJM1f7XN6+lzOwoDZ09Fq7vQBcErz2VmaBrM25W470=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JRtMg+tyAWDlKzhPPh9uybt1ddV4/KtdlG7b8VYxkeOYeOpVcVnKu6H/o/R88zk5F
 OJX65tNJb7/vnfdDefOPaRf4bokKLDt70KwDHa+JRI6x/EAsibZNuITfcHJc4iSeBr
 Fe1jb+l1FwjCDhsPqY0wuFTsHK0CBvASeGyGtShfxYBGJbFMJw2seBdBOcEa2KEv/9
 DkzuqCS4hSISwhDm0g0o2WFOkw/DrMH+lh1u4OIrPBuJcT6eH+gfmW2XKQPCLyQLIz
 S0VDqHnOq5lIheGAKwe+l/szU1/curzqtA18hKetlimSYfFq2lNMWfeTZa3Tx/AHw4
 PCWpgHpamKfug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] virtio: last minute fixup
In-Reply-To: <CAHk-=wj9zKJGA_6SJOMPiQEoYke6cKX-FV3X_5zNXOcFJX1kOQ@mail.gmail.com>
References: <20220510082351-mutt-send-email-mst@kernel.org>
 <CAHk-=wjPR+bj7P1O=MAQWXp0Mx2hHuNQ1acn6gS+mRo_kbo5Lg@mail.gmail.com>
 <87czgk8jjo.fsf@mpe.ellerman.id.au>
 <CAHk-=wj9zKJGA_6SJOMPiQEoYke6cKX-FV3X_5zNXOcFJX1kOQ@mail.gmail.com>
Date: Thu, 12 May 2022 23:30:15 +1000
Message-ID: <87mtfm7uag.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: KVM list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, mie@igel.co.jp,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Wed, May 11, 2022 at 3:12 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Which I read as you endorsing Link: tags :)
>
> I absolutely adore "Link:" tags. They've been great.
>
> But they've been great for links that are *usedful*.
>
> They are wonderful when they link to the original problem.
>
> They are *really* wonderful when they link to some long discussion
> about how to solve the problem.
>
> They are completely useless when they link to "this is the patch
> submission of the SAME DAMN PATCH THAT THE COMMIT IS".

Folks wanted to add Change-Id: tags to every commit.

You said we didn't need to, because we have the Link: to the original
patch submission, which includes the Message-Id and therefore is a
de facto change id.

Links to other random places don't serve that function.

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
