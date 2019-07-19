Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A16E6B7
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 15:44:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B320262C;
	Fri, 19 Jul 2019 13:44:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79DEE2220
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 13:44:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 732A112E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 13:44:12 +0000 (UTC)
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
IronPort-SDR: X1OrYF3szn/jVMuWJIItUAaAsvQfAa90y3D9AP8stN+fw0rDmOqSfER+UcNjSzseQyw2gQjLoU
	/GjqlzMCrkr3moi7VpoI/l+tT8DP4ITyhzGMGaoebhPW5kOMDN6/U8/OnQiAzaUXaZnh+WL/L9
	Q/NwVHMJLR9W7ZBkjR/B2Dwccb44Amt3mb58Xr857UowUmTIqIlT8ZJ7TiJk9Wy1hsZXoMGyf3
	49LJadLIzXut48bh2dFZAbcQYl9yVGIMsmFekJ5JqlccSYAhOErRajrLXyspGZGBr3TdU/0c9s
	Brs=
X-SBRS: 2.7
X-MesageID: 3199218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3199218"
Subject: Re: [PATCH v2] x86/paravirt: Drop {read,write}_cr8() hooks
To: Andy Lutomirski <luto@kernel.org>
References: <20190715151641.29210-1-andrew.cooper3@citrix.com>
	<602B4D96-E2A9-45BE-8247-4E3481ED5402@vmware.com>
	<4a7592c8-0ee8-f394-c445-4032daf74493@citrix.com>
	<CALCETrWBO6dUNzkyD12ZfEQ+biN8rhrWxm8YoNhgisDd2Spujg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
	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
	6+ahAA==
Message-ID: <1b6ef9c2-6c55-81b9-2b9d-4dc7b5d764ab@citrix.com>
Date: Fri, 19 Jul 2019 14:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALCETrWBO6dUNzkyD12ZfEQ+biN8rhrWxm8YoNhgisDd2Spujg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
	AMSPEX02CL02.citrite.net (10.69.22.126)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Feng Tang <feng.tang@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, the
	arch/x86 maintainers <x86@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Pavel Machek <pavel@ucw.cz>,
	Nadav Amit <namit@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

