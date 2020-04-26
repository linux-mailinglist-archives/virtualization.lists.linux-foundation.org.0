Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC61B8E5D
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 11:41:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B2C7420416;
	Sun, 26 Apr 2020 09:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zz0Ngfu9mEQP; Sun, 26 Apr 2020 09:40:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 306EA20767;
	Sun, 26 Apr 2020 09:40:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0A47C089E;
	Sun, 26 Apr 2020 09:40:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F939C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E808204EB
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6nr8+kR-mVf
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:40:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 15C6520416
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587894052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dszNJQs6fArA/yKsYT4W7GinUXQBUMxovUvmunRNpmo=;
 b=d1UVTg5B0Mt5CT0Erp/2EGGXITqIkZ08lTpR9f6KwEThDZhukSVdeaRWPrCUgDQ0tqya90
 +7nNxL01L93mw4sCn0R1HgY9se23erWZqYKCpTS9wrx2kKKPrMS8NQkuGxWTNKdyNtfpHk
 FNjHZYPxUBocK/Pz1YCoueMxBoOAXRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-XdL4riJKPg-YZhzKS0PnUQ-1; Sun, 26 Apr 2020 05:40:50 -0400
X-MC-Unique: XdL4riJKPg-YZhzKS0PnUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0754C107ACCA;
 Sun, 26 Apr 2020 09:40:49 +0000 (UTC)
