Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C627D12A192
	for <lists.virtualization@lfdr.de>; Tue, 24 Dec 2019 14:03:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F2BF855D8;
	Tue, 24 Dec 2019 13:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5qeG+iXTf8J; Tue, 24 Dec 2019 13:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D4C0855D2;
	Tue, 24 Dec 2019 13:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 494BDC0881;
	Tue, 24 Dec 2019 13:03:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3A5CC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 13:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1D2B86F3F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 13:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BK0uOtR0j8Dv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 13:03:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 70BE786F88
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 13:03:25 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0ED600C09669CD883F0A9D.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:d600:c096:69cd:883f:a9d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 395AF1EC0AE5;
 Tue, 24 Dec 2019 14:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1577192598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=RPmKXDdfeilER4Cgaeoi2HiLWA8B3GNUxDgJuxdBXfU=;
 b=reF83Q8gQU8d8BbbxQtuMbOFtz4tNW0TWem/vVoR96GaFFqKuP34eCfMKbkHGHhpKGdri3
 pyPpxWQoCT/9pskvQWyrWoFHiWRqJx3nXMkEvHac9OE4eXfjVFUgDyv9Abz9tEzv8ew26N
 WtLUvAmpJ1NPS+Gi5gUtfB2R8Ui/FNQ=
Date: Tue, 24 Dec 2019 14:03:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v10 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20191224130310.GE21017@zn.tnic>
References: <20191205000957.112719-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205000957.112719-1-thgarnie@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kristen@linux.intel.com, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jslaby@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
 Len Brown <len.brown@intel.com>, keescook@chromium.org,
 linux-pm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
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

On Wed, Dec 04, 2019 at 04:09:37PM -0800, Thomas Garnier wrote:
> Minor changes based on feedback and rebase from v9.
> 
> Splitting the previous serie in two. This part contains assembly code
> changes required for PIE but without any direct dependencies with the
> rest of the patchset.

Ok, modulo the minor commit message and comments fixup, this looks ok
and passes testing here.

I'm going to queue patches 2-11 of the next version unless someone
complains.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
