Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59420514D
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:51:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBB92885F1;
	Tue, 23 Jun 2020 11:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltxDa03v0beH; Tue, 23 Jun 2020 11:51:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29D7188603;
	Tue, 23 Jun 2020 11:51:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04902C0890;
	Tue, 23 Jun 2020 11:51:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58322C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 463DB86CAF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_-vTaHOxIUb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5742B86C7A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:51:09 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BCjzX3+BOpHiGycYt67E9CJmR9y9VmfqJlqeSes5AYEZnPtE4Y5U8EKDIJfULxlccVR1Unu4/t
 odza41iyN6Py2bb5aXuBwU4Vi/htf63bVfuD5PT+0l7Ew73sqwyUhQltOfiNB6RepD6loxfh6t
 tzXBrJQaqlUnAMFu4ZZw5Cu3pHjUZDnwtwaxqF07OJJSUXCDcJmFWFq8shx7DIAOlR3T+JCwb0
 PXhFSgojaIgXKZs28xNTKBcLx4pRtbBiCrlEyQ0T4T0i53E7GoBBWK8XwMEwKV/JCKQ31VV4Ls
 1UE=
X-SBRS: 2.7
X-MesageID: 20716528
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20716528"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Joerg Roedel <jroedel@suse.de>, Peter Zijlstra <peterz@infradead.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8413fe52-04ee-f4e1-873c-17595110856a@citrix.com>
Date: Tue, 23 Jun 2020 12:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623113007.GH31822@suse.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>, Dave
 Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

