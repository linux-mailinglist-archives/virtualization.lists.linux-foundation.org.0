Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0768F596
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 22:16:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A261A11F7;
	Thu, 15 Aug 2019 20:16:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A8E7811E7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:16:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 290FE8A6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:16:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5257BC057EC6;
	Thu, 15 Aug 2019 20:16:36 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ED628CF81;
	Thu, 15 Aug 2019 20:16:32 +0000 (UTC)
Date: Thu, 15 Aug 2019 16:16:30 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20190815201630.GA25517@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815191929.GA9253@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 20:16:36 +0000 (UTC)
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDM6MTk6MjlQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwMjowMTozNVBNICswMzAwLCBBZGFsYmVy
dCBMYXrEg3Igd3JvdGU6Cj4gPiBPbiBGcmksIDkgQXVnIDIwMTkgMDk6MjQ6NDQgLTA3MDAsIE1h
dHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gT24gRnJpLCBB
dWcgMDksIDIwMTkgYXQgMDc6MDA6MjZQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINyIHdyb3RlOgo+
ID4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oCj4gPiA+ID4gQEAgLTQxNyw4
ICs0MTcsMTAgQEAgUEFHRUZMQUcoSWRsZSwgaWRsZSwgUEZfQU5ZKQo+ID4gPiA+ICAgKi8KPiA+
ID4gPiAgI2RlZmluZSBQQUdFX01BUFBJTkdfQU5PTgkweDEKPiA+ID4gPiAgI2RlZmluZSBQQUdF
X01BUFBJTkdfTU9WQUJMRQkweDIKPiA+ID4gPiArI2RlZmluZSBQQUdFX01BUFBJTkdfUkVNT1RF
CTB4NAo+ID4gPiAKPiA+ID4gVWguICBIb3cgZG8geW91IGtub3cgcGFnZS0+bWFwcGluZyB3b3Vs
ZCBvdGhlcndpc2UgaGF2ZSBiaXQgMiBjbGVhcj8KPiA+ID4gV2hvJ3MgZ3VhcmFudGVlaW5nIHRo
YXQ/Cj4gPiA+IAo+ID4gPiBUaGlzIGlzIGFuIGF3ZnVsbHkgYmlnIHBhdGNoIHRvIHRoZSBtZW1v
cnkgbWFuYWdlbWVudCBjb2RlLCBidXJpZWQgaW4KPiA+ID4gdGhlIG1pZGRsZSBvZiBhIGdpZ2Fu
dGljIHNlcmllcyB3aGljaCBhbG1vc3QgZ3VhcmFudGVlcyBub2JvZHkgd291bGQKPiA+ID4gbG9v
ayBhdCBpdC4gIEkgY2FsbCBzaGVuYW5pZ2Fucy4KPiA+ID4gCj4gPiA+ID4gQEAgLTEwMjEsNyAr
MTAyMiw3IEBAIHZvaWQgcGFnZV9tb3ZlX2Fub25fcm1hcChzdHJ1Y3QgcGFnZSAqcGFnZSwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiA+ID4gICAqIF9fcGFnZV9zZXRfYW5vbl9ybWFw
IC0gc2V0IHVwIG5ldyBhbm9ueW1vdXMgcm1hcAo+ID4gPiA+ICAgKiBAcGFnZToJUGFnZSBvciBI
dWdlcGFnZSB0byBhZGQgdG8gcm1hcAo+ID4gPiA+ICAgKiBAdm1hOglWTSBhcmVhIHRvIGFkZCBw
YWdlIHRvLgo+ID4gPiA+IC0gKiBAYWRkcmVzczoJVXNlciB2aXJ0dWFsIGFkZHJlc3Mgb2YgdGhl
IG1hcHBpbmcJCj4gPiA+ID4gKyAqIEBhZGRyZXNzOglVc2VyIHZpcnR1YWwgYWRkcmVzcyBvZiB0
aGUgbWFwcGluZwo+ID4gPiAKPiA+ID4gQW5kIG1peGluZyBpbiBmbHVmZiBjaGFuZ2VzIGxpa2Ug
dGhpcyBpcyBhIHJlYWwgbm8tbm8uICBUcnkgYWdhaW4uCj4gPiA+IAo+ID4gCj4gPiBObyBiYWQg
aW50ZW50aW9ucywganVzdCBvdmVyemVhbG91cy4KPiA+IEkgZGlkbid0IHdhbnQgdG8gaGlkZSBh
bnl0aGluZyBmcm9tIG91ciBwYXRjaGVzLgo+ID4gT25jZSB3ZSBhZHZhbmNlIHdpdGggdGhlIGlu
dHJvc3BlY3Rpb24gcGF0Y2hlcyByZWxhdGVkIHRvIEtWTSB3ZSdsbCBiZQo+ID4gYmFjayB3aXRo
IHRoZSByZW1vdGUgbWFwcGluZyBwYXRjaCwgc3BsaXQgYW5kIGNsZWFuZWQuCj4gCj4gVGhleSBh
cmUgbm90IGJpdCBsZWZ0IGluIHN0cnVjdCBwYWdlICEgTG9va2luZyBhdCB0aGUgcGF0Y2ggaXQg
c2VlbXMKPiB5b3Ugd2FudCB0byBoYXZlIHlvdXIgb3duIHBpbiBjb3VudCBqdXN0IGZvciBLVk0u
IFRoaXMgaXMgYmFkLCB3ZSBhcmUKPiBhbHJlYWR5IHRyeWluZyB0byBzb2x2ZSB0aGUgR1VQIHRo
aW5nIChzZWUgYWxsIHZhcmlvdXMgcGF0Y2hzZXQgYWJvdXQKPiBHVVAgcG9zdGVkIHJlY2VudGx5
KS4KPiAKPiBZb3UgbmVlZCB0byByZXRoaW5rIGhvdyB5b3Ugd2FudCB0byBhY2hpZXZlIHRoaXMu
IFdoeSBub3Qgc2ltcGx5IGEKPiByZW1vdGUgcmVhZCgpL3dyaXRlKCkgaW50byB0aGUgcHJvY2Vz
cyBtZW1vcnkgaWUgS1ZNSSB3b3VsZCBjYWxsCj4gYW4gaW9jdGwgdGhhdCBhbGxvdyB0byByZWFk
IG9yIHdyaXRlIGludG8gYSByZW1vdGUgcHJvY2VzcyBtZW1vcnkKPiBsaWtlIHB0cmFjZSgpIGJ1
dCBvbiBzdGVyb2lkIC4uLgo+IAo+IEFkZGluZyB0aGlzIHdob2xlIGJpZyBjb21wbGV4IGluZnJh
c3RydWN0dXJlIHdpdGhvdXQganVzdGlmaWNhdGlvbgo+IG9mIHdoeSB3ZSBuZWVkIHRvIGF2b2lk
IHJvdW5kIHRyaXAgaXMganVzdCB0b28gbXVjaCByZWFsbHkuCgpUaGlua2luZyBhIGJpdCBtb3Jl
IGFib3V0IHRoaXMsIHlvdSBjYW4gYWNoaWV2ZSB0aGUgc2FtZSB0aGluZyB3aXRob3V0CmFkZGlu
ZyBhIHNpbmdsZSBsaW5lIHRvIGFueSBtbSBjb2RlLiBJbnN0ZWFkIG9mIGhhdmluZyBtbWFwIHdp
dGgKUFJPVF9OT05FIHwgTUFQX0xPQ0tFRCB5b3UgaGF2ZSB1c2Vyc3BhY2UgbW1hcCBzb21lIGt2
bSBkZXZpY2UgZmlsZQooaSBhbSBhc3N1bWluZyB0aGlzIGlzIHNvbWV0aGluZyB5b3UgYWxyZWFk
eSBoYXZlIGFuZCBjYW4gY29udHJvbAp0aGUgbW1hcCBjYWxsYmFjaykuCgpTbyBub3cga2VybmVs
IHNpZGUgeW91IGhhdmUgYSB2bWEgd2l0aCBhIHZtX29wZXJhdGlvbnNfc3RydWN0IHVuZGVyCnlv
dXIgY29udHJvbCB0aGlzIG1lYW5zIHRoYXQgZXZlcnl0aGluZyB5b3Ugd2FudCB0byBibG9jayBt
bSB3aXNlCmZyb20gd2l0aGluIHRoZSBpbnNwZWN0b3IgcHJvY2VzcyBjYW4gYmUgYmxvY2sgdGhy
b3VnaCB0aG9zZSBjYWxsLQpiYWNrcyAoZmluZF9zcGVjaWFsX3BhZ2UoKSBzcGVjaWZpY2FseSBm
b3Igd2hpY2ggeW91IGhhdmUgdG8gcmV0dXJuCk5VTEwgYWxsIHRoZSB0aW1lKS4KClRvIG1pcnJv
ciB0YXJnZXQgcHJvY2VzcyBtZW1vcnkgeW91IGNhbiB1c2UgaG1tX21pcnJvciwgd2hlbiB5b3UK
cG9wdWxhdGUgdGhlIGluc3BlY3RvciBwcm9jZXNzIHBhZ2UgdGFibGUgeW91IHVzZSBpbnNlcnRf
cGZuKCkKKG1tYXAgb2YgdGhlIGt2bSBkZXZpY2UgZmlsZSBtdXN0IG1hcmsgdGhpcyB2bWEgYXMg
UEZOTUFQKS4KCkJ5IGZvbGxvd2luZyB0aGUgaG1tX21pcnJvciBBUEksIGFueXRpbWUgdGhlIHRh
cmdldCBwcm9jZXNzIGhhcwphIGNoYW5nZSBpbiBpdHMgcGFnZSB0YWJsZSAoaWUgdmlydHVhbCBh
ZGRyZXNzIC0+IHBhZ2UpIHlvdSB3aWxsCmdldCBhIGNhbGxiYWNrIGFuZCBhbGwgeW91IGhhdmUg
dG8gZG8gaXMgY2xlYXIgdGhlIHBhZ2UgdGFibGUKd2l0aGluIHRoZSBpbnNwZWN0b3IgcHJvY2Vz
cyBhbmQgZmx1c2ggdGxiICh1c2UgemFwX3BhZ2VfcmFuZ2UpLgoKT24gcGFnZSBmYXVsdCB3aXRo
aW4gdGhlIGluc3BlY3RvciBwcm9jZXNzIHRoZSBmYXVsdCBjYWxsYmFjayBvZgp2bV9vcHMgd2ls
bCBnZXQgY2FsbCBhbmQgZnJvbSB0aGVyZSB5b3UgY2FsbCBobW1fbWlycm9yIGZvbGxvd2luZwpp
dHMgQVBJLgoKT2ggYWxzbyBtYXJrIHRoZSB2bWEgd2l0aCBWTV9XSVBFT05GT1JLIHRvIGF2b2lk
IGFueSBpc3N1ZSBpZiB0aGUKaW5zcGVjdG9yIHByb2Nlc3MgdXNlIGZvcmsoKSAoeW91IGNvdWxk
IHN1cHBvcnQgZm9yayBidXQgdGhlbiB5b3UKd291bGQgbmVlZCB0byBtYXJrIHRoZSB2bWEgYXMg
U0hBUkVEIGFuZCB1c2UgdW5tYXBfbWFwcGluZ19wYWdlcwppbnN0ZWFkIG9mIHphcF9wYWdlX3Jh
bmdlKS4KCgpUaGVyZSBldmVyeXRoaW5nIHlvdSB3YW50IHRvIGRvIHdpdGggYWxyZWFkeSB1cHN0
cmVhbSBtbSBjb2RlLgoKQ2hlZXJzLApKw6lyw7RtZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
