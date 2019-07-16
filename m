Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136C69FB0
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 02:05:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04C5CD9C;
	Tue, 16 Jul 2019 00:05:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9121D85
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 00:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8ACE163D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 00:05:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F2C182173E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 00:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563235518;
	bh=piOXQeY06JPCbmjpjb4VUzp823ZxS1bYEAb7P6Bg000=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y2Ky5stlz1vjJHjrhqC+/Z4/SW6q7GLgSIANYaO6MjGtN8a6+MAIdSifb6xJgfmRX
	8qHvdM14LxOUi4kcFHTo0MTMsNTIqmL/8aEa9YOsKIpof1/oS3f6JymbIAn5uxKHTD
	8wqoQx4+n3WGWh/XO47UPQtWDPzF7EZPjydUVjdQ=
Received: by mail-wr1-f43.google.com with SMTP id 31so18941052wrm.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:05:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWKA4wpmMpewF2LsA8QoTR/zLmaNhx7WkLD6VuFd85TmWQaCg/q
	kfjUcSSnKt25XaT+FGFg+/Lch++13+oC1E5kIPin8w==
X-Google-Smtp-Source: APXvYqx0js9g/XgFkOCOiw+uw19siPzaDdmMc8GKluoJU646DWxzrGkc1mGVQwl+4SGTL6UZQX7cp5pa+mFQL1LRw7I=
X-Received: by 2002:adf:cf02:: with SMTP id o2mr12173472wrj.352.1563235516486; 
	Mon, 15 Jul 2019 17:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190715151641.29210-1-andrew.cooper3@citrix.com>
	<602B4D96-E2A9-45BE-8247-4E3481ED5402@vmware.com>
	<4a7592c8-0ee8-f394-c445-4032daf74493@citrix.com>
