Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFB2232EF
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 07:30:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E8F6880BB;
	Fri, 17 Jul 2020 05:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYxgvDI1seTb; Fri, 17 Jul 2020 05:30:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D0AF880D0;
	Fri, 17 Jul 2020 05:30:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22FE2C0733;
	Fri, 17 Jul 2020 05:30:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D0D3C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6EB9E203D7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvA8Vtf8BgdI
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:30:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F096203A6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594963829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+wLk/ePgaJoi2FnNGkrLAcPurLKVDi5tXa+03Q0aj4=;
 b=RN7gvvQ93RBjUvJo5+te7d/Ve1r3nDabLC/HWXmvoye8a2fEm8cnbuppohNdZ+r4BCaSsI
 vGJxVaT8h/oJXH6T6UXYdfIAbuAKysS0G76TSGq4rzK0CCIjvHUEdb+YbfRlN/fWEUiY0f
 uKCiMLzdt0SQSwPKiucLV0xYrcYhQ7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-XCp00DzjMKeWww0JR7yhyw-1; Fri, 17 Jul 2020 01:30:25 -0400
X-MC-Unique: XCp00DzjMKeWww0JR7yhyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC611800D42;
 Fri, 17 Jul 2020 05:30:22 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF7B378A54;
 Fri, 17 Jul 2020 05:30:02 +0000 (UTC)
