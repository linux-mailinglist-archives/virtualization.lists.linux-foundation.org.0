Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A272FCB03
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 07:25:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CA3186292;
	Wed, 20 Jan 2021 06:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b08hw+9+k7fk; Wed, 20 Jan 2021 06:25:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4CDAF862ED;
	Wed, 20 Jan 2021 06:25:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0211CC088B;
	Wed, 20 Jan 2021 06:25:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F36FDC088B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 06:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E367120480
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 06:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thiuDDYZHwL5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 06:24:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 308E4203E8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611123896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDA4xwYeepwFlkHJwgrw6oW3JHghWeOFqqsJlNpUR/Q=;
 b=AZLHiGfn4HlK/5EjtMm5InIPxAQ8IIiLKc2TUHuhpUF3Mu6El8B5ooEMLBRU1xxhlRebp4
 x5rSa6TOX4xQ1OQadbV3JiwsJduoHb+1qD+LYD9PzBAYNrVszm8jinLPyCiYEczX5+v+Lq
 SE9/kTF80KqWqVfkGeZiF2PQwvOYmcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-wjWc5C-GNYGX9unYD_fSZg-1; Wed, 20 Jan 2021 01:24:54 -0500
X-MC-Unique: wjWc5C-GNYGX9unYD_fSZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 198978015C6;
 Wed, 20 Jan 2021 06:24:52 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79BE25D9DD;
 Wed, 20 Jan 2021 06:24:40 +0000 (UTC)
Subject: Re: [RFC v3 06/11] vhost-vdpa: Add an opaque pointer for vhost IOTLB
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 bob.liu@oracle.com, hch@infradead.org, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net
References: <20210119045920.447-1-xieyongji@bytedance.com>
 <20210119045920.447-7-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <455fe36a-23a2-5720-a721-8ae46515186b@redhat.com>
