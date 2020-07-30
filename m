Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 105782331FA
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 14:26:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F8DB861BC;
	Thu, 30 Jul 2020 12:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOVlwTWaQx7o; Thu, 30 Jul 2020 12:26:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 124CA86141;
	Thu, 30 Jul 2020 12:26:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFE17C004D;
	Thu, 30 Jul 2020 12:26:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C71C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 12:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD714214D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 12:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAVqMGn70MiE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 12:26:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id CBB5320763
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 12:26:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 185E83C8; Thu, 30 Jul 2020 14:26:49 +0200 (CEST)
Date: Thu, 30 Jul 2020 14:26:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v5 00/75] x86: SEV-ES Guest Support
Message-ID: <20200730122645.GA3257@8bytes.org>
References: <20200724160336.5435-1-joro@8bytes.org>
 <B65392F4-FD42-4AA3-8AA8-6C0C0D1FF007@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B65392F4-FD42-4AA3-8AA8-6C0C0D1FF007@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

SGkgTWlrZSwKCk9uIFRodSwgSnVsIDMwLCAyMDIwIGF0IDAxOjI3OjQ4QU0gKzAwMDAsIE1pa2Ug
U3R1bmVzIHdyb3RlOgo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZWQgcGF0Y2hlcyEgSSBhcHBsaWVk
IHRoaXMgcGF0Y2gtc2V0IG9udG8gY29tbWl0Cj4gMDE2MzRmMmJkNDJlICgiTWVyZ2UgYnJhbmNo
ICd4ODYvdXJnZW504oCZ4oCdKSBmcm9tIHlvdXIgdHJlZS4gSXQgYm9vdHMsCj4gYnV0IENQVSAx
IChvbiBhIHR3by1DUFUgVk0pIGlzIG9mZmxpbmUgYXQgYm9vdCwgYW5kIGBjaGNwdSAtZSAxYCBy
ZXR1cm5zOgo+IAo+IGNoY3B1OiBDUFUgMSBlbmFibGUgZmFpbGVkOiBJbnB1dC9vdXRwdXQgZXJy
b3IKPiAKPiB3aXRoIG5vdGhpbmcgaW4gZG1lc2cgdG8gaW5kaWNhdGUgd2h5IGl0IGZhaWxlZC4g
VGhlIGZpcnN0IHRoaW5nIEkgdGhvdWdodAo+IG9mIHdhcyBhbnl0aGluZyByZWxhdGluZyB0byB0
aGUgQVAganVtcCB0YWJsZSwgYnV0IEkgaGF2ZW7igJl0IGNoYW5nZWQKPiBhbnl0aGluZyB0aGVy
ZSBvbiB0aGUgaHlwZXJ2aXNvciBzaWRlLiBMZXQgbWUga25vdyB3aGF0IG90aGVyIGRhdGEgSSBj
YW4KPiBwcm92aWRlIGZvciB5b3UuCgpIYXJkIHRvIHRlbGwsIGhhdmUgeW91IGVuYWJsZWQgRlNH
U0JBU0UgaW4gdGhlIGd1ZXN0PyBJZiB5ZXMsIGNhbiB5b3UKdHJ5IHRvIGRpc2FibGUgaXQ/CgpS
ZWdhcmRzLAoKCUpvZXJnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
