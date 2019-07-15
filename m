Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240C69F83
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 01:30:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1672D39;
	Mon, 15 Jul 2019 23:30:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC196CD4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 23:30:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF5CE25A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 23:30:14 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
	dkim=none (message not signed) header.i=none;
	spf=None smtp.pra=andrew.cooper3@citrix.com;
	spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
	spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	andrew.cooper3@citrix.com) identity=pra;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="andrew.cooper3@citrix.com";
	x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
	Andrew.Cooper3@citrix.com designates 162.221.158.21 as
	permitted sender) identity=mailfrom;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="Andrew.Cooper3@citrix.com";
	x-conformance=sidf_compatible; x-record-type="v=spf1";
	x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
	ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
	ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
	ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@mail.citrix.com) identity=helo;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="Andrew.Cooper3@citrix.com";
	x-sender="postmaster@mail.citrix.com";
	x-conformance=sidf_compatible
IronPort-SDR: 8+Sl8f01B3cJisF2errb/zHcAWqKh89Kx+bfZiCPeqRLI8boQcCRMY513nfpC9e39sWD7Ip6X2
	RbjTqWw22nGMq2JyekJln51HduzWCHw9tKkR0e9LMXIbb87dtma2SfAZJYFrPWThUXOepSuM4M
	lFubP0jcoPIRBj8VQkzdzpdwng+GWaMUaipquhNtXNajcmoZdiyn8vkN/DKpXCNjBvOHn5UOc2
	K616kAhZ5M37SqZPJw1S8FKuylB+XBMQerGv++hzcMDsDU0iHJBJkRx+kI8EvX4bKBkyHZGqAb
	UEM=
X-SBRS: 2.7
X-MesageID: 3012132
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,494,1557201600"; 
   d="scan'208";a="3012132"
Subject: Re: [PATCH v2] x86/paravirt: Drop {read,write}_cr8() hooks
To: Nadav Amit <namit@vmware.com>
References: <20190715151641.29210-1-andrew.cooper3@citrix.com>
	<602B4D96-E2A9-45BE-8247-4E3481ED5402@vmware.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
	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
	6+ahAA==
Message-ID: <4a7592c8-0ee8-f394-c445-4032daf74493@citrix.com>
Date: Tue, 16 Jul 2019 00:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <602B4D96-E2A9-45BE-8247-4E3481ED5402@vmware.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
	AMSPEX02CL02.citrite.net (10.69.22.126)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Feng Tang <feng.tang@intel.com>, Pavel
	Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMTUvMDcvMjAxOSAxOToxNywgTmFkYXYgQW1pdCB3cm90ZToKPj4gT24gSnVsIDE1LCAyMDE5
LCBhdCA4OjE2IEFNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cm90ZToKPj4KPj4gVGhlcmUgaXMgYSBsb3Qgb2YgaW5mcmFzdHJ1Y3R1cmUgZm9yIGZ1bmN0aW9u
YWxpdHkgd2hpY2ggaXMgdXNlZAo+PiBleGNsdXNpdmVseSBpbiBfX3tzYXZlLHJlc3RvcmV9X3By
b2Nlc3Nvcl9zdGF0ZSgpIG9uIHRoZSBzdXNwZW5kL3Jlc3VtZQo+PiBwYXRoLgo+Pgo+PiBjcjgg
aXMgYW4gYWxpYXMgb2YgQVBJQ19UQVNLUFJJLCBhbmQgQVBJQ19UQVNLUFJJIGlzIHNhdmVkL3Jl
c3RvcmVkIGJ5Cj4+IGxhcGljX3tzdXNwZW5kLHJlc3VtZX0oKS4gIFNhdmluZyBhbmQgcmVzdG9y
aW5nIGNyOCBpbmRlcGVuZGVudGx5IG9mIHRoZQo+PiByZXN0IG9mIHRoZSBMb2NhbCBBUElDIHN0
YXRlIGlzbid0IGEgY2xldmVyIHRoaW5nIHRvIGJlIGRvaW5nLgo+Pgo+PiBEZWxldGUgdGhlIHN1
c3BlbmQvcmVzdW1lIGNyOCBoYW5kbGluZywgd2hpY2ggc2hyaW5rcyB0aGUgc2l6ZSBvZiBzdHJ1
Y3QKPj4gc2F2ZWRfY29udGV4dCwgYW5kIGFsbG93cyBmb3IgdGhlIHJlbW92YWwgb2YgYm90aCBQ
Vk9QUy4KPiBJIHRoaW5rIHJlbW92aW5nIHRoZSBpbnRlcmZhY2UgZm9yIENSOCB3cml0ZXMgaXMg
YWxzbyBnb29kIHRvIGF2b2lkCj4gcG90ZW50aWFsIGNvcnJlY3RuZXNzIGlzc3VlcywgYXMgdGhl
IFNETSBzYXlzICgxMC44LjYuMSAiSW50ZXJhY3Rpb24gb2YgVGFzawo+IFByaW9yaXRpZXMgYmV0
d2VlbiBDUjggYW5kIEFQSUPigJ0pOgo+Cj4gIk9wZXJhdGluZyBzb2Z0d2FyZSBzaG91bGQgaW1w
bGVtZW50IGVpdGhlciBkaXJlY3QgQVBJQyBUUFIgdXBkYXRlcyBvciBDUjgKPiBzdHlsZSBUUFIg
dXBkYXRlcyBidXQgbm90IG1peCB0aGVtLiBTb2Z0d2FyZSBjYW4gdXNlIGEgc2VyaWFsaXppbmcK
PiBpbnN0cnVjdGlvbiAoZm9yIGV4YW1wbGUsIENQVUlEKSB0byBzZXJpYWxpemUgdXBkYXRlcyBi
ZXR3ZWVuIE1PViBDUjggYW5kCj4gc3RvcmVzIHRvIHRoZSBBUElDLuKAnQo+Cj4gQW5kIG5hdGl2
ZV93cml0ZV9jcjgoKSBkaWQgbm90IGV2ZW4gaXNzdWUgYSBzZXJpYWxpemluZyBpbnN0cnVjdGlv
bi4KPgoKR2l2ZW4gaXRzIGxvY2F0aW9uLCB0aGUgb25lIHdyaXRlX2NyOCgpIGlzIGJvdW5kZWQg
YnkgdHdvIHNlcmlhbGlzaW5nCm9wZXJhdGlvbnMsIHNvIGlzIHNhZmUgaW4gcHJhY3RpY2UuCgpI
b3dldmVyLCBJIGFncmVlIHdpdGggdGhlIHN0YXRlbWVudCBpbiB0aGUgbWFudWFsLsKgIEkgY291
bGQgc3VibWl0IGEgdjMKd2l0aCBhbiB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlLCBvciBsZXQgaXQg
YmUgZml4ZWQgb24gY29tbWl0LsKgIFdoaWNoZXZlcgppcyBlYXNpZXN0LgoKfkFuZHJldwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
