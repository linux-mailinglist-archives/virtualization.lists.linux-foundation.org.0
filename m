Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E7D4E05
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 09:39:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CB6FA1E07;
	Sat, 12 Oct 2019 07:39:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E52441DB9
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 07:28:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D343D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 07:28:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC66F307D853;
	Sat, 12 Oct 2019 07:28:55 +0000 (UTC)
Received: from [10.72.12.150] (ovpn-12-150.pek2.redhat.com [10.72.12.150])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B516E10013D9;
	Sat, 12 Oct 2019 07:28:51 +0000 (UTC)
Subject: Re: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20191011134358.16912-1-mst@redhat.com>
	<20191011134358.16912-2-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
Date: Sat, 12 Oct 2019 15:28:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011134358.16912-2-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 12 Oct 2019 07:28:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMTkvMTAvMTEg5LiL5Y2IOTo0NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IFRo
ZSBpZGVhIGlzIHRvIHN1cHBvcnQgbXVsdGlwbGUgcmluZyBmb3JtYXRzIGJ5IGNvbnZlcnRpbmcK
PiB0byBhIGZvcm1hdC1pbmRlcGVuZGVudCBhcnJheSBvZiBkZXNjcmlwdG9ycy4KPgo+IFRoaXMg
Y29zdHMgZXh0cmEgY3ljbGVzLCBidXQgd2UgZ2FpbiBpbiBhYmlsaXR5Cj4gdG8gZmV0Y2ggYSBi
YXRjaCBvZiBkZXNjcmlwdG9ycyBpbiBvbmUgZ28sIHdoaWNoCj4gaXMgZ29vZCBmb3IgY29kZSBj
YWNoZSBsb2NhbGl0eS4KPgo+IFRvIHNpbXBsaWZ5IGJlbmNobWFya2luZywgSSBrZXB0IHRoZSBv
bGQgY29kZQo+IGFyb3VuZCBzbyBvbmUgY2FuIHN3aXRjaCBiYWNrIGFuZCBmb3J0aCBieQo+IHdy
aXRpbmcgaW50byBhIG1vZHVsZSBwYXJhbWV0ZXIuCj4gVGhpcyB3aWxsIGdvIGF3YXkgaW4gdGhl
IGZpbmFsIHN1Ym1pc3Npb24uCj4KPiBUaGlzIHBhdGNoIGNhdXNlcyBhIG1pbm9yIHBlcmZvcm1h
bmNlIGRlZ3JhZGF0aW9uLAo+IGl0J3MgYmVlbiBrZXB0IGFzIHNpbXBsZSBhcyBwb3NzaWJsZSBm
b3IgZWFzZSBvZiByZXZpZXcuCj4gTmV4dCBwYXRjaCBnZXRzIHVzIGJhY2sgdGhlIHBlcmZvcm1h
bmNlIGJ5IGFkZGluZyBiYXRjaGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNp
cmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAgfCAg
MTcgKystCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyOTkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgMTYg
KysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMyNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIvZHJpdmVycy92aG9zdC90
ZXN0LmMKPiBpbmRleCAwNTYzMDgwMDgyODguLjM5YTAxOGE3YWYyZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3Rlc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4gQEAgLTE4
LDYgKzE4LDkgQEAKPiAgICNpbmNsdWRlICJ0ZXN0LmgiCj4gICAjaW5jbHVkZSAidmhvc3QuaCIK
PiAgIAo+ICtzdGF0aWMgaW50IG5ld2NvZGUgPSAwOwo+ICttb2R1bGVfcGFyYW0obmV3Y29kZSwg
aW50LCAwNjQ0KTsKPiArCj4gICAvKiBNYXggbnVtYmVyIG9mIGJ5dGVzIHRyYW5zZmVycmVkIGJl
Zm9yZSByZXF1ZXVlaW5nIHRoZSBqb2IuCj4gICAgKiBVc2luZyB0aGlzIGxpbWl0IHByZXZlbnRz
IG9uZSB2aXJ0cXVldWUgZnJvbSBzdGFydmluZyBvdGhlcnMuICovCj4gICAjZGVmaW5lIFZIT1NU
X1RFU1RfV0VJR0hUIDB4ODAwMDAKPiBAQCAtNTgsMTAgKzYxLDE2IEBAIHN0YXRpYyB2b2lkIGhh
bmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPiAgIAl2aG9zdF9kaXNhYmxlX25vdGlmeSgm
bi0+ZGV2LCB2cSk7Cj4gICAKPiAgIAlmb3IgKDs7KSB7Cj4gLQkJaGVhZCA9IHZob3N0X2dldF92
cV9kZXNjKHZxLCB2cS0+aW92LAo+IC0JCQkJCSBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+IC0JCQkJ
CSAmb3V0LCAmaW4sCj4gLQkJCQkJIE5VTEwsIE5VTEwpOwo+ICsJCWlmIChuZXdjb2RlKQo+ICsJ
CQloZWFkID0gdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2godnEsIHZxLT5pb3YsCj4gKwkJCQkJCSAg
ICAgICBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+ICsJCQkJCQkgICAgICAgJm91dCwgJmluLAo+ICsJ
CQkJCQkgICAgICAgTlVMTCwgTlVMTCk7Cj4gKwkJZWxzZQo+ICsJCQloZWFkID0gdmhvc3RfZ2V0
X3ZxX2Rlc2ModnEsIHZxLT5pb3YsCj4gKwkJCQkJCSBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+ICsJ
CQkJCQkgJm91dCwgJmluLAo+ICsJCQkJCQkgTlVMTCwgTlVMTCk7Cj4gICAJCS8qIE9uIGVycm9y
LCBzdG9wIGhhbmRsaW5nIHVudGlsIHRoZSBuZXh0IGtpY2suICovCj4gICAJCWlmICh1bmxpa2Vs
eShoZWFkIDwgMCkpCj4gICAJCQlicmVhazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92
aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggMzZjYTJjZjQxOWJmLi4zNjY2
MWQ2Y2I1MWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gKysrIGIvZHJp
dmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTMwMSw2ICszMDEsNyBAQCBzdGF0aWMgdm9pZCB2aG9z
dF92cV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gICAJCQkgICBzdHJ1Y3Qgdmhvc3Rf
dmlydHF1ZXVlICp2cSkKPiAgIHsKPiAgIAl2cS0+bnVtID0gMTsKPiArCXZxLT5uZGVzY3MgPSAw
Owo+ICAgCXZxLT5kZXNjID0gTlVMTDsKPiAgIAl2cS0+YXZhaWwgPSBOVUxMOwo+ICAgCXZxLT51
c2VkID0gTlVMTDsKPiBAQCAtMzY5LDYgKzM3MCw5IEBAIHN0YXRpYyBpbnQgdmhvc3Rfd29ya2Vy
KHZvaWQgKmRhdGEpCj4gICAKPiAgIHN0YXRpYyB2b2lkIHZob3N0X3ZxX2ZyZWVfaW92ZWNzKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICAgewo+ICsJa2ZyZWUodnEtPmRlc2NzKTsKPiAr
CXZxLT5kZXNjcyA9IE5VTEw7Cj4gKwl2cS0+bWF4X2Rlc2NzID0gMDsKPiAgIAlrZnJlZSh2cS0+
aW5kaXJlY3QpOwo+ICAgCXZxLT5pbmRpcmVjdCA9IE5VTEw7Cj4gICAJa2ZyZWUodnEtPmxvZyk7
Cj4gQEAgLTM4NSw2ICszODksMTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVj
cyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgZGV2LT5u
dnFzOyArK2kpIHsKPiAgIAkJdnEgPSBkZXYtPnZxc1tpXTsKPiArCQl2cS0+bWF4X2Rlc2NzID0g
ZGV2LT5pb3ZfbGltaXQ7Cj4gKwkJdnEtPmRlc2NzID0ga21hbGxvY19hcnJheSh2cS0+bWF4X2Rl
c2NzLAo+ICsJCQkJCSAgc2l6ZW9mKCp2cS0+ZGVzY3MpLAo+ICsJCQkJCSAgR0ZQX0tFUk5FTCk7
CgoKSXMgaW92X2xpbWl0IHRvbyBtdWNoIGhlcmU/IEl0IGNhbiBvYnZpb3VzbHkgaW5jcmVhc2Ug
dGhlIGZvb3RwcmludC4gSSAKZ3Vlc3MgdGhlIGJhdGNoaW5nIGNhbiBvbmx5IGJlIGRvbmUgZm9y
IGRlc2NyaXB0b3Igd2l0aG91dCBpbmRpcmVjdCBvciAKbmV4dCBzZXQuIFRoZW4gd2UgbWF5IGJh
dGNoIDE2IG9yIDY0LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
