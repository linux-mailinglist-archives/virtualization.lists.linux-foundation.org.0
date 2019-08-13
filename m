Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B548BCF4
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 17:25:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 49167C59;
	Tue, 13 Aug 2019 15:25:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A841B8F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 15:25:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EB2DD89D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 15:25:11 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	3B78B30644BA; Tue, 13 Aug 2019 18:25:10 +0300 (EEST)
Received: from localhost (unknown [195.210.4.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 228B8304BD70;
	Tue, 13 Aug 2019 18:25:10 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 16/92] kvm: introspection: handle events and event
	replies
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <08325b3b-3af9-382b-7c0f-8410e8fcb545@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-17-alazar@bitdefender.com>
	<08325b3b-3af9-382b-7c0f-8410e8fcb545@redhat.com>
Date: Tue, 13 Aug 2019 18:25:36 +0300
Message-ID: <1565709936.aAF8B07.6681.@15f23d3a749365d981e968181cce585d2dcb3ffa>
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

T24gVHVlLCAxMyBBdWcgMjAxOSAxMDo1NToyMSArMDIwMCwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSD
ciB3cm90ZToKPiA+IAo+ID4gKwkJCSByZXBseS0+cGFkZGluZzIpOwo+ID4gKwo+ID4gKwlpdmNw
dS0+cmVwbHlfd2FpdGluZyA9IGZhbHNlOwo+ID4gKwlyZXR1cm4gZXhwZWN0ZWQtPmVycm9yOwo+
ID4gK30KPiA+ICsKPiA+ICAvKgo+IAo+IElzIHRoaXMgbWlzc2luZyBhIHdha2V1cD8KPiAKPiA+
ICAKPiA+ICtzdGF0aWMgYm9vbCBuZWVkX3RvX3dhaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+
ID4gK3sKPiA+ICsJc3RydWN0IGt2bWlfdmNwdSAqaXZjcHUgPSBJVkNQVSh2Y3B1KTsKPiA+ICsK
PiA+ICsJcmV0dXJuIGl2Y3B1LT5yZXBseV93YWl0aW5nOwo+ID4gK30KPiA+ICsKPiAKPiBEbyB5
b3UgYWN0dWFsbHkgbmVlZCB0aGlzIGZ1bmN0aW9uPyAgSXQgc2VlbXMgdG8gbWUgdGhhdCBldmVy
eXdoZXJlIHlvdQo+IGNhbGwgaXQgeW91IGFscmVhZHkgaGF2ZSBhbiBpdmNwdSwgc28geW91IGNh
biBqdXN0IGFjY2VzcyB0aGUgZmllbGQuCj4gCj4gQWxzbywgInJlcGx5X3dhaXRpbmciIG1lYW5z
ICJ0aGVyZSBpcyBhIHJlcGx5IHRoYXQgaXMgd2FpdGluZyIuICBXaGF0Cj4geW91IG1lYW4gaXMg
IndhaXRpbmdfZm9yX3JlcGx5Ii4KCkluIGFuIG9sZGVyIHZlcnNpb24sIGhhbmRsZV9ldmVudF9y
ZXBseSgpIHdhcyBleGVjdXRlZCBmcm9tIHRoZSByZWNlaXZpbmcKdGhyZWFkIChoYXZpbmcgYW5v
dGhlciBuYW1lKSBhbmQgaXQgY29udGFpbmVkIGEgd2FrZXVwIGZ1bmN0aW9uLiBOb3csCmluZGVl
ZCwgJ3dhaXRpbmdfZm9yX3JlcGx5JyBpcyB0aGUgcmlnaHQgbmFtZS4KIAo+IFRoZSBvdmVyYWxs
IHN0cnVjdHVyZSBvZiB0aGUgam9icyBjb2RlIGlzIGNvbmZ1c2luZy4gIFRoZSBzYW1lIGZ1bmN0
aW9uCj4ga3ZtX3J1bl9qb2JzX2FuZF93YWl0IGlzIGFuIGluZmluaXRlIGxvb3AgYmVmb3JlIGFu
ZCBnZXRzIGEgImJyZWFrIgo+IGxhdGVyLiAgSXQgaXMgYWxzbyBub3QgY2xlYXIgd2h5IGt2bWlf
am9iX3dhaXQgaXMgY2FsbGVkIHRocm91Z2ggYSBqb2IuCj4gIENhbiB5b3UgaGF2ZSBpbnN0ZWFk
IGp1c3Qga3ZtX3J1bl9qb2JzIGluIEtWTV9SRVFfSU5UUk9TUEVDVElPTiwgYW5kCj4gc29tZXRo
aW5nIGxpa2UgdGhpcyBpbnN0ZWFkIHdoZW4gc2VuZGluZyBhbiBldmVudDoKPiAKPiBpbnQga3Zt
aV93YWl0X2Zvcl9yZXBseShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gewo+IAlzdHJ1Y3Qga3Zt
aV92Y3B1ICppdmNwdSA9IElWQ1BVKHZjcHUpOwo+IAo+IAl3aGlsZSAoaXZjcHUtPndhaXRpbmdf
Zm9yX3JlcGx5KSB7Cj4gCQlrdm1pX3J1bl9qb2JzKHZjcHUpOwo+IAo+IAkJZXJyID0gc3dhaXRf
ZXZlbnRfa2lsbGFibGUoKndxLAo+IAkJCQkhaXZjcHUtPndhaXRpbmdfZm9yX3JlcGx5IHx8Cj4g
CQkJCSFsaXN0X2VtcHR5KCZpdmNwdS0+am9iX2xpc3QpKTsKPiAKPiAJCWlmIChlcnIpCj4gCQkJ
cmV0dXJuIC1FSU5UUjsKPiAJfQo+IAo+IAlyZXR1cm4gMDsKPiB9Cj4gCj4gPwo+IAo+IFBhb2xv
CgpNdWNoIGJldHRlciA6KSBUaGFuayB5b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
