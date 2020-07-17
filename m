Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD132232F2
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 07:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5215B8821F;
	Fri, 17 Jul 2020 05:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KlL4erDfi-l; Fri, 17 Jul 2020 05:33:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEA8E8820A;
	Fri, 17 Jul 2020 05:33:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98A44C0733;
	Fri, 17 Jul 2020 05:33:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B3D3C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFA49880EE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5diUDhx22V7Z
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:33:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C82A28810E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 05:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594963987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKw3TmjYzVk1C1S6gNL1iMqtEatrMQdgW83gtCC8/HU=;
 b=R0E7qt/cDsg5LQfXdA8+TbAHWKwLSrq6FtT4oZnYLThJl0u1+MDElkKF8bhKWXSxvmBdbT
 3lWW+jNJz4E8+Uxdf3mnX6xnZg4IW26Hl3ce76m9USkXyfN85Es/RNb8O7oYZZQvttQVFp
 2LkJPPtelQWJ7NvTSeCzqbuOQflcfcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-R8FnbaM6POmutVFsP9W-Nw-1; Fri, 17 Jul 2020 01:33:03 -0400
X-MC-Unique: R8FnbaM6POmutVFsP9W-Nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A6D107ACCA;
 Fri, 17 Jul 2020 05:33:02 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0F71A7C8;
 Fri, 17 Jul 2020 05:32:32 +0000 (UTC)
Subject: Re: [PATCH V2 5/6] ifcvf: replace irq_request/free with vDPA helpers
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-6-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c0662b7e-98ad-b7a3-a054-56bbb6a364ac@redhat.com>
Date: Fri, 17 Jul 2020 13:32:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594898629-18790-6-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjIzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgcmVwbGFjZWQgaXJxX3JlcXVlc3QvZnJlZSgpIHdpdGggaGVscGVycyBpbiB2RFBBCj4gY29y
ZSwgc28gdGhhdCBpdCBjYW4gcmVxdWVzdC9mcmVlIGlycSBhbmQgc2V0dXAgaXJxIG9mZmxvYWRp
bmcKPiBvbiBvcmRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4u
emh1QGludGVsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgMTQgKysr
KysrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBi
L2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCBmNWE2MGMxLi5iZDJhMzE3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiArKysgYi9k
cml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTQ3LDExICs0NywxMiBAQCBzdGF0
aWMgdm9pZCBpZmN2Zl9mcmVlX2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlciwgaW50
IHF1ZXVlcykKPiAgIHsKPiAgIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGFkYXB0ZXItPnBkZXY7
Cj4gICAJc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFwdGVyLT52ZjsKPiArCXN0cnVjdCB2ZHBh
X2RldmljZSAqdmRwYSA9ICZhZGFwdGVyLT52ZHBhOwo+ICAgCWludCBpOwo+ICAgCj4gICAKPiAg
IAlmb3IgKGkgPSAwOyBpIDwgcXVldWVzOyBpKyspCj4gLQkJZGV2bV9mcmVlX2lycSgmcGRldi0+
ZGV2LCB2Zi0+dnJpbmdbaV0uaXJxLCAmdmYtPnZyaW5nW2ldKTsKPiArCQl2ZHBhX2ZyZWVfdnFf
aXJxKCZwZGV2LT5kZXYsIHZkcGEsIHZmLT52cmluZ1tpXS5pcnEsIGksICZ2Zi0+dnJpbmdbaV0p
Owo+ICAgCj4gICAJaWZjdmZfZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPiAgIH0KPiBAQCAtNjAs
NiArNjEsNyBAQCBzdGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBpZmN2Zl9hZGFw
dGVyICphZGFwdGVyKQo+ICAgewo+ICAgCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gYWRhcHRlci0+
cGRldjsKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+ICsJc3RydWN0
IHZkcGFfZGV2aWNlICp2ZHBhID0gJmFkYXB0ZXItPnZkcGE7Cj4gICAJaW50IHZlY3RvciwgaSwg
cmV0LCBpcnE7Cj4gICAKPiAgIAlyZXQgPSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMocGRldiwgSUZD
VkZfTUFYX0lOVFIsCj4gQEAgLTczLDYgKzc1LDEwIEBAIHN0YXRpYyBpbnQgaWZjdmZfcmVxdWVz
dF9pcnEoc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIpCj4gICAJCSBwY2lfbmFtZShwZGV2
KSk7Cj4gICAJdmVjdG9yID0gMDsKPiAgIAlpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCB2ZWN0
b3IpOwo+ICsJLyogVGhpcyBpc2NvbmZpZyBpbnRlcnJ1cHQsIGNvbmZpZyBhY2Nlc3NlcyBhbGwg
Z28KCgpNaXNzaW5nIGEgYmxhbmsgYmV0d2VlbiBpcyBhbmQgY29uZmlnLgoKVGhhbmtzCgoKPiAr
CSAqIHRocm91Z2ggdXNlcnNwYWNlLCBzbyBubyBuZWVkIHRvIHNldHVwCj4gKwkgKiBjb25maWcg
aW50ZXJydXB0IG9mZmxvYWRpbmcuCj4gKwkgKi8KPiAgIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJx
KCZwZGV2LT5kZXYsIGlycSwKPiAgIAkJCSAgICAgICBpZmN2Zl9jb25maWdfY2hhbmdlZCwgMCwK
PiAgIAkJCSAgICAgICB2Zi0+Y29uZmlnX21zaXhfbmFtZSwgdmYpOwo+IEBAIC04MiwxMyArODgs
MTEgQEAgc3RhdGljIGludCBpZmN2Zl9yZXF1ZXN0X2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAq
YWRhcHRlcikKPiAgIAkJCSBwY2lfbmFtZShwZGV2KSwgaSk7Cj4gICAJCXZlY3RvciA9IGkgKyBJ
RkNWRl9NU0lfUVVFVUVfT0ZGOwo+ICAgCQlpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCB2ZWN0
b3IpOwo+IC0JCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaXJxLAo+ICsJCXJl
dCA9IHZkcGFfYWxsb2NfdnFfaXJxKCZwZGV2LT5kZXYsIHZkcGEsIGlycSwKPiAgIAkJCQkgICAg
ICAgaWZjdmZfaW50cl9oYW5kbGVyLCAwLAo+ICAgCQkJCSAgICAgICB2Zi0+dnJpbmdbaV0ubXNp
eF9uYW1lLAo+IC0JCQkJICAgICAgICZ2Zi0+dnJpbmdbaV0pOwo+ICsJCQkJICAgICAgICZ2Zi0+
dnJpbmdbaV0sIGkpOwo+ICAgCQlpZiAocmV0KSB7Cj4gLQkJCUlGQ1ZGX0VSUihwZGV2LAo+IC0J
CQkJICAiRmFpbGVkIHRvIHJlcXVlc3QgaXJxIGZvciB2cSAlZFxuIiwgaSk7Cj4gICAJCQlpZmN2
Zl9mcmVlX2lycShhZGFwdGVyLCBpKTsKPiAgIAo+ICAgCQkJcmV0dXJuIHJldDsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
