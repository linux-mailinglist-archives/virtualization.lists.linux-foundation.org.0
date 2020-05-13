Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC01D05D3
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 06:12:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC2D388847;
	Wed, 13 May 2020 04:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bpv+XzL6Zetx; Wed, 13 May 2020 04:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C20DB8885E;
	Wed, 13 May 2020 04:12:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1863C016F;
	Wed, 13 May 2020 04:12:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EFFCC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 04:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 78303204BF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 04:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJibvIX6gvbV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 04:12:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id D4703204A6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 04:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589343133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFMNhtVPuv906gLl9sa3StnSPuNaMYBoacPzdy9DO50=;
 b=HQtUF7mUVkkzXAB4oPbO5cIFOTtkqjmUqGhKw18rVd70GwdlbI/Kt+Vie0yx0R53R0lxHC
 e/hQBqCYvWAa9gXDQ3uzr4aMObQLAfyYnc7j89xr8Y6d8V+zzMWk4BP16v5f0joReM6Gcl
 gEQCc6Kj+wGzKFU8L3mejTThy2CfTfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-trGUjsymPEWOpe8TrPlrpg-1; Wed, 13 May 2020 00:12:09 -0400
X-MC-Unique: trGUjsymPEWOpe8TrPlrpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E22E2BFC1;
 Wed, 13 May 2020 04:12:07 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E996160C47;
 Wed, 13 May 2020 04:12:01 +0000 (UTC)
