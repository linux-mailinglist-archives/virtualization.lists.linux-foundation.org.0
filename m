Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 678668A8F0
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 23:05:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A645B65;
	Mon, 12 Aug 2019 21:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ACD528BF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 21:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3DCC72C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 21:05:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Aug 2019 14:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; d="scan'208";a="327476751"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
	([10.54.74.41])
	by orsmga004.jf.intel.com with ESMTP; 12 Aug 2019 14:05:01 -0700
Date: Mon, 12 Aug 2019 14:05:01 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 55/92] kvm: introspection: add KVMI_CONTROL_MSR
	and KVMI_EVENT_MSR
Message-ID: <20190812210501.GD1437@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-56-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809160047.8319-56-alazar@bitdefender.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
IHdyb3RlOgo+IEZyb206IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBpbmRleCAyMmYwOGYyNzMyY2MuLjkxY2Q0M2E3YTdiZiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC0xMDEzLDYgKzEwMTMsOCBAQCBzdHJ1
Y3Qga3ZtX3g4Nl9vcHMgewo+ICAJYm9vbCAoKmhhc19lbXVsYXRlZF9tc3IpKGludCBpbmRleCk7
Cj4gIAl2b2lkICgqY3B1aWRfdXBkYXRlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICAKPiAr
CXZvaWQgKCptc3JfaW50ZXJjZXB0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGlu
dCBtc3IsCj4gKwkJCQlib29sIGVuYWJsZSk7CgpUaGlzIHNob3VsZCBiZSB0b2dnbGVfd3Jtc3Jf
aW50ZXJjZXB0KCksIG9yIHRvZ2dsZV9tc3JfaW50ZXJjZXB0KCkgd2l0aAphIHBhcmFtdGVyIHRv
IGNvbnRyb2wgUkRNU1IgdnMuIFdSTVNSLgoKPiAgCXZvaWQgKCpjcjNfd3JpdGVfZXhpdGluZyko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSk7Cj4gIAlib29sICgqbmVzdGVkX3Bh
Z2VmYXVsdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgCWJvb2wgKCpzcHRfZmF1bHQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gQEAgLTE2MjEsNiArMTYyMyw4IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGt2bV9jcHVfZ2V0X2FwaWNpZChpbnQgbXBzX2NwdSkKPiAgI2RlZmluZSBwdXRfc21z
dGF0ZSh0eXBlLCBidWYsIG9mZnNldCwgdmFsKSAgICAgICAgICAgICAgICAgICAgICBcCj4gIAkq
KHR5cGUgKikoKGJ1ZikgKyAob2Zmc2V0KSAtIDB4N2UwMCkgPSB2YWwKPiAgCj4gK3ZvaWQga3Zt
X2FyY2hfbXNyX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBt
c3IsCj4gKwkJCQlib29sIGVuYWJsZSk7Cj4gIGJvb2wga3ZtX21tdV9uZXN0ZWRfcGFnZWZhdWx0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gIGJvb2wga3ZtX3NwdF9mYXVsdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwo+ICB2b2lkIGt2bV9jb250cm9sX2NyM193cml0ZV9leGl0aW5nKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1pX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5o
Cj4gaW5kZXggODNhMDk4ZGM4OTM5Li44Mjg1ZDFlYjBkYjYgMTAwNjQ0CgouLi4KCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCj4gaW5kZXgg
YjNjYWIwZGI2YTcwLi41ZGJhNGY4N2FmZWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL2t2
bWkuYwo+ICsrKyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKPiBAQCAtOSw2ICs5LDEzMyBAQAo+ICAj
aW5jbHVkZSA8YXNtL3ZteC5oPgo+ICAjaW5jbHVkZSAiLi4vLi4vLi4vdmlydC9rdm0va3ZtaV9p
bnQuaCIKPiAgCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nICptc3JfbWFzayhzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHVuc2lnbmVkIGludCAqbXNyKQo+ICt7Cj4gKwlzd2l0Y2ggKCptc3IpIHsKPiAr
CWNhc2UgMCAuLi4gMHgxZmZmOgo+ICsJCXJldHVybiBJVkNQVSh2Y3B1KS0+bXNyX21hc2subG93
Owo+ICsJY2FzZSAweGMwMDAwMDAwIC4uLiAweGMwMDAxZmZmOgo+ICsJCSptc3IgJj0gMHgxZmZm
Owo+ICsJCXJldHVybiBJVkNQVSh2Y3B1KS0+bXNyX21hc2suaGlnaDsKPiArCX0KPiArCj4gKwly
ZXR1cm4gTlVMTDsKPiArfQoKLi4uCgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwo+IGluZGV4IDY0NTBjOGM0NDc3MS4uMDMwNmM3
ZWYzMTU4IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKPiArKysgYi9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCj4gQEAgLTc3ODQsNiArNzc4NCwxNSBAQCBzdGF0aWMgX19leGl0
IHZvaWQgaGFyZHdhcmVfdW5zZXR1cCh2b2lkKQo+ICAJZnJlZV9rdm1fYXJlYSgpOwo+ICB9Cj4g
IAo+ICtzdGF0aWMgdm9pZCB2bXhfbXNyX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHVuc2lnbmVkIGludCBtc3IsCj4gKwkJCSAgICAgIGJvb2wgZW5hYmxlKQo+ICt7Cj4gKwlzdHJ1
Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKPiArCXVuc2lnbmVkIGxvbmcgKm1zcl9i
aXRtYXAgPSB2bXgtPnZtY3MwMS5tc3JfYml0bWFwOwo+ICsKPiArCXZteF9zZXRfaW50ZXJjZXB0
X2Zvcl9tc3IobXNyX2JpdG1hcCwgbXNyLCBNU1JfVFlQRV9XLCBlbmFibGUpOwo+ICt9CgpVbmxl
c3MgSSBvdmVybG9va2VkIGEgY2hlY2ssIHRoaXMgd2lsbCBhbGxvdyB1c2Vyc3BhY2UgdG8gZGlz
YWJsZSBXUk1TUgppbnRlcmNlcHRpb24gZm9yIGFueSBNU1IgaW4gdGhlIGFib3ZlIHJhbmdlLCBp
LmUuIHVzZXJzcGFjZSBjYW4gdXNlIEtWTQp0byBnYWluIGZ1bGwgd3JpdGUgYWNjZXNzIHRvIHBy
ZXR0eSBtdWNoIGFsbCB0aGUgaW50ZXJlc3RpbmcgTVNScy4gIFRoaXMKbmVlZHMgdG8gb25seSBk
aXNhYmxlIGludGVyY2VwdGlvbiBpZiBLVk0gaGFkIGludGVyY2VwdGlvbiBkaXNhYmxlZCBiZWZv
cmUKaW50cm9zcGVjdGlvbiBzdGFydGVkIG1vZGlmeWluZyBzdGF0ZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
