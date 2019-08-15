Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AC8F455
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 21:19:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 159851092;
	Thu, 15 Aug 2019 19:19:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 485071074
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 19:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D7589CF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 19:19:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DE043090FD8;
	Thu, 15 Aug 2019 19:19:35 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29BE219C6A;
	Thu, 15 Aug 2019 19:19:31 +0000 (UTC)
Date: Thu, 15 Aug 2019 15:19:29 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20190815191929.GA9253@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 15 Aug 2019 19:19:35 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea =?iso-8859-1?Q?C=EErjaliu?= <mcirjaliu@bitdefender.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6MDE6MzVQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINy
IHdyb3RlOgo+IE9uIEZyaSwgOSBBdWcgMjAxOSAwOToyNDo0NCAtMDcwMCwgTWF0dGhldyBXaWxj
b3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMDksIDIwMTkg
YXQgMDc6MDA6MjZQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINyIHdyb3RlOgo+ID4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAo+ID4gPiBAQCAtNDE3LDggKzQxNywxMCBAQCBQQUdF
RkxBRyhJZGxlLCBpZGxlLCBQRl9BTlkpCj4gPiA+ICAgKi8KPiA+ID4gICNkZWZpbmUgUEFHRV9N
QVBQSU5HX0FOT04JMHgxCj4gPiA+ICAjZGVmaW5lIFBBR0VfTUFQUElOR19NT1ZBQkxFCTB4Mgo+
ID4gPiArI2RlZmluZSBQQUdFX01BUFBJTkdfUkVNT1RFCTB4NAo+ID4gCj4gPiBVaC4gIEhvdyBk
byB5b3Uga25vdyBwYWdlLT5tYXBwaW5nIHdvdWxkIG90aGVyd2lzZSBoYXZlIGJpdCAyIGNsZWFy
Pwo+ID4gV2hvJ3MgZ3VhcmFudGVlaW5nIHRoYXQ/Cj4gPiAKPiA+IFRoaXMgaXMgYW4gYXdmdWxs
eSBiaWcgcGF0Y2ggdG8gdGhlIG1lbW9yeSBtYW5hZ2VtZW50IGNvZGUsIGJ1cmllZCBpbgo+ID4g
dGhlIG1pZGRsZSBvZiBhIGdpZ2FudGljIHNlcmllcyB3aGljaCBhbG1vc3QgZ3VhcmFudGVlcyBu
b2JvZHkgd291bGQKPiA+IGxvb2sgYXQgaXQuICBJIGNhbGwgc2hlbmFuaWdhbnMuCj4gPiAKPiA+
ID4gQEAgLTEwMjEsNyArMTAyMiw3IEBAIHZvaWQgcGFnZV9tb3ZlX2Fub25fcm1hcChzdHJ1Y3Qg
cGFnZSAqcGFnZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiA+ICAgKiBfX3BhZ2Vf
c2V0X2Fub25fcm1hcCAtIHNldCB1cCBuZXcgYW5vbnltb3VzIHJtYXAKPiA+ID4gICAqIEBwYWdl
OglQYWdlIG9yIEh1Z2VwYWdlIHRvIGFkZCB0byBybWFwCj4gPiA+ICAgKiBAdm1hOglWTSBhcmVh
IHRvIGFkZCBwYWdlIHRvLgo+ID4gPiAtICogQGFkZHJlc3M6CVVzZXIgdmlydHVhbCBhZGRyZXNz
IG9mIHRoZSBtYXBwaW5nCQo+ID4gPiArICogQGFkZHJlc3M6CVVzZXIgdmlydHVhbCBhZGRyZXNz
IG9mIHRoZSBtYXBwaW5nCj4gPiAKPiA+IEFuZCBtaXhpbmcgaW4gZmx1ZmYgY2hhbmdlcyBsaWtl
IHRoaXMgaXMgYSByZWFsIG5vLW5vLiAgVHJ5IGFnYWluLgo+ID4gCj4gCj4gTm8gYmFkIGludGVu
dGlvbnMsIGp1c3Qgb3ZlcnplYWxvdXMuCj4gSSBkaWRuJ3Qgd2FudCB0byBoaWRlIGFueXRoaW5n
IGZyb20gb3VyIHBhdGNoZXMuCj4gT25jZSB3ZSBhZHZhbmNlIHdpdGggdGhlIGludHJvc3BlY3Rp
b24gcGF0Y2hlcyByZWxhdGVkIHRvIEtWTSB3ZSdsbCBiZQo+IGJhY2sgd2l0aCB0aGUgcmVtb3Rl
IG1hcHBpbmcgcGF0Y2gsIHNwbGl0IGFuZCBjbGVhbmVkLgoKVGhleSBhcmUgbm90IGJpdCBsZWZ0
IGluIHN0cnVjdCBwYWdlICEgTG9va2luZyBhdCB0aGUgcGF0Y2ggaXQgc2VlbXMKeW91IHdhbnQg
dG8gaGF2ZSB5b3VyIG93biBwaW4gY291bnQganVzdCBmb3IgS1ZNLiBUaGlzIGlzIGJhZCwgd2Ug
YXJlCmFscmVhZHkgdHJ5aW5nIHRvIHNvbHZlIHRoZSBHVVAgdGhpbmcgKHNlZSBhbGwgdmFyaW91
cyBwYXRjaHNldCBhYm91dApHVVAgcG9zdGVkIHJlY2VudGx5KS4KCllvdSBuZWVkIHRvIHJldGhp
bmsgaG93IHlvdSB3YW50IHRvIGFjaGlldmUgdGhpcy4gV2h5IG5vdCBzaW1wbHkgYQpyZW1vdGUg
cmVhZCgpL3dyaXRlKCkgaW50byB0aGUgcHJvY2VzcyBtZW1vcnkgaWUgS1ZNSSB3b3VsZCBjYWxs
CmFuIGlvY3RsIHRoYXQgYWxsb3cgdG8gcmVhZCBvciB3cml0ZSBpbnRvIGEgcmVtb3RlIHByb2Nl
c3MgbWVtb3J5Cmxpa2UgcHRyYWNlKCkgYnV0IG9uIHN0ZXJvaWQgLi4uCgpBZGRpbmcgdGhpcyB3
aG9sZSBiaWcgY29tcGxleCBpbmZyYXN0cnVjdHVyZSB3aXRob3V0IGp1c3RpZmljYXRpb24Kb2Yg
d2h5IHdlIG5lZWQgdG8gYXZvaWQgcm91bmQgdHJpcCBpcyBqdXN0IHRvbyBtdWNoIHJlYWxseS4K
CkNoZWVycywKSsOpcsO0bWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
