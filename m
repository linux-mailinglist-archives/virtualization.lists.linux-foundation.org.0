Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B721D1C8
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:33:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43C6987589;
	Mon, 13 Jul 2020 08:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npKaEbx21IAE; Mon, 13 Jul 2020 08:33:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B77DA8757A;
	Mon, 13 Jul 2020 08:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ADBBC0733;
	Mon, 13 Jul 2020 08:33:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF27C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EF75088D7C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9902feFLL2c
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:33:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EAB0D8849D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594629220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCiSRLXUu39mIr1R5zRpea/rVokQzTpo+LOH6ciVFpc=;
 b=OnnrJ2qzeaRX0lZ2wJXTe3WV2O5ksjbOuljuPyz8/4auPCi8P5qwZZchKSmWmxS53Gwli0
 /iDSylUuaCX9ksCAhAcYUoPxZUN0YYxg3pEwd1vD7pzeKPu+zw82FN/fu7FBMTLmixVA12
 ZTyPW42/4AYLsXtgCVfyb6AM+uft1xM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-VVmudf3GOjqQ7yUL6O-LdQ-1; Mon, 13 Jul 2020 04:33:37 -0400
X-MC-Unique: VVmudf3GOjqQ7yUL6O-LdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA05C19057A1;
 Mon, 13 Jul 2020 08:33:35 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1864A1002396;
 Mon, 13 Jul 2020 08:33:25 +0000 (UTC)
Subject: Re: [PATCH 6/7] ifcvf: replace irq_request/free with helpers in vDPA
 core.
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-6-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c7d4eca1-b65a-b795-dfa6-fe7658716cb1@redhat.com>
Date: Mon, 13 Jul 2020 16:33:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594565366-3195-6-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
bWl0IHJlcGxhY2VkIGlycV9yZXF1ZXN0L2ZyZWUoKSB3aXRoIGhlbHBlcnMgaW4gdkRQQQo+IGNv
cmUsIHNvIHRoYXQgaXQgY2FuIHJlcXVlc3QvZnJlZSBpcnEgYW5kIHNldHVwIGlycSBvZmZsb2Fk
aW5nCj4gb24gb3JkZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFu
LnpodUBpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
IHwgMTEgKysrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21h
aW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCBmNWE2MGMxLi42
NWI4NGUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiAr
KysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTQ3LDExICs0NywxMiBA
QCBzdGF0aWMgdm9pZCBpZmN2Zl9mcmVlX2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRl
ciwgaW50IHF1ZXVlcykKPiAgIHsKPiAgIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGFkYXB0ZXIt
PnBkZXY7Cj4gICAJc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFwdGVyLT52ZjsKPiArCXN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYSA9ICZhZGFwdGVyLT52ZHBhOwo+ICAgCWludCBpOwo+ICAgCj4g
ICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgcXVldWVzOyBpKyspCj4gLQkJZGV2bV9mcmVlX2lycSgm
cGRldi0+ZGV2LCB2Zi0+dnJpbmdbaV0uaXJxLCAmdmYtPnZyaW5nW2ldKTsKPiArCQl2ZHBhX2Zy
ZWVfdnFfaXJxKCZwZGV2LT5kZXYsIHZkcGEsIHZmLT52cmluZ1tpXS5pcnEsIGksICZ2Zi0+dnJp
bmdbaV0pOwo+ICAgCj4gICAJaWZjdmZfZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPiAgIH0KPiBA
QCAtNjAsNiArNjEsNyBAQCBzdGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBpZmN2
Zl9hZGFwdGVyICphZGFwdGVyKQo+ICAgewo+ICAgCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gYWRh
cHRlci0+cGRldjsKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+ICsJ
c3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhID0gJmFkYXB0ZXItPnZkcGE7Cj4gICAJaW50IHZlY3Rv
ciwgaSwgcmV0LCBpcnE7Cj4gICAKPiAgIAlyZXQgPSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMocGRl
diwgSUZDVkZfTUFYX0lOVFIsCj4gQEAgLTczLDYgKzc1LDcgQEAgc3RhdGljIGludCBpZmN2Zl9y
ZXF1ZXN0X2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlcikKPiAgIAkJIHBjaV9uYW1l
KHBkZXYpKTsKPiAgIAl2ZWN0b3IgPSAwOwo+ICAgCWlycSA9IHBjaV9pcnFfdmVjdG9yKHBkZXYs
IHZlY3Rvcik7Cj4gKwkvKiBjb25maWcgaW50ZXJydXB0ICovCgoKVW5uZWNlc3NhcnkgY2hhbmdl
cy4KClRoYW5rcwoKCj4gICAJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEs
Cj4gICAJCQkgICAgICAgaWZjdmZfY29uZmlnX2NoYW5nZWQsIDAsCj4gICAJCQkgICAgICAgdmYt
PmNvbmZpZ19tc2l4X25hbWUsIHZmKTsKPiBAQCAtODIsMTMgKzg1LDExIEBAIHN0YXRpYyBpbnQg
aWZjdmZfcmVxdWVzdF9pcnEoc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIpCj4gICAJCQkg
cGNpX25hbWUocGRldiksIGkpOwo+ICAgCQl2ZWN0b3IgPSBpICsgSUZDVkZfTVNJX1FVRVVFX09G
RjsKPiAgIAkJaXJxID0gcGNpX2lycV92ZWN0b3IocGRldiwgdmVjdG9yKTsKPiAtCQlyZXQgPSBk
ZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwKPiArCQlyZXQgPSB2ZHBhX2FsbG9jX3Zx
X2lycSgmcGRldi0+ZGV2LCB2ZHBhLCBpcnEsCj4gICAJCQkJICAgICAgIGlmY3ZmX2ludHJfaGFu
ZGxlciwgMCwKPiAgIAkJCQkgICAgICAgdmYtPnZyaW5nW2ldLm1zaXhfbmFtZSwKPiAtCQkJCSAg
ICAgICAmdmYtPnZyaW5nW2ldKTsKPiArCQkJCSAgICAgICAmdmYtPnZyaW5nW2ldLCBpKTsKPiAg
IAkJaWYgKHJldCkgewo+IC0JCQlJRkNWRl9FUlIocGRldiwKPiAtCQkJCSAgIkZhaWxlZCB0byBy
ZXF1ZXN0IGlycSBmb3IgdnEgJWRcbiIsIGkpOwo+ICAgCQkJaWZjdmZfZnJlZV9pcnEoYWRhcHRl
ciwgaSk7Cj4gICAKPiAgIAkJCXJldHVybiByZXQ7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