Subject: Re: [PATCH V2] ifcvf: move IRQ request/free to status change handlers
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1589270444-3669-1-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8aca85c3-3bf6-a1ec-7009-cd9a635647d7@redhat.com>
Date: Wed, 13 May 2020 12:12:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589270444-3669-1-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNS8xMiDkuIvljYg0OjAwLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgbW92ZSBJUlEgcmVxdWVzdCBhbmQgZnJlZSBvcGVyYXRpb25zIGZyb20gcHJvYmUoKQo+IHRv
IFZJUlRJTyBzdGF0dXMgY2hhbmdlIGhhbmRsZXIgdG8gY29tcGx5IHdpdGggVklSVElPIHNwZWMu
Cj4KPiBWSVJUSU8gc3BlYyAxLjEsIHNlY3Rpb24gMi4xLjIgRGV2aWNlIFJlcXVpcmVtZW50czog
RGV2aWNlIFN0YXR1cyBGaWVsZAo+IFRoZSBkZXZpY2UgTVVTVCBOT1QgY29uc3VtZSBidWZmZXJz
IG9yIHNlbmQgYW55IHVzZWQgYnVmZmVyCj4gbm90aWZpY2F0aW9ucyB0byB0aGUgZHJpdmVyIGJl
Zm9yZSBEUklWRVJfT0suCgoKVGhpcyBjb21tZW50IG5lZWRzIHRvIGJlIGNoZWNrZWQgYXMgSSBz
YWlkIHByZXZpb3VzbHkuIEl0J3Mgb25seSBuZWVkZWQgCmlmIHdlJ3JlIHN1cmUgaWZjdmYgY2Fu
IGdlbmVyYXRlIGludGVycnVwdCBiZWZvcmUgRFJJVkVSX09LLgoKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+Cj4gLS0tCj4gY2hhbmdlcyBm
cm9tIFYxOgo+IHJlbW92ZSBpZmN2Zl9zdG9wX2RhdGFwYXRoKCkgaW4gc3RhdHVzID09IDAgaGFu
ZGxlciwgd2UgZG9uJ3QgbmVlZCB0byBkbyB0aGlzCj4gdHdpY2U7IGhhbmRsZSBzdGF0dXMgPT0g
MCBhZnRlciBEUklWRVJfT0sgLT4gIURSSVZFUl9PSyBoYW5kbGVyIChKYXNvbiBXYW5nKQoKClBh
dGNoIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCB3aXRoIHRoaXMgcGF0Y2ggcGluZyBjYW5ub3Qgd29y
ayBvbiBteSAKbWFjaGluZS4gKEl0IHdvcmtzIHdpdGhvdXQgdGhpcyBwYXRjaCkuCgpUaGFua3MK
Cgo+Cj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgMTIwICsrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNl
cnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfbWFpbi5jIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IGlu
ZGV4IGFiZjZhMDYxLi5kNTI5ZWQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9p
ZmN2Zl9tYWluLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAg
LTI4LDYgKzI4LDYwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpZmN2Zl9pbnRyX2hhbmRsZXIoaW50
IGlycSwgdm9pZCAqYXJnKQo+ICAgCXJldHVybiBJUlFfSEFORExFRDsKPiAgIH0KPiAgIAo+ICtz
dGF0aWMgdm9pZCBpZmN2Zl9mcmVlX2lycV92ZWN0b3JzKHZvaWQgKmRhdGEpCj4gK3sKPiArCXBj
aV9mcmVlX2lycV92ZWN0b3JzKGRhdGEpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBpZmN2Zl9m
cmVlX2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlciwgaW50IHF1ZXVlcykKPiArewo+
ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFwdGVyLT5wZGV2Owo+ICsJc3RydWN0IGlmY3Zm
X2h3ICp2ZiA9ICZhZGFwdGVyLT52ZjsKPiArCWludCBpOwo+ICsKPiArCj4gKwlmb3IgKGkgPSAw
OyBpIDwgcXVldWVzOyBpKyspCj4gKwkJZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCB2Zi0+dnJp
bmdbaV0uaXJxLCAmdmYtPnZyaW5nW2ldKTsKPiArCj4gKwlpZmN2Zl9mcmVlX2lycV92ZWN0b3Jz
KHBkZXYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBp
ZmN2Zl9hZGFwdGVyICphZGFwdGVyKQo+ICt7Cj4gKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGFk
YXB0ZXItPnBkZXY7Cj4gKwlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+ICsJ
aW50IHZlY3RvciwgaSwgcmV0LCBpcnE7Cj4gKwo+ICsJcmV0ID0gcGNpX2FsbG9jX2lycV92ZWN0
b3JzKHBkZXYsIElGQ1ZGX01BWF9JTlRSLAo+ICsJCQkJICAgIElGQ1ZGX01BWF9JTlRSLCBQQ0lf
SVJRX01TSVgpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlJRkNWRl9FUlIocGRldiwgIkZhaWxl
ZCB0byBhbGxvYyBJUlEgdmVjdG9yc1xuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4g
Kwlmb3IgKGkgPSAwOyBpIDwgSUZDVkZfTUFYX1FVRVVFX1BBSVJTICogMjsgaSsrKSB7Cj4gKwkJ
c25wcmludGYodmYtPnZyaW5nW2ldLm1zaXhfbmFtZSwgMjU2LCAiaWZjdmZbJXNdLSVkXG4iLAo+
ICsJCQkgcGNpX25hbWUocGRldiksIGkpOwo+ICsJCXZlY3RvciA9IGkgKyBJRkNWRl9NU0lfUVVF
VUVfT0ZGOwo+ICsJCWlycSA9IHBjaV9pcnFfdmVjdG9yKHBkZXYsIHZlY3Rvcik7Cj4gKwkJcmV0
ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsCj4gKwkJCQkgICAgICAgaWZjdmZf
aW50cl9oYW5kbGVyLCAwLAo+ICsJCQkJICAgICAgIHZmLT52cmluZ1tpXS5tc2l4X25hbWUsCj4g
KwkJCQkgICAgICAgJnZmLT52cmluZ1tpXSk7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlJRkNWRl9F
UlIocGRldiwKPiArCQkJCSAgIkZhaWxlZCB0byByZXF1ZXN0IGlycSBmb3IgdnEgJWRcbiIsIGkp
Owo+ICsJCQlpZmN2Zl9mcmVlX2lycShhZGFwdGVyLCBpKTsKPiArCj4gKwkJCXJldHVybiByZXQ7
Cj4gKwkJfQo+ICsKPiArCQl2Zi0+dnJpbmdbaV0uaXJxID0gaXJxOwo+ICsJfQo+ICsKPiArCXJl
dHVybiAwOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCBpZmN2Zl9zdGFydF9kYXRhcGF0aCh2b2lk
ICpwcml2YXRlKQo+ICAgewo+ICAgCXN0cnVjdCBpZmN2Zl9odyAqdmYgPSBpZmN2Zl9wcml2YXRl
X3RvX3ZmKHByaXZhdGUpOwo+IEBAIC0xMTgsMTcgKzE3MiwzNCBAQCBzdGF0aWMgdm9pZCBpZmN2
Zl92ZHBhX3NldF9zdGF0dXMoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTggc3RhdHVz
KQo+ICAgewo+ICAgCXN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVyOwo+ICAgCXN0cnVjdCBp
ZmN2Zl9odyAqdmY7Cj4gKwl1OCBzdGF0dXNfb2xkOwo+ICsJaW50IHJldDsKPiAgIAo+ICAgCXZm
ICA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICAgCWFkYXB0ZXIgPSBkZXZfZ2V0X2RydmRhdGEo
dmRwYV9kZXYtPmRldi5wYXJlbnQpOwo+ICsJc3RhdHVzX29sZCA9IGlmY3ZmX2dldF9zdGF0dXMo
dmYpOwo+ICAgCj4gLQlpZiAoc3RhdHVzID09IDApIHsKPiArCWlmICgoc3RhdHVzX29sZCAmIFZJ
UlRJT19DT05GSUdfU19EUklWRVJfT0spICYmCj4gKwkgICAgIShzdGF0dXMgJiBWSVJUSU9fQ09O
RklHX1NfRFJJVkVSX09LKSkgewo+ICAgCQlpZmN2Zl9zdG9wX2RhdGFwYXRoKGFkYXB0ZXIpOwo+
ICsJCWlmY3ZmX2ZyZWVfaXJxKGFkYXB0ZXIsIElGQ1ZGX01BWF9RVUVVRV9QQUlSUyAqIDIpOwo+
ICsJfQo+ICsKPiArCWlmIChzdGF0dXMgPT0gMCkgewo+ICAgCQlpZmN2Zl9yZXNldF92cmluZyhh
ZGFwdGVyKTsKPiAgIAkJcmV0dXJuOwo+ICAgCX0KPiAgIAo+IC0JaWYgKHN0YXR1cyAmIFZJUlRJ
T19DT05GSUdfU19EUklWRVJfT0spIHsKPiArCWlmICgoc3RhdHVzICYgVklSVElPX0NPTkZJR19T
X0RSSVZFUl9PSykgJiYKPiArCSAgICAhKHN0YXR1c19vbGQgJiBWSVJUSU9fQ09ORklHX1NfRFJJ
VkVSX09LKSkgewo+ICsJCXJldCA9IGlmY3ZmX3JlcXVlc3RfaXJxKGFkYXB0ZXIpOwo+ICsJCWlm
IChyZXQpIHsKPiArCQkJc3RhdHVzID0gaWZjdmZfZ2V0X3N0YXR1cyh2Zik7Cj4gKwkJCXN0YXR1
cyB8PSBWSVJUSU9fQ09ORklHX1NfRkFJTEVEOwo+ICsJCQlpZmN2Zl9zZXRfc3RhdHVzKHZmLCBz
dGF0dXMpOwo+ICsJCQlyZXR1cm47Cj4gKwkJfQo+ICsKPiAgIAkJaWYgKGlmY3ZmX3N0YXJ0X2Rh
dGFwYXRoKGFkYXB0ZXIpIDwgMCkKPiAgIAkJCUlGQ1ZGX0VSUihhZGFwdGVyLT5wZGV2LAo+ICAg
CQkJCSAgIkZhaWxlZCB0byBzZXQgaWZjdmYgdmRwYSAgc3RhdHVzICV1XG4iLAo+IEBAIC0yODQs
MzggKzM1NSw2IEBAIHN0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfc2V0X2NvbmZpZ19jYihzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkcGFfZGV2LAo+ICAgCS5zZXRfY29uZmlnX2NiICA9IGlmY3ZmX3ZkcGFf
c2V0X2NvbmZpZ19jYiwKPiAgIH07Cj4gICAKPiAtc3RhdGljIGludCBpZmN2Zl9yZXF1ZXN0X2ly
cShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlcikKPiAtewo+IC0Jc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSBhZGFwdGVyLT5wZGV2Owo+IC0Jc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFwdGVy
LT52ZjsKPiAtCWludCB2ZWN0b3IsIGksIHJldCwgaXJxOwo+IC0KPiAtCj4gLQlmb3IgKGkgPSAw
OyBpIDwgSUZDVkZfTUFYX1FVRVVFX1BBSVJTICogMjsgaSsrKSB7Cj4gLQkJc25wcmludGYodmYt
PnZyaW5nW2ldLm1zaXhfbmFtZSwgMjU2LCAiaWZjdmZbJXNdLSVkXG4iLAo+IC0JCQkgcGNpX25h
bWUocGRldiksIGkpOwo+IC0JCXZlY3RvciA9IGkgKyBJRkNWRl9NU0lfUVVFVUVfT0ZGOwo+IC0J
CWlycSA9IHBjaV9pcnFfdmVjdG9yKHBkZXYsIHZlY3Rvcik7Cj4gLQkJcmV0ID0gZGV2bV9yZXF1
ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsCj4gLQkJCQkgICAgICAgaWZjdmZfaW50cl9oYW5kbGVy
LCAwLAo+IC0JCQkJICAgICAgIHZmLT52cmluZ1tpXS5tc2l4X25hbWUsCj4gLQkJCQkgICAgICAg
JnZmLT52cmluZ1tpXSk7Cj4gLQkJaWYgKHJldCkgewo+IC0JCQlJRkNWRl9FUlIocGRldiwKPiAt
CQkJCSAgIkZhaWxlZCB0byByZXF1ZXN0IGlycSBmb3IgdnEgJWRcbiIsIGkpOwo+IC0JCQlyZXR1
cm4gcmV0Owo+IC0JCX0KPiAtCQl2Zi0+dnJpbmdbaV0uaXJxID0gaXJxOwo+IC0JfQo+IC0KPiAt
CXJldHVybiAwOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBpZmN2Zl9mcmVlX2lycV92ZWN0b3Jz
KHZvaWQgKmRhdGEpCj4gLXsKPiAtCXBjaV9mcmVlX2lycV92ZWN0b3JzKGRhdGEpOwo+IC19Cj4g
LQo+ICAgc3RhdGljIGludCBpZmN2Zl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qg
c3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+ICAgewo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Cj4gQEAgLTM0OSwxMyArMzg4LDYgQEAgc3RhdGljIGludCBpZmN2Zl9wcm9i
ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+
ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gcGNpX2FsbG9jX2lycV92ZWN0
b3JzKHBkZXYsIElGQ1ZGX01BWF9JTlRSLAo+IC0JCQkJICAgIElGQ1ZGX01BWF9JTlRSLCBQQ0lf
SVJRX01TSVgpOwo+IC0JaWYgKHJldCA8IDApIHsKPiAtCQlJRkNWRl9FUlIocGRldiwgIkZhaWxl
ZCB0byBhbGxvYyBpcnEgdmVjdG9yc1xuIik7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4g
ICAJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgaWZjdmZfZnJlZV9pcnFfdmVj
dG9ycywgcGRldik7Cj4gICAJaWYgKHJldCkgewo+ICAgCQlJRkNWRl9FUlIocGRldiwKPiBAQCAt
Mzc5LDEyICs0MTEsNiBAQCBzdGF0aWMgaW50IGlmY3ZmX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4gICAJYWRhcHRlci0+cGRldiA9
IHBkZXY7Cj4gICAJYWRhcHRlci0+dmRwYS5kbWFfZGV2ID0gJnBkZXYtPmRldjsKPiAgIAo+IC0J
cmV0ID0gaWZjdmZfcmVxdWVzdF9pcnEoYWRhcHRlcik7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJSUZD
VkZfRVJSKHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBNU0ktWCBpcnFcbiIpOwo+IC0JCWdvdG8g
ZXJyOwo+IC0JfQo+IC0KPiAgIAlyZXQgPSBpZmN2Zl9pbml0X2h3KHZmLCBwZGV2KTsKPiAgIAlp
ZiAocmV0KSB7Cj4gICAJCUlGQ1ZGX0VSUihwZGV2LCAiRmFpbGVkIHRvIGluaXQgSUZDVkYgaHdc
biIpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
