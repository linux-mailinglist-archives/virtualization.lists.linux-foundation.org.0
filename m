Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D6E920D
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 22:30:39 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 61272C90;
	Tue, 29 Oct 2019 21:30:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD500C3A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A6E5FD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:30:31 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k2so70092edx.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zjXTK8wqc+micfhU3PtaSFSd9eN2mP8dCcEeCTySNXs=;
	b=bK/S1BlNrTZX7xIW1sXhw8Fva50fgp2jCLXmx0dNxNdaHjwy5/0nsVOn2M3e4zMndS
	ylG17btxpUvCOnh3po1QOsl4zYyVzclox07WqLhIhzoEUjWE0jPgbGjIoMpMt+4hzaxz
	xphwlkYHW3IuOdu+kxcOFdy/GMp5nH05i8uOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zjXTK8wqc+micfhU3PtaSFSd9eN2mP8dCcEeCTySNXs=;
	b=TOm9cV+Ukskx6BaBJqYOQfY+UgUvaAYUv6FyuZ3lAIbO/C/g8BzRH5zmSFlI1CJRtS
	4tEQeaPs36QrQ3xxpd3sdxBrpBSzSvErqweoMvtSSLw89KR//3f1n5T2BT09ZroSAiIL
	RIaXYwpMBzIAlAaC984UZr3e+4zpj1yu3b12J3oCoz0+anrgXBeopIpr4x+D/IJdCIdk
	QP9EnJ0Cj8rK08toOb3zjb0D093wj7/lATJRowfRp/fP9SRyGKy/zfE7kF8eLqwCLnZE
	ZZAqZ1nTf6G8fnD/MMRN9xxWrrGDH50o9aQfWhd+wugD+COYFkLVUHYfjtJju2qhAV8w
	wo/w==
X-Gm-Message-State: APjAAAWltjLml9ngRGl9xKcj9FPAZ+insjzy1nmdzmLXOk0dhuOL846C
	gubYJT5CjLfxTmNWw39FX+ydf9qUuqI=
X-Google-Smtp-Source: APXvYqzk02MpFJEYRElOWqWV3EVm5KHJui1f/oGP4SRDMr26Jp6DfBxd25faiooqRVf9bmpRX2F0SA==
X-Received: by 2002:a17:906:4554:: with SMTP id
	s20mr5641248ejq.283.1572384629003; 
	Tue, 29 Oct 2019 14:30:29 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
	[209.85.128.51])
	by smtp.gmail.com with ESMTPSA id oq18sm579ejb.22.2019.10.29.14.30.28
	for <virtualization@lists.linux-foundation.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 29 Oct 2019 14:30:28 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 11so4216211wmk.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 14:30:28 -0700 (PDT)
X-Received: by 2002:a05:600c:1150:: with SMTP id
	z16mr6173967wmz.153.1572384627393; 
	Tue, 29 Oct 2019 14:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190730191303.206365-1-thgarnie@chromium.org>
	<20190730191303.206365-11-thgarnie@chromium.org>
	<20190731125306.GU31381@hirez.programming.kicks-ass.net>
	<20190812125540.GD23772@zn.tnic>
In-Reply-To: <20190812125540.GD23772@zn.tnic>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Tue, 29 Oct 2019 14:30:15 -0700
X-Gmail-Original-Message-ID: <CAJcbSZG-JhBC9b1JMv1zq2r5uRQipYLtkNjM67sd7=eqy_iOaA@mail.gmail.com>
Message-ID: <CAJcbSZG-JhBC9b1JMv1zq2r5uRQipYLtkNjM67sd7=eqy_iOaA@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] x86/paravirt: Adapt assembly for PIE support
To: Borislav Petkov <bp@alien8.de>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	Kees Cook <keescook@chromium.org>,
	Kernel Hardening <kernel-hardening@lists.openwall.com>,
	Peter Zijlstra <peterz@infradead.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux-foundation.org, "VMware,
	Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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

On Mon, Aug 12, 2019 at 5:54 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Jul 31, 2019 at 02:53:06PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 30, 2019 at 12:12:54PM -0700, Thomas Garnier wrote:
> > > if PIE is enabled, switch the paravirt assembly constraints to be
> > > compatible. The %c/i constrains generate smaller code so is kept by
> > > default.
> > >
> > > Position Independent Executable (PIE) support will allow to extend the
> > > KASLR randomization range below 0xffffffff80000000.
> > >
> > > Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
> > > Acked-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >  arch/x86/include/asm/paravirt_types.h | 25 +++++++++++++++++++++----
> > >  1 file changed, 21 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> > > index 70b654f3ffe5..fd7dc37d0010 100644
> > > --- a/arch/x86/include/asm/paravirt_types.h
> > > +++ b/arch/x86/include/asm/paravirt_types.h
> > > @@ -338,9 +338,25 @@ extern struct paravirt_patch_template pv_ops;
> > >  #define PARAVIRT_PATCH(x)                                  \
> > >     (offsetof(struct paravirt_patch_template, x) / sizeof(void *))
> > >
> > > +#ifdef CONFIG_X86_PIE
> > > +#define paravirt_opptr_call "a"
> > > +#define paravirt_opptr_type "p"
> > > +
> > > +/*
> > > + * Alternative patching requires a maximum of 7 bytes but the relative call is
> > > + * only 6 bytes. If PIE is enabled, add an additional nop to the call
> > > + * instruction to ensure patching is possible.
> > > + */
> > > +#define PARAVIRT_CALL_POST  "nop;"
> >
> > I'm confused; where does the 7 come from? The relative call is 6 bytes,
>
> Well, before it, the relative CALL is a CALL reg/mem64, i.e. the target
> is mem64. For example:
>
>
> ffffffff81025c45:       ff 14 25 68 37 02 82    callq  *0xffffffff82023768
>
> That address there is practically pv_ops + offset.
>
> Now, in the opcode bytes you have 0xff opcode, ModRM byte 0x14 and SIB
> byte 0x25, and 4 bytes imm32 offset. And this is 7 bytes.
>
> What it becomes is:
>
> ffffffff81025cd0:       ff 15 fa d9 ff 00       callq  *0xffd9fa(%rip)        # ffffffff820236d0 <pv_ops+0x30>
> ffffffff81025cd6:       90                      nop
>
> which is a RIP-relative, i.e., opcode 0xff, ModRM byte 0x15 and imm32.
> And this is 6 bytes.
>
> And since the paravirt patching doesn't do NOP padding like the
> alternatives patching does, you need to pad with a byte.
>
> Thomas, please add the gist of this to the comments because this
> incomprehensible machinery better be documented as detailed as possible.

Sorry for the late reply, busy couple months. Will add it.

>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
