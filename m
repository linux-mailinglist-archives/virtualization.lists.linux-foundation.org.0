Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B183585
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 17:44:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 661C9D36;
	Tue,  6 Aug 2019 15:43:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0333DCD4
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:43:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8432282F
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:43:50 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0DA00008E04FA4C58F7CE4.dip0.t-ipconnect.de
	[IPv6:2003:ec:2f0d:a000:8e0:4fa4:c58f:7ce4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id
	42CB21EC0C42; Tue,  6 Aug 2019 17:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1565106228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=TDFDazt6//hwNfwRMzmVKFiu4ldxLz+yMwXDE8Lj5Eo=;
	b=dt2cjv9ck6Riog7ad+ewdarAX2dM8UrmZhk8qdfxpW8EfZWGjwleuVrU4g1cmXqrcn8Kh+
	TWcpA8A1qy+/qbzkXNRCP6wNTc/+TBGiGV3muxnmmGbdGi77lel3IPkl79O3Iqqfn0x3XN
	2iqBRrkAzDyyrAqpiKzGnDMqxESTm0c=
Date: Tue, 6 Aug 2019 17:43:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v9 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20190806154347.GD25897@zn.tnic>
References: <20190730191303.206365-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730191303.206365-1-thgarnie@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	kernel-hardening@lists.openwall.com, "VMware,
	Inc." <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
	Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	keescook@chromium.org, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
	Maran Wilson <maran.wilson@oracle.com>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
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

On Tue, Jul 30, 2019 at 12:12:44PM -0700, Thomas Garnier wrote:
> These patches make some of the changes necessary to build the kernel as
> Position Independent Executable (PIE) on x86_64. Another patchset will
> add the PIE option and larger architecture changes.

Yeah, about this: do we have a longer writeup about the actual benefits
of all this and why we should take this all? After all, after looking
at the first couple of asm patches, it is posing restrictions to how
we deal with virtual addresses in asm (only RIP-relative addressing in
64-bit mode, MOVs with 64-bit immediates, etc, for example) and I'm
willing to bet money that some future unrelated change will break PIE
sooner or later. And I'd like to have a better justification why we
should enforce those new "rules" unconditionally.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
