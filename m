Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6812D395
	for <lists.virtualization@lfdr.de>; Mon, 30 Dec 2019 19:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D88228616F;
	Mon, 30 Dec 2019 18:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDDPeUA3rIc0; Mon, 30 Dec 2019 18:52:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6664A86064;
	Mon, 30 Dec 2019 18:52:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48983C077D;
	Mon, 30 Dec 2019 18:52:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 570C0C077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 18:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D74685AF1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 18:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96i6Ye2kJGA0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 18:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5519185A4B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 18:52:31 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id k14so47300431otn.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 10:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2PU80e06dVsLEFBPoBP15a3a0bqTWpgCtffJm4G5PGU=;
 b=bHZS9r+DC7xoeD6cxpH4i3xpSJ/gq50CwlupX1697alL9zoV2RniiOpeS0fzfamIQa
 WxQ7cCBNSANfXeX4NY4r/hZFK4P1w1JlyzXv9TnOkQRK0d1M4ZscNJljNFAQFM5GFlOM
 35xcjwPPMRp352B/JuDt4EKyWZZ4Uo+a1Db+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2PU80e06dVsLEFBPoBP15a3a0bqTWpgCtffJm4G5PGU=;
 b=HUJl1/2ZO7avet2vhB0G9J9ghOW9zenFIKEFNAkAlKSG4a6EwY0PLu3dhp5DxNZugl
 NJYmfPG2M4rOi29w4N5H5/HyXmGKbLnluv2jrCzEJygfsY/yDX3r0kKXF+Q+e0VYJ8FP
 dv1WnTlBkf4E9wL3hkaf9HbszpEW5msisG0IomgzzdmtPGwV2BRAlYRRe0Uqz7T7lSee
 xQWb+K6iMi/Vi3DxoAeGZTwObDBvCjGnvWe5S15oIwvNbVfeQ4crrFs0+YRySF/fnUsx
 IeHK32ciFr4io0Zi57l3UuuZh6Q1bbdTarza3jcpzrwfnTWrf1ybZ8dVVZvwfGxUsGMH
 ROqA==
X-Gm-Message-State: APjAAAXzfE+vuREZaf7pEV754Bo5YV/Qy0D5N2MFCh6meARLIPld+P53
 +++L0ZGYMQXirFa/3euAD/zhcA==
X-Google-Smtp-Source: APXvYqyRXCmINU65Y6yuKMiO/XiDPdUu64Vn+VoIxbx6ttD2OgkwUiThd7nh2RnWqHJyh6C1czL/mQ==
X-Received: by 2002:a9d:748d:: with SMTP id t13mr73212089otk.181.1577731950592; 
 Mon, 30 Dec 2019 10:52:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r13sm13994800oic.52.2019.12.30.10.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 10:52:29 -0800 (PST)
Date: Mon, 30 Dec 2019 10:52:28 -0800
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v10 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <201912301052.16438D6@keescook>
References: <20191205000957.112719-1-thgarnie@chromium.org>
 <20191224130310.GE21017@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224130310.GE21017@zn.tnic>
Cc: kristen@linux.intel.com, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org,
 Thomas Garnier <thgarnie@chromium.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Andy Lutomirski <luto@kernel.org>,
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

On Tue, Dec 24, 2019 at 02:03:10PM +0100, Borislav Petkov wrote:
> On Wed, Dec 04, 2019 at 04:09:37PM -0800, Thomas Garnier wrote:
> > Minor changes based on feedback and rebase from v9.
> > 
> > Splitting the previous serie in two. This part contains assembly code
> > changes required for PIE but without any direct dependencies with the
> > rest of the patchset.
> 
> Ok, modulo the minor commit message and comments fixup, this looks ok
> and passes testing here.
> 
> I'm going to queue patches 2-11 of the next version unless someone
> complains.

Great! Thanks very much for the reviews. :)

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