In-Reply-To: <4a7592c8-0ee8-f394-c445-4032daf74493@citrix.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 15 Jul 2019 17:05:04 -0700
X-Gmail-Original-Message-ID: <CALCETrWBO6dUNzkyD12ZfEQ+biN8rhrWxm8YoNhgisDd2Spujg@mail.gmail.com>
Message-ID: <CALCETrWBO6dUNzkyD12ZfEQ+biN8rhrWxm8YoNhgisDd2Spujg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/paravirt: Drop {read,write}_cr8() hooks
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Feng Tang <feng.tang@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Nadav Amit <namit@vmware.com>,
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgNDozMCBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDE1LzA3LzIwMTkgMTk6MTcsIE5hZGF2IEFt
aXQgd3JvdGU6Cj4gPj4gT24gSnVsIDE1LCAyMDE5LCBhdCA4OjE2IEFNLCBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Pgo+ID4+IFRoZXJlIGlzIGEg
bG90IG9mIGluZnJhc3RydWN0dXJlIGZvciBmdW5jdGlvbmFsaXR5IHdoaWNoIGlzIHVzZWQKPiA+
PiBleGNsdXNpdmVseSBpbiBfX3tzYXZlLHJlc3RvcmV9X3Byb2Nlc3Nvcl9zdGF0ZSgpIG9uIHRo
ZSBzdXNwZW5kL3Jlc3VtZQo+ID4+IHBhdGguCj4gPj4KPiA+PiBjcjggaXMgYW4gYWxpYXMgb2Yg
QVBJQ19UQVNLUFJJLCBhbmQgQVBJQ19UQVNLUFJJIGlzIHNhdmVkL3Jlc3RvcmVkIGJ5Cj4gPj4g
bGFwaWNfe3N1c3BlbmQscmVzdW1lfSgpLiAgU2F2aW5nIGFuZCByZXN0b3JpbmcgY3I4IGluZGVw
ZW5kZW50bHkgb2YgdGhlCj4gPj4gcmVzdCBvZiB0aGUgTG9jYWwgQVBJQyBzdGF0ZSBpc24ndCBh
IGNsZXZlciB0aGluZyB0byBiZSBkb2luZy4KPiA+Pgo+ID4+IERlbGV0ZSB0aGUgc3VzcGVuZC9y
ZXN1bWUgY3I4IGhhbmRsaW5nLCB3aGljaCBzaHJpbmtzIHRoZSBzaXplIG9mIHN0cnVjdAo+ID4+
IHNhdmVkX2NvbnRleHQsIGFuZCBhbGxvd3MgZm9yIHRoZSByZW1vdmFsIG9mIGJvdGggUFZPUFMu
Cj4gPiBJIHRoaW5rIHJlbW92aW5nIHRoZSBpbnRlcmZhY2UgZm9yIENSOCB3cml0ZXMgaXMgYWxz
byBnb29kIHRvIGF2b2lkCj4gPiBwb3RlbnRpYWwgY29ycmVjdG5lc3MgaXNzdWVzLCBhcyB0aGUg
U0RNIHNheXMgKDEwLjguNi4xICJJbnRlcmFjdGlvbiBvZiBUYXNrCj4gPiBQcmlvcml0aWVzIGJl
dHdlZW4gQ1I4IGFuZCBBUElD4oCdKToKPiA+Cj4gPiAiT3BlcmF0aW5nIHNvZnR3YXJlIHNob3Vs
ZCBpbXBsZW1lbnQgZWl0aGVyIGRpcmVjdCBBUElDIFRQUiB1cGRhdGVzIG9yIENSOAo+ID4gc3R5
bGUgVFBSIHVwZGF0ZXMgYnV0IG5vdCBtaXggdGhlbS4gU29mdHdhcmUgY2FuIHVzZSBhIHNlcmlh
bGl6aW5nCj4gPiBpbnN0cnVjdGlvbiAoZm9yIGV4YW1wbGUsIENQVUlEKSB0byBzZXJpYWxpemUg
dXBkYXRlcyBiZXR3ZWVuIE1PViBDUjggYW5kCj4gPiBzdG9yZXMgdG8gdGhlIEFQSUMu4oCdCj4g
Pgo+ID4gQW5kIG5hdGl2ZV93cml0ZV9jcjgoKSBkaWQgbm90IGV2ZW4gaXNzdWUgYSBzZXJpYWxp
emluZyBpbnN0cnVjdGlvbi4KPiA+Cj4KPiBHaXZlbiBpdHMgbG9jYXRpb24sIHRoZSBvbmUgd3Jp
dGVfY3I4KCkgaXMgYm91bmRlZCBieSB0d28gc2VyaWFsaXNpbmcKPiBvcGVyYXRpb25zLCBzbyBp
cyBzYWZlIGluIHByYWN0aWNlLgo+Cj4gSG93ZXZlciwgSSBhZ3JlZSB3aXRoIHRoZSBzdGF0ZW1l
bnQgaW4gdGhlIG1hbnVhbC4gIEkgY291bGQgc3VibWl0IGEgdjMKPiB3aXRoIGFuIHVwZGF0ZWQg
Y29tbWl0IG1lc3NhZ2UsIG9yIGxldCBpdCBiZSBmaXhlZCBvbiBjb21taXQuICBXaGljaGV2ZXIK
PiBpcyBlYXNpZXN0Lgo+CgpJIGRvbid0IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRoIHRoZSBtZXNz
YWdlLiAgSWYgd2UgYWN0dWFsbHkgdXNlZCBDUjgKZm9yIGludGVycnVwdCBwcmlvcml0aWVzLCB3
ZSB3b3VsZG4ndCB3YW50IGl0IHRvIHNlcmlhbGl6ZS4gIFRoZSBidWcKaXMgdGhhdCB0aGUgY29k
ZSB0aGF0IGRpZCB0aGUgd3JpdGVfY3I4KCkgc2hvdWxkIGhhdmUgaGFkIGEgY29tbWVudCBhcwp0
byBob3cgaXQgc2VyaWFsaXplZCBhZ2FpbnN0IGxhcGljX3Jlc3RvcmUoKS4gIEJ1dCB0aGF0IGRv
ZXNuJ3Qgc2VlbQp3b3J0aCBtZW50aW9uaW5nIGluIHRoZSBtZXNzYWdlLCBzaW5jZSwgYXMgbm90
ZWQsIHRoZSByZWFsIHByb2JsZW0gd2FzCnRoYXQgaXQgbm9uc2Vuc2ljYWxseSByZXN0b3JlZCBq
dXN0IFRQUiB3aXRob3V0IHJlc3RvcmluZyBldmVyeXRoaW5nCmVsc2UuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
