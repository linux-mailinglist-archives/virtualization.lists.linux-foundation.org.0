Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB61CEBA5
	for <lists.virtualization@lfdr.de>; Tue, 12 May 2020 05:41:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD84A88395;
	Tue, 12 May 2020 03:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEjLbmlPwFV2; Tue, 12 May 2020 03:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B5A7882EE;
	Tue, 12 May 2020 03:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C6DAC016F;
	Tue, 12 May 2020 03:41:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78D29C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 03:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6E0C3882C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 03:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p64RAGB842Bi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 03:41:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4457187F6F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 03:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589254883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WZWZXE1nGez71XEyOueHoIOeCX5yLfPNsW+lHVCAeg=;
 b=dvQmfIU5iN43c1nkWKKXfauMYytRj1EWN0/h5JEVXU1pjmimb0By/zkBuelbPb93Uz16Fq
 RTbdFxlG772iEomHmL5bzTYG5q0H1mzxoY9Ci3mnWo0PqJ5/JMntZL3LlObW/0XvlZTjoJ
 iU+0KeSitadpoVacO8CFZmX5u/wadpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-0-PIybqDMpSy_6h9ah9lWg-1; Mon, 11 May 2020 23:41:19 -0400
X-MC-Unique: 0-PIybqDMpSy_6h9ah9lWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B3C18005B7;
 Tue, 12 May 2020 03:41:18 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D00F761988;
 Tue, 12 May 2020 03:41:11 +0000 (UTC)
Subject: Re: [PATCH] ifcvf: move IRQ request/free to status change handlers
To: Francesco Lavra <francescolavra.fl@gmail.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <1589181563-38400-1-git-send-email-lingshan.zhu@intel.com>
 <22d9dcdb-e790-0a68-ba41-b9530b2bf9fd@redhat.com>
 <c1da2054-eb4c-d7dd-ca83-29e85e5cfe90@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <289e3487-7ecc-6b82-35d5-3037e34c8e31@redhat.com>
Date: Tue, 12 May 2020 11:41:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c1da2054-eb4c-d7dd-ca83-29e85e5cfe90@gmail.com>
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

