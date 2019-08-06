Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E011835B2
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 17:51:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CD606DD9;
	Tue,  6 Aug 2019 15:51:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 866B0D81
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:51:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 85B348A3
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SncjWrmoRC5b495lasgofj0Rqb2mQTyyh5dUq+5um6c=;
	b=omsCdPaWcnXHcWz6QUOPsZ1pH
	m4nhZmOCV5hlYYIM86PIwoYv97n1noOSx61nqdD5Rvo9OhGQQJ+ZPRQzx7OSmkV0g38j23wJVV0Wu
	OA6nibDOjqa3aQAvytDJ1hR4rA9LfBGjXdSQASh7g9TEaQ8ZQXZk5SLvA35tGtSk8QSRL8vagnuRA
	grsvsDLfqhl+NiT+Dqly9Tn8qDyLmrA6YcWPBssLEypNK8woJHz1tPHv/fxvUgbTsilr6PrnL7CMY
	86FQfGDuo3nB2UVQvSwY6mHsHIHy7t5NB7g5s7yo2yQLb4vLc/RxZQGZgFdwDXYBYoVrN3i/SKjrc
	dsPnU77wA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hv1ji-0001tD-Q5; Tue, 06 Aug 2019 15:50:54 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 55E2F3077A6;
	Tue,  6 Aug 2019 17:50:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id B8089201B3F8E; Tue,  6 Aug 2019 17:50:34 +0200 (CEST)
Date: Tue, 6 Aug 2019 17:50:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v9 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20190806155034.GP2349@hirez.programming.kicks-ass.net>
References: <20190730191303.206365-1-thgarnie@chromium.org>
	<20190806154347.GD25897@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806154347.GD25897@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	kernel-hardening@lists.openwall.com, "VMware,
	Inc." <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
	Thomas Garnier <thgarnie@chromium.org>,
	Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	keescook@chromium.org, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
	Maran Wilson <maran.wilson@oracle.com>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Nadav Amit <namit@vmware.com>, Enrico Weigelt <info@metux.net>,
	"David S. Miller" <davem@davemloft.net>
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

On Tue, Aug 06, 2019 at 05:43:47PM +0200, Borislav Petkov wrote:
> On Tue, Jul 30, 2019 at 12:12:44PM -0700, Thomas Garnier wrote:
> > These patches make some of the changes necessary to build the kernel as
> > Position Independent Executable (PIE) on x86_64. Another patchset will
> > add the PIE option and larger architecture changes.
> 
> Yeah, about this: do we have a longer writeup about the actual benefits
> of all this and why we should take this all? After all, after looking
> at the first couple of asm patches, it is posing restrictions to how
> we deal with virtual addresses in asm (only RIP-relative addressing in
> 64-bit mode, MOVs with 64-bit immediates, etc, for example) and I'm
> willing to bet money that some future unrelated change will break PIE
> sooner or later.

Possibly objtool can help here; it should be possible to teach it about
these rules, and then it will yell when violated. That should avoid
regressions.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
