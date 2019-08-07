Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152984E20
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 16:02:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F880E0E;
	Wed,  7 Aug 2019 14:02:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEC48D9E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 14:02:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A782D7D2
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 14:02:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16CE351F0B;
	Wed,  7 Aug 2019 14:02:16 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A825B608AB;
	Wed,  7 Aug 2019 14:02:13 +0000 (UTC)
Subject: Re: [PATCH V4 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190807070617.23716-1-jasowang@redhat.com>
	<20190807070617.23716-8-jasowang@redhat.com>
	<20190807120738.GB1557@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ba5f375f-435a-91fd-7fca-bfab0915594b@redhat.com>
Date: Wed, 7 Aug 2019 22:02:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807120738.GB1557@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 07 Aug 2019 14:02:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC83IOS4i+WNiDg6MDcsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQs
IEF1ZyAwNywgMjAxOSBhdCAwMzowNjoxNUFNIC0wNDAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBX
ZSB1c2VkIHRvIHVzZSBSQ1UgdG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggd29ya2Vy
LiBUaGlzIGxlYWRzCj4+IGNhbGxpbmcgc3luY2hyb25pemVfcmN1KCkgaW4gaW52YWxpZGF0ZV9y
YW5nZV9zdGFydCgpLiBCdXQgb24gYSBidXN5Cj4+IHN5c3RlbSwgdGhlcmUgd291bGQgYmUgbWFu
eSBmYWN0b3JzIHRoYXQgbWF5IHNsb3cgZG93biB0aGUKPj4gc3luY2hyb25pemVfcmN1KCkgd2hp
Y2ggbWFrZXMgaXQgdW5zdWl0YWJsZSB0byBiZSBjYWxsZWQgaW4gTU1VCj4+IG5vdGlmaWVyLgo+
Pgo+PiBTbyB0aGlzIHBhdGNoIHN3aXRjaGVzIHVzZSBzZXFsb2NrIGNvdW50ZXIgdG8gdHJhY2sg
d2hldGhlciBvciBub3QgdGhlCj4+IG1hcCB3YXMgdXNlZC4gVGhlIGNvdW50ZXIgd2FzIGluY3Jl
YXNlZCB3aGVuIHZxIHRyeSB0byBzdGFydCBvciBmaW5pc2gKPj4gdXNlcyB0aGUgbWFwLiBUaGlz
IG1lYW5zLCB3aGVuIGl0IHdhcyBldmVuLCB3ZSdyZSBzdXJlIHRoZXJlJ3Mgbm8KPj4gcmVhZGVy
cyBhbmQgTU1VIG5vdGlmaWVyIGlzIHN5bmNocm9uaXplZC4gV2hlbiBpdCB3YXMgb2RkLCBpdCBt
ZWFucwo+PiB0aGVyZSdzIGEgcmVhZGVyIHdlIG5lZWQgdG8gd2FpdCBpdCB0byBiZSBldmVuIGFn
YWluIHRoZW4gd2UgYXJlCj4+IHN5bmNocm9uaXplZC4gQ29uc2lkZXIgdGhlIHJlYWQgY3JpdGlj
YWwgc2VjdGlvbiBpcyBwcmV0dHkgc21hbGwgdGhlCj4+IHN5bmNocm9uaXphdGlvbiBzaG91bGQg
YmUgZG9uZSB2ZXJ5IGZhc3QuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4g
PG1zdEByZWRoYXQuY29tPgo+PiBGaXhlczogN2Y0NjYwMzJkYzllICgidmhvc3Q6IGFjY2VzcyB2
cSBtZXRhZGF0YSB0aHJvdWdoIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAgIGRyaXZlcnMvdmhvc3Qv
dmhvc3QuYyB8IDE0MSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
Pj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgIDcgKystCj4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA5MCBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiBpbmRleCBjZmMx
MWY5ZWQ5YzkuLjU3YmZiYjYwZDk2MCAxMDA2NDQKPj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9z
dC5jCj4+IEBAIC0zMjQsMTcgKzMyNCwxNiBAQCBzdGF0aWMgdm9pZCB2aG9zdF91bmluaXRfdnFf
bWFwcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPj4gICAKPj4gICAJc3Bpbl9sb2NrKCZ2
cS0+bW11X2xvY2spOwo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgVkhPU1RfTlVNX0FERFJTOyBpKysp
IHsKPj4gLQkJbWFwW2ldID0gcmN1X2RlcmVmZXJlbmNlX3Byb3RlY3RlZCh2cS0+bWFwc1tpXSwK
Pj4gLQkJCQkgIGxvY2tkZXBfaXNfaGVsZCgmdnEtPm1tdV9sb2NrKSk7Cj4+ICsJCW1hcFtpXSA9
IHZxLT5tYXBzW2ldOwo+PiAgIAkJaWYgKG1hcFtpXSkgewo+PiAgIAkJCXZob3N0X3NldF9tYXBf
ZGlydHkodnEsIG1hcFtpXSwgaSk7Cj4+IC0JCQlyY3VfYXNzaWduX3BvaW50ZXIodnEtPm1hcHNb
aV0sIE5VTEwpOwo+PiArCQkJdnEtPm1hcHNbaV0gPSBOVUxMOwo+PiAgIAkJfQo+PiAgIAl9Cj4+
ICAgCXNwaW5fdW5sb2NrKCZ2cS0+bW11X2xvY2spOwo+PiAgIAo+PiAtCS8qIE5vIG5lZWQgZm9y
IHN5bmNocm9uaXplX3JjdSgpIG9yIGtmcmVlX3JjdSgpIHNpbmNlIHdlIGFyZQo+PiAtCSAqIHNl
cmlhbGl6ZWQgd2l0aCBtZW1vcnkgYWNjZXNzb3JzIChlLmcgdnEgbXV0ZXggaGVsZCkuCj4+ICsJ
LyogTm8gbmVlZCBmb3Igc3luY2hyb25pemF0aW9uIHNpbmNlIHdlIGFyZSBzZXJpYWxpemVkIHdp
dGgKPj4gKwkgKiBtZW1vcnkgYWNjZXNzb3JzIChlLmcgdnEgbXV0ZXggaGVsZCkuCj4+ICAgCSAq
Lwo+PiAgIAo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgVkhPU1RfTlVNX0FERFJTOyBpKyspCj4+IEBA
IC0zNjIsNiArMzYxLDQwIEBAIHN0YXRpYyBib29sIHZob3N0X21hcF9yYW5nZV9vdmVybGFwKHN0
cnVjdCB2aG9zdF91YWRkciAqdWFkZHIsCj4+ICAgCXJldHVybiAhKGVuZCA8IHVhZGRyLT51YWRk
ciB8fCBzdGFydCA+IHVhZGRyLT51YWRkciAtIDEgKyB1YWRkci0+c2l6ZSk7Cj4+ICAgfQo+PiAg
IAo+PiArc3RhdGljIHZvaWQgaW5saW5lIHZob3N0X3ZxX2FjY2Vzc19tYXBfYmVnaW4oc3RydWN0
IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4+ICt7Cj4+ICsJd3JpdGVfc2VxY291bnRfYmVnaW4oJnZx
LT5zZXEpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBpbmxpbmUgdmhvc3RfdnFfYWNjZXNz
X21hcF9lbmQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4+ICt7Cj4+ICsJd3JpdGVfc2Vx
Y291bnRfZW5kKCZ2cS0+c2VxKTsKPj4gK30KPiBUaGUgd3JpdGUgc2lkZSBvZiBhIHNlcWxvY2sg
b25seSBwcm92aWRlcyB3cml0ZSBiYXJyaWVycy4gQWNjZXNzIHRvCj4KPiAJbWFwID0gdnEtPm1h
cHNbVkhPU1RfQUREUl9VU0VEXTsKPgo+IFN0aWxsIG5lZWRzIGEgcmVhZCBzaWRlIGJhcnJpZXIs
IGFuZCB0aGVuIEkgdGhpbmsgdGhpcyB3aWxsIGJlIG5vCj4gYmV0dGVyIHRoYW4gYSBub3JtYWwg
c3BpbmxvY2suCj4KPiBJdCBhbHNvIGRvZXNuJ3Qgc2VlbSBsaWtlIHRoaXMgYWxnb3JpdGhtIGV2
ZW4gbmVlZHMgYSBzZXFsb2NrLCBhcyB0aGlzCj4gaXMganVzdCBhIG9uZSBiaXQgZmxhZwoKClJp
Z2h0LCBzbyB0aGVuIEkgdGVuZCB0byB1c2Ugc3BpbmxvY2sgZmlyc3QgZm9yIGNvcnJlY3RuZXNz
LgoKCj4KPiBhdG9taWNfc2V0X2JpdCh1c2luZyBtYXApCj4gc21wX21iX19hZnRlcl9hdG9taWMo
KQo+IC4uIG1hcHMgWy4uLl0KPiBhdG9taWNfY2xlYXJfYml0KHVzaW5nIG1hcCkKPgo+Cj4gbWFw
ID0gTlVMTDsKPiBzbXBfbWJfX2JlZm9yZV9hdG9taWMoKTsKPiB3aGlsZSAoYXRvbWljX3JlYWRf
Yml0KHVzaW5nIG1hcCkpCj4gICAgIHJlbGF4KCkKPgo+IEFnYWluLCBub3QgY2xlYXIgdGhpcyBj
b3VsZCBiZSBmYXN0ZXIgdGhhbiBhIHNwaW5sb2NrIHdoZW4gdGhlCj4gYmFycmllcnMgYXJlIGNv
cnJlY3QuLi4KCgpZZXMsIGZvciBuZXh0IHJlbGVhc2Ugd2UgbWF5IHdhbnQgdG8gdXNlIHRoZSBp
ZGVhIGZyb20gTWljaGFlbCBsaWtlIHRvIAptaXRpZ2F0ZSB0aGUgaW1wYWN0IG9mIG1iLgoKaHR0
cHM6Ly9sd24ubmV0L0FydGljbGVzLzc3NTg3MS8KClRoYW5rcwoKCj4KPiBKYXNvbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
