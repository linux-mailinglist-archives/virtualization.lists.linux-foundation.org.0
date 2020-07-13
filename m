Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7521D19A
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:22:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D58787257;
	Mon, 13 Jul 2020 08:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLFtpUCGb6jr; Mon, 13 Jul 2020 08:22:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D72C58727C;
	Mon, 13 Jul 2020 08:22:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1482C0733;
	Mon, 13 Jul 2020 08:22:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76680C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7272887257
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2o3CJ_4cnZ2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:22:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 942FF8723E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594628570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/+ZSrW+kUPY6oOBgBRDnn14Dz1y/Pxezt0ZYfjJHCg=;
 b=bzAa+ZCzAecZUoS31sXakZ16/8NhovI29k/WcDRlSmgwYFBoTEF3wU8szna5dpWxLMIEcD
 d5nhOUlPWMnuMOBwaG9rJ9rR1WgXF1eF8lf93Wumfogu++r5F9XhXWcSEfy6ZMq6m/2gCO
 m8VlXO6I5TAnxe/fNaIJeb/WB+Meemo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-BFefOaafNHGv-gih_CJ7pw-1; Mon, 13 Jul 2020 04:22:46 -0400
X-MC-Unique: BFefOaafNHGv-gih_CJ7pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96DBE107ACCA;
 Mon, 13 Jul 2020 08:22:44 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB4C60C84;
 Mon, 13 Jul 2020 08:22:35 +0000 (UTC)
Subject: Re: [PATCH 3/7] vhost_vdpa: implement IRQ offloading functions in
 vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-3-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3fb9ecfc-a325-69b5-f5b7-476a5683a324@redhat.com>
