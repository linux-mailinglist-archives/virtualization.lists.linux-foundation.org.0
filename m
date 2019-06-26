Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F24B56079
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 05:51:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1EB4D93;
	Wed, 26 Jun 2019 03:51:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23574D85
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7F0F82C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:51:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5FCBA20659
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561521077;
	bh=bZ1G2S3PGPwXnzJ2rk9+AJfTR7RiYbBDCp2Ne0/fTPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hDpnehLLZWYQsb4aX9YZYzguXD8TTUSAIhULp729n8DAd3sPSpCCjjH+HzCPLwdZd
	b7eIz7p7jzWRuAZuJf+gL4x8oEpDDZ1WHdrxlJzrAbNnzfkQ4tgX4ZJLAL3u/PvZx1
	JmoDEivgDpfzwuzPz30YkfqmKdCjBVNxvm3Drhkk=
Received: by mail-wr1-f44.google.com with SMTP id n9so947866wru.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 20:51:17 -0700 (PDT)
X-Gm-Message-State: APjAAAUvFEf7kkG6lTLzL3tyaAXEjY/x7LhwIcNLMOVTpJW4xW5pfmQF
	3yjNYuZV1f0pOHT+LcybkavGdxoLqfd5kJ2tGSM5GQ==
X-Google-Smtp-Source: APXvYqxhbwnXC+HHtbgLXKDHMg8L3l+e67NPNctbsjFY5QgqxzbbdaPZPdECVjYrpk2ZK2KQAYoaSiz68v0i6AaL3z0=
X-Received: by 2002:adf:f606:: with SMTP id t6mr1183395wrp.265.1561521076028; 
	Tue, 25 Jun 2019 20:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190613064813.8102-1-namit@vmware.com>
	<20190613064813.8102-5-namit@vmware.com>
	<CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
	<28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
In-Reply-To: <28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 25 Jun 2019 20:51:05 -0700
X-Gmail-Original-Message-ID: <CALCETrUicyG0NJfj309zU6SX1Xdq6gcmC9+zGLqW4iFkodnWjw@mail.gmail.com>
Message-ID: <CALCETrUicyG0NJfj309zU6SX1Xdq6gcmC9+zGLqW4iFkodnWjw@mail.gmail.com>
Subject: Re: [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
To: Nadav Amit <namit@vmware.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Tue, Jun 25, 2019 at 8:48 PM Nadav Amit <namit@vmware.com> wrote:
>
> > On Jun 25, 2019, at 8:36 PM, Andy Lutomirski <luto@kernel.org> wrote:
> >
> > On Wed, Jun 12, 2019 at 11:49 PM Nadav Amit <namit@vmware.com> wrote:
> >> To improve TLB shootdown performance, flush the remote and local TLBs
> >> concurrently. Introduce flush_tlb_multi() that does so. The current
> >> flush_tlb_others() interface is kept, since paravirtual interfaces need
> >> to be adapted first before it can be removed. This is left for future
> >> work. In such PV environments, TLB flushes are not performed, at this
> >> time, concurrently.
> >
> > Would it be straightforward to have a default PV flush_tlb_multi()
> > that uses flush_tlb_others() under the hood?
>
> I prefer not to have a default PV implementation that should anyhow go away.
>
> I can create unoptimized untested versions for Xen and Hyper-V, if you want.
>

I think I prefer that approach.  We should be able to get the
maintainers to test it.  I don't love having legacy paths in there,
ahem, UV.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
