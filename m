Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDA8BB95
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:33:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7CA8BE7;
	Tue, 13 Aug 2019 14:33:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63BFD255
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:33:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 93E268D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:33:02 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E90CD30644BA; Tue, 13 Aug 2019 17:33:00 +0300 (EEST)
Received: from localhost (unknown [195.210.4.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id D233E304BD70;
	Tue, 13 Aug 2019 17:33:00 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 75/92] kvm: x86: disable gpa_available optimization
	in emulator_read_write_onepage()
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <eb748e05-8289-0c05-6907-b6c898f6080b@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-76-alazar@bitdefender.com>
	<eb748e05-8289-0c05-6907-b6c898f6080b@redhat.com>
Date: Tue, 13 Aug 2019 17:33:27 +0300
Message-ID: <1565706807.E3E4656eC.28420.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mihai =?UTF-8?b?RG9uyJt1?= <mdontu@bitdefender.com>
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

T24gVHVlLCAxMyBBdWcgMjAxOSAxMDo0NzozNCArMDIwMCwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSD
ciB3cm90ZToKPiA+IElmIHRoZSBFUFQgdmlvbGF0aW9uIHdhcyBjYXVzZWQgYnkgYW4gZXhlY3V0
ZSByZXN0cmljdGlvbiBpbXBvc2VkIGJ5IHRoZQo+ID4gaW50cm9zcGVjdGlvbiB0b29sLCBncGFf
YXZhaWxhYmxlIHdpbGwgcG9pbnQgdG8gdGhlIGluc3RydWN0aW9uIHBvaW50ZXIsCj4gPiBub3Qg
dGhlIHRvIHRoZSByZWFkL3dyaXRlIGxvY2F0aW9uIHRoYXQgaGFzIHRvIGJlIHVzZWQgdG8gZW11
bGF0ZSB0aGUKPiA+IGN1cnJlbnQgaW5zdHJ1Y3Rpb24uCj4gPiAKPiA+IFRoaXMgb3B0aW1pemF0
aW9uIHNob3VsZCBiZSBkaXNhYmxlZCBvbmx5IHdoZW4gdGhlIFZNIGlzIGludHJvc3BlY3RlZCwK
PiA+IG5vdCBqdXN0IGJlY2F1c2UgdGhlIGludHJvc3BlY3Rpb24gc3Vic3lzdGVtIGlzIHByZXNl
bnQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRl
ZmVuZGVyLmNvbT4KPiAKPiBUaGUgcmlnaHQgdGhpbmcgdG8gZG8gaXMgdG8gbm90IHNldCBncGFf
YXZhaWxhYmxlIGZvciBmZXRjaCBmYWlsdXJlcyBpbiAKPiBrdm1fbW11X3BhZ2VfZmF1bHQgaW5z
dGVhZDoKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS5jIGIvYXJjaC94ODYva3Zt
L21tdS5jCj4gaW5kZXggMjQ4NDNjZjQ5NTc5Li4xYmRjYTQwZmE4MzEgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC94ODYva3ZtL21tdS5jCj4gKysrIGIvYXJjaC94ODYva3ZtL21tdS5jCj4gQEAgLTUzNjQs
OCArNTM2NCwxMiBAQCBpbnQga3ZtX21tdV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ3ZhX3QgY3IyLCB1NjQgZXJyb3JfY29kZSwKPiAgCWVudW0gZW11bGF0aW9uX3Jlc3VsdCBl
cjsKPiAgCWJvb2wgZGlyZWN0ID0gdmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXA7Cj4gIAo+IC0J
LyogV2l0aCBzaGFkb3cgcGFnZSB0YWJsZXMsIGZhdWx0X2FkZHJlc3MgY29udGFpbnMgYSBHVkEg
b3IgbkdQQS4gICovCj4gLQlpZiAodmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXApIHsKPiArCS8q
Cj4gKwkgKiBXaXRoIHNoYWRvdyBwYWdlIHRhYmxlcywgZmF1bHRfYWRkcmVzcyBjb250YWlucyBh
IEdWQSBvciBuR1BBLgo+ICsJICogT24gYSBmZXRjaCBmYXVsdCwgZmF1bHRfYWRkcmVzcyBjb250
YWlucyB0aGUgaW5zdHJ1Y3Rpb24gcG9pbnRlci4KPiArCSAqLwo+ICsJaWYgKHZjcHUtPmFyY2gu
bW11LT5kaXJlY3RfbWFwICYmCj4gKwkgICAgbGlrZWx5KCEoZXJyb3JfY29kZSAmIFBGRVJSX0ZF
VENIX01BU0spKSB7Cj4gIAkJdmNwdS0+YXJjaC5ncGFfYXZhaWxhYmxlID0gdHJ1ZTsKPiAgCQl2
Y3B1LT5hcmNoLmdwYV92YWwgPSBjcjI7Cj4gIAl9Cj4gCj4gCj4gUGFvbG8KPiAKPiA+IC0tLQo+
ID4gIGFyY2gveDg2L2t2bS94ODYuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwo+ID4gaW5kZXggOTY1YzRmMDEwOGViLi4zOTc1
MzMxMjMwYjkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKPiA+ICsrKyBiL2Fy
Y2gveDg2L2t2bS94ODYuYwo+ID4gQEAgLTU1MzIsNyArNTUzMiw3IEBAIHN0YXRpYyBpbnQgZW11
bGF0b3JfcmVhZF93cml0ZV9vbmVwYWdlKHVuc2lnbmVkIGxvbmcgYWRkciwgdm9pZCAqdmFsLAo+
ID4gIAkgKiBvcGVyYXRpb24gdXNpbmcgcmVwIHdpbGwgb25seSBoYXZlIHRoZSBpbml0aWFsIEdQ
QSBmcm9tIHRoZSBOUEYKPiA+ICAJICogb2NjdXJyZWQuCj4gPiAgCSAqLwo+ID4gLQlpZiAodmNw
dS0+YXJjaC5ncGFfYXZhaWxhYmxlICYmCj4gPiArCWlmICh2Y3B1LT5hcmNoLmdwYV9hdmFpbGFi
bGUgJiYgIWt2bWlfaXNfcHJlc2VudCgpICYmCj4gPiAgCSAgICBlbXVsYXRvcl9jYW5fdXNlX2dw
YShjdHh0KSAmJgo+ID4gIAkgICAgKGFkZHIgJiB+UEFHRV9NQVNLKSA9PSAodmNwdS0+YXJjaC5n
cGFfdmFsICYgflBBR0VfTUFTSykpIHsKPiA+ICAJCWdwYSA9IHZjcHUtPmFyY2guZ3BhX3ZhbDsK
PiA+IAo+IAoKU3VyZSwgYnV0IEkgdGhpbmsgd2UnbGwgaGF2ZSB0byBleHRlbmQgdGhlIGNoZWNr
LgoKU2VhcmNoaW5nIHRoZSBsb2dzIEkndmUgZm91bmQ6CgogICAga3ZtL3g4NjogcmUtdHJhbnNs
YXRlIGJyb2tlbiB0cmFuc2xhdGlvbiB0aGF0IGNhdXNlZCBFUFQgdmlvbGF0aW9uCiAgICAKICAg
IFNpZ25lZC1vZmYtYnk6IE1pcmNlYSBDaXJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNv
bT4KCiBhcmNoL3g4Ni9rdm0veDg2LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKL2hvbWUvYi9rdm1pQDljYWQ4NDR+MS9hcmNoL3g4Ni9rdm0veDg2LmM6NDc1Nyw0NzYy
IC0gL2hvbWUvYi9rdm1pQDljYWQ4NDQvYXJjaC94ODYva3ZtL3g4Ni5jOjQ3NTcsNDc2MwogIAkg
Ki8KICAJaWYgKHZjcHUtPmFyY2guZ3BhX2F2YWlsYWJsZSAmJgogIAkgICAgZW11bGF0b3JfY2Fu
X3VzZV9ncGEoY3R4dCkgJiYKKyAJICAgICh2Y3B1LT5hcmNoLmVycm9yX2NvZGUgJiBQRkVSUl9H
VUVTVF9GSU5BTF9NQVNLKSAmJgogIAkgICAgKGFkZHIgJiB+UEFHRV9NQVNLKSA9PSAodmNwdS0+
YXJjaC5ncGFfdmFsICYgflBBR0VfTUFTSykpIHsKICAJCWdwYSA9IHZjcHUtPmFyY2guZ3BhX3Zh
bDsKICAJCXJldCA9IHZjcHVfaXNfbW1pb19ncGEodmNwdSwgYWRkciwgZ3BhLCB3cml0ZSk7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
