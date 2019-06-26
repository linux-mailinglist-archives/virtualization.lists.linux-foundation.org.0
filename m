Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 910B955F9B
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 05:37:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5DAD4D73;
	Wed, 26 Jun 2019 03:37:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2632FD13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:37:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D072C710
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:37:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 56BC4216C8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561520231;
	bh=JmzGPKsmUvSdNsSmIymUCFxAhA+cTqqTboCcY+e/GPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mpIGug1BN7TkavcEanSgy9S5TtgTAZM159v3f/R0RGk2ktaFcZBiwXCLs/azsmbLf
	uUPFAtrSsYkESs/Ex05eq88JFcXbg2ESx8nqbaF8XaupoKVIi7fl+KcUqLwW38K/ma
	gTC6bPVOCj3EOyALXyVKo6/zCvdWEcp4HhF6RByI=
Received: by mail-wr1-f50.google.com with SMTP id d18so895034wrs.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 20:37:11 -0700 (PDT)
X-Gm-Message-State: APjAAAWr3Hxd0yGhsN37gmCRDkSC2oV+oJoRXguw7uopV0o/NLKw7hg+
	YYaarvk1Sdh7XuFjN0U3k3EdbynIgaGBt6WIZ+xjXA==
X-Google-Smtp-Source: APXvYqwElpql8oD8RU81s8JM59UICeBjuSUCnq2AkPAPHmk5YrgJh6ZyasGJxpLlUDzaC8WV+AQ53SYq53YWmoIFgSg=
X-Received: by 2002:adf:f28a:: with SMTP id k10mr1277832wro.343.1561520229959; 
	Tue, 25 Jun 2019 20:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190613064813.8102-1-namit@vmware.com>
	<20190613064813.8102-5-namit@vmware.com>
In-Reply-To: <20190613064813.8102-5-namit@vmware.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 25 Jun 2019 20:36:59 -0700
X-Gmail-Original-Message-ID: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
Message-ID: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
Subject: Re: [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
To: Nadav Amit <namit@vmware.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	linux-hyperv@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
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

On Wed, Jun 12, 2019 at 11:49 PM Nadav Amit <namit@vmware.com> wrote:
>
> To improve TLB shootdown performance, flush the remote and local TLBs
> concurrently. Introduce flush_tlb_multi() that does so. The current
> flush_tlb_others() interface is kept, since paravirtual interfaces need
> to be adapted first before it can be removed. This is left for future
> work. In such PV environments, TLB flushes are not performed, at this
> time, concurrently.

Would it be straightforward to have a default PV flush_tlb_multi()
that uses flush_tlb_others() under the hood?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
