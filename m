Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E96C7625
	for <lists.virtualization@lfdr.de>; Fri, 24 Mar 2023 04:09:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376EB40550;
	Fri, 24 Mar 2023 03:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376EB40550
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmc4ttG0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaobmreBRP6C; Fri, 24 Mar 2023 03:09:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 94FE94019D;
	Fri, 24 Mar 2023 03:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FE94019D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2C86C008A;
	Fri, 24 Mar 2023 03:09:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87FDDC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 03:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E73A60B36
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 03:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E73A60B36
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmc4ttG0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lr20gXrKrtzm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 03:09:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF9160B33
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFF9160B33
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Mar 2023 03:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679627373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtI2juFUeoRnDkwFmiyqwzGFUaIQAQe0cDkr2MscuyA=;
 b=Hmc4ttG0x0G/27ep6uiWya7IyZM2M6iZWaYB7ewBLGFh+dFYpXa/VwIAfgSlfti2cThZqS
 igScyRfTwHxCFGtS5leA79/1svta+XGClQOpomwjkycAa/qX1CqLuPhEnxmGgvVeE4Dp4W
 15l+9Tq86imSASjFFUATsYw0/kTcN0o=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-3kSGpHHmMx6wANhl0M9cyQ-1; Thu, 23 Mar 2023 23:09:31 -0400
X-MC-Unique: 3kSGpHHmMx6wANhl0M9cyQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-17e7104c589so272160fac.19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 20:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679627371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qtI2juFUeoRnDkwFmiyqwzGFUaIQAQe0cDkr2MscuyA=;
 b=HKs03VuJ5i1jc8oL/ARjMF5uv0MIgvb/TZ2Ox97w2mCMYFL55+NSCcQr+kE0zHxSSw
 x/uI9O+FHoWOTSnvke+c7gZmihO9sJsgqpf8/+nPZ9A6qepGkVabNEU4Aucor1OFiJ8M
 fGbSc6erABRAG69EvOHyYOp9ZEQQACP6bJpf+V8XJAFDDBnZAcLIwM7x02/cOFvxV7eB
 X9lyhxBg0VLWfUfdSzg+JrwtRI3TnAfPt3KwTC2kvlPDmuSsid8Se3bdQnRnt80Cml2d
 qQr33pSwv3MQ6tQR/sLVP/P3vnnAn3pt8jAYYg3wegIH2yWA1oNxx816/6j4rht77lKd
 N+lA==
X-Gm-Message-State: AAQBX9cj5vJ+RwU/r7WaZjg+FWJrilRNCWu3mqliQZj/zz5UZCgnyaB/
 Jm+o2gDA7eg7iM6u2JnAlip+Id8EXf+gsXdp2ut3L2RP6Ylg3BZXBVAZi25u33iQQbIkfdBO2rK
 ZigMA3B4qZSRmC2h9JqOpyzhyZMjvGxGkffRXjSRDn+3p82J07jp0CRiDuQ==
X-Received: by 2002:a05:6870:10d4:b0:17e:255e:b1 with SMTP id
 20-20020a05687010d400b0017e255e00b1mr502515oar.9.1679627371012; 
 Thu, 23 Mar 2023 20:09:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set+LnuKvSHKHAHgt2Eh7blZvjlwMurDf3B/v6VZFRw2wkwwsN54YFbLfhB516kRTf46wDFjWbQjLS5ngm+tAKvs=
X-Received: by 2002:a05:6870:10d4:b0:17e:255e:b1 with SMTP id
 20-20020a05687010d400b0017e255e00b1mr502500oar.9.1679627370630; Thu, 23 Mar
 2023 20:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230323085551.2346411-1-viktor@daynix.com>
