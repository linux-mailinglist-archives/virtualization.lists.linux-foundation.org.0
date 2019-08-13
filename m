Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73B8BC56
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 17:01:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 60D26C2A;
	Tue, 13 Aug 2019 15:01:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 70408B88
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 15:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F319D8A6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 15:01:28 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Aug 2019 08:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="351556260"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
	([10.54.74.41])
	by orsmga005.jf.intel.com with ESMTP; 13 Aug 2019 08:01:28 -0700
Date: Tue, 13 Aug 2019 08:01:28 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
Message-ID: <20190813150128.GB13991@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
	<5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
	<5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
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
	Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea =?iso-8859-1?Q?C=EErjaliu?= <mcirjaliu@bitdefender.com>,
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6MDk6NTFQTSArMDIwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiAxMy8wOC8xOSAxMzo1NywgQWRhbGJlcnQgTGF6xINyIHdyb3RlOgo+ID4+IFRo
ZSByZWZjb3VudGluZyBhcHByb2FjaCBzZWVtcyBhIGJpdCBiYWNrd2FyZHMsIGFuZCBBRkFJQ1Qg
aXMgZHJpdmVuIGJ5Cj4gPj4gaW1wbGVtZW50aW5nIHVuaG9vayB2aWEgYSBtZXNzYWdlLCB3aGlj
aCBhbHNvIHNlZW1zIGJhY2t3YXJkcy4gIEkgYXNzdW1lCj4gPj4gaG9vayBhbmQgdW5ob29rIGFy
ZSByZWxhdGl2ZWx5IHJhcmUgZXZlbnRzIGFuZCBub3QgcGVyZm9ybWFuY2UgY3JpdGljYWwsCj4g
Pj4gc28gbWFrZSB0aG9zZSB0aGUgcmVzdHJpY3RlZC9zbG93IGZsb3dzLCBlLmcuIGZvcmNlIHVz
ZXJzcGFjZSB0byBxdWllc2NlCj4gPj4gdGhlIFZNIGJ5IG1ha2luZyB1bmhvb2soKSBtdXR1YWxs
eSBleGNsdXNpdmUgd2l0aCBldmVyeSB2Y3B1IGlvY3RsKCkgYW5kCj4gPj4gbWF5YmUgYW55dGhp
bmcgdGhhdCB0YWtlcyBrdm0tPmxvY2suIAo+ID4+Cj4gPj4gVGhlbiBrdm1pX2lvY3RsX3VuaG9v
aygpIGNhbiB1c2UgdGhyZWFkX3N0b3AoKSBhbmQga3ZtaV9yZWN2KCkganVzdCBuZWVkcwo+ID4+
IHRvIGNoZWNrIGt0aHJlYWRfc2hvdWxkX3N0b3AoKS4KPiA+Pgo+ID4+IFRoYXQgd2F5IGt2bWkg
ZG9lc24ndCBuZWVkIHRvIGJlIHJlZmNvdW50ZWQgc2luY2UgaXQncyBndWFyYW50ZWVkIHRvIGJl
Cj4gPj4gYWxpdmUgaWYgdGhlIHBvaW50ZXIgaXMgbm9uLW51bGwuICBFbGltaW5hdGluZyB0aGUg
cmVmY291bnRpbmcgd2lsbCBjbGVhbgo+ID4+IHVwIGEgbG90IG9mIHRoZSBjb2RlIGJ5IGVsaW1p
bmF0aW5nIGNhbGxzIHRvIGt2bWlfe2dldCxwdXR9KCksIGUuZy4KPiA+PiB3cmFwcGVycyBsaWtl
IGt2bWlfYnJlYWtwb2ludF9ldmVudCgpIGp1c3QgY2hlY2sgdmNwdS0+a3ZtaSwgb3IgbWF5YmUK
PiA+PiBldmVuIGdldCBkcm9wcGVkIGFsdG9nZXRoZXIuCj4gPiAKPiA+IFRoZSB1bmhvb2sgZXZl
bnQgaGFzIGJlZW4gYWRkZWQgdG8gY292ZXIgdGhlIGZvbGxvd2luZyBjYXNlOiB3aGlsZSB0aGUK
PiA+IGludHJvc3BlY3Rpb24gdG9vbCBydW5zIGluIGFub3RoZXIgVk0sIGJvdGggVk1zLCB0aGUg
dmlydHVhbCBhcHBsaWFuY2UKPiA+IGFuZCB0aGUgaW50cm9zcGVjdGVkIFZNLCBjb3VsZCBiZSBw
YXVzZWQgYnkgdGhlIHVzZXIuIFdlIG5lZWRlZCBhIHdheQo+ID4gdG8gc2lnbmFsIHRoaXMgdG8g
dGhlIGludHJvc3BlY3Rpb24gdG9vbCBhbmQgZ2l2ZSBpdCB0aW1lIHRvIHVuaG9vawo+ID4gKHRo
ZSBpbnRyb3NwZWN0ZWQgVk0gaGFzIHRvIHJ1biBhbmQgZXhlY3V0ZSB0aGUgaW50cm9zcGVjdGlv
biBjb21tYW5kcwo+ID4gZHVyaW5nIHRoaXMgcGhhc2UpLiBUaGUgcmVjZWl2aW5nIHRocmVhZHMg
cXVpdHMgd2hlbiB0aGUgc29ja2V0IGlzIGNsb3NlZAo+ID4gKGJ5IFFFTVUgb3IgYnkgdGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCkuCgpXaHkgZG9lcyBjbG9zaW5nIHRoZSBzb2NrZXQgcmVxdWlyZSBk
ZXN0cm95aW5nIHRoZSBrdm1pIG9iamVjdD8gIEUuZy4gY2FuCml0IGJlIG1hcmtlZCBhcyBkZWZ1
bmN0IG9yIHdoYXRldmVyIGFuZCBvbmx5IGZ1bGx5IHJlbW92ZWQgb24gYSBzeW5jaHJvbm91cwp1
bmhvb2sgZnJvbSB1c2Vyc3BhY2U/ICBSZS1ob29raW5nIGNvdWxkIGVpdGhlciByZXF1aXJlIHNh
aWQgdW5ob29rLCBvcgptYXliZSByZXVzZSB0aGUgZXhpc3Rpbmcga3ZtaSBvYmplY3Qgd2l0aCBh
IG5ldyBzb2NrZXQuCgo+ID4gSXQncyBhIGJpdCB1bmNsZWFyIGhvdywgYnV0IHdlJ2xsIHRyeSB0
byBnZXQgcmlkZSBvZiB0aGUgcmVmY291bnQgb2JqZWN0LAo+ID4gd2hpY2ggd2lsbCByZW1vdmUg
YSBsb3Qgb2YgY29kZSwgaW5kZWVkLgo+IAo+IFlvdSBjYW4ga2VlcCBpdCBmb3Igbm93LiAgSXQg
bWF5IGJlY29tZSBjbGVhcmVyIGhvdyB0byBmaXggaXQgYWZ0ZXIgdGhlCj4gZXZlbnQgbG9vcCBp
cyBjbGVhbmVkIHVwLgoKQnkgZXZlbnQgbG9vcCwgZG8geW91IG1lYW4gdGhlIHBlci12Q1BVIGpv
YnMgbGlzdD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
