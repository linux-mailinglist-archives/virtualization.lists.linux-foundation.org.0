Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18771934
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 15:30:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B7D2B88;
	Tue, 23 Jul 2019 13:30:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7CBCFC74
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:30:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 63135FE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:30:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBE8881F10;
	Tue, 23 Jul 2019 13:30:04 +0000 (UTC)
Received: from [10.72.12.26] (ovpn-12-26.pek2.redhat.com [10.72.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 521E019C58;
	Tue, 23 Jul 2019 13:29:59 +0000 (UTC)
Subject: Re: [PATCH 2/6] vhost: validate MMU notifier registration
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-3-jasowang@redhat.com>
	<20190723042428-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <682a0a87-4fb5-1b85-fe8d-736115f6ab2b@redhat.com>
Date: Tue, 23 Jul 2019 21:30:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723042428-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 Jul 2019 13:30:04 +0000 (UTC)
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

Ck9uIDIwMTkvNy8yMyDkuIvljYg1OjE3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NTc6MTRBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhlIHJldHVybiB2YWx1ZSBvZiBtbXVfbm90aWZpZXJfcmVnaXN0ZXIoKSBpcyBub3QgY2hl
Y2tlZCBpbgo+PiB2aG9zdF92cmluZ19zZXRfbnVtX2FkZHIoKS4gVGhpcyB3aWxsIGNhdXNlIGFu
IG91dCBvZiBzeW5jIGJldHdlZW4gbW0KPj4gYW5kIE1NVSBub3RpZmllciB0aHVzIGEgZG91Ymxl
IGZyZWUuIFRvIHNvbHZlIHRoaXMsIGludHJvZHVjZSBhCj4+IGJvb2xlYW4gZmxhZyB0byB0cmFj
ayB3aGV0aGVyIE1NVSBub3RpZmllciBpcyByZWdpc3RlcmVkIGFuZCBvbmx5IGRvCj4+IHVucmVn
aXN0ZXJpbmcgd2hlbiBpdCB3YXMgdHJ1ZS4KPj4KPj4gUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieToK
Pj4gc3l6Ym90K2U1ODExMmQ3MWY3NzExM2RkYjdiQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20K
Pj4gRml4ZXM6IDdmNDY2MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3Vn
aCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIikKPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBSaWdodC4gVGhpcyBmaXhlcyB0aGUgYnVnLgo+IEJ1dCBp
dCdzIG5vdCBncmVhdCB0aGF0IHNpbXBsZSB0aGluZ3MgbGlrZQo+IHNldHRpbmcgdnEgYWRkcmVz
cyBwdXQgcHJlc3N1cmUgb24gbWVtb3J5IGFsbG9jYXRvci4KPiBBbHNvLCBpZiB3ZSBnZXQgYSBz
aW5nbGUgZHVyaW5nIHByb2Nlc3NpbmcKPiBub3RpZmllciByZWdpc3RlciB3aWxsIGZhaWwsIGRp
c2FibGluZyBvcHRpbWl6YXRpb24gcGVybWFuZW50bHkuCgoKWWVzLCBidXQgZG8gd2UgcmVhbGx5
IGNhcmUgYWJvdXQgdGhpcyBjYXNlLiBFLmcgd2UgZXZlbiBmYWlsIGZvciAtRU5PTUVNIApmb3Ig
c2V0IG93bmVyLgoKCj4KPiBJbiBmYWN0LCBzZWUgYmVsb3c6Cj4KPgo+PiAtLS0KPj4gICBkcml2
ZXJzL3Zob3N0L3Zob3N0LmMgfCAxOSArKysrKysrKysrKysrKystLS0tCj4+ICAgZHJpdmVycy92
aG9zdC92aG9zdC5oIHwgIDEgKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
YyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiBpbmRleCAzNGMwZDk3MGJjYmMuLjA1ODE5MWQ1
ZWZhZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4+ICsrKyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+PiBAQCAtNjMwLDYgKzYzMCw3IEBAIHZvaWQgdmhvc3RfZGV2X2lu
aXQoc3RydWN0IHZob3N0X2RldiAqZGV2LAo+PiAgIAlkZXYtPmlvdl9saW1pdCA9IGlvdl9saW1p
dDsKPj4gICAJZGV2LT53ZWlnaHQgPSB3ZWlnaHQ7Cj4+ICAgCWRldi0+Ynl0ZV93ZWlnaHQgPSBi
eXRlX3dlaWdodDsKPj4gKwlkZXYtPmhhc19ub3RpZmllciA9IGZhbHNlOwo+PiAgIAlpbml0X2xs
aXN0X2hlYWQoJmRldi0+d29ya19saXN0KTsKPj4gICAJaW5pdF93YWl0cXVldWVfaGVhZCgmZGV2
LT53YWl0KTsKPj4gICAJSU5JVF9MSVNUX0hFQUQoJmRldi0+cmVhZF9saXN0KTsKPj4gQEAgLTcz
MSw2ICs3MzIsNyBAQCBsb25nIHZob3N0X2Rldl9zZXRfb3duZXIoc3RydWN0IHZob3N0X2RldiAq
ZGV2KQo+PiAgIAlpZiAoZXJyKQo+PiAgIAkJZ290byBlcnJfbW11X25vdGlmaWVyOwo+PiAgICNl
bmRpZgo+PiArCWRldi0+aGFzX25vdGlmaWVyID0gdHJ1ZTsKPj4gICAKPj4gICAJcmV0dXJuIDA7
Cj4+ICAgCj4gSSBqdXN0IG5vdGljZWQgdGhhdCBzZXQgb3duZXIgbm93IGZhaWxzIGlmIHdlIGdl
dCBhIHNpZ25hbC4KPiBVc2Vyc3BhY2UgY291bGQgcmV0cnkgaW4gdGhlb3J5IGJ1dCBpdCBkb2Vz
IG5vdDoKPiB0aGlzIGlzIHVzZXJzcGFjZSBhYmkgYnJlYWthZ2Ugc2luY2UgaXQgdXNlZCB0byBv
bmx5Cj4gZmFpbCBvbiBpbnZhbGlkIGlucHV0LgoKCldlbGwsIGF0IGxlYXN0IGt0aHJlYWRfY3Jl
YXRlKCkgYW5kIHZob3N0X2Rldl9hbGxvY19pb3ZlY3MoKSB3aWxsIAphbGxvY2F0ZSBtZW1vcnku
CgpUaGFua3MKCgo+Cj4+IEBAIC05NjAsNyArOTYyLDExIEBAIHZvaWQgdmhvc3RfZGV2X2NsZWFu
dXAoc3RydWN0IHZob3N0X2RldiAqZGV2KQo+PiAgIAl9Cj4+ICAgCWlmIChkZXYtPm1tKSB7Cj4+
ICAgI2lmIFZIT1NUX0FSQ0hfQ0FOX0FDQ0VMX1VBQ0NFU1MKPj4gLQkJbW11X25vdGlmaWVyX3Vu
cmVnaXN0ZXIoJmRldi0+bW11X25vdGlmaWVyLCBkZXYtPm1tKTsKPj4gKwkJaWYgKGRldi0+aGFz
X25vdGlmaWVyKSB7Cj4+ICsJCQltbXVfbm90aWZpZXJfdW5yZWdpc3RlcigmZGV2LT5tbXVfbm90
aWZpZXIsCj4+ICsJCQkJCQlkZXYtPm1tKTsKPj4gKwkJCWRldi0+aGFzX25vdGlmaWVyID0gZmFs
c2U7Cj4+ICsJCX0KPj4gICAjZW5kaWYKPj4gICAJCW1tcHV0KGRldi0+bW0pOwo+PiAgIAl9Cj4+
IEBAIC0yMDY1LDggKzIwNzEsMTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfdnJpbmdfc2V0X251bV9h
ZGRyKHN0cnVjdCB2aG9zdF9kZXYgKmQsCj4+ICAgCS8qIFVucmVnaXN0ZXIgTU1VIG5vdGlmZXIg
dG8gYWxsb3cgaW52YWxpZGF0aW9uIGNhbGxiYWNrCj4+ICAgCSAqIGNhbiBhY2Nlc3MgdnEtPnVh
ZGRyc1tdIHdpdGhvdXQgaG9sZGluZyBhIGxvY2suCj4+ICAgCSAqLwo+PiAtCWlmIChkLT5tbSkK
Pj4gKwlpZiAoZC0+aGFzX25vdGlmaWVyKSB7Cj4+ICAgCQltbXVfbm90aWZpZXJfdW5yZWdpc3Rl
cigmZC0+bW11X25vdGlmaWVyLCBkLT5tbSk7Cj4+ICsJCWQtPmhhc19ub3RpZmllciA9IGZhbHNl
Owo+PiArCX0KPj4gICAKPj4gICAJdmhvc3RfdW5pbml0X3ZxX21hcHModnEpOwo+PiAgICNlbmRp
Zgo+PiBAQCAtMjA4Niw4ICsyMDk0LDExIEBAIHN0YXRpYyBsb25nIHZob3N0X3ZyaW5nX3NldF9u
dW1fYWRkcihzdHJ1Y3Qgdmhvc3RfZGV2ICpkLAo+PiAgIAlpZiAociA9PSAwKQo+PiAgIAkJdmhv
c3Rfc2V0dXBfdnFfdWFkZHIodnEpOwo+PiAgIAo+PiAtCWlmIChkLT5tbSkKPj4gLQkJbW11X25v
dGlmaWVyX3JlZ2lzdGVyKCZkLT5tbXVfbm90aWZpZXIsIGQtPm1tKTsKPj4gKwlpZiAoZC0+bW0p
IHsKPj4gKwkJciA9IG1tdV9ub3RpZmllcl9yZWdpc3RlcigmZC0+bW11X25vdGlmaWVyLCBkLT5t
bSk7Cj4+ICsJCWlmICghcikKPj4gKwkJCWQtPmhhc19ub3RpZmllciA9IHRydWU7Cj4+ICsJfQo+
PiAgICNlbmRpZgo+PiAgIAo+PiAgIAltdXRleF91bmxvY2soJnZxLT5tdXRleCk7Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmggYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4g
aW5kZXggODE5Mjk2MzMyOTEzLi5hNjJmNTZhNGNmNzIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
dmhvc3Qvdmhvc3QuaAo+PiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4gQEAgLTIxNCw2
ICsyMTQsNyBAQCBzdHJ1Y3Qgdmhvc3RfZGV2IHsKPj4gICAJaW50IGlvdl9saW1pdDsKPj4gICAJ
aW50IHdlaWdodDsKPj4gICAJaW50IGJ5dGVfd2VpZ2h0Owo+PiArCWJvb2wgaGFzX25vdGlmaWVy
Owo+PiAgIH07Cj4+ICAgCj4+ICAgYm9vbCB2aG9zdF9leGNlZWRzX3dlaWdodChzdHJ1Y3Qgdmhv
c3RfdmlydHF1ZXVlICp2cSwgaW50IHBrdHMsIGludCB0b3RhbF9sZW4pOwo+PiAtLSAKPj4gMi4x
OC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
