Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04F2FCADB
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 06:56:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B164320480;
	Wed, 20 Jan 2021 05:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnPgg5WBQ7Dh; Wed, 20 Jan 2021 05:56:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AFF6E203D3;
	Wed, 20 Jan 2021 05:56:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88F92C013A;
	Wed, 20 Jan 2021 05:56:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F792C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 05:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 37E4320480
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 05:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFjEb1vr+mkE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 05:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id B13B6203D3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611122158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8SbE5PdHAcpmt+ukP9VF3z2TekafV+3DGaZfD9WNrk=;
 b=fVdpwYirtKmS41wJPS8r5or5Pqb7h29ESFQJJ94vhhuw+VFq6oi5JVQMZ/86sDVX+tEttG
 YMQiWch6LbcdzR/yxXE1Ld2sOqRJmAYTRvQYOniH/sts2JwmoVnkfN6SHqcDdUBHZlwI7Y
 5D+imnxQ2WiWu0nOGK7sdrK36z3jNWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-IKneJktcMtWVGUomDOwycg-1; Wed, 20 Jan 2021 00:55:54 -0500
X-MC-Unique: IKneJktcMtWVGUomDOwycg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40711005504;
 Wed, 20 Jan 2021 05:55:51 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9489960C0F;
 Wed, 20 Jan 2021 05:55:37 +0000 (UTC)
Subject: Re: [RFC v3 05/11] vdpa: shared virtual addressing support
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 bob.liu@oracle.com, hch@infradead.org, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net
References: <20210119045920.447-1-xieyongji@bytedance.com>
 <20210119045920.447-6-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3d58d50c-935a-a827-e261-59282f4c8577@redhat.com>