Received: from [10.72.13.147] (ovpn-13-147.pek2.redhat.com [10.72.13.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFA560612;
 Sun, 26 Apr 2020 09:40:42 +0000 (UTC)
Subject: Re: [PATCH V3 2/2] vdpa: implement config interrupt in IFCVF
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587890572-39093-1-git-send-email-lingshan.zhu@intel.com>
 <1587890572-39093-3-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <32fda0dc-b1c7-4a7c-2f97-34a40af45fac@redhat.com>
Date: Sun, 26 Apr 2020 17:40:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587890572-39093-3-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNC8yNiDkuIvljYg0OjQyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBjb25maWcgaW50ZXJydXB0IHN1cHBvcnQKPiBpbiBJRkMgVkYKPgo+IFNp
Z25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgfCAgMyArKysKPiAgIGRyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggfCAgMyArKysKPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9p
ZmN2Zl9tYWluLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKystCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jh
c2UuYwo+IGluZGV4IGI2MWIwNmUuLmM4MjVkOTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBh
L2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNl
LmMKPiBAQCAtMTg1LDYgKzE4NSw5IEBAIHZvaWQgaWZjdmZfc2V0X3N0YXR1cyhzdHJ1Y3QgaWZj
dmZfaHcgKmh3LCB1OCBzdGF0dXMpCj4gICAKPiAgIHZvaWQgaWZjdmZfcmVzZXQoc3RydWN0IGlm
Y3ZmX2h3ICpodykKPiAgIHsKPiArCWh3LT5jb25maWdfY2IuY2FsbGJhY2sgPSBOVUxMOwo+ICsJ
aHctPmNvbmZpZ19jYi5wcml2YXRlID0gTlVMTDsKPiArCj4gICAJaWZjdmZfc2V0X3N0YXR1cyho
dywgMCk7Cj4gICAJLyogZmx1c2ggc2V0X3N0YXR1cywgbWFrZSBzdXJlIFZGIGlzIHN0b3BwZWQs
IHJlc2V0ICovCj4gICAJaWZjdmZfZ2V0X3N0YXR1cyhodyk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFz
ZS5oCj4gaW5kZXggZTgwMzA3MC4uMjNhYzQ3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfYmFzZS5oCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2Uu
aAo+IEBAIC0yNyw2ICsyNyw3IEBACj4gICAJCSgoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfTUFDKQkJ
CXwgXAo+ICAgCQkgKDFVTEwgPDwgVklSVElPX0ZfQU5ZX0xBWU9VVCkJCQl8IFwKPiAgIAkJICgx
VUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkJCQl8IFwKPiArCQkgKDFVTEwgPDwgVklSVElPX05F
VF9GX1NUQVRVUykJCQl8IFwKPiAgIAkJICgxVUxMIDw8IFZJUlRJT19GX09SREVSX1BMQVRGT1JN
KQkJfCBcCj4gICAJCSAoMVVMTCA8PCBWSVJUSU9fRl9JT01NVV9QTEFURk9STSkJCXwgXAo+ICAg
CQkgKDFVTEwgPDwgVklSVElPX05FVF9GX01SR19SWEJVRikpCj4gQEAgLTgxLDYgKzgyLDggQEAg
c3RydWN0IGlmY3ZmX2h3IHsKPiAgIAl2b2lkIF9faW9tZW0gKm5ldF9jZmc7Cj4gICAJc3RydWN0
IHZyaW5nX2luZm8gdnJpbmdbSUZDVkZfTUFYX1FVRVVFX1BBSVJTICogMl07Cj4gICAJdm9pZCBf
X2lvbWVtICogY29uc3QgKmJhc2U7Cj4gKwljaGFyIGNvbmZpZ19tc2l4X25hbWVbMjU2XTsKPiAr
CXN0cnVjdCB2ZHBhX2NhbGxiYWNrIGNvbmZpZ19jYjsKPiAgIH07Cj4gICAKPiAgIHN0cnVjdCBp
ZmN2Zl9hZGFwdGVyIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21h
aW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCA4ZDU0ZGM1Li5m
N2JhZWNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiAr
KysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTE4LDYgKzE4LDE2IEBA
Cj4gICAjZGVmaW5lIERSSVZFUl9BVVRIT1IgICAiSW50ZWwgQ29ycG9yYXRpb24iCj4gICAjZGVm
aW5lIElGQ1ZGX0RSSVZFUl9OQU1FICAgICAgICJpZmN2ZiIKPiAgIAo+ICtzdGF0aWMgaXJxcmV0
dXJuX3QgaWZjdmZfY29uZmlnX2NoYW5nZWQoaW50IGlycSwgdm9pZCAqYXJnKQo+ICt7Cj4gKwlz
dHJ1Y3QgaWZjdmZfaHcgKnZmID0gYXJnOwo+ICsKPiArCWlmICh2Zi0+Y29uZmlnX2NiLmNhbGxi
YWNrKQo+ICsJCXJldHVybiB2Zi0+Y29uZmlnX2NiLmNhbGxiYWNrKHZmLT5jb25maWdfY2IucHJp
dmF0ZSk7Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGly
cXJldHVybl90IGlmY3ZmX2ludHJfaGFuZGxlcihpbnQgaXJxLCB2b2lkICphcmcpCj4gICB7Cj4g
ICAJc3RydWN0IHZyaW5nX2luZm8gKnZyaW5nID0gYXJnOwo+IEBAIC0yNTYsNyArMjY2LDEwIEBA
IHN0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfc2V0X2NvbmZpZyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
cGFfZGV2LAo+ICAgc3RhdGljIHZvaWQgaWZjdmZfdmRwYV9zZXRfY29uZmlnX2NiKHN0cnVjdCB2
ZHBhX2RldmljZSAqdmRwYV9kZXYsCj4gICAJCQkJICAgICBzdHJ1Y3QgdmRwYV9jYWxsYmFjayAq
Y2IpCj4gICB7Cj4gLQkvKiBXZSBkb24ndCBzdXBwb3J0IGNvbmZpZyBpbnRlcnJ1cHQgKi8KPiAr
CXN0cnVjdCBpZmN2Zl9odyAqdmYgPSB2ZHBhX3RvX3ZmKHZkcGFfZGV2KTsKPiArCj4gKwl2Zi0+
Y29uZmlnX2NiLmNhbGxiYWNrID0gY2ItPmNhbGxiYWNrOwo+ICsJdmYtPmNvbmZpZ19jYi5wcml2
YXRlID0gY2ItPnByaXZhdGU7Cj4gICB9Cj4gICAKPiAgIC8qCj4gQEAgLTI5Miw2ICszMDUsMTMg
QEAgc3RhdGljIGludCBpZmN2Zl9yZXF1ZXN0X2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRh
cHRlcikKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+ICAgCWludCB2
ZWN0b3IsIGksIHJldCwgaXJxOwo+ICAgCj4gKwlzbnByaW50Zih2Zi0+Y29uZmlnX21zaXhfbmFt
ZSwgMjU2LCAiaWZjdmZbJXNdLWNvbmZpZ1xuIiwKPiArCQlwY2lfbmFtZShwZGV2KSk7Cj4gKwl2
ZWN0b3IgPSAwOwo+ICsJaXJxID0gcGNpX2lycV92ZWN0b3IocGRldiwgdmVjdG9yKTsKCgpOaXRw
aWNrLCB3ZSBjYW4ganVzdCB1c2UgcGNpX2lycV92ZWNvdHIocGRldiwgMCk7Cgp2ZWN0b3Igd2ls
bCBiZSByZWFzc2lnbmVkIHNvb24gOikKClRoYW5rcwoKCj4gKwlyZXQgPSBkZXZtX3JlcXVlc3Rf
aXJxKCZwZGV2LT5kZXYsIGlycSwKPiArCQkJICAgICAgIGlmY3ZmX2NvbmZpZ19jaGFuZ2VkLCAw
LAo+ICsJCQkgICAgICAgdmYtPmNvbmZpZ19tc2l4X25hbWUsIHZmKTsKPiAgIAo+ICAgCWZvciAo
aSA9IDA7IGkgPCBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyOyBpKyspIHsKPiAgIAkJc25wcmlu
dGYodmYtPnZyaW5nW2ldLm1zaXhfbmFtZSwgMjU2LCAiaWZjdmZbJXNdLSVkXG4iLAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
