Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 05227205651
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 17:52:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A946C88C7B;
	Tue, 23 Jun 2020 15:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0P4+et5eaec; Tue, 23 Jun 2020 15:52:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E954988C64;
	Tue, 23 Jun 2020 15:52:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB0EFC016F;
	Tue, 23 Jun 2020 15:52:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EE79C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 56C4B88C64
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vK+ShNQw-Bq8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:51:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE57188AAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 15:51:55 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d470028fe1155168fd3d2.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4700:28fe:1155:168f:d3d2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C05C01EC0318;
 Tue, 23 Jun 2020 17:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1592927512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2M4dPDLeLsejQozbS41vpz4rnLlW8vCdyqTb0kIw2d8=;
 b=L3laiMxCskkcebkat4zrLZQGr1hD02Dv29rK5VGvx7Sm1nAayDeF6xBed99AUxBGn3rThu
 bArWMr3Qs5gJg7hDP6BLlgtcGOSPo8e17/oq1Mel0/393sSFGOcCGrIF0aLvviN3EchPeO
 Xbdwn8DRLHajvZNTd2fREOPxoBsKLBo=
Date: Tue, 23 Jun 2020 17:51:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623155144.GD32590@zn.tnic>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <8413fe52-04ee-f4e1-873c-17595110856a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8413fe52-04ee-f4e1-873c-17595110856a@citrix.com>
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

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTI6NTE6MDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDcmFzaGluZyBvdXQgaGFyZCBpZiB0aGUgaHlwZXJ2aXNvciBpcyBtaXNiZWhhdmlu
ZyBpcyBhY2NlcHRhYmxlLsKgIEluIGEKPiBjbG91ZCwgSSBhcyBhIGN1c3RvbWVyIHdvdWxkICh0
aHJlYXRlbiB0bz8pIHRha2UgbXkgY3JlZGl0IGNhcmQKPiBlbHNld2hlcmUsIHdoaWxlIGZvciBl
bnRlcnByaXNlLCBJJ2Qgc2hvdXQgYXQgbXkgdmlydHVhbGlzYXRpb24gdmVuZG9yCj4gdW50aWwg
YSBmaXggaGFwcGVuZWQgKGFsc28gcGVyaGFwcyB0aHJlYXRlbiB0byB0YWtlIG15IGNyZWRpdCBj
YXJkCj4gZWxzZXdoZXJlKS4KClRoaXMgaXMgY2FsbGVkIGN1c3RvbWVyLCBjcmVkaXQtY2FyZC1l
bmZvcmNlZCBidWcgZml4aW5nLgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBz
Oi8vcGVvcGxlLmtlcm5lbC5vcmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