Ck9uIDIwMjAvNS8xMSDkuIvljYg2OjE4LCBGcmFuY2VzY28gTGF2cmEgd3JvdGU6Cj4gT24gNS8x
MS8yMCAxMToyNiBBTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC81LzExIOS4i+WN
iDM6MTksIFpodSBMaW5nc2hhbiB3cm90ZToKPj4+IFRoaXMgY29tbWl0IG1vdmUgSVJRIHJlcXVl
c3QgYW5kIGZyZWUgb3BlcmF0aW9ucyBmcm9tIHByb2JlKCkKPj4+IHRvIFZJUlRJTyBzdGF0dXMg
Y2hhbmdlIGhhbmRsZXIgdG8gY29tcGx5IHdpdGggVklSVElPIHNwZWMuCj4+Pgo+Pj4gVklSVElP
IHNwZWMgMS4xLCBzZWN0aW9uIDIuMS4yIERldmljZSBSZXF1aXJlbWVudHM6IERldmljZSBTdGF0
dXMgRmllbGQKPj4+IFRoZSBkZXZpY2UgTVVTVCBOT1QgY29uc3VtZSBidWZmZXJzIG9yIHNlbmQg
YW55IHVzZWQgYnVmZmVyCj4+PiBub3RpZmljYXRpb25zIHRvIHRoZSBkcml2ZXIgYmVmb3JlIERS
SVZFUl9PSy4KPj4KPj4KPj4gTXkgcHJldmlvdXMgZXhwbGFuYXRpb24gbWlnaHQgYmUgd3Jvbmcg
aGVyZS4gSXQgZGVwZW5kcyBvbiBob3cgeW91IAo+PiBpbXBsZW1lbnQgeW91ciBoYXJkd2FyZSwg
aWYgeW91IGhhcmR3YXJlIGd1YXJhbnRlZSB0aGF0IG5vIGludGVycnVwdCAKPj4gd2lsbCBiZSB0
cmlnZ2VyZWQgYmVmb3JlIERSSVZFUl9PSywgdGhlbiBpdCdzIGZpbmUuCj4+Cj4+IEFuZCB0aGUg
bWFpbiBnb2FsIGZvciB0aGlzIHBhdGNoIGlzIHRvIGFsbG9jYXRlIHRoZSBpbnRlcnJ1cHQgb24g
ZGVtYW5kLgo+Pgo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3No
YW4uemh1QGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3Zm
X21haW4uYyB8IDExOSAKPj4+ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyAK
Pj4+IGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+Pj4gaW5kZXggYWJmNmEwNjEu
LjRkNThiZjIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
Cj4+PiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4+PiBAQCAtMjgsNiAr
MjgsNjAgQEAgc3RhdGljIGlycXJldHVybl90IGlmY3ZmX2ludHJfaGFuZGxlcihpbnQgaXJxLCAK
Pj4+IHZvaWQgKmFyZykKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIElSUV9IQU5ETEVEOwo+Pj4gwqAg
fQo+Pj4gK3N0YXRpYyB2b2lkIGlmY3ZmX2ZyZWVfaXJxX3ZlY3RvcnModm9pZCAqZGF0YSkKPj4+
ICt7Cj4+PiArwqDCoMKgIHBjaV9mcmVlX2lycV92ZWN0b3JzKGRhdGEpOwo+Pj4gK30KPj4+ICsK
Pj4+ICtzdGF0aWMgdm9pZCBpZmN2Zl9mcmVlX2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRh
cHRlciwgaW50IHF1ZXVlcykKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gYWRhcHRlci0+cGRldjsKPj4+ICvCoMKgwqAgc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFw
dGVyLT52ZjsKPj4+ICvCoMKgwqAgaW50IGk7Cj4+PiArCj4+PiArCj4+PiArwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBxdWV1ZXM7IGkrKykKPj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZtX2ZyZWVfaXJx
KCZwZGV2LT5kZXYsIHZmLT52cmluZ1tpXS5pcnEsICZ2Zi0+dnJpbmdbaV0pOwo+Pj4gKwo+Pj4g
K8KgwqDCoCBpZmN2Zl9mcmVlX2lycV92ZWN0b3JzKHBkZXYpOwo+Pj4gK30KPj4+ICsKPj4+ICtz
dGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVy
KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFwdGVyLT5wZGV2
Owo+Pj4gK8KgwqDCoCBzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+Pj4gK8Kg
wqDCoCBpbnQgdmVjdG9yLCBpLCByZXQsIGlycTsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0ID0gcGNp
X2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsIElGQ1ZGX01BWF9JTlRSLAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElGQ1ZGX01BWF9JTlRSLCBQQ0lfSVJRX01TSVgp
Owo+Pj4gK8KgwqDCoCBpZiAocmV0IDwgMCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIElGQ1ZGX0VS
UihwZGV2LCAiRmFpbGVkIHRvIGFsbG9jIElSUSB2ZWN0b3JzXG4iKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gcmV0Owo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyOyBpKyspIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBzbnByaW50Zih2Zi0+dnJpbmdbaV0ubXNpeF9uYW1lLCAyNTYsICJpZmN2Zlslc10tJWRc
biIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9uYW1lKHBkZXYpLCBpKTsKPj4+
ICvCoMKgwqDCoMKgwqDCoCB2ZWN0b3IgPSBpICsgSUZDVkZfTVNJX1FVRVVFX09GRjsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCB2ZWN0b3IpOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaXJxLAo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmY3ZmX2ludHJf
aGFuZGxlciwgMCwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2Zi0+dnJpbmdbaV0ubXNpeF9uYW1lLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZ2Zi0+dnJpbmdbaV0pOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChyZXQpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElGQ1ZGX0VSUihwZGV2LAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkZhaWxlZCB0byByZXF1ZXN0
IGlycSBmb3IgdnEgJWRcbiIsIGkpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWZjdmZf
ZnJlZV9pcnEoYWRhcHRlciwgaSk7Cj4+Cj4+Cj4+IEknbSBub3Qgc3VyZSB0aGlzIHVud2luZCBp
cyBjb3JyZWN0LiBJdCBsb29rcyBsaWtlIHdlIHNob3VsZCBsb29wIGFuZCAKPj4gY2FsbCBkZXZt
X2ZyZWVfaXJxKCkgZm9yIHZpcnRxdWV1ZSBbMCwgaSk7Cj4KPiBUaGF0J3MgZXhhY3RseSB3aGF0
IHRoZSBjb2RlIGRvZXM6IGlmY3ZmX2ZyZWVfaXJxKCkgY29udGFpbnMgYSAoaSA9IDA7IAo+IGkg
PCBxdWV1ZXM7IGkrKykgbG9vcCwgYW5kIGhlcmUgdGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRo
IHRoZSAKPiBgcXVldWVzYCBhcmd1bWVudCBzZXQgdG8gYGlgLgo+CgpPaCByaWdodC4KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
