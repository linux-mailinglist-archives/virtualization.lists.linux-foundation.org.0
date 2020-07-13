Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB921D1AC
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:27:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D8FC88F16;
	Mon, 13 Jul 2020 08:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g30-ZK+XUMGs; Mon, 13 Jul 2020 08:27:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A429B88F08;
	Mon, 13 Jul 2020 08:27:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8398AC0733;
	Mon, 13 Jul 2020 08:27:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C85CC0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CD3BD20367
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqRxG2QuWWWd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:27:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A38832000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594628852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxdZg1N6R8DqaKbCvSIupj1dKmqOdpoif6br+brtFjA=;
 b=W29OteRViQID5AsAn9QQcjvJ3mrlv4t+MVWm6xj+QbLTb2GKw4AI8hNE4Eh5Bp/YNixxaL
 nLFiI04ylq8CPFQB1cx3xT4tFEijl5MNUCLBNvMmApEIGZB+pVw6/gfmJ1PU8MCEqbEWMB
 Lm5V0Y3Dy7XcNzjtR3cgigsv2tuQJDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-0pN_GoaCNFOBst1aDpKvCQ-1; Mon, 13 Jul 2020 04:27:26 -0400
X-MC-Unique: 0pN_GoaCNFOBst1aDpKvCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F2531902EC0;
 Mon, 13 Jul 2020 08:27:25 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F338427DE90;
 Mon, 13 Jul 2020 08:27:14 +0000 (UTC)
