Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67F1798E6
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 20:22:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AA4286DEE;
	Wed,  4 Mar 2020 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-45DhsYu6+L; Wed,  4 Mar 2020 19:22:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E0B6186D92;
	Wed,  4 Mar 2020 19:22:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B31DCC1D8E;
	Wed,  4 Mar 2020 19:22:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11EF6C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00A0C84597
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JlAiLVBd8rc
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:22:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5619784536
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:22:31 +0000 (UTC)
Received: from hanvin-mobl2.amr.corp.intel.com ([192.55.55.45])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 024JM4WA436200
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 4 Mar 2020 11:22:05 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 024JM4WA436200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2020022001; t=1583349727;
 bh=g6Mtry4glpDMxH5UiOpY16heGYyer5fR7lVfPBWaveE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ar6nn8Ge/T+692bP42wyhN6/gA6zy1dzCiGF74CRXJXFqjrk6VwRkFpBhRP3+cZ6P
 aoecjqhhdSeSkR9EesGi+ThpGixJViS9m59hDZE5MkhJCppsl9CGI+XaXJHL6N9PSz
 N15YsSpDSe2BGbMQ73a5iqbaYgTLZGuuCk9xtQ+bYyE3yGCxvvNHQZ7Xw/jQnA8xUa
 jCODCawM3hNRUyrc1PnA5eoR37ZT81R1OELgMwfxsZpMMFvL9tLT1LJphQQCaZE+6J
 TgBBCCGkC2zFLRAajE3d9FAm6PTlGUqxGMq/StoWIgr6Tz8ZPVJwmUM93IFzinAgT+
 QzoETf31D45JA==
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
To: Thomas Garnier <thgarnie@chromium.org>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
 <202003031314.1AFFC0E@keescook>
 <20200304092136.GI2596@hirez.programming.kicks-ass.net>
 <202003041019.C6386B2F7@keescook>
 <e60876d0-4f7d-9523-bcec-6d002f717623@zytor.com>
 <CAJcbSZHBB1u2Vq0jZKsmd0UcRj=aichxTtbGvbWgf8-g8WPa7w@mail.gmail.com>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <627fe5d2-e6c3-4eff-1a58-14e17dc04ac5@zytor.com>
Date: Wed, 4 Mar 2020 11:22:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAJcbSZHBB1u2Vq0jZKsmd0UcRj=aichxTtbGvbWgf8-g8WPa7w@mail.gmail.com>
Content-Language: en-US
Cc: Kristen Carlson Accardi <kristen@linux.intel.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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

On 2020-03-04 11:19, Thomas Garnier wrote:
>>
>> The huge memory model, required for arbitrary placement, has a very
>> significant performance impact.
> 
> I assume you mean mcmodel=large, it doesn't use it. It uses -fPIE and
> removes -mcmodel=kernel. It favors relative references whenever
> possible.
> 

I know... this was in reference to a comment of Kees'.

	-hpa

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
