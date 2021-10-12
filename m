Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 152AA42AF74
	for <lists.virtualization@lfdr.de>; Wed, 13 Oct 2021 00:00:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119B680E29;
	Tue, 12 Oct 2021 22:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nv4IcqpN_6n; Tue, 12 Oct 2021 22:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E707980E3B;
	Tue, 12 Oct 2021 22:00:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84810C000D;
	Tue, 12 Oct 2021 22:00:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56EBAC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358BD60C1B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1H958V-Ltot
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 22:00:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F258A607D1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 22:00:13 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f5so356029pgc.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtMAj68aUuTTSGbrDQhTvggvj29pIYu2zJBH77+GR9M=;
 b=l4aQQdqM1qp9TtohjZx2PZM0wFCEL6l/kvo8NN9KzJyymhBkkyJgSo+9JA65w2tJEC
 9LMd/PZYWtD639cxF6qZMwd7jZd9819/ZvHD/DyB/7wSK2/pajxSegKWAuJyX3EvYN36
 Hvgx10j1dFhPR07T/GBgmSYWFBkdDDI7TrgeSvfoF3jbQGYARg2lN3Mrzq8mhpCVohvp
 ZGTcRKSDYPs1LYZ9Cvfeg4KhU92J4uRVYVOhbj7jW97OCTyGTD9dTqfQJOsiIMNnWVv0
 /ozc6W/ADlxkkOe6vMPoo0ylJl6JzbiIVBISrC3VjWn2vlC4L7iJWKamuM1v2Iw/lFzH
 VREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtMAj68aUuTTSGbrDQhTvggvj29pIYu2zJBH77+GR9M=;
 b=mDYs3nzehu1iYSjIRmLZlxw0piZvI3GW8z5rtRlR8Py0gIL30FqPK0U8AsBGVfJX/8
 JunYcXGbIFPlTpjA2jB+jq9/2IqlPHsoLDtdf74yNwutxQHS2de7Ra7KtcY4VV8bhh82
 hSR5ufNj3Mfalb2PUGWRRWgGDjK7b2zajy+jW9yCjl7U7Spti7ZzCJB8VMzIIcKD/JGs
 lc1r8B+EfjjRWGRW2Lo0ffDBl6aq/w8SmXaAxi9GTU1nIULLVDl04y9U12tSRvEBB3R8
 qOY2CmpSNA98WZR8fwIXueiGxBjCNt0h89LTF3uGsHB9yTm5/PCBFcuhYH3W+cTubjOz
 UXnA==
X-Gm-Message-State: AOAM533XdPZpR8u8TMouZaVj/TbAx8gqb2JTWxv+X1OSbBW1obDfdFHl
 eNS2wopEAH6Oz8IW3FXjmMErmSUgZG9veG7/83gkzA==
X-Google-Smtp-Source: ABdhPJy/e3jBUJgWufF7ultP6rKqv7OOHb6VQ8mNAhGHcU3yrYfDGGAVb/xjngRbf2MGZ68jBqzuzUn25eWS2pvZ40Y=
X-Received: by 2002:a63:1262:: with SMTP id 34mr24624590pgs.356.1634076012990; 
 Tue, 12 Oct 2021 15:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
 <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
 <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
 <bca75b04-f084-5bda-c071-249fd91aaa1e@linux.intel.com>
In-Reply-To: <bca75b04-f084-5bda-c071-249fd91aaa1e@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Oct 2021 15:00:01 -0700
Message-ID: <CAPcyv4gZfG-Bm+_jGRjSHd8K+jO2M2NgXisqacanxGZgZKFaJA@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
To: Andi Kleen <ak@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, "Reshetova, Elena" <elena.reshetova@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>
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

On Tue, Oct 12, 2021 at 2:28 PM Andi Kleen <ak@linux.intel.com> wrote:
[..]
> >> But how do you debug the kernel then? Making early undebuggable seems
> >> just bad policy to me.
> > I am not proposing making the early undebuggable.
>
>
> That's the implication of moving the policy into initrd.
>
>
> If only initrd can authorize then it won't be possible to authorize
> before initrd, thus the early console won't work.

Again, the proposal is that the allow-list is limited to just enough
devices to startup and debug the initramfs and no more. Everything
else can be dynamic, and this allows for a powerful custom override
interface without needing to debate additional ABI like command line
overrides, and minimizes future changes to this kernel-internal
allow-list.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
