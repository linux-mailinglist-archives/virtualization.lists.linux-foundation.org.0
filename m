Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC802056C8
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 18:10:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10D898767F;
	Tue, 23 Jun 2020 16:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlm-kslKPo66; Tue, 23 Jun 2020 16:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A91428765E;
	Tue, 23 Jun 2020 16:10:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F83BC016F;
	Tue, 23 Jun 2020 16:10:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7346EC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6792989596
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrSDHaIZLQlD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:10:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A70089562
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:10:20 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d47007938aef930b6c4fb.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4700:7938:aef9:30b6:c4fb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 445861EC0390;
 Tue, 23 Jun 2020 18:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1592928618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRvNeLgnj5EUYtezLWiSTfwu1q6G/wPTT9fdfyj9xYQ=;
 b=HF6CnrExk3oqYwLL7mzTIOKSsMDwnWe7KIL7Waj5xzeGYvsheaQPN2zwe3L4v9bRqaYG4p
 EbVI8ncLyIZjl4G5EBxgSjDAQS4/izgGnmNmB6re445rstGW+hSsroF+PmiaIEAQ7DwxNc
 u/r/VHsDr5fc86TkEBe6YgmjNWYfxXI=
Date: Tue, 23 Jun 2020 18:10:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623161010.GE32590@zn.tnic>
References: <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
 <20200623130322.GH4817@hirez.programming.kicks-ass.net>
 <20200623144940.GE14101@suse.de>
 <20200623151607.GJ4817@hirez.programming.kicks-ass.net>
 <fe0af2c8-92c8-8d66-e9f3-5a50d64837e5@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe0af2c8-92c8-8d66-e9f3-5a50d64837e5@citrix.com>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDQ6MzI6MjJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBNU1JfTUNHX1NUQVRVUy5NQ0lQLCBhbmQgeWVzIC0gYW55ICNNQyBiZWZvcmUgdGhh
dCBwb2ludCB3aWxsCj4gaW1tZWRpYXRlbHkgU2h1dGRvd24uwqAgQW55ICNNQyBiZXR3ZWVuIHRo
YXQgcG9pbnQgYW5kIElSRVQgd2lsbCBjbG9iYmVyCj4gaXRzIElTVCBzdGFjayBhbmQgZW5kIHVw
IHNhZC4KCldlbGwsIGF0IHNvbWUgcG9pbnQgd2Ugc2hvdWxkIHNpbXBseSBhY2NlcHQgdGhhdCB3
ZSdyZSBsaXZpbmcgYSBsaXR0bGUKb24gdGhlIGVkZ2UuIFRoYXQgaXMsIHVudGlsIHdlIGdldCBJ
UkVUIHdpdGggYSBtYXNrIG9mIHRvLXJlZW5hYmxlCnZlY3RvcnMgd2hpY2ggaGFzICNNQywgTk1J
IGFuZCB3aGF0ZXZlciBlbHNlIHZlY3RvcnMuIEl0IHdvdWxkIGJlIGV2ZW4KYmV0dGVyIGlmIHRo
YXQgbWFzayB3ZXJlIGNvbmZpZ3VyYWJsZS4KCi0tIApSZWdhcmRzL0dydXNzLAogICAgQm9yaXMu
CgpodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL3RnbHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