Subject: Re: [PATCH 4/7] vDPA: implement IRQ offloading helpers in vDPA core
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-4-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6e8b267c-0734-1d9b-d3da-e2e6f44f7847@redhat.com>
Date: Mon, 13 Jul 2020 16:27:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594565366-3195-4-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNy8xMiDkuIvljYgxMDo0OSwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IFRoaXMgY29t
bWl0IGltcGxlbWVudHMgSVJRIG9mZmxvYWRpbmcgaGVscGVycyBpbiB2RFBBIGNvcmUgYnkKPiBp
bnRyb2R1Y2luZyB0d28gY291cGxlIG9mIGZ1bmN0aW9uczoKPgo+IHZkcGFfYWxsb2NfdnFfaXJx
KCkgYW5kIHZkcGFfZnJlZV92cV9pcnEoKTogcmVxdWVzdCBpcnEgYW5kIGZyZWUKPiBpcnEsIHdp
bGwgc2V0dXAgaXJxIG9mZmxvYWRpbmcgaWYgaXJxX2J5cGFzcyBpcyBlbmFibGVkLgo+Cj4gdmRw
YV9zZXR1cF9pcnEoKSBhbmQgdmRwYV91bnNldHVwX2lycSgpOiBzdXBwb3J0aXZlIGZ1bmN0aW9u
cywKPiB3aWxsIGNhbGwgdmhvc3RfdmRwYSBoZWxwZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1
IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgoKClRoaXMgcGF0Y2ggc2hvdWxkIGdv
IGJlZm9yZSBwYXRjaCAzLgoKCj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvdmRwYS5jICAgfCA0NiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJz
L3Zob3N0L0tjb25maWcgfCAgMSArCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgfCAgMiArKwo+
ICAgaW5jbHVkZS9saW51eC92ZHBhLmggIHwgMTEgKysrKysrKysrKysKPiAgIDQgZmlsZXMgY2hh
bmdlZCwgNjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBh
LmMgYi9kcml2ZXJzL3ZkcGEvdmRwYS5jCj4gaW5kZXggZmY2NTYyZi4uZDhlYmEwMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGEuYwo+
IEBAIC0xNjMsNiArMTYzLDUyIEBAIHZvaWQgdmRwYV91bnJlZ2lzdGVyX2RyaXZlcihzdHJ1Y3Qg
dmRwYV9kcml2ZXIgKmRydikKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKHZkcGFfdW5yZWdp
c3Rlcl9kcml2ZXIpOwo+ICAgCj4gK3N0YXRpYyB2b2lkIHZkcGFfc2V0dXBfaXJxKHN0cnVjdCB2
ZHBhX2RldmljZSAqdmRldiwgaW50IHFpZCwgaW50IGlycSkKPiArewo+ICsJc3RydWN0IHZkcGFf
ZHJpdmVyICpkcnYgPSBkcnZfdG9fdmRwYSh2ZGV2LT5kZXYuZHJpdmVyKTsKPiArCj4gKyNpZmRl
ZiBDT05GSUdfSEFWRV9LVk1fSVJRX0JZUEFTUwoKCkxldCdzIGRvbid0IGRvIHRoZSBjaGVjayBo
ZXJlLiBJdCdzIHRoZSByZXNwb25zaWJpbGl0eSBvZiBkcml2ZXIgdG8gCmRlY2lkZSB3aGF0IGl0
IHNob3VsZCBkby4KCgo+ICsJaWYgKGRydi0+c2V0dXBfdnFfaXJxKQo+ICsJCWRydi0+c2V0dXBf
dnFfaXJxKHZkZXYsIHFpZCwgaXJxKTsKPiArI2VuZGlmCj4gK30KPiArCj4gK3N0YXRpYyB2b2lk
IHZkcGFfdW5zZXR1cF9pcnEoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCBpbnQgcWlkKQo+ICt7
Cj4gKwlzdHJ1Y3QgdmRwYV9kcml2ZXIgKmRydiA9IGRydl90b192ZHBhKHZkZXYtPmRldi5kcml2
ZXIpOwo+ICsKPiArI2lmZGVmIENPTkZJR19IQVZFX0tWTV9JUlFfQllQQVNTCj4gKwlpZiAoZHJ2
LT51bnNldHVwX3ZxX2lycSkKPiArCQlkcnYtPnVuc2V0dXBfdnFfaXJxKHZkZXYsIHFpZCk7Cj4g
KyNlbmRpZgo+ICt9Cj4gKwo+ICtpbnQgdmRwYV9hbGxvY192cV9pcnEoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsCj4gKwkJICAgICAgdW5zaWduZWQgaW50IGly
cSwgaXJxX2hhbmRsZXJfdCBoYW5kbGVyLAo+ICsJCSAgICAgIHVuc2lnbmVkIGxvbmcgaXJxZmxh
Z3MsIGNvbnN0IGNoYXIgKmRldm5hbWUsIHZvaWQgKmRldl9pZCwKPiArCQkgICAgICBpbnQgcWlk
KQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBp
cnEsIGhhbmRsZXIsIGlycWZsYWdzLCBkZXZuYW1lLCBkZXZfaWQpOwo+ICsJaWYgKHJldCkKPiAr
CQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IGlycSBmb3IgdnEgJWRcbiIsIHFpZCk7
Cj4gKwllbHNlCj4gKwkJdmRwYV9zZXR1cF9pcnEodmRldiwgcWlkLCBpcnEpOwoKCkknZCBsaWtl
IHRvIHNxdWFzaCB0aGUgdmRwYV9zZXR1cF9pcnEgbG9naWMgaGVyZS4KCgo+ICsKPiArCXJldHVy
biByZXQ7Cj4gKwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHZkcGFfYWxsb2NfdnFfaXJxKTsK
PiArCj4gK3ZvaWQgdmRwYV9mcmVlX3ZxX2lycShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB2
ZHBhX2RldmljZSAqdmRldiwgaW50IGlycSwKPiArCQkJIGludCBxaWQsIHZvaWQgKmRldl9pZCkK
PiArewo+ICsJZGV2bV9mcmVlX2lycShkZXYsIGlycSwgZGV2X2lkKTsKPiArCXZkcGFfdW5zZXR1
cF9pcnEodmRldiwgcWlkKTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTCh2ZHBhX2ZyZWVfdnFf
aXJxKTsKPiArCj4gICBzdGF0aWMgaW50IHZkcGFfaW5pdCh2b2lkKQo+ICAgewo+ICAgCXJldHVy
biBidXNfcmVnaXN0ZXIoJnZkcGFfYnVzKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9L
Y29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCgoKTGV0IHNxdWFzaCB0aGUgdmhvc3QgcGF0
Y2ggaW50byBwYXRjaCAzLgoKCj4gaW5kZXggZDM2ODhjNi4uNTg3ZmJhZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiBA
QCAtNjUsNiArNjUsNyBAQCBjb25maWcgVkhPU1RfVkRQQQo+ICAgCXRyaXN0YXRlICJWaG9zdCBk
cml2ZXIgZm9yIHZEUEEtYmFzZWQgYmFja2VuZCIKPiAgIAlkZXBlbmRzIG9uIEVWRU5URkQKPiAg
IAlzZWxlY3QgVkhPU1QKPiArCXNlbGVjdCBJUlFfQllQQVNTX01BTkFHRVIKPiAgIAlkZXBlbmRz
IG9uIFZEUEEKPiAgIAloZWxwCj4gICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJlIGxvYWRl
ZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhv
c3QvdmRwYS5jIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBpbmRleCA5MjY4M2U0Li42ZTI1MTU4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gKysrIGIvZHJpdmVycy92aG9z
dC92ZHBhLmMKPiBAQCAtMTAyMCw2ICsxMDIwLDggQEAgc3RhdGljIHZvaWQgdmhvc3RfdmRwYV9y
ZW1vdmUoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+ICAgCX0sCj4gICAJLnByb2JlCT0gdmhv
c3RfdmRwYV9wcm9iZSwKPiAgIAkucmVtb3ZlCT0gdmhvc3RfdmRwYV9yZW1vdmUsCj4gKwkuc2V0
dXBfdnFfaXJxID0gdmhvc3RfdmRwYV9zZXR1cF92cV9pcnEsCj4gKwkudW5zZXR1cF92cV9pcnEg
PSB2aG9zdF92ZHBhX3Vuc2V0dXBfdnFfaXJxLAo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGludCBf
X2luaXQgdmhvc3RfdmRwYV9pbml0KHZvaWQpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
dmRwYS5oIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBpbmRleCAyMzlkYjc5Li45ZjliMjQ1IDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92
ZHBhLmgKPiBAQCAtMjIwLDE3ICsyMjAsMjggQEAgc3RydWN0IHZkcGFfZGV2aWNlICpfX3ZkcGFf
YWxsb2NfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPiAgIAo+ICAgaW50IHZkcGFfcmVn
aXN0ZXJfZGV2aWNlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4gICB2b2lkIHZkcGFfdW5y
ZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPiAraW50IHZkcGFfYWxs
b2NfdnFfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LAo+
ICsJCSAgICAgIHVuc2lnbmVkIGludCBpcnEsIGlycV9oYW5kbGVyX3QgaGFuZGxlciwKPiArCQkg
ICAgICB1bnNpZ25lZCBsb25nIGlycWZsYWdzLCBjb25zdCBjaGFyICpkZXZuYW1lLCB2b2lkICpk
ZXZfaWQsCj4gKwkJICAgICAgaW50IHFpZCk7Cj4gK3ZvaWQgdmRwYV9mcmVlX3ZxX2lycShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgaW50IGlycSwKPiArCQkg
ICAgICBpbnQgcWlkLCB2b2lkICpkZXZfaWQpOwoKCllvdSBuZWVkIHRvIGRvY3VtZW50IHRoZSBk
ZXZyZXMgaW1wbGljYXRpb25zIG9mIHRob3NlIHR3byBoZWxwZXJzLgoKCj4gKwo+ICAgCj4gICAv
KioKPiAgICAqIHZkcGFfZHJpdmVyIC0gb3BlcmF0aW9ucyBmb3IgYSB2RFBBIGRyaXZlcgo+ICAg
ICogQGRyaXZlcjogdW5kZXJseWluZyBkZXZpY2UgZHJpdmVyCj4gICAgKiBAcHJvYmU6IHRoZSBm
dW5jdGlvbiB0byBjYWxsIHdoZW4gYSBkZXZpY2UgaXMgZm91bmQuICBSZXR1cm5zIDAgb3IgLWVy
cm5vLgo+ICAgICogQHJlbW92ZTogdGhlIGZ1bmN0aW9uIHRvIGNhbGwgd2hlbiBhIGRldmljZSBp
cyByZW1vdmVkLgo+ICsgKiBAc2V0dXBfdnFfaXJxOiBzZXR1cCBpcnEgYnlwYXNzIGZvciBhIHZo
b3N0X3ZkcGEgdnEuCj4gKyAqIEB1bnNldHVwX3ZxX2lycTogdW5zZXR1cCBpcnEgYnlwYXNzIGZv
ciBhIHZob3N0X3ZkcGEgdnEuCgoKVGhvdWdoIGlycSBieXBhc3MgaXMgdXNlZCBieSB2aG9zdC12
ZHBhLCBpdCdzIG5vdCBuZWNlc3NhcmlseSB0byBiZSB0cnVlIAppbiB0aGUgZnV0dXJlLiBTbyBp
dCdzIGJldHRlciBub3QgdG8gbWVudGlvbiBpcnFieXBhc3MgaW4gdGhlIGRvYyBoZXJlLgoKVGhh
bmtzCgoKPiAgICAqLwo+ICAgc3RydWN0IHZkcGFfZHJpdmVyIHsKPiAgIAlzdHJ1Y3QgZGV2aWNl
X2RyaXZlciBkcml2ZXI7Cj4gICAJaW50ICgqcHJvYmUpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRl
dik7Cj4gICAJdm9pZCAoKnJlbW92ZSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPiArCXZv
aWQgKCpzZXR1cF92cV9pcnEpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgaW50IHFpZCwgaW50
IGlycSk7Cj4gKwl2b2lkICgqdW5zZXR1cF92cV9pcnEpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRl
diwgaW50IHFpZCk7Cj4gICB9Owo+ICAgCj4gICAjZGVmaW5lIHZkcGFfcmVnaXN0ZXJfZHJpdmVy
KGRydikgXAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