Date: Wed, 20 Jan 2021 13:55:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119045920.447-6-xieyongji@bytedance.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjEvMS8xOSDkuIvljYgxMjo1OSwgWGllIFlvbmdqaSB3cm90ZToKPiBUaGlzIHBhdGNo
ZXMgaW50cm9kdWNlcyBTVkEgKFNoYXJlZCBWaXJ0dWFsIEFkZHJlc3NpbmcpCj4gc3VwcG9ydCBm
b3IgdkRQQSBkZXZpY2UuIER1cmluZyB2RFBBIGRldmljZSBhbGxvY2F0aW9uLAo+IHZEUEEgZGV2
aWNlIGRyaXZlciBuZWVkcyB0byBpbmRpY2F0ZSB3aGV0aGVyIFNWQSBpcwo+IHN1cHBvcnRlZCBi
eSB0aGUgZGV2aWNlLiBUaGVuIHZob3N0LXZkcGEgYnVzIGRyaXZlcgo+IHdpbGwgbm90IHBpbiB1
c2VyIHBhZ2UgYW5kIHRyYW5zZmVyIHVzZXJzcGFjZSB2aXJ0dWFsCj4gYWRkcmVzcyBpbnN0ZWFk
IG9mIHBoeXNpY2FsIGFkZHJlc3MgZHVyaW5nIERNQSBtYXBwaW5nLgo+Cj4gU3VnZ2VzdGVkLWJ5
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFhpZSBZ
b25namkgPHhpZXlvbmdqaUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX21haW4uYyAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1
X3ZuZXQuYyB8ICAyICstCj4gICBkcml2ZXJzL3ZkcGEvdmRwYS5jICAgICAgICAgICAgICAgfCAg
NSArKysrLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgIHwgIDMgKystCj4g
ICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLQo+ICAgaW5jbHVkZS9saW51eC92ZHBhLmggICAgICAgICAgICAg
IHwgMTAgKysrKysrKy0tLQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZf
bWFpbi5jIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IGluZGV4IDIzNDc0YWY3
ZGE0MC4uOTVjNDYwMWY4MmY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2
Zl9tYWluLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTQz
OSw3ICs0MzksNyBAQCBzdGF0aWMgaW50IGlmY3ZmX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4gICAKPiAgIAlhZGFwdGVyID0gdmRw
YV9hbGxvY19kZXZpY2Uoc3RydWN0IGlmY3ZmX2FkYXB0ZXIsIHZkcGEsCj4gICAJCQkJICAgIGRl
diwgJmlmY192ZHBhX29wcywKPiAtCQkJCSAgICBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyLCBO
VUxMKTsKPiArCQkJCSAgICBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyLCBOVUxMLCBmYWxzZSk7
Cj4gICAJaWYgKGFkYXB0ZXIgPT0gTlVMTCkgewo+ICAgCQlJRkNWRl9FUlIocGRldiwgIkZhaWxl
ZCB0byBhbGxvY2F0ZSB2RFBBIHN0cnVjdHVyZSIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92
ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gaW5kZXggNzc1OTVjODE0ODhkLi4wNTk4OGQ2OTA3
ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gKysr
IGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gQEAgLTE5NTksNyArMTk1OSw3
IEBAIHN0YXRpYyBpbnQgbWx4NXZfcHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYs
Cj4gICAJbWF4X3ZxcyA9IG1pbl90KHUzMiwgbWF4X3ZxcywgTUxYNV9NQVhfU1VQUE9SVEVEX1ZR
Uyk7Cj4gICAKPiAgIAluZGV2ID0gdmRwYV9hbGxvY19kZXZpY2Uoc3RydWN0IG1seDVfdmRwYV9u
ZXQsIG12ZGV2LnZkZXYsIG1kZXYtPmRldmljZSwgJm1seDVfdmRwYV9vcHMsCj4gLQkJCQkgMiAq
IG1seDVfdmRwYV9tYXhfcXBzKG1heF92cXMpLCBOVUxMKTsKPiArCQkJCSAyICogbWx4NV92ZHBh
X21heF9xcHMobWF4X3ZxcyksIE5VTEwsIGZhbHNlKTsKPiAgIAlpZiAoSVNfRVJSKG5kZXYpKQo+
ICAgCQlyZXR1cm4gUFRSX0VSUihuZGV2KTsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zk
cGEvdmRwYS5jIGIvZHJpdmVycy92ZHBhL3ZkcGEuYwo+IGluZGV4IDMyYmQ0OGJhZmZhYi4uNTBj
YWI5MzBiMmU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhLmMKPiArKysgYi9kcml2
ZXJzL3ZkcGEvdmRwYS5jCj4gQEAgLTcyLDYgKzcyLDcgQEAgc3RhdGljIHZvaWQgdmRwYV9yZWxl
YXNlX2RldihzdHJ1Y3QgZGV2aWNlICpkKQo+ICAgICogQG52cXM6IG51bWJlciBvZiB2aXJ0cXVl
dWVzIHN1cHBvcnRlZCBieSB0aGlzIGRldmljZQo+ICAgICogQHNpemU6IHNpemUgb2YgdGhlIHBh
cmVudCBzdHJ1Y3R1cmUgdGhhdCBjb250YWlucyBwcml2YXRlIGRhdGEKPiAgICAqIEBuYW1lOiBu
YW1lIG9mIHRoZSB2ZHBhIGRldmljZTsgb3B0aW9uYWwuCj4gKyAqIEBzdmE6IGluZGljYXRlIHdo
ZXRoZXIgU1ZBIChTaGFyZWQgVmlydHVhbCBBZGRyZXNzaW5nKSBpcyBzdXBwb3J0ZWQKPiAgICAq
Cj4gICAgKiBEcml2ZXIgc2hvdWxkIHVzZSB2ZHBhX2FsbG9jX2RldmljZSgpIHdyYXBwZXIgbWFj
cm8gaW5zdGVhZCBvZgo+ICAgICogdXNpbmcgdGhpcyBkaXJlY3RseS4KPiBAQCAtODEsNyArODIs
OCBAQCBzdGF0aWMgdm9pZCB2ZHBhX3JlbGVhc2VfZGV2KHN0cnVjdCBkZXZpY2UgKmQpCj4gICAg
Ki8KPiAgIHN0cnVjdCB2ZHBhX2RldmljZSAqX192ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgZGV2
aWNlICpwYXJlbnQsCj4gICAJCQkJCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKmNvbmZp
ZywKPiAtCQkJCQlpbnQgbnZxcywgc2l6ZV90IHNpemUsIGNvbnN0IGNoYXIgKm5hbWUpCj4gKwkJ
CQkJaW50IG52cXMsIHNpemVfdCBzaXplLCBjb25zdCBjaGFyICpuYW1lLAo+ICsJCQkJCWJvb2wg
c3ZhKQo+ICAgewo+ICAgCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRldjsKPiAgIAlpbnQgZXJyID0g
LUVJTlZBTDsKPiBAQCAtMTA4LDYgKzExMCw3IEBAIHN0cnVjdCB2ZHBhX2RldmljZSAqX192ZHBh
X2FsbG9jX2RldmljZShzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4gICAJdmRldi0+Y29uZmlnID0g
Y29uZmlnOwo+ICAgCXZkZXYtPmZlYXR1cmVzX3ZhbGlkID0gZmFsc2U7Cj4gICAJdmRldi0+bnZx
cyA9IG52cXM7Cj4gKwl2ZGV2LT5zdmEgPSBzdmE7Cj4gICAKPiAgIAlpZiAobmFtZSkKPiAgIAkJ
ZXJyID0gZGV2X3NldF9uYW1lKCZ2ZGV2LT5kZXYsICIlcyIsIG5hbWUpOwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyBiL2RyaXZlcnMvdmRwYS92ZHBhX3Np
bS92ZHBhX3NpbS5jCj4gaW5kZXggODU3NzZlNGU2NzQ5Li4wM2M3OTY4NzNhNmIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiArKysgYi9kcml2ZXJzL3Zk
cGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+IEBAIC0zNjcsNyArMzY3LDggQEAgc3RhdGljIHN0cnVj
dCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZShjb25zdCBjaGFyICpuYW1lKQo+ICAgCWVsc2UKPiAg
IAkJb3BzID0gJnZkcGFzaW1fbmV0X2NvbmZpZ19vcHM7Cj4gICAKPiAtCXZkcGFzaW0gPSB2ZHBh
X2FsbG9jX2RldmljZShzdHJ1Y3QgdmRwYXNpbSwgdmRwYSwgTlVMTCwgb3BzLCBWRFBBU0lNX1ZR
X05VTSwgbmFtZSk7Cj4gKwl2ZHBhc2ltID0gdmRwYV9hbGxvY19kZXZpY2Uoc3RydWN0IHZkcGFz
aW0sIHZkcGEsIE5VTEwsIG9wcywKPiArCQkJCVZEUEFTSU1fVlFfTlVNLCBuYW1lLCBmYWxzZSk7
Cj4gICAJaWYgKCF2ZHBhc2ltKQo+ICAgCQlnb3RvIGVycl9hbGxvYzsKPiAgIAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5kZXgg
NGEyNDFkMzgwYzQwLi4zNmI2OTUwYmEzN2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92
ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBAIC00ODYsMjEgKzQ4NiwyNSBA
QCBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3VubG9ja2VkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxl
cCwKPiAgIHN0YXRpYyB2b2lkIHZob3N0X3ZkcGFfaW90bGJfdW5tYXAoc3RydWN0IHZob3N0X3Zk
cGEgKnYsIHU2NCBzdGFydCwgdTY0IGxhc3QpCj4gICB7Cj4gICAJc3RydWN0IHZob3N0X2RldiAq
ZGV2ID0gJnYtPnZkZXY7Cj4gKwlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+
ICAgCXN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIgPSBkZXYtPmlvdGxiOwo+ICAgCXN0cnVjdCB2
aG9zdF9pb3RsYl9tYXAgKm1hcDsKPiAgIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAgIAl1bnNpZ25l
ZCBsb25nIHBmbiwgcGlubmVkOwo+ICAgCj4gICAJd2hpbGUgKChtYXAgPSB2aG9zdF9pb3RsYl9p
dHJlZV9maXJzdChpb3RsYiwgc3RhcnQsIGxhc3QpKSAhPSBOVUxMKSB7Cj4gLQkJcGlubmVkID0g
bWFwLT5zaXplID4+IFBBR0VfU0hJRlQ7Cj4gLQkJZm9yIChwZm4gPSBtYXAtPmFkZHIgPj4gUEFH
RV9TSElGVDsKPiAtCQkgICAgIHBpbm5lZCA+IDA7IHBmbisrLCBwaW5uZWQtLSkgewo+IC0JCQlw
YWdlID0gcGZuX3RvX3BhZ2UocGZuKTsKPiAtCQkJaWYgKG1hcC0+cGVybSAmIFZIT1NUX0FDQ0VT
U19XTykKPiAtCQkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7Cj4gLQkJCXVucGluX3VzZXJf
cGFnZShwYWdlKTsKPiArCQlpZiAoIXZkcGEtPnN2YSkgewo+ICsJCQlwaW5uZWQgPSBtYXAtPnNp
emUgPj4gUEFHRV9TSElGVDsKPiArCQkJZm9yIChwZm4gPSBtYXAtPmFkZHIgPj4gUEFHRV9TSElG
VDsKPiArCQkJICAgICBwaW5uZWQgPiAwOyBwZm4rKywgcGlubmVkLS0pIHsKPiArCQkJCXBhZ2Ug
PSBwZm5fdG9fcGFnZShwZm4pOwo+ICsJCQkJaWYgKG1hcC0+cGVybSAmIFZIT1NUX0FDQ0VTU19X
TykKPiArCQkJCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwo+ICsJCQkJdW5waW5fdXNlcl9w
YWdlKHBhZ2UpOwo+ICsJCQl9Cj4gKwkJCWF0b21pYzY0X3N1YihtYXAtPnNpemUgPj4gUEFHRV9T
SElGVCwKPiArCQkJCQkmZGV2LT5tbS0+cGlubmVkX3ZtKTsKPiAgIAkJfQo+IC0JCWF0b21pYzY0
X3N1YihtYXAtPnNpemUgPj4gUEFHRV9TSElGVCwgJmRldi0+bW0tPnBpbm5lZF92bSk7Cj4gICAJ
CXZob3N0X2lvdGxiX21hcF9mcmVlKGlvdGxiLCBtYXApOwo+ICAgCX0KPiAgIH0KPiBAQCAtNTU4
LDEzICs1NjIsMTUgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX21hcChzdHJ1Y3Qgdmhvc3RfdmRw
YSAqdiwKPiAgIAkJciA9IGlvbW11X21hcCh2LT5kb21haW4sIGlvdmEsIHBhLCBzaXplLAo+ICAg
CQkJICAgICAgcGVybV90b19pb21tdV9mbGFncyhwZXJtKSk7Cj4gICAJfQo+IC0KPiAtCWlmIChy
KQo+ICsJaWYgKHIpIHsKPiAgIAkJdmhvc3RfaW90bGJfZGVsX3JhbmdlKGRldi0+aW90bGIsIGlv
dmEsIGlvdmEgKyBzaXplIC0gMSk7Cj4gLQllbHNlCj4gKwkJcmV0dXJuIHI7Cj4gKwl9Cj4gKwo+
ICsJaWYgKCF2ZHBhLT5zdmEpCj4gICAJCWF0b21pYzY0X2FkZChzaXplID4+IFBBR0VfU0hJRlQs
ICZkZXYtPm1tLT5waW5uZWRfdm0pOwo+ICAgCj4gLQlyZXR1cm4gcjsKPiArCXJldHVybiAwOwo+
ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX3VubWFwKHN0cnVjdCB2aG9zdF92
ZHBhICp2LCB1NjQgaW92YSwgdTY0IHNpemUpCj4gQEAgLTU4OSw2ICs1OTUsNyBAQCBzdGF0aWMg
aW50IHZob3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl91cGRhdGUoc3RydWN0IHZob3N0X3ZkcGEgKnYs
Cj4gICAJCQkJCSAgIHN0cnVjdCB2aG9zdF9pb3RsYl9tc2cgKm1zZykKPiAgIHsKPiAgIAlzdHJ1
Y3Qgdmhvc3RfZGV2ICpkZXYgPSAmdi0+dmRldjsKPiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSA9IHYtPnZkcGE7Cj4gICAJc3RydWN0IHZob3N0X2lvdGxiICppb3RsYiA9IGRldi0+aW90bGI7
Cj4gICAJc3RydWN0IHBhZ2UgKipwYWdlX2xpc3Q7Cj4gICAJdW5zaWduZWQgbG9uZyBsaXN0X3Np
emUgPSBQQUdFX1NJWkUgLyBzaXplb2Yoc3RydWN0IHBhZ2UgKik7Cj4gQEAgLTYwNyw2ICs2MTQs
MTAgQEAgc3RhdGljIGludCB2aG9zdF92ZHBhX3Byb2Nlc3NfaW90bGJfdXBkYXRlKHN0cnVjdCB2
aG9zdF92ZHBhICp2LAo+ICAgCQkJCSAgICBtc2ctPmlvdmEgKyBtc2ctPnNpemUgLSAxKSkKPiAg
IAkJcmV0dXJuIC1FRVhJU1Q7Cj4gICAKPiArCWlmICh2ZHBhLT5zdmEpCj4gKwkJcmV0dXJuIHZo
b3N0X3ZkcGFfbWFwKHYsIG1zZy0+aW92YSwgbXNnLT5zaXplLAo+ICsJCQkJICAgICAgbXNnLT51
YWRkciwgbXNnLT5wZXJtKTsKPiArCj4gICAJLyogTGltaXQgdGhlIHVzZSBvZiBtZW1vcnkgZm9y
IGJvb2trZWVwaW5nICovCj4gICAJcGFnZV9saXN0ID0gKHN0cnVjdCBwYWdlICoqKSBfX2dldF9m
cmVlX3BhZ2UoR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFwYWdlX2xpc3QpCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvdmRwYS5oIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBpbmRleCBjYjVh
M2Q4NDdhZjMuLmY4Njg2OTY1MTYxNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZkcGEu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgc3RydWN0
IHZkcGFfcGFyZW50X2RldjsKPiAgICAqIEBjb25maWc6IHRoZSBjb25maWd1cmF0aW9uIG9wcyBm
b3IgdGhpcyBkZXZpY2UuCj4gICAgKiBAaW5kZXg6IGRldmljZSBpbmRleAo+ICAgICogQGZlYXR1
cmVzX3ZhbGlkOiB3ZXJlIGZlYXR1cmVzIGluaXRpYWxpemVkPyBmb3IgbGVnYWN5IGd1ZXN0cwo+
ICsgKiBAc3ZhOiBpbmRpY2F0ZSB3aGV0aGVyIFNWQSAoU2hhcmVkIFZpcnR1YWwgQWRkcmVzc2lu
ZykgaXMgc3VwcG9ydGVkCgoKUmV0aGluayBhYm91dCB0aGlzLiBJIHRoaW5rIHdlIHByb2JhYmx5
IG5lZWQgYSBiZXR0ZXIgbmFtZSBvdGhlciB0aGFuIAoic3ZhIiBzaW5jZSBrZXJuZWwgYWxyZWFk
eSB1c2UgdGhhdCBmb3Igc2hhcmVkIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4gCkJ1dCBhY3R1YWxs
eSB3ZSBkb24ndCB0aGUgd2hvbGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlLgoKQW5kIEkgZ3Vlc3Mg
dGhpcyBjYW4gbm90IHdvcmsgZm9yIHRoZSBkZXZpY2UgdGhhdCB1c2UgcGxhdGZvcm0gSU9NTVUs
IHNvIAp3ZSBzaG91bGQgY2hlY2sgYW5kIGZhaWwgaWYgc3ZhICYmICEoZG1hX21hcCB8fCBzZXRf
bWFwKS4KClRoYW5rcwoKCj4gICAgKiBAbnZxczogbWF4aW11bSBudW1iZXIgb2Ygc3VwcG9ydGVk
IHZpcnRxdWV1ZXMKPiAgICAqIEBwZGV2OiBwYXJlbnQgZGV2aWNlIHBvaW50ZXI7IGNhbGxlciBt
dXN0IHNldHVwIHdoZW4gcmVnaXN0ZXJpbmcgZGV2aWNlIGFzIHBhcnQKPiAgICAqCSAgb2YgZGV2
X2FkZCgpIHBhcmVudGRldiBvcHMgY2FsbGJhY2sgYmVmb3JlIGludm9raW5nIF92ZHBhX3JlZ2lz
dGVyX2RldmljZSgpLgo+IEBAIC01NCw2ICs1NSw3IEBAIHN0cnVjdCB2ZHBhX2RldmljZSB7Cj4g
ICAJY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqY29uZmlnOwo+ICAgCXVuc2lnbmVkIGlu
dCBpbmRleDsKPiAgIAlib29sIGZlYXR1cmVzX3ZhbGlkOwo+ICsJYm9vbCBzdmE7Cj4gICAJaW50
IG52cXM7Cj4gICAJc3RydWN0IHZkcGFfcGFyZW50X2RldiAqcGRldjsKPiAgIH07Cj4gQEAgLTI1
MCwxNCArMjUyLDE2IEBAIHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgewo+ICAgCj4gICBzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKl9fdmRwYV9hbGxvY19kZXZpY2Uoc3RydWN0IGRldmljZSAqcGFyZW50LAo+
ICAgCQkJCQljb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpjb25maWcsCj4gLQkJCQkJaW50
IG52cXMsIHNpemVfdCBzaXplLCBjb25zdCBjaGFyICpuYW1lKTsKPiArCQkJCQlpbnQgbnZxcywg
c2l6ZV90IHNpemUsCj4gKwkJCQkJY29uc3QgY2hhciAqbmFtZSwgYm9vbCBzdmEpOwo+ICAgCj4g
LSNkZWZpbmUgdmRwYV9hbGxvY19kZXZpY2UoZGV2X3N0cnVjdCwgbWVtYmVyLCBwYXJlbnQsIGNv
bmZpZywgbnZxcywgbmFtZSkgICBcCj4gKyNkZWZpbmUgdmRwYV9hbGxvY19kZXZpY2UoZGV2X3N0
cnVjdCwgbWVtYmVyLCBwYXJlbnQsIGNvbmZpZywgXAo+ICsJCQkgIG52cXMsIG5hbWUsIHN2YSkg
XAo+ICAgCQkJICBjb250YWluZXJfb2YoX192ZHBhX2FsbG9jX2RldmljZSggXAo+ICAgCQkJCSAg
ICAgICBwYXJlbnQsIGNvbmZpZywgbnZxcywgXAo+ICAgCQkJCSAgICAgICBzaXplb2YoZGV2X3N0
cnVjdCkgKyBcCj4gICAJCQkJICAgICAgIEJVSUxEX0JVR19PTl9aRVJPKG9mZnNldG9mKCBcCj4g
LQkJCQkgICAgICAgZGV2X3N0cnVjdCwgbWVtYmVyKSksIG5hbWUpLCBcCj4gKwkJCQkgICAgICAg
ZGV2X3N0cnVjdCwgbWVtYmVyKSksIG5hbWUsIHN2YSksIFwKPiAgIAkJCQkgICAgICAgZGV2X3N0
cnVjdCwgbWVtYmVyKQo+ICAgCj4gICBpbnQgdmRwYV9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IHZk
cGFfZGV2aWNlICp2ZGV2KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
