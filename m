Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE192053FE
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 15:57:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEAA388615;
	Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD8SCFHC7ul0; Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39B568860D;
	Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16804C016F;
	Tue, 23 Jun 2020 13:57:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56989C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50AF62DEAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id titm0KM2qoGI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:57:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by silver.osuosl.org (Postfix) with ESMTPS id 581C12DD08
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:57:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RxHCBkGn6WCYmKI8uhwqpDzWq9+T02hGLgx/4StGqp26rXVL/9EHUTW4ZgZWcdrwy973h8+FL1
 vuqOMF+AEy3R03F6tyzjQrt2Z04lpSzdTjGVedKmE+8goFjOSXq8bTLW7X1REC5Cfa0KZuLHu2
 2qD6s/B/VzsFyM3jt90pG1SIBE4FZqvelWngm1YJyUG8/pNVPZt+4klXSO5TluydnT49CwDygG
 limi5Xh2jdtnNS/3Y5BWVO88o78s3uWHLpkzsF9dVK1dQ3NXHK8JVP176FwTkg1lAJtb/ohx2C
 C6Y=
X-SBRS: 2.7
X-MesageID: 21024354
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="21024354"
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Peter Zijlstra <peterz@infradead.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
 <20200623110706.GB4817@hirez.programming.kicks-ass.net>
 <20200623113007.GH31822@suse.de>
 <8413fe52-04ee-f4e1-873c-17595110856a@citrix.com>
 <20200623124712.GF4817@hirez.programming.kicks-ass.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4113e368-6bc8-51b7-9412-3b4df2633ad6@citrix.com>
Date: Tue, 23 Jun 2020 14:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623124712.GF4817@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Sean
 Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

T24gMjMvMDYvMjAyMCAxMzo0NywgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MjMsIDIwMjAgYXQgMTI6NTE6MDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPgo+PiBU
aGVyZSBhcmUgY2FzZXMgd2hpY2ggYXJlIGRlZmluaXRlbHkgbm9uLXJlY292ZXJhYmxlLgo+Pgo+
PiBGb3IgYm90aCBFUyBhbmQgU05QLCBhIG1hbGljaW91cyBoeXBlcnZpc29yIGNhbiBtZXNzIHdp
dGggdGhlIGd1ZXN0Cj4+IHBoeXNtYXAgdG8gbWFrZSB0aGUgdGhlIE5NSSwgI1ZDIGFuZCAjREYg
c3RhY2tzIGFsbCBhbGlhcy4KPj4KPj4gRm9yIEVTLCB0aGlzIGhhZCBiZXR0ZXIgcmVzdWx0IGlu
IHRoZSAjREYgaGFuZGxlciBkZWNpZGluZyB0aGF0IGNyYXNoaW5nCj4+IGlzIHRoZSB3YXkgb3V0
LCB3aGVyZWFzIGZvciBTTlAsIHRoaXMgaGFkIGJldHRlciBlc2NhbGF0ZSB0byBTaHV0ZG93bi4K
Pj4gQ3Jhc2hpbmcgb3V0IGhhcmQgaWYgdGhlIGh5cGVydmlzb3IgaXMgbWlzYmVoYXZpbmcgaXMg
YWNjZXB0YWJsZS4KPiBUaGVuIEknbSB0aGlua2luZyB0aGUgb25seSBzZW5zaWJsZSBvcHRpb24g
aXMgdG8gY3Jhc2ggaGFyZCBmb3IgYW55IFNOUAo+ICNWQyBmcm9tIGtlcm5lbCBtb2RlLgo+Cj4g
U2FkbHkgdGhhdCBkb2Vzbid0IGhlbHAgd2l0aCAjVkMgbmVlZGluZyB0byBiZSBJU1QgOi0oIElT
VCBpcyBzdWNoIGEKPiBmcmlnZ2luZyBuaWdodG1hcmUuCgpJIHByZXN1bWUgeW91IG1lYW4gYW55
ICNWQyBjYXVzZWQgYnkgUk1QIGZhdWx0cyAoaS5lLiBzb21ldGhpbmcgd2VudAp3cm9uZyB3aXRo
IHRoZSBtZW1vcnkgb3duZXIvZXRjIG1ldGFkYXRhKSA/CgpJZiBzbywgdGhlbiB5ZXMuwqAgQW55
IGZhaWx1cmUgaGVyZSBpcyBhIGJ1ZyBpbiB0aGUga2VybmVsIG9yIGh5cGVydmlzb3IKKGFuZCBu
ZWVkcyBmaXhpbmcpIG9yIGEgbWFsaWNpb3VzIGh5cGVydmlzb3IgYW5kIHRoZSBndWVzdCBzaG91
bGQKdGVybWluYXRlIGZvciBpdHMgb3duIHNhZmV0eS4KCn5BbmRyZXcKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