T24gMjMvMDYvMjAyMCAxMjozMCwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDIz
LCAyMDIwIGF0IDAxOjA3OjA2UE0gKzAyMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+PiBPbiBU
dWUsIEFwciAyOCwgMjAyMCBhdCAwOTo1NToxMkFNICswMjAwLCBKb2VyZyBSb2VkZWwgd3JvdGU6
Cj4+IFNvIHdoYXQgaGFwcGVucyBpZiB0aGlzICNWQyB0cmlnZ2VycyBvbiB0aGUgZmlyc3QgYWNj
ZXNzIHRvIHRoZSAjVkMKPj4gc3RhY2ssIGJlY2F1c2UgdGhlIG1hbGljaW91cyBob3N0IGhhcyBj
cmFmdGlseSBtdWNrZWQgd2l0aCBvbmx5IHRoZSAjVkMKPj4gSVNUIHN0YWNrIHBhZ2U/Cj4+Cj4+
IE9yIG9uIHRoZSBOTUkgSVNUIHN0YWNrLCB0aGVuIHdlIGdldCAjVkMgaW4gTk1JIGJlZm9yZSB0
aGUgTk1JIGNhbiBmaXgKPj4geW91IHVwLgo+Pgo+PiBBRkFJQ1QgYWxsIG9mIHRoYXQgaXMgbm9u
LXJlY292ZXJhYmxlLgo+IEkgYW0gbm90IDEwMCUgc3VyZSwgYnV0IEkgdGhpbmsgaWYgdGhlICNW
QyBzdGFjayBwYWdlIGlzIG5vdCB2YWxpZGF0ZWQsCj4gdGhlICNWQyBzaG91bGQgYmUgcHJvbW90
ZWQgdG8gYSAjREYuCj4KPiBOb3RlIHRoYXQgdGhpcyBpcyBhbiBpc3N1ZSBvbmx5IHdpdGggc2Vj
dXJlIG5lc3RlZCBwYWdpbmcgKFNOUCksIHdoaWNoCj4gaXMgbm90IGVuYWJsZWQgeWV0IHdpdGgg
dGhpcyBwYXRjaC1zZXQuIFdoZW4gaXQgZ2V0cyBlbmFibGVkIGEgc3RhY2sKPiByZWN1cnNpb24g
Y2hlY2sgaW4gdGhlICNWQyBoYW5kbGVyIGlzIG5lZWRlZCB3aGljaCBwYW5pY3MgdGhlIFZNLiBU
aGF0Cj4gYWxzbyBmaXhlcyB0aGUgI1ZDLWluLWVhcmx5LU5NSSBwcm9ibGVtLgoKVGhlcmUgYXJl
IGNhc2VzIHdoaWNoIGFyZSBkZWZpbml0ZWx5IG5vbi1yZWNvdmVyYWJsZS4KCkZvciBib3RoIEVT
IGFuZCBTTlAsIGEgbWFsaWNpb3VzIGh5cGVydmlzb3IgY2FuIG1lc3Mgd2l0aCB0aGUgZ3Vlc3QK
cGh5c21hcCB0byBtYWtlIHRoZSB0aGUgTk1JLCAjVkMgYW5kICNERiBzdGFja3MgYWxsIGFsaWFz
LgoKRm9yIEVTLCB0aGlzIGhhZCBiZXR0ZXIgcmVzdWx0IGluIHRoZSAjREYgaGFuZGxlciBkZWNp
ZGluZyB0aGF0IGNyYXNoaW5nCmlzIHRoZSB3YXkgb3V0LCB3aGVyZWFzIGZvciBTTlAsIHRoaXMg
aGFkIGJldHRlciBlc2NhbGF0ZSB0byBTaHV0ZG93bi4KCgpXaGF0IG1hdHRlcnMgaGVyZSBpcyB0
aGUgc2VjdXJpdHkgbW9kZWwgaW4gU05QLsKgIFRoZSBoeXBlcnZpc29yIGlzCnJlbGllZCB1cG9u
IGZvciBhdmFpbGFiaWxpdHkgKGJlY2F1c2UgaXQgY291bGQgc2ltcGx5IHJlZnVzZSB0byBzY2hl
ZHVsZQp0aGUgVk0pLCBidXQgbWFya2V0L2J1c2luZXNzIGZvcmNlcyB3aWxsIGNhdXNlIGl0IHRv
IGRvIGl0cyBiZXN0IHRvIGtlZXAKdGhlIFZNIHJ1bm5pbmcuwqAgVGhlcmVmb3JlLCB0aGUgc2Vj
dXJlbHkgbW9kZWwgaXMgc2ltcGx5KD8pIHRoYXQgdGhlCmh5cGVydmlzb3IgY2FuJ3QgZG8gYW55
dGhpbmcgdG8gdW5kZXJtaW5lIHRoZSBjb25maWRlbnRpYWxpdHkgb3IKaW50ZWdyaXR5IG9mIHRo
ZSBWTS4KCkNyYXNoaW5nIG91dCBoYXJkIGlmIHRoZSBoeXBlcnZpc29yIGlzIG1pc2JlaGF2aW5n
IGlzIGFjY2VwdGFibGUuwqAgSW4gYQpjbG91ZCwgSSBhcyBhIGN1c3RvbWVyIHdvdWxkICh0aHJl
YXRlbiB0bz8pIHRha2UgbXkgY3JlZGl0IGNhcmQKZWxzZXdoZXJlLCB3aGlsZSBmb3IgZW50ZXJw
cmlzZSwgSSdkIHNob3V0IGF0IG15IHZpcnR1YWxpc2F0aW9uIHZlbmRvcgp1bnRpbCBhIGZpeCBo
YXBwZW5lZCAoYWxzbyBwZXJoYXBzIHRocmVhdGVuIHRvIHRha2UgbXkgY3JlZGl0IGNhcmQKZWxz
ZXdoZXJlKS4KClRoZXJlZm9yZSwgaXQgaXMgcmVhc29uYWJsZSB0byBidWlsZCBvbiB0aGUgZXhw
ZWN0YXRpb24gdGhhdCB0aGUKaHlwZXJ2aXNvciB3b24ndCBiZSBtZXNzaW5nIGFyb3VuZCB3aXRo
IHJlbWFwcGluZyBzdGFja3MvZXRjLsKgIE1vc3QKI1ZDJ3MgYXJlIHN5bmNocm9ub3VzIHdpdGgg
Z3Vlc3QgYWN0aW9ucyAodGhleSBlcXVhdGUgdG8gYWN0aW9ucyB3aGljaAp3b3VsZCBoYXZlIGNh
dXNlZCBhIFZNRXhpdCksIHNvIHlvdSBjYW4gc2FmZWx5IHJlYXNvbiBhYm91dCB3aGVuIHRoZQpm
aXJzdCAjVkMgbWlnaHQgb2NjdXIsIHByZXN1bWluZyBubyBmdW5ueSBidXNpbmVzcyB3aXRoIHRo
ZSBmcmFtZXMKYmFja2luZyBhbnkgbWVtb3J5IG9wZXJhbmRzIHRvdWNoZWQuCgp+QW5kcmV3Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