Date: Mon, 13 Jul 2020 16:22:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594565366-3195-3-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNy8xMiDkuIvljYgxMDo0OSwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlIGEgc2V0IG9mIGZ1bmN0aW9ucyBmb3Igc2V0dXAvdW5zZXR1cAo+IGFuZCB1
cGRhdGUgaXJxIG9mZmxvYWRpbmcgcmVzcGVjdGl2ZWx5IGJ5IHJlZ2lzdGVyL3VucmVnaXN0ZXIK
PiBhbmQgcmUtcmVnaXN0ZXIgdGhlIGlycV9ieXBhc3NfcHJvZHVjZXIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL3Zob3N0L3ZkcGEuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEu
Ywo+IGluZGV4IDJmY2M0MjIuLjkyNjgzZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92
ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBAIC0xMTUsNiArMTE1LDYzIEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCB2aG9zdF92ZHBhX2NvbmZpZ19jYih2b2lkICpwcml2YXRlKQo+
ICAgCXJldHVybiBJUlFfSEFORExFRDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB2aG9zdF92
ZHBhX3NldHVwX3ZxX2lycShzdHJ1Y3QgdmRwYV9kZXZpY2UgKmRldiwgaW50IHFpZCwgaW50IGly
cSkKPiArewo+ICsJc3RydWN0IHZob3N0X3ZkcGEgKnYgPSB2ZHBhX2dldF9kcnZkYXRhKGRldik7
Cj4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSA9ICZ2LT52cXNbcWlkXTsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJdnFfZXJyKHZxLCAic2V0dXAgaXJxIGJ5cGFzcyBmb3IgdnEgJWQgd2l0aCBp
cnEgPSAlZFxuIiwgcWlkLCBpcnEpOwo+ICsJc3Bpbl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xv
Y2spOwo+ICsJaWYgKCF2cS0+Y2FsbF9jdHguY3R4KQo+ICsJCXJldHVybjsKPiArCj4gKwl2cS0+
Y2FsbF9jdHgucHJvZHVjZXIudG9rZW4gPSB2cS0+Y2FsbF9jdHguY3R4Owo+ICsJdnEtPmNhbGxf
Y3R4LnByb2R1Y2VyLmlycSA9IGlycTsKPiArCXJldCA9IGlycV9ieXBhc3NfcmVnaXN0ZXJfcHJv
ZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4gKwlzcGluX3VubG9jaygmdnEtPmNhbGxf
Y3R4LmN0eF9sb2NrKTsKPiArCj4gKwlpZiAodW5saWtlbHkocmV0KSkKPiArCQl2cV9lcnIodnEs
Cj4gKwkJImlycSBieXBhc3MgcHJvZHVjZXIgKHRva2VuICVwIHJlZ2lzdHJhdGlvbiBmYWlsczog
JWRcbiIsCj4gKwkJdnEtPmNhbGxfY3R4LnByb2R1Y2VyLnRva2VuLCByZXQpOwoKCk5vdCBzdXJl
IHRoaXMgZGVzZXJ2ZXMgYSB2cV9lcnIoKSwgaXJxIHdpbGwgYmUgcmVsYXllZCB0aHJvdWdoIGV2
ZW50ZmQgCmlmIGlycSBieXBhc3MgbWFuYWdlciBjYW4ndCB3b3JrLgoKCj4gK30KPiArCj4gK3N0
YXRpYyB2b2lkIHZob3N0X3ZkcGFfdW5zZXR1cF92cV9pcnEoc3RydWN0IHZkcGFfZGV2aWNlICpk
ZXYsIGludCBxaWQpCj4gK3sKPiArCXN0cnVjdCB2aG9zdF92ZHBhICp2ID0gdmRwYV9nZXRfZHJ2
ZGF0YShkZXYpOwo+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEgPSAmdi0+dnFzW3FpZF07
Cj4gKwo+ICsJc3Bpbl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+ICsJaXJxX2J5cGFz
c191bnJlZ2lzdGVyX3Byb2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICsJc3Bpbl91
bmxvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7Cj4gKwo+ICsJdnFfZXJyKHZxLCAidW5zZXR1
cCBpcnEgYnlwYXNzIGZvciB2cSAlZFxuIiwgcWlkKTsKCgpXaHkgY2FsbCB2cV9lcnIoKSBoZXJl
PwoKCj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHZob3N0X3ZkcGFfdXBkYXRlX3ZxX2lycShzdHJ1
Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiArewo+ICsJc3RydWN0IGV2ZW50ZmRfY3R4ICpjdHg7
Cj4gKwl2b2lkICp0b2tlbjsKPiArCj4gKwlzcGluX2xvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9j
ayk7Cj4gKwljdHggPSB2cS0+Y2FsbF9jdHguY3R4Owo+ICsJdG9rZW4gPSB2cS0+Y2FsbF9jdHgu
cHJvZHVjZXIudG9rZW47Cj4gKwlpZiAoY3R4ID09IHRva2VuKQo+ICsJCXJldHVybjsKCgpOZWVk
IGRvIHVubG9jayBoZXJlLgoKCj4gKwo+ICsJaWYgKCFjdHggJiYgdG9rZW4pCj4gKwkJaXJxX2J5
cGFzc191bnJlZ2lzdGVyX3Byb2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICsKPiAr
CWlmIChjdHggJiYgY3R4ICE9IHRva2VuKSB7Cj4gKwkJaXJxX2J5cGFzc191bnJlZ2lzdGVyX3By
b2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICsJCXZxLT5jYWxsX2N0eC5wcm9kdWNl
ci50b2tlbiA9IGN0eDsKPiArCQlpcnFfYnlwYXNzX3JlZ2lzdGVyX3Byb2R1Y2VyKCZ2cS0+Y2Fs
bF9jdHgucHJvZHVjZXIpOwo+ICsJfQo+ICsKPiArCXNwaW5fdW5sb2NrKCZ2cS0+Y2FsbF9jdHgu
Y3R4X2xvY2spOwoKClRoaXMgc2hvdWxkIGJlIHJhcmUgc28gSSdkIHVzZSBzaW1wbGUgY29kZXMg
anVzdCBkbyB1bnJlZ2lzdGVyIGFuZCByZWdpc3Rlci4KCgo+ICt9Cj4gKwo+ICAgc3RhdGljIHZv
aWQgdmhvc3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPiAgIHsKPiAgIAlzdHJ1
Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+IEBAIC0zMzIsNiArMzg5LDcgQEAgc3Rh
dGljIGxvbmcgdmhvc3RfdmRwYV9zZXRfY29uZmlnX2NhbGwoc3RydWN0IHZob3N0X3ZkcGEgKnYs
IHUzMiBfX3VzZXIgKmFyZ3ApCj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiArCgoKVW5uZWNl
c3NhcnkgY2hhbmdlLgoKCj4gICBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3ZyaW5nX2lvY3RsKHN0
cnVjdCB2aG9zdF92ZHBhICp2LCB1bnNpZ25lZCBpbnQgY21kLAo+ICAgCQkJCSAgIHZvaWQgX191
c2VyICphcmdwKQo+ICAgewo+IEBAIC0zOTAsNiArNDQ4LDE2IEBAIHN0YXRpYyBsb25nIHZob3N0
X3ZkcGFfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHVuc2lnbmVkIGludCBjbWQs
Cj4gICAJCQljYi5wcml2YXRlID0gTlVMTDsKPiAgIAkJfQo+ICAgCQlvcHMtPnNldF92cV9jYih2
ZHBhLCBpZHgsICZjYik7Cj4gKyNpZmRlZiBDT05GSUdfSEFWRV9LVk1fSVJRX0JZUEFTUwo+ICsJ
CS8qCj4gKwkJICogaWYgaXQgaGFzIGEgbm9uLXplcm8gaXJxLCBtZWFucyB0aGVyZSBpcyBhCj4g
KwkJICogcHJldmlzb3VseSByZWdpc3RlcmVkIGlycV9ieXBhc3NfcHJvZHVjZXIsCj4gKwkJICog
d2Ugc2hvdWxkIHVwZGF0ZSBpdCB3aGVuIGN0eCAoaXRzIHRva2VuKQo+ICsJCSAqIGNoYW5nZXMu
Cj4gKwkJICovCj4gKwkJaWYgKHZxLT5jYWxsX2N0eC5wcm9kdWNlci5pcnEpCj4gKwkJCXZob3N0
X3ZkcGFfdXBkYXRlX3ZxX2lycSh2cSk7Cj4gKyNlbmRpZgo+ICAgCQlicmVhazsKPiAgIAo+ICAg
CWNhc2UgVkhPU1RfU0VUX1ZSSU5HX05VTToKPiBAQCAtNzQxLDYgKzgwOSw3IEBAIHN0YXRpYyBp
bnQgdmhvc3RfdmRwYV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxl
cCkKPiAgIAkJdnFzW2ldID0gJnYtPnZxc1tpXTsKPiAgIAkJdnFzW2ldLT5oYW5kbGVfa2ljayA9
IGhhbmRsZV92cV9raWNrOwo+ICAgCX0KPiArCgoKVW5uZWNlc3NhcnkgY2hhbmdlLgoKVGhhbmtz
CgoKPiAgIAl2aG9zdF9kZXZfaW5pdChkZXYsIHZxcywgbnZxcywgMCwgMCwgMCwgZmFsc2UsCj4g
ICAJCSAgICAgICB2aG9zdF92ZHBhX3Byb2Nlc3NfaW90bGJfbXNnKTsKPiAgIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
