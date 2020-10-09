Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDF2880E7
	for <lists.virtualization@lfdr.de>; Fri,  9 Oct 2020 05:57:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71E33875EE;
	Fri,  9 Oct 2020 03:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbJeu9BHZ8Ht; Fri,  9 Oct 2020 03:57:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F7B9875EA;
	Fri,  9 Oct 2020 03:57:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E48AC0051;
	Fri,  9 Oct 2020 03:57:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EFE0C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 228FD874B9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mveM5mmMtvSc
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 124918748A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 03:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602215848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uo7BVuO5nWq7vRp+Q6BR8DRA9qJtxjDgxial76TpnbI=;
 b=IM/5HUECvPATIsWu7Ylx3NPPB5EbUZ0qNyywcxpn5NcGMQgHddlFHqnBlB2Y5ZmM+diL9f
 je24znWY3odK0GrNMu+cz6CCIflMIOzlbSgYS1HClL0AEn5yxavQk/BzISEJxuacXuBj7z
 oo4vWRkaPEFU4aEH9vSi3rHX6EZQ+KE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-I6MnL823NTCeUzAiJitfyQ-1; Thu, 08 Oct 2020 23:57:27 -0400
X-MC-Unique: I6MnL823NTCeUzAiJitfyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1AF387950C;
 Fri,  9 Oct 2020 03:57:25 +0000 (UTC)
