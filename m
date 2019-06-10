Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 377BE3BEB4
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:32:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 11017C8B;
	Mon, 10 Jun 2019 21:32:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 995C5C8B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:32:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43B6A174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:32:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s11so6009751pfm.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=u65kJhZ2c0w54Nc/i9RYT+l58N6im9e9Q29G/YH/uuc=;
	b=ijZRqYOHAJLGYs5vVBH7AyvxnX3poiS7Ze8fMa8xMMZFUFQkNHIHUJuCZa0E+HU7KK
	ZEEdHPDvfDlVSbqAvrXP3rviz6pH3j9htRBPT5NIqJKjGJE+FjxllNFI8RlkWV1QA19g
	aArbTyQM1D+rcblnoPAFTe/gzDozuxJ5mSkQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=u65kJhZ2c0w54Nc/i9RYT+l58N6im9e9Q29G/YH/uuc=;
	b=NCFXjRnNouA/V3/UkYYZFOj3dcYfLpfxxYEPyOVFlZSNeMcEtNgUBq6D00MCjvf79L
	+3o73ZXa+z/CPZ8yNFXvlKNbKFa/8f7gg+B9YCZtkmZHeQejVED5xFS4BiIw8YQsGt5M
	LHGkWXrHya7bc/5g2uPVzidd+bSJl2lIA9GiapCtT5JVE+r46J4splymbRyO+ZnT/nz8
	w3mwucH9o8dU1MH4sVJSxNZMzRG9/wmH13Op+kdmWiEiwVNdVw7xtv8iOtcKg2fNuSWN
	DDrANThSZrkEbDHgK0LPAJsk4P76rTbuRA9UZh1JB6gtLnZG7ooYNr7mHQTaP0+gmxB5
	L3iQ==
X-Gm-Message-State: APjAAAU5RU2SymcX+O7/HN5KSlcOqZTns/qSQ0rPDaBPo8wmyyLQztOg
	bcOi9Gt7zjrMQJhfQ8iIr7IL6w==
X-Google-Smtp-Source: APXvYqyQzwsz4g4vXj8Aq9NRG67WJeqq4COKYtOvIJxo3DWxXcQEhMnNrnrMg8J5OGqUXm+tPqrSlw==
X-Received: by 2002:aa7:8145:: with SMTP id d5mr77831178pfn.11.1560202368916; 
	Mon, 10 Jun 2019 14:32:48 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net.
	[173.164.112.133]) by smtp.gmail.com with ESMTPSA id
	q1sm18907954pfb.156.2019.06.10.14.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Jun 2019 14:32:48 -0700 (PDT)
Date: Mon, 10 Jun 2019 14:32:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v7 00/12] x86: PIE support to extend KASLR randomization
Message-ID: <201906101432.B642E297F@keescook>
References: <20190520231948.49693-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520231948.49693-1-thgarnie@chromium.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Jan Beulich <JBeulich@suse.com>, Nadav Amit <namit@vmware.com>,
	Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	Jann Horn <jannh@google.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Alok Kataria <akataria@vmware.com>,
	Juergen Gross <jgross@suse.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	linux-pm@vger.kernel.org, Maran Wilson <maran.wilson@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Garnier <thgarnie@google.com>
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

On Mon, May 20, 2019 at 04:19:25PM -0700, Thomas Garnier wrote:
> Splitting the previous serie in two. This part contains assembly code
> changes required for PIE but without any direct dependencies with the
> rest of the patchset.

Thanks for doing this! It should be easier to land the "little" fixes so
there's less to review for the big PIE changes down the road.

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