Date: Wed, 20 Jan 2021 14:24:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119045920.447-7-xieyongji@bytedance.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-aio@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjEvMS8xOSDkuIvljYgxMjo1OSwgWGllIFlvbmdqaSB3cm90ZToKPiBBZGQgYW4gb3Bh
cXVlIHBvaW50ZXIgZm9yIHZob3N0IElPVExCIHRvIHN0b3JlIHRoZQo+IGNvcnJlc3BvbmRpbmcg
dm1hLT52bV9maWxlIGFuZCBvZmZzZXQgb24gdGhlIERNQSBtYXBwaW5nLgoKCkxldCdzIHNwbGl0
IHRoZSBwYXRjaCBpbnRvIHR3by4KCjEpIG9wYXF1ZSBwb2ludGVyCjIpIHZtYSBzdHVmZnMKCgo+
Cj4gSXQgd2lsbCBiZSB1c2VkIGluIFZEVVNFIGNhc2UgbGF0ZXIuCj4KPiBTdWdnZXN0ZWQtYnk6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWGllIFlv
bmdqaSA8eGlleW9uZ2ppQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvdmRw
YV9zaW0vdmRwYV9zaW0uYyB8IDExICsrKystLS0KPiAgIGRyaXZlcnMvdmhvc3QvaW90bGIuYyAg
ICAgICAgICAgIHwgIDUgKystCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICAgICAgICB8
IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgIGRyaXZlcnMv
dmhvc3Qvdmhvc3QuYyAgICAgICAgICAgIHwgIDQgKy0tCj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEu
aCAgICAgICAgICAgICB8ICAzICstCj4gICBpbmNsdWRlL2xpbnV4L3Zob3N0X2lvdGxiLmggICAg
ICB8ICA4ICsrKystCj4gICA2IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3Np
bS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiBpbmRleCAwM2M3OTY4NzNh
NmIuLjFmZmNlZjY3OTU0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRw
YV9zaW0uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gQEAgLTI3
OSw3ICsyNzksNyBAQCBzdGF0aWMgZG1hX2FkZHJfdCB2ZHBhc2ltX21hcF9wYWdlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAJICovCj4gICAJc3Bpbl9sb2NrKCZ2
ZHBhc2ltLT5pb21tdV9sb2NrKTsKPiAgIAlyZXQgPSB2aG9zdF9pb3RsYl9hZGRfcmFuZ2UoaW9t
bXUsIHBhLCBwYSArIHNpemUgLSAxLAo+IC0JCQkJICAgIHBhLCBkaXJfdG9fcGVybShkaXIpKTsK
PiArCQkJCSAgICBwYSwgZGlyX3RvX3Blcm0oZGlyKSwgTlVMTCk7CgoKTWF5YmUgaXRzIGJldHRl
ciB0byBpbnRyb2R1Y2UKCnZob3N0X2lvdGxiX2FkZF9yYW5nZV9jdHgoKSB3aGljaCBjYW4gYWNj
ZXB0cyB0aGUgb3BhcXVlIChjb250ZXh0KS4gQW5kIApsZXQgdmhvc3RfaW90bGJfYWRkX3Jhbmdl
KCkganVzdCBjYWxsIHRoYXQuCgoKPiAgIAlzcGluX3VubG9jaygmdmRwYXNpbS0+aW9tbXVfbG9j
ayk7Cj4gICAJaWYgKHJldCkKPiAgIAkJcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwo+IEBAIC0z
MTcsNyArMzE3LDcgQEAgc3RhdGljIHZvaWQgKnZkcGFzaW1fYWxsb2NfY29oZXJlbnQoc3RydWN0
IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgIAo+ICAgCQlyZXQgPSB2aG9zdF9pb3RsYl9h
ZGRfcmFuZ2UoaW9tbXUsICh1NjQpcGEsCj4gICAJCQkJCSAgICAodTY0KXBhICsgc2l6ZSAtIDEs
Cj4gLQkJCQkJICAgIHBhLCBWSE9TVF9NQVBfUlcpOwo+ICsJCQkJCSAgICBwYSwgVkhPU1RfTUFQ
X1JXLCBOVUxMKTsKPiAgIAkJaWYgKHJldCkgewo+ICAgCQkJKmRtYV9hZGRyID0gRE1BX01BUFBJ
TkdfRVJST1I7Cj4gICAJCQlrZnJlZShhZGRyKTsKPiBAQCAtNjI1LDcgKzYyNSw4IEBAIHN0YXRp
YyBpbnQgdmRwYXNpbV9zZXRfbWFwKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSwKPiAgIAlmb3Ig
KG1hcCA9IHZob3N0X2lvdGxiX2l0cmVlX2ZpcnN0KGlvdGxiLCBzdGFydCwgbGFzdCk7IG1hcDsK
PiAgIAkgICAgIG1hcCA9IHZob3N0X2lvdGxiX2l0cmVlX25leHQobWFwLCBzdGFydCwgbGFzdCkp
IHsKPiAgIAkJcmV0ID0gdmhvc3RfaW90bGJfYWRkX3JhbmdlKHZkcGFzaW0tPmlvbW11LCBtYXAt
PnN0YXJ0LAo+IC0JCQkJCSAgICBtYXAtPmxhc3QsIG1hcC0+YWRkciwgbWFwLT5wZXJtKTsKPiAr
CQkJCQkgICAgbWFwLT5sYXN0LCBtYXAtPmFkZHIsCj4gKwkJCQkJICAgIG1hcC0+cGVybSwgTlVM
TCk7Cj4gICAJCWlmIChyZXQpCj4gICAJCQlnb3RvIGVycjsKPiAgIAl9Cj4gQEAgLTYzOSwxNCAr
NjQwLDE0IEBAIHN0YXRpYyBpbnQgdmRwYXNpbV9zZXRfbWFwKHN0cnVjdCB2ZHBhX2RldmljZSAq
dmRwYSwKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCB2ZHBhc2ltX2RtYV9tYXAoc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhLCB1NjQgaW92YSwgdTY0IHNpemUsCj4gLQkJCSAgIHU2NCBwYSwgdTMy
IHBlcm0pCj4gKwkJCSAgIHU2NCBwYSwgdTMyIHBlcm0sIHZvaWQgKm9wYXF1ZSkKPiAgIHsKPiAg
IAlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2ltKHZkcGEpOwo+ICAgCWludCBy
ZXQ7Cj4gICAKPiAgIAlzcGluX2xvY2soJnZkcGFzaW0tPmlvbW11X2xvY2spOwo+ICAgCXJldCA9
IHZob3N0X2lvdGxiX2FkZF9yYW5nZSh2ZHBhc2ltLT5pb21tdSwgaW92YSwgaW92YSArIHNpemUg
LSAxLCBwYSwKPiAtCQkJCSAgICBwZXJtKTsKPiArCQkJCSAgICBwZXJtLCBOVUxMKTsKPiAgIAlz
cGluX3VubG9jaygmdmRwYXNpbS0+aW9tbXVfbG9jayk7Cj4gICAKPiAgIAlyZXR1cm4gcmV0Owo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L2lvdGxiLmMgYi9kcml2ZXJzL3Zob3N0L2lvdGxi
LmMKPiBpbmRleCAwZmQzZjg3ZTkxM2MuLjNiZDViZDA2Y2RiYyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3Zob3N0L2lvdGxiLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L2lvdGxiLmMKPiBAQCAtNDIs
MTMgKzQyLDE1IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHZob3N0X2lvdGxiX21hcF9mcmVlKTsKPiAg
ICAqIEBsYXN0OiBsYXN0IG9mIElPVkEgcmFuZ2UKPiAgICAqIEBhZGRyOiB0aGUgYWRkcmVzcyB0
aGF0IGlzIG1hcHBlZCB0byBAc3RhcnQKPiAgICAqIEBwZXJtOiBhY2Nlc3MgcGVybWlzc2lvbiBv
ZiB0aGlzIHJhbmdlCj4gKyAqIEBvcGFxdWU6IHRoZSBvcGFxdWUgcG9pbnRlciBmb3IgdGhlIElP
VExCIG1hcHBpbmcKPiAgICAqCj4gICAgKiBSZXR1cm5zIGFuIGVycm9yIGxhc3QgaXMgc21hbGxl
ciB0aGFuIHN0YXJ0IG9yIG1lbW9yeSBhbGxvY2F0aW9uCj4gICAgKiBmYWlscwo+ICAgICovCj4g
ICBpbnQgdmhvc3RfaW90bGJfYWRkX3JhbmdlKHN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIsCj4g
ICAJCQkgIHU2NCBzdGFydCwgdTY0IGxhc3QsCj4gLQkJCSAgdTY0IGFkZHIsIHVuc2lnbmVkIGlu
dCBwZXJtKQo+ICsJCQkgIHU2NCBhZGRyLCB1bnNpZ25lZCBpbnQgcGVybSwKPiArCQkJICB2b2lk
ICpvcGFxdWUpCj4gICB7Cj4gICAJc3RydWN0IHZob3N0X2lvdGxiX21hcCAqbWFwOwo+ICAgCj4g
QEAgLTcxLDYgKzczLDcgQEAgaW50IHZob3N0X2lvdGxiX2FkZF9yYW5nZShzdHJ1Y3Qgdmhvc3Rf
aW90bGIgKmlvdGxiLAo+ICAgCW1hcC0+bGFzdCA9IGxhc3Q7Cj4gICAJbWFwLT5hZGRyID0gYWRk
cjsKPiAgIAltYXAtPnBlcm0gPSBwZXJtOwo+ICsJbWFwLT5vcGFxdWUgPSBvcGFxdWU7Cj4gICAK
PiAgIAlpb3RsYi0+bm1hcHMrKzsKPiAgIAl2aG9zdF9pb3RsYl9pdHJlZV9pbnNlcnQobWFwLCAm
aW90bGItPnJvb3QpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZl
cnMvdmhvc3QvdmRwYS5jCj4gaW5kZXggMzZiNjk1MGJhMzdmLi5lODNlNWJlN2NlYzggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEu
Ywo+IEBAIC00ODgsNiArNDg4LDcgQEAgc3RhdGljIHZvaWQgdmhvc3RfdmRwYV9pb3RsYl91bm1h
cChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTY0IHN0YXJ0LCB1NjQgbGFzdCkKPiAgIAlzdHJ1Y3Qg
dmhvc3RfZGV2ICpkZXYgPSAmdi0+dmRldjsKPiAgIAlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEg
PSB2LT52ZHBhOwo+ICAgCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIgPSBkZXYtPmlvdGxiOwo+
ICsJc3RydWN0IHZob3N0X2lvdGxiX2ZpbGUgKmlvdGxiX2ZpbGU7Cj4gICAJc3RydWN0IHZob3N0
X2lvdGxiX21hcCAqbWFwOwo+ICAgCXN0cnVjdCBwYWdlICpwYWdlOwo+ICAgCXVuc2lnbmVkIGxv
bmcgcGZuLCBwaW5uZWQ7Cj4gQEAgLTUwNCw2ICs1MDUsMTAgQEAgc3RhdGljIHZvaWQgdmhvc3Rf
dmRwYV9pb3RsYl91bm1hcChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTY0IHN0YXJ0LCB1NjQgbGFz
dCkKPiAgIAkJCX0KPiAgIAkJCWF0b21pYzY0X3N1YihtYXAtPnNpemUgPj4gUEFHRV9TSElGVCwK
PiAgIAkJCQkJJmRldi0+bW0tPnBpbm5lZF92bSk7Cj4gKwkJfSBlbHNlIGlmIChtYXAtPm9wYXF1
ZSkgewo+ICsJCQlpb3RsYl9maWxlID0gKHN0cnVjdCB2aG9zdF9pb3RsYl9maWxlICopbWFwLT5v
cGFxdWU7Cj4gKwkJCWZwdXQoaW90bGJfZmlsZS0+ZmlsZSk7Cj4gKwkJCWtmcmVlKGlvdGxiX2Zp
bGUpOwo+ICAgCQl9Cj4gICAJCXZob3N0X2lvdGxiX21hcF9mcmVlKGlvdGxiLCBtYXApOwo+ICAg
CX0KPiBAQCAtNTQwLDggKzU0NSw4IEBAIHN0YXRpYyBpbnQgcGVybV90b19pb21tdV9mbGFncyh1
MzIgcGVybSkKPiAgIAlyZXR1cm4gZmxhZ3MgfCBJT01NVV9DQUNIRTsKPiAgIH0KPiAgIAo+IC1z
dGF0aWMgaW50IHZob3N0X3ZkcGFfbWFwKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+IC0JCQkgIHU2
NCBpb3ZhLCB1NjQgc2l6ZSwgdTY0IHBhLCB1MzIgcGVybSkKPiArc3RhdGljIGludCB2aG9zdF92
ZHBhX21hcChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTY0IGlvdmEsCj4gKwkJCSAgdTY0IHNpemUs
IHU2NCBwYSwgdTMyIHBlcm0sIHZvaWQgKm9wYXF1ZSkKPiAgIHsKPiAgIAlzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkZXYgPSAmdi0+dmRldjsKPiAgIAlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52
ZHBhOwo+IEBAIC01NDksMTIgKzU1NCwxMiBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfbWFwKHN0
cnVjdCB2aG9zdF92ZHBhICp2LAo+ICAgCWludCByID0gMDsKPiAgIAo+ICAgCXIgPSB2aG9zdF9p
b3RsYl9hZGRfcmFuZ2UoZGV2LT5pb3RsYiwgaW92YSwgaW92YSArIHNpemUgLSAxLAo+IC0JCQkJ
ICBwYSwgcGVybSk7Cj4gKwkJCQkgIHBhLCBwZXJtLCBvcGFxdWUpOwo+ICAgCWlmIChyKQo+ICAg
CQlyZXR1cm4gcjsKPiAgIAo+ICAgCWlmIChvcHMtPmRtYV9tYXApIHsKPiAtCQlyID0gb3BzLT5k
bWFfbWFwKHZkcGEsIGlvdmEsIHNpemUsIHBhLCBwZXJtKTsKPiArCQlyID0gb3BzLT5kbWFfbWFw
KHZkcGEsIGlvdmEsIHNpemUsIHBhLCBwZXJtLCBvcGFxdWUpOwo+ICAgCX0gZWxzZSBpZiAob3Bz
LT5zZXRfbWFwKSB7Cj4gICAJCWlmICghdi0+aW5fYmF0Y2gpCj4gICAJCQlyID0gb3BzLT5zZXRf
bWFwKHZkcGEsIGRldi0+aW90bGIpOwo+IEBAIC01OTEsNiArNTk2LDUxIEBAIHN0YXRpYyB2b2lk
IHZob3N0X3ZkcGFfdW5tYXAoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHU2NCBpb3ZhLCB1NjQgc2l6
ZSkKPiAgIAl9Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCB2aG9zdF92ZHBhX3N2YV9tYXAoc3Ry
dWN0IHZob3N0X3ZkcGEgKnYsCj4gKwkJCSAgICAgIHU2NCBpb3ZhLCB1NjQgc2l6ZSwgdTY0IHVh
ZGRyLCB1MzIgcGVybSkKPiArewo+ICsJdTY0IG9mZnNldCwgbWFwX3NpemUsIG1hcF9pb3ZhID0g
aW92YTsKPiArCXN0cnVjdCB2aG9zdF9pb3RsYl9maWxlICppb3RsYl9maWxlOwo+ICsJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gKwlpbnQgcmV0OwoKCkxhY2tpbmcgbW1hcF9yZWFkX2xv
Y2soKS4KCgo+ICsKPiArCXdoaWxlIChzaXplKSB7Cj4gKwkJdm1hID0gZmluZF92bWEoY3VycmVu
dC0+bW0sIHVhZGRyKTsKPiArCQlpZiAoIXZtYSkgewo+ICsJCQlyZXQgPSAtRUlOVkFMOwo+ICsJ
CQlnb3RvIGVycjsKPiArCQl9Cj4gKwkJbWFwX3NpemUgPSBtaW4oc2l6ZSwgdm1hLT52bV9lbmQg
LSB1YWRkcik7Cj4gKwkJb2Zmc2V0ID0gKHZtYS0+dm1fcGdvZmYgPDwgUEFHRV9TSElGVCkgKyB1
YWRkciAtIHZtYS0+dm1fc3RhcnQ7Cj4gKwkJaW90bGJfZmlsZSA9IE5VTEw7Cj4gKwkJaWYgKHZt
YS0+dm1fZmlsZSAmJiAodm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkpIHsKCgpJIHdvbmRlciBp
ZiB3ZSBuZWVkIG1vcmUgc3RyaWN0IGNoZWNrIGhlcmUuIFdoZW4gZGV2ZWxvcGluZyB2aG9zdC12
ZHBhLCAKSSB0cnkgaGFyZCB0byBtYWtlIHN1cmUgdGhlIG1hcCBjYW4gb25seSB3b3JrIGZvciB1
c2VyIHBhZ2VzLgoKU28gdGhlIHF1ZXN0aW9uIGlzOiBkbyB3ZSBuZWVkIHRvIGV4Y2x1ZGUgTU1J
TyBhcmVhIG9yIG9ubHkgYWxsb3cgc2htZW0gCnRvIHdvcmsgaGVyZT8KCgoKPiArCQkJaW90bGJf
ZmlsZSA9IGttYWxsb2Moc2l6ZW9mKCppb3RsYl9maWxlKSwgR0ZQX0tFUk5FTCk7Cj4gKwkJCWlm
ICghaW90bGJfZmlsZSkgewo+ICsJCQkJcmV0ID0gLUVOT01FTTsKPiArCQkJCWdvdG8gZXJyOwo+
ICsJCQl9Cj4gKwkJCWlvdGxiX2ZpbGUtPmZpbGUgPSBnZXRfZmlsZSh2bWEtPnZtX2ZpbGUpOwo+
ICsJCQlpb3RsYl9maWxlLT5vZmZzZXQgPSBvZmZzZXQ7Cj4gKwkJfQoKCkkgd29uZGVyIGlmIGl0
J3MgYmV0dGVyIHRvIGFsbG9jYXRlIGlvdGxiX2ZpbGUgYW5kIG1ha2UgaW90bGJfZmlsZS0+Zmls
ZSAKPSBOVUxMICYmIGlvdGxiX2ZpbGUtPm9mZnNldCA9IDAuIFRoaXMgY2FuIGZvcmNlIGEgY29u
c2lzdGVudCBjb2RlIGZvciAKdGhlIHZEUEEgcGFyZW50cy4KCk9yIHdlIGNhbiBzaW1wbHkgZmFp
bCB0aGUgbWFwIHdpdGhvdXQgYSBmaWxlIGFzIGJhY2tlbmQuCgoKPiArCQlyZXQgPSB2aG9zdF92
ZHBhX21hcCh2LCBtYXBfaW92YSwgbWFwX3NpemUsIHVhZGRyLAo+ICsJCQkJCXBlcm0sIGlvdGxi
X2ZpbGUpOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJaWYgKGlvdGxiX2ZpbGUpIHsKPiArCQkJCWZw
dXQoaW90bGJfZmlsZS0+ZmlsZSk7Cj4gKwkJCQlrZnJlZShpb3RsYl9maWxlKTsKPiArCQkJfQo+
ICsJCQlnb3RvIGVycjsKPiArCQl9Cj4gKwkJc2l6ZSAtPSBtYXBfc2l6ZTsKPiArCQl1YWRkciAr
PSBtYXBfc2l6ZTsKPiArCQltYXBfaW92YSArPSBtYXBfc2l6ZTsKPiArCX0KPiArCXJldHVybiAw
Owo+ICtlcnI6Cj4gKwl2aG9zdF92ZHBhX3VubWFwKHYsIGlvdmEsIG1hcF9pb3ZhIC0gaW92YSk7
Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCB2aG9zdF92ZHBhX3Byb2Nl
c3NfaW90bGJfdXBkYXRlKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+ICAgCQkJCQkgICBzdHJ1Y3Qg
dmhvc3RfaW90bGJfbXNnICptc2cpCj4gICB7Cj4gQEAgLTYxNSw4ICs2NjUsOCBAQCBzdGF0aWMg
aW50IHZob3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl91cGRhdGUoc3RydWN0IHZob3N0X3ZkcGEgKnYs
Cj4gICAJCXJldHVybiAtRUVYSVNUOwo+ICAgCj4gICAJaWYgKHZkcGEtPnN2YSkKPiAtCQlyZXR1
cm4gdmhvc3RfdmRwYV9tYXAodiwgbXNnLT5pb3ZhLCBtc2ctPnNpemUsCj4gLQkJCQkgICAgICBt
c2ctPnVhZGRyLCBtc2ctPnBlcm0pOwo+ICsJCXJldHVybiB2aG9zdF92ZHBhX3N2YV9tYXAodiwg
bXNnLT5pb3ZhLCBtc2ctPnNpemUsCj4gKwkJCQkJICBtc2ctPnVhZGRyLCBtc2ctPnBlcm0pOwoK
ClNvIEkgdGhpbmsgaXQncyBiZXR0ZXIgc3F1YXNoIHZob3N0X3ZkcGFfc3ZhX21hcCgpIGFuZCBy
ZWxhdGVkIGNoYW5nZXMgCmludG8gcHJldmlvdXMgcGF0Y2guCgoKPiAgIAo+ICAgCS8qIExpbWl0
IHRoZSB1c2Ugb2YgbWVtb3J5IGZvciBib29ra2VlcGluZyAqLwo+ICAgCXBhZ2VfbGlzdCA9IChz
dHJ1Y3QgcGFnZSAqKikgX19nZXRfZnJlZV9wYWdlKEdGUF9LRVJORUwpOwo+IEBAIC02NzEsNyAr
NzIxLDcgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX3Byb2Nlc3NfaW90bGJfdXBkYXRlKHN0cnVj
dCB2aG9zdF92ZHBhICp2LAo+ICAgCQkJCWNzaXplID0gKGxhc3RfcGZuIC0gbWFwX3BmbiArIDEp
IDw8IFBBR0VfU0hJRlQ7Cj4gICAJCQkJcmV0ID0gdmhvc3RfdmRwYV9tYXAodiwgaW92YSwgY3Np
emUsCj4gICAJCQkJCQkgICAgIG1hcF9wZm4gPDwgUEFHRV9TSElGVCwKPiAtCQkJCQkJICAgICBt
c2ctPnBlcm0pOwo+ICsJCQkJCQkgICAgIG1zZy0+cGVybSwgTlVMTCk7Cj4gICAJCQkJaWYgKHJl
dCkgewo+ICAgCQkJCQkvKgo+ICAgCQkJCQkgKiBVbnBpbiB0aGUgcGFnZXMgdGhhdCBhcmUgbGVm
dCB1bm1hcHBlZAo+IEBAIC03MDAsNyArNzUwLDcgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX3By
b2Nlc3NfaW90bGJfdXBkYXRlKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+ICAgCj4gICAJLyogUGlu
IHRoZSByZXN0IGNodW5rICovCj4gICAJcmV0ID0gdmhvc3RfdmRwYV9tYXAodiwgaW92YSwgKGxh
c3RfcGZuIC0gbWFwX3BmbiArIDEpIDw8IFBBR0VfU0hJRlQsCj4gLQkJCSAgICAgbWFwX3BmbiA8
PCBQQUdFX1NISUZULCBtc2ctPnBlcm0pOwo+ICsJCQkgICAgIG1hcF9wZm4gPDwgUEFHRV9TSElG
VCwgbXNnLT5wZXJtLCBOVUxMKTsKPiAgIG91dDoKPiAgIAlpZiAocmV0KSB7Cj4gICAJCWlmIChu
Y2h1bmtzKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMv
dmhvc3Qvdmhvc3QuYwo+IGluZGV4IGEyNjJlMTJjNmRjMi4uMTIwZGQ1YjNjMTE5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
Ywo+IEBAIC0xMTA0LDcgKzExMDQsNyBAQCBzdGF0aWMgaW50IHZob3N0X3Byb2Nlc3NfaW90bGJf
bXNnKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPiAgIAkJdmhvc3RfdnFfbWV0YV9yZXNldChkZXYp
Owo+ICAgCQlpZiAodmhvc3RfaW90bGJfYWRkX3JhbmdlKGRldi0+aW90bGIsIG1zZy0+aW92YSwK
PiAgIAkJCQkJICBtc2ctPmlvdmEgKyBtc2ctPnNpemUgLSAxLAo+IC0JCQkJCSAgbXNnLT51YWRk
ciwgbXNnLT5wZXJtKSkgewo+ICsJCQkJCSAgbXNnLT51YWRkciwgbXNnLT5wZXJtLCBOVUxMKSkg
ewo+ICAgCQkJcmV0ID0gLUVOT01FTTsKPiAgIAkJCWJyZWFrOwo+ICAgCQl9Cj4gQEAgLTE0NTAs
NyArMTQ1MCw3IEBAIHN0YXRpYyBsb25nIHZob3N0X3NldF9tZW1vcnkoc3RydWN0IHZob3N0X2Rl
diAqZCwgc3RydWN0IHZob3N0X21lbW9yeSBfX3VzZXIgKm0pCj4gICAJCQkJCSAgcmVnaW9uLT5n
dWVzdF9waHlzX2FkZHIgKwo+ICAgCQkJCQkgIHJlZ2lvbi0+bWVtb3J5X3NpemUgLSAxLAo+ICAg
CQkJCQkgIHJlZ2lvbi0+dXNlcnNwYWNlX2FkZHIsCj4gLQkJCQkJICBWSE9TVF9NQVBfUlcpKQo+
ICsJCQkJCSAgVkhPU1RfTUFQX1JXLCBOVUxMKSkKPiAgIAkJCWdvdG8gZXJyOwo+ICAgCX0KPiAg
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZkcGEuaCBiL2luY2x1ZGUvbGludXgvdmRw
YS5oCj4gaW5kZXggZjg2ODY5NjUxNjE0Li5iMjY0YzYyN2U5NGIgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9saW51eC92ZHBhLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+IEBAIC0xODks
NiArMTg5LDcgQEAgc3RydWN0IHZkcGFfaW92YV9yYW5nZSB7Cj4gICAgKgkJCQlAc2l6ZTogc2l6
ZSBvZiB0aGUgYXJlYQo+ICAgICoJCQkJQHBhOiBwaHlzaWNhbCBhZGRyZXNzIGZvciB0aGUgbWFw
Cj4gICAgKgkJCQlAcGVybTogZGV2aWNlIGFjY2VzcyBwZXJtaXNzaW9uIChWSE9TVF9NQVBfWFgp
Cj4gKyAqCQkJCUBvcGFxdWU6IHRoZSBvcGFxdWUgcG9pbnRlciBmb3IgdGhlIG1hcHBpbmcKPiAg
ICAqCQkJCVJldHVybnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKPiAgICAq
IEBkbWFfdW5tYXA6CQkJVW5tYXAgYW4gYXJlYSBvZiBJT1ZBIChvcHRpb25hbCBidXQKPiAgICAq
CQkJCW11c3QgYmUgaW1wbGVtZW50ZWQgd2l0aCBkbWFfbWFwKQo+IEBAIC0yNDMsNyArMjQ0LDcg
QEAgc3RydWN0IHZkcGFfY29uZmlnX29wcyB7Cj4gICAJLyogRE1BIG9wcyAqLwo+ICAgCWludCAo
KnNldF9tYXApKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgc3RydWN0IHZob3N0X2lvdGxiICpp
b3RsYik7Cj4gICAJaW50ICgqZG1hX21hcCkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1NjQg
aW92YSwgdTY0IHNpemUsCj4gLQkJICAgICAgIHU2NCBwYSwgdTMyIHBlcm0pOwo+ICsJCSAgICAg
ICB1NjQgcGEsIHUzMiBwZXJtLCB2b2lkICpvcGFxdWUpOwo+ICAgCWludCAoKmRtYV91bm1hcCko
c3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1NjQgaW92YSwgdTY0IHNpemUpOwo+ICAgCj4gICAJ
LyogRnJlZSBkZXZpY2UgcmVzb3VyY2VzICovCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
dmhvc3RfaW90bGIuaCBiL2luY2x1ZGUvbGludXgvdmhvc3RfaW90bGIuaAo+IGluZGV4IDZiMDli
Nzg2YTc2Mi4uNjZhNTBjMTFjOGNhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvdmhvc3Rf
aW90bGIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmhvc3RfaW90bGIuaAo+IEBAIC00LDYgKzQs
MTEgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4L2ludGVydmFsX3RyZWVfZ2VuZXJpYy5oPgo+
ICAgCj4gK3N0cnVjdCB2aG9zdF9pb3RsYl9maWxlIHsKPiArCXN0cnVjdCBmaWxlICpmaWxlOwo+
ICsJdTY0IG9mZnNldDsKPiArfTsKCgpJIHRoaW5rIHdlJ2QgYmV0dGVyIGVpdGhlcjoKCjEpIHNp
bXBseSB1c2Ugc3RydWN0IHZob3N0X2lvdGxiX2ZpbGUgKiBpbnN0ZWFkIG9mIHZvaWQgKm9wYXF1
ZSBmb3IgCnZob3N0X2lvdGxiX21hcAoKb3IKCjIpcmVuYW1lIGFuZCBtb3ZlIHRoZSB2aG9zdF9p
b3RsYl9maWxlIHRvIHZkcGEKCjIpIGxvb2tzIGJldHRlciBzaW5jZSB3ZSB3YW50IHRvIGxldCB2
aG9zdCBpb3RsYiB0byBjYXJyeSBhbnkgdHlwZSBvZiAKY29udGV4dCAob3BhcXVlIHBvaW50ZXIp
CgpBbmQgaWYgd2UgZG8gdGhpcywgdGhlIG1vZGlmaWNhdGlvbiBvZiB2ZHBhX2NvbmZpZ19vcHMg
ZGVzZXJ2ZXMgYSAKc2VwYXJhdGUgcGF0Y2guCgpUaGFua3MKCgo+ICsKPiAgIHN0cnVjdCB2aG9z
dF9pb3RsYl9tYXAgewo+ICAgCXN0cnVjdCByYl9ub2RlIHJiOwo+ICAgCXN0cnVjdCBsaXN0X2hl
YWQgbGluazsKPiBAQCAtMTcsNiArMjIsNyBAQCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbWFwIHsKPiAg
IAl1MzIgcGVybTsKPiAgIAl1MzIgZmxhZ3NfcGFkZGluZzsKPiAgIAl1NjQgX19zdWJ0cmVlX2xh
c3Q7Cj4gKwl2b2lkICpvcGFxdWU7Cj4gICB9Owo+ICAgCj4gICAjZGVmaW5lIFZIT1NUX0lPVExC
X0ZMQUdfUkVUSVJFIDB4MQo+IEBAIC0zMCw3ICszNiw3IEBAIHN0cnVjdCB2aG9zdF9pb3RsYiB7
Cj4gICB9Owo+ICAgCj4gICBpbnQgdmhvc3RfaW90bGJfYWRkX3JhbmdlKHN0cnVjdCB2aG9zdF9p
b3RsYiAqaW90bGIsIHU2NCBzdGFydCwgdTY0IGxhc3QsCj4gLQkJCSAgdTY0IGFkZHIsIHVuc2ln
bmVkIGludCBwZXJtKTsKPiArCQkJICB1NjQgYWRkciwgdW5zaWduZWQgaW50IHBlcm0sIHZvaWQg
Km9wYXF1ZSk7Cj4gICB2b2lkIHZob3N0X2lvdGxiX2RlbF9yYW5nZShzdHJ1Y3Qgdmhvc3RfaW90
bGIgKmlvdGxiLCB1NjQgc3RhcnQsIHU2NCBsYXN0KTsKPiAgIAo+ICAgc3RydWN0IHZob3N0X2lv
dGxiICp2aG9zdF9pb3RsYl9hbGxvYyh1bnNpZ25lZCBpbnQgbGltaXQsIHVuc2lnbmVkIGludCBm
bGFncyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