Received: from [10.72.13.133] (ovpn-13-133.pek2.redhat.com [10.72.13.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 796DC5C1BD;
 Fri,  9 Oct 2020 03:56:52 +0000 (UTC)
Subject: Re: [RFC PATCH 10/24] vdpa: introduce config operations for
 associating ASID to a virtqueue group
To: Eli Cohen <elic@nvidia.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
 <20200924032125.18619-11-jasowang@redhat.com>
 <20201001132927.GC32363@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <70af3ff0-74ed-e519-56f5-d61e6a48767f@redhat.com>
Date: Fri, 9 Oct 2020 11:56:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001132927.GC32363@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvMTAvMSDkuIvljYg5OjI5LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjQsIDIwMjAgYXQgMTE6MjE6MTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGJ1cyBvcGVyYXRpb24gdG8gYWxsb3cgdGhlIHZEUEEgYnVz
IGRyaXZlcgo+PiB0byBhc3NvY2lhdGUgYW4gQVNJRCB0byBhIHZpcnRxdWV1ZSBncm91cC4KPj4K
PiBTbyBpbiBjYXNlIG9mIHZpcnRpb19uZXQsIEkgd291bGQgZXhwZWN0IHRoYXQgYWxsIHRoZSBk
YXRhIHZpcnRxdWV1ZXMKPiB3aWxsIGJlIGFzc29jaWF0ZWQgd2l0aCB0aGUgc2FtZSBhZGRyZXNz
IHNwYWNlIGlkZW50aWZpZXIuCgoKUmlnaHQuCgpJIHdpbGwgYWRkIHRoZSBjb2RlcyB0byBkbyB0
aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uIEl0IHNob3VsZCBiZSBtb3JlIApleHBsaWNpdCB0aGFu
IGhhdmUgdGhpcyBhc3N1bXB0aW9uIGJ5IGRlZmF1bHQuCgoKPiBNb3Jlb3ZlciwKPiB0aGlzIGFz
c2lnbm1lbnQgc2hvdWxkIGJlIHByb3ZpZGVkIGJlZm9yZSB0aGUgc2V0X21hcCBjYWxsIHRoYXQg
cHJvdmlkZXMKPiB0aGUgaW90bGIgZm9yIHRoZSBhZGRyZXNzIHNwYWNlLCBjb3JyZWN0PwoKCkkg
dGhpbmsgaXQncyBiZXR0ZXIgbm90IGhhdmUgdGhpcyBsaW1pdGF0aW9uLCBub3RlIHRoYXQgc2V0
X21hcCgpIG5vdyAKdGFrZXMgYSBhc2lkIGFyZ3VtZW50LgoKU28gZm9yIGhhcmR3YXJlIGlmIHRo
ZSBhc3NvY2lhdGVkIGFzIGlzIGNoYW5nZWQsIHRoZSBkcml2ZXIgbmVlZHMgdG8gCnByb2dyYW0g
dGhlIGhhcmR3YXJlIHRvIHN3aXRjaCB0byB0aGUgbmV3IG1hcHBpbmcuCgpEb2VzIHRoaXMgd29y
ayBmb3IgbWx4NT8KCgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDEwICsrKysrKysrKysK
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC92ZHBhLmggYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+PiBpbmRleCAxZTEx
NjNkYWEzNTIuLmUyMzk0OTk1YTNjZCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC92ZHBh
LmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPj4gQEAgLTE2MCw2ICsxNjAsMTIgQEAg
c3RydWN0IHZkcGFfZGV2aWNlIHsKPj4gICAgKiBAZ2V0X2dlbmVyYXRpb246CQlHZXQgZGV2aWNl
IGNvbmZpZyBnZW5lcmF0aW9uIChvcHRpb25hbCkKPj4gICAgKgkJCQlAdmRldjogdmRwYSBkZXZp
Y2UKPj4gICAgKgkJCQlSZXR1cm5zIHUzMjogZGV2aWNlIGdlbmVyYXRpb24KPj4gKyAqIEBzZXRf
Z3JvdXBfYXNpZDoJCVNldCBhZGRyZXNzIHNwYWNlIGlkZW50aWZpZXIgZm9yIGEKPj4gKyAqCQkJ
CXZpcnRxdWV1ZSBncm91cAo+PiArICoJCQkJQHZkZXY6IHZkcGEgZGV2aWNlCj4+ICsgKgkJCQlA
Z3JvdXA6IHZpcnRxdWV1ZSBncm91cAo+PiArICoJCQkJQGFzaWQ6IGFkZHJlc3Mgc3BhY2UgaWQg
Zm9yIHRoaXMgZ3JvdXAKPj4gKyAqCQkJCVJldHVybnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3Ig
ZXJyb3IgKDwgMCkKPj4gICAgKiBAc2V0X21hcDoJCQlTZXQgZGV2aWNlIG1lbW9yeSBtYXBwaW5n
IChvcHRpb25hbCkKPj4gICAgKgkJCQlOZWVkZWQgZm9yIGRldmljZSB0aGF0IHVzaW5nIGRldmlj
ZQo+PiAgICAqCQkJCXNwZWNpZmljIERNQSB0cmFuc2xhdGlvbiAob24tY2hpcCBJT01NVSkKPj4g
QEAgLTIzNyw2ICsyNDMsMTAgQEAgc3RydWN0IHZkcGFfY29uZmlnX29wcyB7Cj4+ICAgCQkgICAg
ICAgdTY0IGlvdmEsIHU2NCBzaXplLCB1NjQgcGEsIHUzMiBwZXJtKTsKPj4gICAJaW50ICgqZG1h
X3VubWFwKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBhc2lkLAo+PiAg
IAkJCSB1NjQgaW92YSwgdTY0IHNpemUpOwo+PiArCWludCAoKnNldF9ncm91cF9hc2lkKShzdHJ1
Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBncm91cCwKPj4gKwkJCSAgICAgIHVu
c2lnbmVkIGludCBhc2lkKTsKPj4gKwo+PiArCj4gRXh0cmEgc3BhY2UKCgpXaWxsIGZpeC4KClRo
YW5rcwoKCj4+ICAgCj4+ICAgCS8qIEZyZWUgZGV2aWNlIHJlc291cmNlcyAqLwo+PiAgIAl2b2lk
ICgqZnJlZSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPj4gLS0gCj4+IDIuMjAuMQo+PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
