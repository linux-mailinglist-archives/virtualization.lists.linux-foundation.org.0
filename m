Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 145566CB714
	for <lists.virtualization@lfdr.de>; Tue, 28 Mar 2023 08:25:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A2881FBD;
	Tue, 28 Mar 2023 06:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A2881FBD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKqOFBMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64IFdgQTSInx; Tue, 28 Mar 2023 06:25:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3C72F82181;
	Tue, 28 Mar 2023 06:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C72F82181
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81A3CC007E;
	Tue, 28 Mar 2023 06:25:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7113DC002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 06:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C8016118A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 06:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8016118A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKqOFBMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOhQtcdOmCyk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 06:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5278F61160
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5278F61160
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679984732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jPu8kw/Ah/LTcgqKhnnr0XyPGfhmwRVm+34XjGTCtI=;
 b=fKqOFBMTkJXPFMw+KkIG9PY3ZXSDS0njQwwh1nlbEW2SrOHq9/BHc0PnRQuFjvyaE5cizj
 HofYLo5vmILRGAXYVlDrxka8TsmD6XYY81sNDzhpLRSNofLoIDHtLtjsA7u3sz3UTzm2Jg
 XCKjSkBc0bxHZreih/HZqzmQg9rypJY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-GhD8YV9zMuyOqYWZjWbKbw-1; Tue, 28 Mar 2023 02:25:31 -0400
X-MC-Unique: GhD8YV9zMuyOqYWZjWbKbw-1
Received: by mail-oi1-f198.google.com with SMTP id
 a9-20020a05680802c900b00388734df7e8so1872199oid.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Mar 2023 23:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679984730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jPu8kw/Ah/LTcgqKhnnr0XyPGfhmwRVm+34XjGTCtI=;
 b=gL1mZWLKax03qX9JfJ6TeU50ErXQGaMQ7VywT/sl4ZUTF9omvh7Ul99jkCd12/Dba7
 S4sGVdUFfjAK7jU/ifeiTUwiiZ7B4ypKwG/ovXRgrBIUSdl+or7d1x+W43uVf8UDybJG
 vTb/WVgrVOByhCKrnQouUfdl4FCKyFaAk2ipK8BB4GoGjbE7W+ytSHPm1Meeckr6qEpx
 PND+LVG9mPMf6tbs2ddllKmT9dF3hcMTzLbQVqocX9M9OerETXyznRtoux+RlE+3iKwv
 OBxMjAiA6HECAJDxaD8FQvuAeXWG7FUn2zVbfPVGwtxGlVkXTuKmq6svvcp3eAdtEP7G
 2c4g==
X-Gm-Message-State: AO0yUKUKaLtr8awVuyEKGMYAPSjo57tMLoyYApGhZ7JkaxFxGsjjdbgt
 OoEwDeyT/kqpaqH26tpVYuS61oXtIWVFDdVUZjzfmxco89XuWviXZue8swejfVxQNV4m3cuf+bM
 7Z9rb7wdlaou4YEYba7pPKCRf2G4K7hDc+LiMrYYvZPlp3EwFvaDq6dwSVw==
X-Received: by 2002:a54:4710:0:b0:384:4e2d:81ea with SMTP id
 k16-20020a544710000000b003844e2d81eamr4141311oik.9.1679984729980; 
 Mon, 27 Mar 2023 23:25:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Nvm03pC5kkULeNNuswwsPIi6terzHBaZxF4RoEVHvLE4ddxiXZtalZRhQbvBnDFjxOJSUk8Oju4qT0iy3jok=
X-Received: by 2002:a54:4710:0:b0:384:4e2d:81ea with SMTP id
 k16-20020a544710000000b003844e2d81eamr4141304oik.9.1679984729421; Mon, 27 Mar
 2023 23:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230322025701.2955-1-xuanzhuo@linux.alibaba.com>
 <20230322025701.2955-2-xuanzhuo@linux.alibaba.com>
 <792bd26a-03a0-9687-15c2-a70f173ba798@redhat.com>
