Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6AAC2F7
	for <lists.virtualization@lfdr.de>; Sat,  7 Sep 2019 01:23:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF7F2289F;
	Fri,  6 Sep 2019 23:23:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82CF41DA4
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 23:23:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D6C3F623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 23:23:03 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id s49so8027648edb.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eqinxltb4P+tBqyuO4WEtRUcfdT4qbszA3gfVj1CVng=;
	b=CfxhObTVAmcNKpN/uttdeqMFFuot/dgQ8oBhunu1p3A2/KXMdnJc7eTmTJi6e2ocMn
	NDFZD/Qh8ub6N+V6n8nGKJNHUKm6leUg+lflNX9keuez69bvdXFvHkCOlVvCSi5FCwQp
	GqpsxbxIXF0lypQ9v5DbU9u4VRzHE/ky6Ttco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eqinxltb4P+tBqyuO4WEtRUcfdT4qbszA3gfVj1CVng=;
	b=Q7R8DOheIHhCW8N4p7xSmYk+EvQByYBjXKy8dluo7vx9dyquzYbIdTJP0OeobSKvQh
	t8XRAevLFPiXMyFPybzrqfThrLzYpTIafZVb/FyPgG8V8mAeF8aPBczHHAKG+E/zlqCz
	5IW2nv/J7qQZEE0q1pKuDyDzcj3F/pgIDPkitkNmLJswr2xRCL6pRS/YOKhwLUxgZ0cB
	PSN+lW/uvC61dr641CIb1ZTdP/N6/vzSo5hKSpsNgyGDZwUvNMQc0O3l3tnwj+/tMGWq
	RBY5K0QuyrCOC68jr4zw/KhVkRndib+zfHRuTXWI+N5PU1ULUFxNuixUXjlhh9/Jwq/h
	TB0g==
X-Gm-Message-State: APjAAAW6CoPK4q7e/pIkNKx4YyMjwhE1/oWLnA2BJqXVvUMu6cHfzzOH
	5HEfI4U+oyPDjpx4GaXU7Cw3EJIc3F0=
X-Google-Smtp-Source: APXvYqzR+BdcsQW7TDcCngfY85CgsNpt8hCqlfKj5I9mRKB+KSbCP3hgjV05yXRHwIQ9qFxLgyaWVw==
X-Received: by 2002:a17:906:4056:: with SMTP id
	y22mr9840635ejj.230.1567812182332; 
	Fri, 06 Sep 2019 16:23:02 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
	[209.85.221.44]) by smtp.gmail.com with ESMTPSA id
	bq18sm746084ejb.84.2019.09.06.16.23.00
	for <virtualization@lists.linux-foundation.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Sep 2019 16:23:02 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id 30so8100820wrk.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 16:23:00 -0700 (PDT)
X-Received: by 2002:adf:de08:: with SMTP id b8mr8516944wrm.200.1567812179254; 
	Fri, 06 Sep 2019 16:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190730191303.206365-1-thgarnie@chromium.org>
	<20190806154347.GD25897@zn.tnic>
	<20190806155034.GP2349@hirez.programming.kicks-ass.net>
	<CAJcbSZETvvQYmh6U_Oauptdsrp-emmSG_QsAZzKLv+0-b2Yxig@mail.gmail.com>
In-Reply-To: <CAJcbSZETvvQYmh6U_Oauptdsrp-emmSG_QsAZzKLv+0-b2Yxig@mail.gmail.com>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Fri, 6 Sep 2019 16:22:47 -0700
X-Gmail-Original-Message-ID: <CAJcbSZEc07UJtWyM5i-DGRpNTtoxoY7cDpdyDh3N-Bb+G3s0gA@mail.gmail.com>
Message-ID: <CAJcbSZEc07UJtWyM5i-DGRpNTtoxoY7cDpdyDh3N-Bb+G3s0gA@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] x86: PIE support to extend KASLR randomization
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kernel Hardening <kernel-hardening@lists.openwall.com>, "VMware,
	Inc." <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
	Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	the arch/x86 maintainers <x86@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
	Maran Wilson <maran.wilson@oracle.com>,
	Linux PM list <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Aug 29, 2019 at 12:55 PM Thomas Garnier <thgarnie@chromium.org> wrote:
>
> On Tue, Aug 6, 2019 at 8:51 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Aug 06, 2019 at 05:43:47PM +0200, Borislav Petkov wrote:
> > > On Tue, Jul 30, 2019 at 12:12:44PM -0700, Thomas Garnier wrote:
> > > > These patches make some of the changes necessary to build the kernel as
> > > > Position Independent Executable (PIE) on x86_64. Another patchset will
> > > > add the PIE option and larger architecture changes.
> > >
> > > Yeah, about this: do we have a longer writeup about the actual benefits
> > > of all this and why we should take this all? After all, after looking
> > > at the first couple of asm patches, it is posing restrictions to how
> > > we deal with virtual addresses in asm (only RIP-relative addressing in
> > > 64-bit mode, MOVs with 64-bit immediates, etc, for example) and I'm
> > > willing to bet money that some future unrelated change will break PIE
> > > sooner or later.
>
> The goal is being able to extend the range of addresses where the
> kernel can be placed with KASLR. I will look at clarifying that in the
> future.
>
> >
> > Possibly objtool can help here; it should be possible to teach it about
> > these rules, and then it will yell when violated. That should avoid
> > regressions.
> >
>
> I will look into that as well.

Following a discussion with Kees. I will explore objtool in the
follow-up patchset as we still have more elaborate pie changes in the
second set. I like the idea overall and I think it would be great if
it works.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
