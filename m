Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087D2B037C
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 12:07:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3535986F0C;
	Thu, 12 Nov 2020 11:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0GgzyLkKWlS; Thu, 12 Nov 2020 11:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CCBEA86F02;
	Thu, 12 Nov 2020 11:07:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95062C016F;
	Thu, 12 Nov 2020 11:07:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8A49C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B23832E19E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmQ-Bf2EjpFa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id CB9131FE0A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 11:07:33 +0000 (UTC)
Date: Thu, 12 Nov 2020 12:07:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=zZ3ortjpGyVdT6l5Epo+oXEihOo3YsbgeWmCO4SNBn297T52hhepV9lm5suD/944+Sz1gu
 BkYylnk8pMKlYkb4csofMkEGSrhcQcyIn5AL1i1pw3/utYozF/zdo6+bRfmnph5PP7xve1
 PpOVvXxebOQE5U3JtIzNhA0Fc1104xhNai+afx4A4y2O3Fs5x58WbqWTdn5gkAWgcM/duh
 sMgxr+wPIZY9f8FrD3RrbmLqGk62lK9VfUOJuVBmyG+rJup0NYxJRRrKBRd/enHEx2zhIx
 UfbLWY8NE5CqXAlPHU3T/T5B/66csi1W6K2Uz4Y5UeWB8lzg0bfoVIlYejlz5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605179252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GScfsa8nOXUlNCCC/0bnPZszGImDlkAqoVu5Twbqets=;
 b=IHlNPa7GPp5Ilh/x3NSZBuxoBCag1CyU3lSY94fXEHyvLJqz7JXMYGP0aqsiN8HGB3WFr5
 ZFMQ/3qvo+nJiyAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
Message-ID: <20201112110729.vx4xebavy6gpzuef@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christian Koenig <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
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

On 2020-11-12 09:10:34 [+0100], Marek Szyprowski wrote:
> I can do more tests to help fixing this issue. Just let me know what to do.

-> https://lkml.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Sebastian
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
