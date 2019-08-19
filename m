Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A038B94D7E
	for <lists.virtualization@lfdr.de>; Mon, 19 Aug 2019 21:06:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 56B25EBC;
	Mon, 19 Aug 2019 19:06:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 35ED1E57
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 19:06:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CA2E567F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 19:06:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 11:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="172210414"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
	([10.54.74.41])
	by orsmga008.jf.intel.com with ESMTP; 19 Aug 2019 11:52:40 -0700
Date: Mon, 19 Aug 2019 11:52:40 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 55/92] kvm: introspection: add KVMI_CONTROL_MSR
	and KVMI_EVENT_MSR
Message-ID: <20190819185240.GC1916@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-56-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809160047.8319-56-alazar@bitdefender.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDc6MDA6MTBQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINy
IHdyb3RlOgo+ICtpbnQga3ZtaV9hcmNoX2NtZF9jb250cm9sX21zcihzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsCj4gKwkJCSAgICAgIGNvbnN0IHN0cnVjdCBrdm1pX2NvbnRyb2xfbXNyICpyZXEpCj4g
K3sKPiArCWludCBlcnI7Cj4gKwo+ICsJaWYgKHJlcS0+cGFkZGluZzEgfHwgcmVxLT5wYWRkaW5n
MikKPiArCQlyZXR1cm4gLUtWTV9FSU5WQUw7Cj4gKwo+ICsJZXJyID0gbXNyX2NvbnRyb2wodmNw
dSwgcmVxLT5tc3IsIHJlcS0+ZW5hYmxlKTsKPiArCj4gKwlpZiAoIWVyciAmJiByZXEtPmVuYWJs
ZSkKClRoaXMgbmVlZHMgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCBpdCBpbnRlbnRpb25hbGx5
IGNhbGxzIGludG8gYXJjaApjb2RlIG9ubHkgZm9yIHRoZSBlbmFibGUgY2FzZSBzbyBhcyB0byBh
dm9pZCBoYXZpbmcgdG8gZGVhbCB3aXRoIHRyYWNraW5nCndoZXRoZXIgb3Igbm90IGl0J3Mgc2Fm
ZSB0byBkaXNhYmxlIGludGVyY2VwdGlvbi4gIEF0IGZpcnN0IChhbmQgc2Vjb25kKQpnbGFuY2Ug
aXQgbG9vayBsaWtlIEtWTSBpcyBzaWxlbnRseSBpZ25vcmluZyB0aGUgQGVuYWJsZT1mYWxzZSBj
YXNlLgoKPiArCQlrdm1fYXJjaF9tc3JfaW50ZXJjZXB0KHZjcHUsIHJlcS0+bXNyLCByZXEtPmVu
YWJsZSk7CgpSZW5hbWluZyB0byBrdm1fYXJjaF9lbmFibGVfbXNyX2ludGVyY2VwdCgpIHdvdWxk
IGFsc28gaGVscCBjb21tdW5pY2F0ZQp0aGF0IEtWTUkgY2FuJ3QgYmUgdXNlZCB0byBkaXNhYmxl
IG1zciBpbnRlcmNlcHRpb24uICBUaGUgZnVuY3Rpb24gY2FuCmFsd2F5cyBiZSByZW5hbWVkIGlm
IHNvbWVvbmUgdGFrZXMgb24gdGhlIHRhc2sgb2YgZW5oYW5jaW5nIHRoZSBhcmNoIGNvZGUKdG8g
aGFuZGxpbmcgZGlzYWJsaW5nIGludGVyY2VwdGlvbi4KCj4gKwo+ICsJcmV0dXJuIGVycjsKPiAr
fQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
