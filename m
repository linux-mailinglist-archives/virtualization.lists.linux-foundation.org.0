Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239B718FD
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 15:16:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F778CC4;
	Tue, 23 Jul 2019 13:16:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E5CC5CB7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:16:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95F46FE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:16:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F07623082AF2;
	Tue, 23 Jul 2019 13:16:25 +0000 (UTC)
Received: from [10.72.12.26] (ovpn-12-26.pek2.redhat.com [10.72.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E01A35D9C5;
	Tue, 23 Jul 2019 13:16:16 +0000 (UTC)
Subject: Re: [PATCH 6/6] vhost: don't do synchronize_rcu() in
	vhost_uninit_vq_maps()
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-7-jasowang@redhat.com>
	<20190723041144-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f2074bc7-6d67-14fa-4f58-91e9c5a9cc12@redhat.com>
Date: Tue, 23 Jul 2019 21:16:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723041144-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 23 Jul 2019 13:16:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNy8yMyDkuIvljYg1OjE2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NTc6MThBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhlcmUncyBubyBuZWVkIGZvciBSQ1Ugc3luY2hyb25pemF0aW9uIGluIHZob3N0X3VuaW5p
dF92cV9tYXBzKCkKPj4gc2luY2Ugd2UndmUgYWxyZWFkeSBzZXJpYWxpemVkIHdpdGggcmVhZGVy
cyAobWVtb3J5IGFjY2Vzc29ycykuIFRoaXMKPj4gYWxzbyBhdm9pZCB0aGUgcG9zc2libGUgdXNl
cnNwYWNlIERPUyB0aHJvdWdoIGlvY3RsKCkgYmVjYXVzZSBvZiB0aGUKPj4gcG9zc2libGUgaGln
aCBsYXRlbmN5IGNhdXNlZCBieSBzeW5jaHJvbml6ZV9yY3UoKS4KPj4KPj4gUmVwb3J0ZWQtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+IEZpeGVzOiA3ZjQ2NjAzMmRj
OWUgKCJ2aG9zdDogYWNjZXNzIHZxIG1ldGFkYXRhIHRocm91Z2gga2VybmVsIHZpcnR1YWwgYWRk
cmVzcyIpCj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
Cj4gSSBhZ3JlZSBzeW5jaHJvbml6ZV9yY3UgaW4gYm90aCBtbXUgbm90aWZpZXJzIGFuZCBpb2N0
bAo+IGlzIGEgcHJvYmxlbSB3ZSBtdXN0IGZpeC4KPgo+PiAtLS0KPj4gICBkcml2ZXJzL3Zob3N0
L3Zob3N0LmMgfCA0ICsrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9k
cml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gaW5kZXggNWI4ODIxZDAwZmU0Li5hMTdkZjFmNDA2OWEg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiArKysgYi9kcml2ZXJzL3Zo
b3N0L3Zob3N0LmMKPj4gQEAgLTMzNCw3ICszMzQsOSBAQCBzdGF0aWMgdm9pZCB2aG9zdF91bmlu
aXRfdnFfbWFwcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPj4gICAJfQo+PiAgIAlzcGlu
X3VubG9jaygmdnEtPm1tdV9sb2NrKTsKPj4gICAKPj4gLQlzeW5jaHJvbml6ZV9yY3UoKTsKPj4g
KwkvKiBObyBuZWVkIGZvciBzeW5jaHJvbml6ZV9yY3UoKSBvciBrZnJlZV9yY3UoKSBzaW5jZSB3
ZSBhcmUKPj4gKwkgKiBzZXJpYWxpemVkIHdpdGggbWVtb3J5IGFjY2Vzc29ycyAoZS5nIHZxIG11
dGV4IGhlbGQpLgo+PiArCSAqLwo+PiAgIAo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgVkhPU1RfTlVN
X0FERFJTOyBpKyspCj4+ICAgCQlpZiAobWFwW2ldKQo+PiAtLSAKPj4gMi4xOC4xCj4gLi4gaG93
ZXZlciB3ZSBjYW4gbm90IFJDVSB3aXRoIG5vIHN5bmNocm9uaXphdGlvbiBpbiBzaWdodC4KPiBT
b21ldGltZXMgdGhlcmUgYXJlIGhhY2tzIGxpa2UgdXNpbmcgYSBsb2NrL3VubG9jawo+IHBhaXIg
aW5zdGVhZCBvZiBzeW5jLCBidXQgaGVyZSBubyBvbmUgYm90aGVycy4KPgo+IHNwZWNpZmljYWxs
eSBub3RpZmllcnMgY2FsbCByZXNldCB2cSBtYXBzIHdoaWNoIGNhbGxzCj4gdW5pbml0IHZxIG1h
cHMgd2hpY2ggaXMgbm90IHVuZGVyIGFueSBsb2NrLgoKCk5vdGlmaWVyIGRpZCB0aGlzOgoKIMKg
wqDCoMKgwqDCoMKgIGlmIChtYXApIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAodWFkZHItPndyaXRlKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBtYXAtPm5wYWdlczsgaSsrKQpzZXRfcGFnZV9kaXJ0
eShtYXAtPnBhZ2VzW2ldKTsKfQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjdV9h
c3NpZ25fcG9pbnRlcih2cS0+bWFwc1tpbmRleF0sIE5VTEwpOwp9CnNwaW5fdW5sb2NrKCZ2cS0+
bW11X2xvY2spOwoKIMKgwqDCoMKgwqDCoMKgIGlmIChtYXApIHsKc3luY2hyb25pemVfcmN1KCk7
CnZob3N0X21hcF91bnByZWZldGNoKG1hcCk7CiDCoMKgwqDCoMKgwqDCoCB9CgpTbyBpdCBpbmRl
ZWQgaGF2ZSBhIHN5bmNocm9uaXplX3JjdSgpIHRoZXJlLgoKVGhhbmtzCgoKPgo+IFlvdSB3aWxs
IGdldCB1c2UgYWZ0ZXIgZnJlZSB3aGVuIG1hcCBpcyB0aGVuIGFjY2Vzc2VkLgo+Cj4gSWYgeW91
IGFsd2F5cyBoYXZlIGEgbG9jayB0aGVuIGp1c3QgdGFrZSB0aGF0IGxvY2sKPiBhbmQgbm8gbmVl
ZCBmb3IgUkNVLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