T24gMTYvMDcvMjAxOSAwMTowNSwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+IE9uIE1vbiwgSnVs
IDE1LCAyMDE5IGF0IDQ6MzAgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDE1LzA3LzIwMTkgMTk6MTcsIE5hZGF2IEFtaXQgd3JvdGU6Cj4+
Pj4gT24gSnVsIDE1LCAyMDE5LCBhdCA4OjE2IEFNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+Pgo+Pj4+IFRoZXJlIGlzIGEgbG90IG9mIGluZnJh
c3RydWN0dXJlIGZvciBmdW5jdGlvbmFsaXR5IHdoaWNoIGlzIHVzZWQKPj4+PiBleGNsdXNpdmVs
eSBpbiBfX3tzYXZlLHJlc3RvcmV9X3Byb2Nlc3Nvcl9zdGF0ZSgpIG9uIHRoZSBzdXNwZW5kL3Jl
c3VtZQo+Pj4+IHBhdGguCj4+Pj4KPj4+PiBjcjggaXMgYW4gYWxpYXMgb2YgQVBJQ19UQVNLUFJJ
LCBhbmQgQVBJQ19UQVNLUFJJIGlzIHNhdmVkL3Jlc3RvcmVkIGJ5Cj4+Pj4gbGFwaWNfe3N1c3Bl
bmQscmVzdW1lfSgpLiAgU2F2aW5nIGFuZCByZXN0b3JpbmcgY3I4IGluZGVwZW5kZW50bHkgb2Yg
dGhlCj4+Pj4gcmVzdCBvZiB0aGUgTG9jYWwgQVBJQyBzdGF0ZSBpc24ndCBhIGNsZXZlciB0aGlu
ZyB0byBiZSBkb2luZy4KPj4+Pgo+Pj4+IERlbGV0ZSB0aGUgc3VzcGVuZC9yZXN1bWUgY3I4IGhh
bmRsaW5nLCB3aGljaCBzaHJpbmtzIHRoZSBzaXplIG9mIHN0cnVjdAo+Pj4+IHNhdmVkX2NvbnRl
eHQsIGFuZCBhbGxvd3MgZm9yIHRoZSByZW1vdmFsIG9mIGJvdGggUFZPUFMuCj4+PiBJIHRoaW5r
IHJlbW92aW5nIHRoZSBpbnRlcmZhY2UgZm9yIENSOCB3cml0ZXMgaXMgYWxzbyBnb29kIHRvIGF2
b2lkCj4+PiBwb3RlbnRpYWwgY29ycmVjdG5lc3MgaXNzdWVzLCBhcyB0aGUgU0RNIHNheXMgKDEw
LjguNi4xICJJbnRlcmFjdGlvbiBvZiBUYXNrCj4+PiBQcmlvcml0aWVzIGJldHdlZW4gQ1I4IGFu
ZCBBUElD4oCdKToKPj4+Cj4+PiAiT3BlcmF0aW5nIHNvZnR3YXJlIHNob3VsZCBpbXBsZW1lbnQg
ZWl0aGVyIGRpcmVjdCBBUElDIFRQUiB1cGRhdGVzIG9yIENSOAo+Pj4gc3R5bGUgVFBSIHVwZGF0
ZXMgYnV0IG5vdCBtaXggdGhlbS4gU29mdHdhcmUgY2FuIHVzZSBhIHNlcmlhbGl6aW5nCj4+PiBp
bnN0cnVjdGlvbiAoZm9yIGV4YW1wbGUsIENQVUlEKSB0byBzZXJpYWxpemUgdXBkYXRlcyBiZXR3
ZWVuIE1PViBDUjggYW5kCj4+PiBzdG9yZXMgdG8gdGhlIEFQSUMu4oCdCj4+Pgo+Pj4gQW5kIG5h
dGl2ZV93cml0ZV9jcjgoKSBkaWQgbm90IGV2ZW4gaXNzdWUgYSBzZXJpYWxpemluZyBpbnN0cnVj
dGlvbi4KPj4+Cj4+IEdpdmVuIGl0cyBsb2NhdGlvbiwgdGhlIG9uZSB3cml0ZV9jcjgoKSBpcyBi
b3VuZGVkIGJ5IHR3byBzZXJpYWxpc2luZwo+PiBvcGVyYXRpb25zLCBzbyBpcyBzYWZlIGluIHBy
YWN0aWNlLgo+Pgo+PiBIb3dldmVyLCBJIGFncmVlIHdpdGggdGhlIHN0YXRlbWVudCBpbiB0aGUg
bWFudWFsLiAgSSBjb3VsZCBzdWJtaXQgYSB2Mwo+PiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1l
c3NhZ2UsIG9yIGxldCBpdCBiZSBmaXhlZCBvbiBjb21taXQuICBXaGljaGV2ZXIKPj4gaXMgZWFz
aWVzdC4KPj4KPiBJIGRvbid0IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRoIHRoZSBtZXNzYWdlLiAg
SWYgd2UgYWN0dWFsbHkgdXNlZCBDUjgKPiBmb3IgaW50ZXJydXB0IHByaW9yaXRpZXMsIHdlIHdv
dWxkbid0IHdhbnQgaXQgdG8gc2VyaWFsaXplLiAgVGhlIGJ1Zwo+IGlzIHRoYXQgdGhlIGNvZGUg
dGhhdCBkaWQgdGhlIHdyaXRlX2NyOCgpIHNob3VsZCBoYXZlIGhhZCBhIGNvbW1lbnQgYXMKPiB0
byBob3cgaXQgc2VyaWFsaXplZCBhZ2FpbnN0IGxhcGljX3Jlc3RvcmUoKS4gIEJ1dCB0aGF0IGRv
ZXNuJ3Qgc2VlbQo+IHdvcnRoIG1lbnRpb25pbmcgaW4gdGhlIG1lc3NhZ2UsIHNpbmNlLCBhcyBu
b3RlZCwgdGhlIHJlYWwgcHJvYmxlbSB3YXMKPiB0aGF0IGl0IG5vbnNlbnNpY2FsbHkgcmVzdG9y
ZWQganVzdCBUUFIgd2l0aG91dCByZXN0b3JpbmcgZXZlcnl0aGluZwo+IGVsc2UuCgpGYWlyIGVu
b3VnaCwgaW4gd2hpY2ggY2FzZSBJJ20gaGFwcHkgd2l0aCB2MiBhcyBpdCBpcy4KCn5BbmRyZXcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