Subject: Re: [PATCH V2 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-5-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <96df4d83-2297-5f30-b6a3-75a0cdf23a0b@redhat.com>
Date: Fri, 17 Jul 2020 13:29:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594898629-18790-5-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjIzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBwYXRj
aCBpbnRyb2R1Y2UgYSBzZXQgb2YgZnVuY3Rpb25zIGZvciBzZXR1cC91bnNldHVwCj4gYW5kIHVw
ZGF0ZSBpcnEgb2ZmbG9hZGluZyByZXNwZWN0aXZlbHkgYnkgcmVnaXN0ZXIvdW5yZWdpc3Rlcgo+
IGFuZCByZS1yZWdpc3RlciB0aGUgaXJxX2J5cGFzc19wcm9kdWNlci4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0
L0tjb25maWcgfCAgMSArCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgfCA0OCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgNDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2NvbmZp
ZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IGluZGV4IGQzNjg4YzYuLjU4N2ZiYWUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy92aG9zdC9LY29u
ZmlnCj4gQEAgLTY1LDYgKzY1LDcgQEAgY29uZmlnIFZIT1NUX1ZEUEEKPiAgIAl0cmlzdGF0ZSAi
Vmhvc3QgZHJpdmVyIGZvciB2RFBBLWJhc2VkIGJhY2tlbmQiCj4gICAJZGVwZW5kcyBvbiBFVkVO
VEZECj4gICAJc2VsZWN0IFZIT1NUCj4gKwlzZWxlY3QgSVJRX0JZUEFTU19NQU5BR0VSCj4gICAJ
ZGVwZW5kcyBvbiBWRFBBCj4gICAJaGVscAo+ICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBi
ZSBsb2FkZWQgaW4gaG9zdCBrZXJuZWwgdG8gYWNjZWxlcmF0ZQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5kZXggMmZjYzQyMi4u
YjkwNzhkNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZl
cnMvdmhvc3QvdmRwYS5jCj4gQEAgLTExNSw2ICsxMTUsNDMgQEAgc3RhdGljIGlycXJldHVybl90
IHZob3N0X3ZkcGFfY29uZmlnX2NiKHZvaWQgKnByaXZhdGUpCj4gICAJcmV0dXJuIElSUV9IQU5E
TEVEOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyB2b2lkIHZob3N0X3ZkcGFfc2V0dXBfdnFfaXJxKHN0
cnVjdCB2ZHBhX2RldmljZSAqZGV2LCBpbnQgcWlkLCBpbnQgaXJxKQo+ICt7Cj4gKwlzdHJ1Y3Qg
dmhvc3RfdmRwYSAqdiA9IHZkcGFfZ2V0X2RydmRhdGEoZGV2KTsKPiArCXN0cnVjdCB2aG9zdF92
aXJ0cXVldWUgKnZxID0gJnYtPnZxc1txaWRdOwo+ICsJaW50IHJldDsKPiArCj4gKwlzcGluX2xv
Y2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7Cj4gKwlpZiAoIXZxLT5jYWxsX2N0eC5jdHgpIHsK
PiArCQlzcGluX3VubG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiArCQlyZXR1cm47Cj4g
Kwl9CgoKSSB0aGluayB3ZSBjYW4gc2ltcGx5IHJlbW92ZSB0aGlzIGNoZWNrIGFzIHdoYXQgaXMg
ZG9uZSBpbiAKdmhvc3RfdmRwcV91cGRhdGVfdnFfaXJxKCkuCgoKPiArCj4gKwl2cS0+Y2FsbF9j
dHgucHJvZHVjZXIudG9rZW4gPSB2cS0+Y2FsbF9jdHguY3R4Owo+ICsJdnEtPmNhbGxfY3R4LnBy
b2R1Y2VyLmlycSA9IGlycTsKPiArCXJldCA9IGlycV9ieXBhc3NfcmVnaXN0ZXJfcHJvZHVjZXIo
JnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4gKwlzcGluX3VubG9jaygmdnEtPmNhbGxfY3R4LmN0
eF9sb2NrKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgdmhvc3RfdmRwYV91bnNldHVwX3ZxX2ly
cShzdHJ1Y3QgdmRwYV9kZXZpY2UgKmRldiwgaW50IHFpZCkKPiArewo+ICsJc3RydWN0IHZob3N0
X3ZkcGEgKnYgPSB2ZHBhX2dldF9kcnZkYXRhKGRldik7Cj4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cSA9ICZ2LT52cXNbcWlkXTsKPiArCj4gKwlzcGluX2xvY2soJnZxLT5jYWxsX2N0eC5j
dHhfbG9jayk7Cj4gKwlpcnFfYnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0
eC5wcm9kdWNlcik7Cj4gKwlzcGluX3VubG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgdmhvc3RfdmRwYV91cGRhdGVfdnFfaXJxKHN0cnVjdCB2aG9z
dF92aXJ0cXVldWUgKnZxKQo+ICt7Cj4gKwlzcGluX2xvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9j
ayk7Cj4gKwlpcnFfYnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9k
dWNlcik7Cj4gKwl2cS0+Y2FsbF9jdHgucHJvZHVjZXIudG9rZW4gPSB2cS0+Y2FsbF9jdHguY3R4
Owo+ICsJaXJxX2J5cGFzc19yZWdpc3Rlcl9wcm9kdWNlcigmdnEtPmNhbGxfY3R4LnByb2R1Y2Vy
KTsKPiArCXNwaW5fdW5sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+ICt9Cj4gKwo+ICAg
c3RhdGljIHZvaWQgdmhvc3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPiAgIHsK
PiAgIAlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+IEBAIC0zMzIsNiArMzY5
LDcgQEAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9zZXRfY29uZmlnX2NhbGwoc3RydWN0IHZob3N0
X3ZkcGEgKnYsIHUzMiBfX3VzZXIgKmFyZ3ApCj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAr
CgoKSWYgeW91IHJlYWxseSB3YW50IHRvIGZpeCBjb2Rpbmcgc3R5bGUgaXNzdWUsIGl0J3MgYmV0
dGVyIHRvIGhhdmUgCmFub3RoZXIgcGF0Y2guCgoKPiAgIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFf
dnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHVuc2lnbmVkIGludCBjbWQsCj4gICAJ
CQkJICAgdm9pZCBfX3VzZXIgKmFyZ3ApCj4gICB7Cj4gQEAgLTM5MCw2ICs0MjgsMTQgQEAgc3Rh
dGljIGxvbmcgdmhvc3RfdmRwYV92cmluZ19pb2N0bChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdW5z
aWduZWQgaW50IGNtZCwKPiAgIAkJCWNiLnByaXZhdGUgPSBOVUxMOwo+ICAgCQl9Cj4gICAJCW9w
cy0+c2V0X3ZxX2NiKHZkcGEsIGlkeCwgJmNiKTsKPiArCQkvKgo+ICsJCSAqIGlmIGl0IGhhcyBh
IG5vbi16ZXJvIGlycSwgbWVhbnMgdGhlcmUgaXMgYQo+ICsJCSAqIHByZXZpc291bHkgcmVnaXN0
ZXJlZCBpcnFfYnlwYXNzX3Byb2R1Y2VyLAo+ICsJCSAqIHdlIHNob3VsZCB1cGRhdGUgaXQgd2hl
biBjdHggKGl0cyB0b2tlbikKPiArCQkgKiBjaGFuZ2VzLgo+ICsJCSAqLwo+ICsJCWlmICh2cS0+
Y2FsbF9jdHgucHJvZHVjZXIuaXJxKQo+ICsJCQl2aG9zdF92ZHBhX3VwZGF0ZV92cV9pcnEodnEp
OwoKCklzIHRoaXMgc2FmZSB0byBjaGVjayBwcm9kdWNlci5pcnEgb3V0c2lkZSBzcGlubG9jaz8K
ClRoYW5rcwoKCj4gICAJCWJyZWFrOwo+ICAgCj4gICAJY2FzZSBWSE9TVF9TRVRfVlJJTkdfTlVN
Ogo+IEBAIC05NTEsNiArOTk3LDggQEAgc3RhdGljIHZvaWQgdmhvc3RfdmRwYV9yZW1vdmUoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+ICAgCX0sCj4gICAJLnByb2JlCT0gdmhvc3RfdmRwYV9w
cm9iZSwKPiAgIAkucmVtb3ZlCT0gdmhvc3RfdmRwYV9yZW1vdmUsCj4gKwkuc2V0dXBfdnFfaXJx
ID0gdmhvc3RfdmRwYV9zZXR1cF92cV9pcnEsCj4gKwkudW5zZXR1cF92cV9pcnEgPSB2aG9zdF92
ZHBhX3Vuc2V0dXBfdnFfaXJxLAo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGludCBfX2luaXQgdmhv
c3RfdmRwYV9pbml0KHZvaWQpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