In-Reply-To: <20230323085551.2346411-1-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Mar 2023 11:09:19 +0800
Message-ID: <CACGkMEsTpdES6Gzsx7eobJsac8a1V0dqfRm3vExrd1e+TJ_bVg@mail.gmail.com>
Subject: Re: [PATCH v5] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
To: Viktor Prutyanov <viktor@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-s390@vger.kernel.org, farman@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com, yan@daynix.com
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgNDo1NuKAr1BNIFZpa3RvciBQcnV0eWFub3YgPHZpa3Rv
ckBkYXluaXguY29tPiB3cm90ZToKPgo+IEFjY29yZGluZyB0byBWaXJ0SU8gc3BlYyB2MS4yLCBW
SVJUSU9fRl9OT1RJRklDQVRJT05fREFUQSBmZWF0dXJlCj4gaW5kaWNhdGVzIHRoYXQgdGhlIGRy
aXZlciBwYXNzZXMgZXh0cmEgZGF0YSBhbG9uZyB3aXRoIHRoZSBxdWV1ZQo+IG5vdGlmaWNhdGlv
bnMuCj4KPiBJbiBhIHNwbGl0IHF1ZXVlIGNhc2UsIHRoZSBleHRyYSBkYXRhIGlzIDE2LWJpdCBh
dmFpbGFibGUgaW5kZXguIEluIGEKPiBwYWNrZWQgcXVldWUgY2FzZSwgdGhlIGV4dHJhIGRhdGEg
aXMgMS1iaXQgd3JhcCBjb3VudGVyIGFuZCAxNS1iaXQKPiBhdmFpbGFibGUgaW5kZXguCj4KPiBB
ZGQgc3VwcG9ydCBmb3IgdGhpcyBmZWF0dXJlIGZvciBNTUlPLCBjaGFubmVsIEkvTyBhbmQgbW9k
ZXJuIFBDSQo+IHRyYW5zcG9ydHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgUHJ1dHlhbm92
IDx2aWt0b3JAZGF5bml4LmNvbT4KPiAtLS0KPiAgdjU6IHJlcGxhY2UgdGVybmFyeSBvcGVyYXRv
ciB3aXRoIGlmLWVsc2UKPiAgdjQ6IHJlbW92ZSBWUF9OT1RJRlkgbWFjcm8gYW5kIGxlZ2FjeSBQ
Q0kgc3VwcG9ydCwgYWRkCj4gICAgIHZpcnRpb19jY3dfa3ZtX25vdGlmeV93aXRoX2RhdGEgdG8g
dmlydGlvX2Njdwo+ICB2Mzogc3VwcG9ydCBmZWF0dXJlIGluIHZpcnRpb19jY3csIHJlbW92ZSBW
TV9OT1RJRlksIHVzZSBhdmFpbF9pZHhfc2hhZG93LAo+ICAgICByZW1vdmUgYnl0ZSBzd2FwLCBy
ZW5hbWUgdG8gdnJpbmdfbm90aWZpY2F0aW9uX2RhdGEKPiAgdjI6IHJlamVjdCB0aGUgZmVhdHVy
ZSBpbiB2aXJ0aW9fY2N3LCByZXBsYWNlIF9fbGUzMiB3aXRoIHUzMgo+Cj4gIFRlc3RlZCB3aXRo
IGRpc2FibGVkIFZJUlRJT19GX05PVElGSUNBVElPTl9EQVRBIG9uIHFlbXUtc3lzdGVtLXMzOTB4
Cj4gICh2aXJ0aW8tYmxrLWNjdyksIHFlbXUtc3lzdGVtLXJpc2N2NjQgKHZpcnRpby1ibGstZGV2
aWNlLAo+ICB2aXJ0aW8tcm5nLWRldmljZSksIHFlbXUtc3lzdGVtLXg4Nl82NCAodmlydGlvLWJs
ay1wY2ksIHZpcnRpby1uZXQtcGNpKQo+ICB0byBtYWtlIHN1cmUgbm90aGluZyBpcyBicm9rZW4u
Cj4gIFRlc3RlZCB3aXRoIGVuYWJsZWQgVklSVElPX0ZfTk9USUZJQ0FUSU9OX0RBVEEgb24gNjQt
Yml0IFJJU0MtViBMaW51eAo+ICBhbmQgbXkgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24gb2Ygdmly
dGlvLXJuZyB3aXRoIE1NSU8uCj4KPiAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMg
ICB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KPiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX21t
aW8uYyAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcGNpX21vZGVybi5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy92aXJ0aW8v
dmlydGlvX3JpbmcuYyAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGlu
dXgvdmlydGlvX3JpbmcuaCAgICAgICAgfCAgMiArKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmly
dGlvX2NvbmZpZy5oIHwgIDYgKysrKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvdmlydGlv
L3ZpcnRpb19jY3cuYyBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gaW5kZXgg
OTU0ZmMzMWI0YmM3Li45YTljNWQzNDQ1NGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zMzkwL3Zp
cnRpby92aXJ0aW9fY2N3LmMKPiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cu
Ywo+IEBAIC0zOTEsNyArMzkxLDcgQEAgc3RhdGljIHZvaWQgdmlydGlvX2Njd19kcm9wX2luZGlj
YXRvcihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ICAgICAgICAgY2N3X2Rldmlj
ZV9kbWFfZnJlZSh2Y2Rldi0+Y2RldiwgdGhpbmludF9hcmVhLCBzaXplb2YoKnRoaW5pbnRfYXJl
YSkpOwo+ICB9Cj4KPiAtc3RhdGljIGJvb2wgdmlydGlvX2Njd19rdm1fbm90aWZ5KHN0cnVjdCB2
aXJ0cXVldWUgKnZxKQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdmlydGlvX2Njd19kb19rdm1fbm90
aWZ5KHN0cnVjdCB2aXJ0cXVldWUgKnZxLCB1MzIgZGF0YSkKPiAgewo+ICAgICAgICAgc3RydWN0
IHZpcnRpb19jY3dfdnFfaW5mbyAqaW5mbyA9IHZxLT5wcml2Owo+ICAgICAgICAgc3RydWN0IHZp
cnRpb19jY3dfZGV2aWNlICp2Y2RldjsKPiBAQCAtNDAyLDEyICs0MDIsMjIgQEAgc3RhdGljIGJv
b2wgdmlydGlvX2Njd19rdm1fbm90aWZ5KHN0cnVjdCB2aXJ0cXVldWUgKnZxKQo+ICAgICAgICAg
QlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3Qgc3ViY2hhbm5lbF9pZCkgIT0gc2l6ZW9mKHVuc2ln
bmVkIGludCkpOwo+ICAgICAgICAgaW5mby0+Y29va2llID0ga3ZtX2h5cGVyY2FsbDMoS1ZNX1Mz
OTBfVklSVElPX0NDV19OT1RJRlksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqKCh1bnNpZ25lZCBpbnQgKikmc2NoaWQpLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdnEtPmluZGV4LCBpbmZvLT5jb29raWUpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSwgaW5mby0+Y29va2llKTsKPiAgICAgICAgIGlm
IChpbmZvLT5jb29raWUgPCAwKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gK3N0YXRpYyBib29sIHZpcnRpb19jY3dfa3ZtX25v
dGlmeShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPiArewo+ICsgICAgICAgcmV0dXJuIHZpcnRpb19j
Y3dfZG9fa3ZtX25vdGlmeSh2cSwgdnEtPmluZGV4KTsKPiArfQo+ICsKPiArc3RhdGljIGJvb2wg
dmlydGlvX2Njd19rdm1fbm90aWZ5X3dpdGhfZGF0YShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPiAr
ewo+ICsgICAgICAgcmV0dXJuIHZpcnRpb19jY3dfZG9fa3ZtX25vdGlmeSh2cSwgdnJpbmdfbm90
aWZpY2F0aW9uX2RhdGEodnEpKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCB2aXJ0aW9fY2N3X3Jl
YWRfdnFfY29uZihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNjdzEgKmNjdywgaW50IGluZGV4KQo+ICB7
Cj4gQEAgLTUwMSw2ICs1MTEsMTIgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZpcnRpb19j
Y3dfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gICAgICAgICB1NjQgcXVl
dWU7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgICAgICAgYm9vbCBtYXlfcmVk
dWNlOwo+ICsgICAgICAgYm9vbCAoKm5vdGlmeSkoc3RydWN0IHZpcnRxdWV1ZSAqdnEpOwo+ICsK
PiArICAgICAgIGlmIChfX3ZpcnRpb190ZXN0X2JpdCh2ZGV2LCBWSVJUSU9fRl9OT1RJRklDQVRJ
T05fREFUQSkpCj4gKyAgICAgICAgICAgICAgIG5vdGlmeSA9IHZpcnRpb19jY3dfa3ZtX25vdGlm
eV93aXRoX2RhdGE7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIG5vdGlmeSA9IHZp
cnRpb19jY3dfa3ZtX25vdGlmeTsKPgo+ICAgICAgICAgLyogQWxsb2NhdGUgcXVldWUuICovCj4g
ICAgICAgICBpbmZvID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHZpcnRpb19jY3dfdnFfaW5mbyks
IEdGUF9LRVJORUwpOwo+IEBAIC01MjQsNyArNTQwLDcgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVl
dWUgKnZpcnRpb19jY3dfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gICAg
ICAgICBtYXlfcmVkdWNlID0gdmNkZXYtPnJldmlzaW9uID4gMDsKPiAgICAgICAgIHZxID0gdnJp
bmdfY3JlYXRlX3ZpcnRxdWV1ZShpLCBpbmZvLT5udW0sIEtWTV9WSVJUSU9fQ0NXX1JJTkdfQUxJ
R04sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmRldiwgdHJ1ZSwgbWF5
X3JlZHVjZSwgY3R4LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRp
b19jY3dfa3ZtX25vdGlmeSwgY2FsbGJhY2ssIG5hbWUpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5vdGlmeSwgY2FsbGJhY2ssIG5hbWUpOwo+Cj4gICAgICAgICBpZiAo
IXZxKSB7Cj4gICAgICAgICAgICAgICAgIC8qIEZvciBub3csIHdlIGZhaWwgaWYgd2UgY2FuJ3Qg
Z2V0IHRoZSByZXF1ZXN0ZWQgc2l6ZS4gKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8v
dmlydGlvX21taW8uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiBpbmRleCAzZmY3
NDZlM2YyNGEuLjdlODdmNzQ1ZjY4ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fbW1pby5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+IEBAIC0yODUs
NiArMjg1LDE2IEBAIHN0YXRpYyBib29sIHZtX25vdGlmeShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkK
PiAgICAgICAgIHJldHVybiB0cnVlOwo+ICB9Cj4KPiArc3RhdGljIGJvb2wgdm1fbm90aWZ5X3dp
dGhfZGF0YShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPiArewo+ICsgICAgICAgc3RydWN0IHZpcnRp
b19tbWlvX2RldmljZSAqdm1fZGV2ID0gdG9fdmlydGlvX21taW9fZGV2aWNlKHZxLT52ZGV2KTsK
PiArICAgICAgIHUzMiBkYXRhID0gdnJpbmdfbm90aWZpY2F0aW9uX2RhdGEodnEpOwo+ICsKPiAr
ICAgICAgIHdyaXRlbChkYXRhLCB2bV9kZXYtPmJhc2UgKyBWSVJUSU9fTU1JT19RVUVVRV9OT1RJ
RlkpOwo+ICsKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gKwo+ICAvKiBOb3RpZnkgYWxs
IHZpcnRxdWV1ZXMgb24gYW4gaW50ZXJydXB0LiAqLwo+ICBzdGF0aWMgaXJxcmV0dXJuX3Qgdm1f
aW50ZXJydXB0KGludCBpcnEsIHZvaWQgKm9wYXF1ZSkKPiAgewo+IEBAIC0zNjgsNiArMzc4LDEy
IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2bV9zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2Rl
dmljZSAqdmRldiwgdW5zaWduZWQgaW50IGluCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
Owo+ICAgICAgICAgdW5zaWduZWQgaW50IG51bTsKPiAgICAgICAgIGludCBlcnI7Cj4gKyAgICAg
ICBib29sICgqbm90aWZ5KShzdHJ1Y3QgdmlydHF1ZXVlICp2cSk7Cj4gKwo+ICsgICAgICAgaWYg
KF9fdmlydGlvX3Rlc3RfYml0KHZkZXYsIFZJUlRJT19GX05PVElGSUNBVElPTl9EQVRBKSkKPiAr
ICAgICAgICAgICAgICAgbm90aWZ5ID0gdm1fbm90aWZ5X3dpdGhfZGF0YTsKPiArICAgICAgIGVs
c2UKPiArICAgICAgICAgICAgICAgbm90aWZ5ID0gdm1fbm90aWZ5Owo+Cj4gICAgICAgICBpZiAo
IW5hbWUpCj4gICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+IEBAIC0zOTcsNyArNDEzLDcg
QEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZtX3NldHVwX3ZxKHN0cnVjdCB2aXJ0aW9fZGV2
aWNlICp2ZGV2LCB1bnNpZ25lZCBpbnQgaW4KPgo+ICAgICAgICAgLyogQ3JlYXRlIHRoZSB2cmlu
ZyAqLwo+ICAgICAgICAgdnEgPSB2cmluZ19jcmVhdGVfdmlydHF1ZXVlKGluZGV4LCBudW0sIFZJ
UlRJT19NTUlPX1ZSSU5HX0FMSUdOLCB2ZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRydWUsIHRydWUsIGN0eCwgdm1fbm90aWZ5LCBjYWxsYmFjaywgbmFtZSk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgdHJ1ZSwgY3R4LCBub3RpZnksIGNh
bGxiYWNrLCBuYW1lKTsKPiAgICAgICAgIGlmICghdnEpIHsKPiAgICAgICAgICAgICAgICAgZXJy
ID0gLUVOT01FTTsKPiAgICAgICAgICAgICAgICAgZ290byBlcnJvcl9uZXdfdmlydHF1ZXVlOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYwo+IGluZGV4IDllNDk2ZTI4OGNmYS4uM2JmYzM2
OGIyNzllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMK
PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jCj4gQEAgLTI4OCw2ICsy
ODgsMTUgQEAgc3RhdGljIHUxNiB2cF9jb25maWdfdmVjdG9yKHN0cnVjdCB2aXJ0aW9fcGNpX2Rl
dmljZSAqdnBfZGV2LCB1MTYgdmVjdG9yKQo+ICAgICAgICAgcmV0dXJuIHZwX21vZGVybl9jb25m
aWdfdmVjdG9yKCZ2cF9kZXYtPm1kZXYsIHZlY3Rvcik7Cj4gIH0KPgo+ICtzdGF0aWMgYm9vbCB2
cF9ub3RpZnlfd2l0aF9kYXRhKHN0cnVjdCB2aXJ0cXVldWUgKnZxKQo+ICt7Cj4gKyAgICAgICB1
MzIgZGF0YSA9IHZyaW5nX25vdGlmaWNhdGlvbl9kYXRhKHZxKTsKPiArCj4gKyAgICAgICBpb3dy
aXRlMzIoZGF0YSwgKHZvaWQgX19pb21lbSAqKXZxLT5wcml2KTsKPiArCj4gKyAgICAgICByZXR1
cm4gdHJ1ZTsKPiArfQo+ICsKPiAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnNldHVwX3ZxKHN0
cnVjdCB2aXJ0aW9fcGNpX2RldmljZSAqdnBfZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdmlydGlvX3BjaV92cV9pbmZvICppbmZvLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXgsCj4gQEAgLTMwMSw2ICsz
MTAsMTIgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnNldHVwX3ZxKHN0cnVjdCB2aXJ0aW9f
cGNpX2RldmljZSAqdnBfZGV2LAo+ICAgICAgICAgc3RydWN0IHZpcnRxdWV1ZSAqdnE7Cj4gICAg
ICAgICB1MTYgbnVtOwo+ICAgICAgICAgaW50IGVycjsKPiArICAgICAgIGJvb2wgKCpub3RpZnkp
KHN0cnVjdCB2aXJ0cXVldWUgKnZxKTsKPiArCj4gKyAgICAgICBpZiAoX192aXJ0aW9fdGVzdF9i
aXQoJnZwX2Rldi0+dmRldiwgVklSVElPX0ZfTk9USUZJQ0FUSU9OX0RBVEEpKQo+ICsgICAgICAg
ICAgICAgICBub3RpZnkgPSB2cF9ub3RpZnlfd2l0aF9kYXRhOwo+ICsgICAgICAgZWxzZQo+ICsg
ICAgICAgICAgICAgICBub3RpZnkgPSB2cF9ub3RpZnk7Cj4KPiAgICAgICAgIGlmIChpbmRleCA+
PSB2cF9tb2Rlcm5fZ2V0X251bV9xdWV1ZXMobWRldikpCj4gICAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOwo+IEBAIC0zMjEsNyArMzM2LDcgQEAgc3RhdGljIHN0cnVjdCB2
aXJ0cXVldWUgKnNldHVwX3ZxKHN0cnVjdCB2aXJ0aW9fcGNpX2RldmljZSAqdnBfZGV2LAo+ICAg
ICAgICAgdnEgPSB2cmluZ19jcmVhdGVfdmlydHF1ZXVlKGluZGV4LCBudW0sCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgU01QX0NBQ0hFX0JZVEVTLCAmdnBfZGV2LT52ZGV2
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIHRydWUsIGN0eCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cF9ub3RpZnksIGNhbGxiYWNr
LCBuYW1lKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBub3RpZnksIGNh
bGxiYWNrLCBuYW1lKTsKPiAgICAgICAgIGlmICghdnEpCj4gICAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gaW5kZXggNGMzYmIwZGRl
YjliLi44Mzc4NzVjYzMxOTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiBAQCAtMjc1Miw2ICsy
NzUyLDIxIEBAIHZvaWQgdnJpbmdfZGVsX3ZpcnRxdWV1ZShzdHJ1Y3QgdmlydHF1ZXVlICpfdnEp
Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwodnJpbmdfZGVsX3ZpcnRxdWV1ZSk7Cj4KPiArdTMy
IHZyaW5nX25vdGlmaWNhdGlvbl9kYXRhKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiArewo+ICsg
ICAgICAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiArICAgICAg
IHUxNiBuZXh0Owo+ICsKPiArICAgICAgIGlmICh2cS0+cGFja2VkX3JpbmcpCj4gKyAgICAgICAg
ICAgICAgIG5leHQgPSAodnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeCAmIH4oMSA8PCAxNSkpIHwK
PiArICAgICAgICAgICAgICAgICAgICAgICB2cS0+cGFja2VkLmF2YWlsX3dyYXBfY291bnRlciA8
PCAxNTsKCk5pdDogV2UgaGF2ZSBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUiB3aGljaCBj
b3VsZCBiZSB1c2VkIGZvcgpyZXBsYWNpbmcgMTUgaGVyZS4KCkFuZCB3ZSBoYXZlIG1hbnkgcGxh
Y2VzIGZvciBwYWNraW5nIHRoZW0gaW50byB1MTYsIGl0IG1pZ2h0IGJlIGJldHRlcgp0byBpbnRy
b2R1Y2UgYSBoZWxwZXIuCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4KClRoYW5rcwoKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgbmV4dCA9IHZxLT5z
cGxpdC5hdmFpbF9pZHhfc2hhZG93Owo+ICsKPiArICAgICAgIHJldHVybiBuZXh0IDw8IDE2IHwg
X3ZxLT5pbmRleDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTCh2cmluZ19ub3RpZmljYXRpb25f
ZGF0YSk7Cj4gKwo+ICAvKiBNYW5pcHVsYXRlcyB0cmFuc3BvcnQtc3BlY2lmaWMgZmVhdHVyZSBi
aXRzLiAqLwo+ICB2b2lkIHZyaW5nX3RyYW5zcG9ydF9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2Rl
dmljZSAqdmRldikKPiAgewo+IEBAIC0yNzcxLDYgKzI3ODYsOCBAQCB2b2lkIHZyaW5nX3RyYW5z
cG9ydF9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgY2FzZSBWSVJUSU9fRl9PUkRFUl9Q
TEFURk9STToKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAg
ICAgY2FzZSBWSVJUSU9fRl9OT1RJRklDQVRJT05fREFUQToKPiArICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBXZSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgYml0LiAqLwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBpKTsKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC92aXJ0aW9fcmluZy5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fcmluZy5o
Cj4gaW5kZXggOGI5NWI2OWVmNjk0Li4yNTUwYzkxNzBmNGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC92aXJ0aW9fcmluZy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fcmluZy5o
Cj4gQEAgLTExNyw0ICsxMTcsNiBAQCB2b2lkIHZyaW5nX2RlbF92aXJ0cXVldWUoc3RydWN0IHZp
cnRxdWV1ZSAqdnEpOwo+ICB2b2lkIHZyaW5nX3RyYW5zcG9ydF9mZWF0dXJlcyhzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldik7Cj4KPiAgaXJxcmV0dXJuX3QgdnJpbmdfaW50ZXJydXB0KGludCBp
cnEsIHZvaWQgKl92cSk7Cj4gKwo+ICt1MzIgdnJpbmdfbm90aWZpY2F0aW9uX2RhdGEoc3RydWN0
IHZpcnRxdWV1ZSAqX3ZxKTsKPiAgI2VuZGlmIC8qIF9MSU5VWF9WSVJUSU9fUklOR19IICovCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fY29uZmlnLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gaW5kZXggM2MwNTE2MmJjOTg4Li4yYzcxMmM2
NTQxNjUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19jb25maWcuaAo+
ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fY29uZmlnLmgKPiBAQCAtOTksNiArOTks
MTIgQEAKPiAgICovCj4gICNkZWZpbmUgVklSVElPX0ZfU1JfSU9WICAgICAgICAgICAgICAgICAg
ICAgICAgMzcKPgo+ICsvKgo+ICsgKiBUaGlzIGZlYXR1cmUgaW5kaWNhdGVzIHRoYXQgdGhlIGRy
aXZlciBwYXNzZXMgZXh0cmEgZGF0YSAoYmVzaWRlcwo+ICsgKiBpZGVudGlmeWluZyB0aGUgdmly
dHF1ZXVlKSBpbiBpdHMgZGV2aWNlIG5vdGlmaWNhdGlvbnMuCj4gKyAqLwo+ICsjZGVmaW5lIFZJ
UlRJT19GX05PVElGSUNBVElPTl9EQVRBICAgICAzOAo+ICsKPiAgLyoKPiAgICogVGhpcyBmZWF0
dXJlIGluZGljYXRlcyB0aGF0IHRoZSBkcml2ZXIgY2FuIHJlc2V0IGEgcXVldWUgaW5kaXZpZHVh
bGx5Lgo+ICAgKi8KPiAtLQo+IDIuMzUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