In-Reply-To: <792bd26a-03a0-9687-15c2-a70f173ba798@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 28 Mar 2023 14:25:18 +0800
Message-ID: <CACGkMEumgO2cncZrKwONWjboYuws=Kg53p7r3oQJL-yHWYR3zQ@mail.gmail.com>
Subject: Re: [PATCH vhost v4 01/11] virtio_ring: split: separate dma codes
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 virtualization@lists.linux-foundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMjoyNOKAr1BNIEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4KPiDlnKggMjAyMy8zLzIyIDEwOjU2LCBYdWFuIFpodW8g5YaZ
6YGTOgo+ID4gRE1BLXJlbGF0ZWQgbG9naWMgaXMgc2VwYXJhdGVkIGZyb20gdGhlIHZpcnRxdWV1
ZV9hZGRfc3BsaXQoKSB0bwo+ID4gb25lIG5ldyBmdW5jdGlvbi4gRE1BIGFkZHJlc3Mgd2lsbCBi
ZSBzYXZlZCBhcyBzZy0+ZG1hX2FkZHJlc3MgaWYKPiA+IHVzZV9kbWFfYXBpIGlzIHRydWUsIHRo
ZW4gdmlydHF1ZXVlX2FkZF9zcGxpdCgpIHdpbGwgdXNlIGl0IGRpcmVjdGx5Lgo+ID4gVW5tYXAg
b3BlcmF0aW9uIHdpbGwgYmUgc2ltcGxlci4KPiA+Cj4gPiBUaGUgcHVycG9zZSBvZiB0aGlzIGlz
IHRvIGZhY2lsaXRhdGUgc3Vic2VxdWVudCBzdXBwb3J0IHRvIHJlY2VpdmUKPiA+IGRtYSBhZGRy
ZXNzIG1hcHBlZCBieSBkcml2ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1byA8
eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4KPgo+IEFja2VkLWJ5OiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgo+Cj4gVGhhbmtzCgpQbGVhc2UgaWdub3JlIHRoaXMsIGhpdCB0
aGUgYnV0dG9uIGFjY2lkZW50YWxseS4KClRoYW5rcwoKPgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8IDEyMSArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMg
Yi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiBpbmRleCA0MTE0NGI1MjQ2YTguLmZl
NzA0Y2E2YzgxMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMK
PiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+IEBAIC0zNzksNiArMzc5
LDE0IEBAIHN0YXRpYyBkbWFfYWRkcl90IHZyaW5nX21hcF9vbmVfc2coY29uc3Qgc3RydWN0IHZy
aW5nX3ZpcnRxdWV1ZSAqdnEsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpcmVjdGlv
bik7Cj4gPiAgIH0KPiA+Cj4gPiArc3RhdGljIGRtYV9hZGRyX3QgdnJpbmdfc2dfYWRkcmVzcyhz
dHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnKQo+ID4gK3sKPiA+ICsgICAgIGlmIChzZy0+ZG1hX2FkZHJl
c3MpCj4gPiArICAgICAgICAgICAgIHJldHVybiBzZy0+ZG1hX2FkZHJlc3M7Cj4gPiArCj4gPiAr
ICAgICByZXR1cm4gKGRtYV9hZGRyX3Qpc2dfcGh5cyhzZyk7Cj4gPiArfQo+ID4gKwo+ID4gICBz
dGF0aWMgZG1hX2FkZHJfdCB2cmluZ19tYXBfc2luZ2xlKGNvbnN0IHN0cnVjdCB2cmluZ192aXJ0
cXVldWUgKnZxLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqY3B1
X2FkZHIsIHNpemVfdCBzaXplLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQo+ID4gQEAgLTUyMCw2ICs1MjgsODAg
QEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgdmlydHF1ZXVlX2FkZF9kZXNjX3NwbGl0KHN0
cnVjdCB2aXJ0cXVldWUgKnZxLAo+ID4gICAgICAgcmV0dXJuIG5leHQ7Cj4gPiAgIH0KPiA+Cj4g
PiArc3RhdGljIHZvaWQgdmlydHF1ZXVlX3VubWFwX3NncyhzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVl
ICp2cSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzY2F0dGVybGlz
dCAqc2dzW10sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
dG90YWxfc2csCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
b3V0X3NncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBp
bl9zZ3MpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKPiA+ICsgICAg
IHVuc2lnbmVkIGludCBuOwo+ID4gKwo+ID4gKyAgICAgaWYgKCF2cS0+dXNlX2RtYV9hcGkpCj4g
PiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgIGZvciAobiA9IDA7IG4gPCBv
dXRfc2dzOyBuKyspIHsKPiA+ICsgICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNn
ID0gc2dfbmV4dChzZykpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoIXNnLT5kbWFf
YWRkcmVzcykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBkbWFfdW5tYXBfcGFnZSh2cmluZ19kbWFfZGV2KHZx
KSwgc2ctPmRtYV9hZGRyZXNzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNnLT5sZW5ndGgsIERNQV9UT19ERVZJQ0UpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiAr
ICAgICB9Cj4gPiArCj4gPiArICAgICBmb3IgKDsgbiA8IChvdXRfc2dzICsgaW5fc2dzKTsgbisr
KSB7Cj4gPiArICAgICAgICAgICAgIGZvciAoc2cgPSBzZ3Nbbl07IHNnOyBzZyA9IHNnX25leHQo
c2cpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKCFzZy0+ZG1hX2FkZHJlc3MpCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgZG1hX3VubWFwX3BhZ2UodnJpbmdfZG1hX2Rldih2cSksIHNnLT5kbWFf
YWRkcmVzcywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZy0+bGVu
Z3RoLCBETUFfRlJPTV9ERVZJQ0UpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgdmlydHF1ZXVlX21hcF9zZ3Moc3RydWN0IHZyaW5n
X3ZpcnRxdWV1ZSAqdnEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2Nh
dHRlcmxpc3QgKnNnc1tdLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IHRvdGFsX3NnLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IG91dF9zZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW5f
c2dzKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4gPiArICAgICB1
bnNpZ25lZCBpbnQgbjsKPiA+ICsKPiA+ICsgICAgIGlmICghdnEtPnVzZV9kbWFfYXBpKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIGZvciAobiA9IDA7IG4gPCBv
dXRfc2dzOyBuKyspIHsKPiA+ICsgICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNn
ID0gc2dfbmV4dChzZykpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkbWFfYWRkcl90IGFk
ZHIgPSB2cmluZ19tYXBfb25lX3NnKHZxLCBzZywgRE1BX1RPX0RFVklDRSk7Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZyaW5nX21hcHBpbmdfZXJyb3IodnEsIGFkZHIpKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgc2ctPmRtYV9hZGRyZXNzID0gYWRkcjsKPiA+ICsgICAgICAgICAg
ICAgfQo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZm9yICg7IG4gPCAob3V0X3NncyArIGlu
X3Nncyk7IG4rKykgewo+ID4gKyAgICAgICAgICAgICBmb3IgKHNnID0gc2dzW25dOyBzZzsgc2cg
PSBzZ19uZXh0KHNnKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgYWRk
ciA9IHZyaW5nX21hcF9vbmVfc2codnEsIHNnLCBETUFfRlJPTV9ERVZJQ0UpOwo+ID4gKwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGlmICh2cmluZ19tYXBwaW5nX2Vycm9yKHZxLCBhZGRyKSkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHNnLT5kbWFfYWRkcmVzcyA9IGFkZHI7Cj4gPiArICAgICAgICAg
ICAgIH0KPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gK2Vy
cjoKPiA+ICsgICAgIHZpcnRxdWV1ZV91bm1hcF9zZ3ModnEsIHNncywgdG90YWxfc2csIG91dF9z
Z3MsIGluX3Nncyk7Cj4gPiArICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICt9Cj4gPiArCj4gPiAg
IHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNjYXR0
ZXJsaXN0ICpzZ3NbXSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCB0b3RhbF9zZywKPiA+IEBAIC01MzIsOSArNjE0LDkgQEAgc3RhdGljIGlubGlu
ZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiAgICAg
ICBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4gICAgICAgc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzZzsKPiA+ICAgICAgIHN0cnVjdCB2cmluZ19kZXNjICpkZXNjOwo+
ID4gLSAgICAgdW5zaWduZWQgaW50IGksIG4sIGF2YWlsLCBkZXNjc191c2VkLCBwcmV2LCBlcnJf
aWR4Owo+ID4gLSAgICAgaW50IGhlYWQ7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgaSwgbiwgYXZh
aWwsIGRlc2NzX3VzZWQsIHByZXY7Cj4gPiAgICAgICBib29sIGluZGlyZWN0Owo+ID4gKyAgICAg
aW50IGhlYWQ7Cj4gPgo+ID4gICAgICAgU1RBUlRfVVNFKHZxKTsKPiA+Cj4gPiBAQCAtNTg2LDMy
ICs2NjgsMzAgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3Qg
dmlydHF1ZXVlICpfdnEsCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PU1BDOwo+ID4gICAg
ICAgfQo+ID4KPiA+ICsgICAgIGlmICh2aXJ0cXVldWVfbWFwX3Nncyh2cSwgc2dzLCB0b3RhbF9z
Zywgb3V0X3NncywgaW5fc2dzKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4g
PiArCj4gPiAgICAgICBmb3IgKG4gPSAwOyBuIDwgb3V0X3NnczsgbisrKSB7Cj4gPiAgICAgICAg
ICAgICAgIGZvciAoc2cgPSBzZ3Nbbl07IHNnOyBzZyA9IHNnX25leHQoc2cpKSB7Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgZG1hX2FkZHJfdCBhZGRyID0gdnJpbmdfbWFwX29uZV9zZyh2cSwg
c2csIERNQV9UT19ERVZJQ0UpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGlmICh2cmluZ19t
YXBwaW5nX2Vycm9yKHZxLCBhZGRyKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gdW5tYXBfcmVsZWFzZTsKPiA+IC0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBwcmV2
ID0gaTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAvKiBOb3RlIHRoYXQgd2UgdHJ1c3QgaW5k
aXJlY3QgZGVzY3JpcHRvcgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAqIHRhYmxlIHNpbmNl
IGl0IHVzZSBzdHJlYW0gRE1BIG1hcHBpbmcuCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICov
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgaSA9IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxpdChf
dnEsIGRlc2MsIGksIGFkZHIsIHNnLT5sZW5ndGgsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
aSA9IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxpdChfdnEsIGRlc2MsIGksCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cmluZ19zZ19hZGRyZXNz
KHNnKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNnLT5sZW5ndGgsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBWUklOR19ERVNDX0ZfTkVYVCwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGlyZWN0KTsKPiA+ICAgICAgICAgICAg
ICAgfQo+ID4gICAgICAgfQo+ID4gICAgICAgZm9yICg7IG4gPCAob3V0X3NncyArIGluX3Nncyk7
IG4rKykgewo+ID4gICAgICAgICAgICAgICBmb3IgKHNnID0gc2dzW25dOyBzZzsgc2cgPSBzZ19u
ZXh0KHNnKSkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgYWRkciA9IHZy
aW5nX21hcF9vbmVfc2codnEsIHNnLCBETUFfRlJPTV9ERVZJQ0UpOwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgIGlmICh2cmluZ19tYXBwaW5nX2Vycm9yKHZxLCBhZGRyKSkKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5tYXBfcmVsZWFzZTsKPiA+IC0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBwcmV2ID0gaTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAvKiBO
b3RlIHRoYXQgd2UgdHJ1c3QgaW5kaXJlY3QgZGVzY3JpcHRvcgo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAqIHRhYmxlIHNpbmNlIGl0IHVzZSBzdHJlYW0gRE1BIG1hcHBpbmcuCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICovCj4gPiAtICAgICAgICAgICAgICAgICAgICAgaSA9IHZpcnRx
dWV1ZV9hZGRfZGVzY19zcGxpdChfdnEsIGRlc2MsIGksIGFkZHIsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgaSA9IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxpdChfdnEsIGRlc2MsIGksCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cmluZ19z
Z19hZGRyZXNzKHNnKSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNnLT5sZW5ndGgsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBWUklOR19ERVNDX0ZfTkVYVCB8Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19ERVNDX0ZfV1JJ
VEUsCj4gPiBAQCAtNjc5LDIyICs3NTksNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVf
YWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ICAgICAgIHJldHVybiAwOwo+ID4K
PiA+ICAgdW5tYXBfcmVsZWFzZToKPiA+IC0gICAgIGVycl9pZHggPSBpOwo+ID4gLQo+ID4gLSAg
ICAgaWYgKGluZGlyZWN0KQo+ID4gLSAgICAgICAgICAgICBpID0gMDsKPiA+IC0gICAgIGVsc2UK
PiA+IC0gICAgICAgICAgICAgaSA9IGhlYWQ7Cj4gPiAtCj4gPiAtICAgICBmb3IgKG4gPSAwOyBu
IDwgdG90YWxfc2c7IG4rKykgewo+ID4gLSAgICAgICAgICAgICBpZiAoaSA9PSBlcnJfaWR4KQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gLSAgICAgICAgICAgICBpZiAoaW5k
aXJlY3QpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICB2cmluZ191bm1hcF9vbmVfc3BsaXRf
aW5kaXJlY3QodnEsICZkZXNjW2ldKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBpID0gdmly
dGlvMTZfdG9fY3B1KF92cS0+dmRldiwgZGVzY1tpXS5uZXh0KTsKPiA+IC0gICAgICAgICAgICAg
fSBlbHNlCj4gPiAtICAgICAgICAgICAgICAgICAgICAgaSA9IHZyaW5nX3VubWFwX29uZV9zcGxp
dCh2cSwgaSk7Cj4gPiAtICAgICB9Cj4gPiArICAgICB2aXJ0cXVldWVfdW5tYXBfc2dzKHZxLCBz
Z3MsIHRvdGFsX3NnLCBvdXRfc2dzLCBpbl9zZ3MpOwo+ID4KPiA+ICAgICAgIGlmIChpbmRpcmVj
dCkKPiA+ICAgICAgICAgICAgICAga2ZyZWUoZGVzYyk7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
