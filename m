Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0A79A1F9
	for <lists.virtualization@lfdr.de>; Mon, 11 Sep 2023 05:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26ED380BC7;
	Mon, 11 Sep 2023 03:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26ED380BC7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVhhuJR8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_ORJISIg9cA; Mon, 11 Sep 2023 03:48:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B2D1C80BD1;
	Mon, 11 Sep 2023 03:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D1C80BD1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABDDC0DD3;
	Mon, 11 Sep 2023 03:48:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B628C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 03:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA2F60C08
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 03:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA2F60C08
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVhhuJR8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBLJ3Fe-6MP0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 03:48:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B18D60C05
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 03:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B18D60C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694404114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5E5UxRaf+8bynJOkbkmpj7fwbb2S7rf6YXuPS5dwMA=;
 b=hVhhuJR8bVKVfO33bRm6BtBqYBJOvyRXYUfGMPn+5H00j4AAhCRVMoeiH9VqYRddbpxza4
 SSNpgef+C52Fyy5zS8ZYxxOHOI76tMOV2a0R3n4BmM5ffFOjisid4r9OZKTH9MY8O4LUDU
 oZy+Ky/dGTQGkKAFiwj7A/W6x5LWpnw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-hh11dEPvOp6lp04xOsZX1g-1; Sun, 10 Sep 2023 23:48:32 -0400
X-MC-Unique: hh11dEPvOp6lp04xOsZX1g-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ba1949656bso42993971fa.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 10 Sep 2023 20:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694404111; x=1695008911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5E5UxRaf+8bynJOkbkmpj7fwbb2S7rf6YXuPS5dwMA=;
 b=P4PyxugRCHji1eMsxhiz42KwK5OMk35FrAQrJO+9Wm7Wh1ETsnso6vVEDV4ezlLfOk
 usnrZoqWp+1/PrpagaMMdlCMoZPprhMipQIYneOIwFSGtEw0x3+MOmKcyG+jkCqMDA+M
 BfsGJTg8Qw9JzpFBQwNBVIKGoHUbzYD/Tc1FFSBJ7x5hmcUIdL5iBNSNgHfSuxaErV29
 zNnJ5hWnjhoFrB2Ow6AMzCUYz2D9Vo0UbvHlBriol6nB4Joqxym21HQtJtxdkfuYEisZ
 FyNh5iTDv9ym0B1Nx2Xpas/x3Bq0Z50CHVicKqrkTUVc9FgUhPLpdMRkSu/rrI9uyJW5
 RaTA==
X-Gm-Message-State: AOJu0Ywl1NhzthEv5sbpTi4RZ6Ljd0YOr9qf39MzIJsZ63XTmSpYrrwE
 NPW+7Egs8OXu3p79daEL/EMOEvSdK/UPrW8kVt6Mw2yKcpRgvWETtl3ZD48bbWI/7bGcaWkUPFd
 o3msmGdeZlQwlQcWnuERwif0v3TEa1TWFbLGeYe7scXQ6wdnkJEfIDVGaew==
X-Received: by 2002:a05:6512:3188:b0:500:b63f:4db3 with SMTP id
 i8-20020a056512318800b00500b63f4db3mr7842680lfe.35.1694404111230; 
 Sun, 10 Sep 2023 20:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqY9X0KuAxH2NPlsSlaNHJuDuq0gCG6kh1b8ct5upcY68fHHWxdqqpEHbncdiKvIQqRf56JW4RAG7EICV1Fug=
X-Received: by 2002:a05:6512:3188:b0:500:b63f:4db3 with SMTP id
 i8-20020a056512318800b00500b63f4db3mr7842672lfe.35.1694404110826; Sun, 10 Sep
 2023 20:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <1694267039-718-1-git-send-email-si-wei.liu@oracle.com>
 <1694267039-718-3-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1694267039-718-3-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Sep 2023 11:48:19 +0800
Message-ID: <CACGkMEuY+KF_mBRbbahsbUoCYeALwF=o7xvJT0BvSZzWHqEFLw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/4] vdpa/mlx5: implement .reset_map driver op
To: Si-Wei Liu <si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: eperezma@redhat.com, virtualization@lists.linux-foundation.org,
 xuanzhuo@linux.alibaba.com, mst@redhat.com
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

T24gU2F0LCBTZXAgOSwgMjAyMyBhdCA5OjQ24oCvUE0gU2ktV2VpIExpdSA8c2ktd2VpLmxpdUBv
cmFjbGUuY29tPiB3cm90ZToKPgo+IFRvZGF5LCBtbHg1X3ZkcGEgZ2V0cyBzdGFydGVkIGJ5IHBy
ZWFsbG9jYXRlIDE6MSBETUEgbWFwcGluZyBhdAo+IGRldmljZSBjcmVhdGlvbiB0aW1lLCB3aGls
ZSB0aGlzIDE6MSBtYXBwaW5nIHdpbGwgYmUgaW1wbGljaXRseQo+IGRlc3Ryb3llZCB3aGVuIHRo
ZSBmaXJzdCAuc2V0X21hcCBjYWxsIGlzIGludm9rZWQuIEV2ZXJ5dGltZQo+IHdoZW4gdGhlIC5y
ZXNldCBjYWxsYmFjayBpcyBpbnZva2VkLCBhbnkgbWFwcGluZyBsZWZ0IGJlaGluZCB3aWxsCj4g
YmUgZHJvcHBlZCB0aGVuIHJlc2V0IGJhY2sgdG8gdGhlIGluaXRpYWwgMToxIERNQSBtYXBwaW5n
Lgo+Cj4gSW4gb3JkZXIgdG8gcmVkdWNlIGV4Y2Vzc2l2ZSBtZW1vcnkgbWFwcGluZyBjb3N0IGR1
cmluZyBsaXZlCj4gbWlncmF0aW9uLCBpdCBpcyBkZXNpcmFibGUgdG8gZGVjb3VwbGUgdGhlIHZo
b3N0LXZkcGEgaW90bGIKPiBhYnN0cmFjdGlvbiBmcm9tIHRoZSB2aXJ0aW8gZGV2aWNlIGxpZmUg
Y3ljbGUsIGkuZS4gbWFwcGluZ3MKPiBzaG91bGQgYmUgbGVmdCBpbnRhY3QgYWNyb3NzIHZpcnRp
byBkZXZpY2UgcmVzZXQuIExldmVyYWdlIHRoZQo+IC5yZXNldF9tYXAgY2FsbGJhY2sgdG8gcmVz
ZXQgbWVtb3J5IG1hcHBpbmcsIHRoZW4gdGhlIGRldmljZQo+IC5yZXNldCByb3V0aW5lIGNhbiBy
dW4gZnJlZSBmcm9tIGhhdmluZyB0byBjbGVhbiB1cCBtZW1vcnkKPiBtYXBwaW5ncy4KCkl0J3Mg
bm90IGNsZWFyIHRoZSBkaXJlY3QgcmVsYXRpb25zaGlwIGJldHdlZW4gdGhlIHBlcnNpc3RlbnQg
bWFwcGluZwphbmQgcmVzZXRfbWFwLiBDb3VsZCB3ZSBkbyBpdCBzdGVwIGJ5IHN0ZXA/IEZvciBl
eGFtcGxlLCByZW1vdmUgdGhlCm1seDVfdmRwYV9kZXN0cm95X21yKCkgaW4gbWx4NV92ZHBhX3Jl
c2V0KCkgd2hlbiBQRVJTSVNUX0lPVExCIGV4aXN0cz8KQW5kIHRoZW4gd2UgY2FuIGRlYWwgd2l0
aCB0aGUgcmVzZXR0aW5nIGFuZCBvdGhlcnMgb24gdG9wLCBvciBpdCBuZWVkcwpzb21lIGV4cGxh
bmF0aW9uIGZvciB3aHkgcmVzZXRfbWFwKCkgbXVzdCBiZSBkb25lIGZpcnN0LgoKVGhhbmtzCgo+
Cj4gU2lnbmVkLW9mZi1ieTogU2ktV2VpIExpdSA8c2ktd2VpLmxpdUBvcmFjbGUuY29tPgo+Cj4g
LS0tCj4gUkZDIHYxIC0+IHYyOgo+ICAgLSBmaXggZXJyb3IgcGF0aCB3aGVuIGJvdGggQ1ZRIGFu
ZCBEVlEgZmFsbCBpbiBzYW1lIGFzaWQKPiAtLS0KPiAgZHJpdmVycy92ZHBhL21seDUvY29yZS9t
bHg1X3ZkcGEuaCB8ICAxICsKPiAgZHJpdmVycy92ZHBhL21seDUvY29yZS9tci5jICAgICAgICB8
IDcwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvdmRw
YS9tbHg1L25ldC9tbHg1X3ZuZXQuYyAgfCAxOCArKysrKysrLS0tCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNTYgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaCBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUv
bWx4NV92ZHBhLmgKPiBpbmRleCBiNTM0MjBlLi41YzlhMjVhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgKPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9j
b3JlL21seDVfdmRwYS5oCj4gQEAgLTEyMyw2ICsxMjMsNyBAQCBpbnQgbWx4NV92ZHBhX2NyZWF0
ZV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHN0cnVjdCB2aG9zdF9pb3RsYiAqaW90
bGIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFzaWQpOwo+ICB2b2lk
IG1seDVfdmRwYV9kZXN0cm95X21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldik7Cj4gIHZv
aWQgbWx4NV92ZHBhX2Rlc3Ryb3lfbXJfYXNpZChzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYs
IHVuc2lnbmVkIGludCBhc2lkKTsKPiAraW50IG1seDVfdmRwYV9yZXNldF9tcihzdHJ1Y3QgbWx4
NV92ZHBhX2RldiAqbXZkZXYsIHVuc2lnbmVkIGludCBhc2lkKTsKPgo+ICAjZGVmaW5lIG1seDVf
dmRwYV93YXJuKF9fZGV2LCBmb3JtYXQsIC4uLikgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBkZXZfd2FybigoX19kZXYp
LT5tZGV2LT5kZXZpY2UsICIlczolZDoocGlkICVkKSB3YXJuaW5nOiAiIGZvcm1hdCwgX19mdW5j
X18sIF9fTElORV9fLCAgICAgXAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4NS9jb3Jl
L21yLmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMKPiBpbmRleCA1YTE5NzFmYy4uZWMy
YzdiNGUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYwo+ICsrKyBi
L2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYwo+IEBAIC00ODksMjEgKzQ4OSwxNSBAQCBzdGF0
aWMgdm9pZCBkZXN0cm95X3VzZXJfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCBzdHJ1
Y3QgbWx4NV92ZHBhX21yICptcgo+ICAgICAgICAgfQo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgX21s
eDVfdmRwYV9kZXN0cm95X2N2cV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHVuc2ln
bmVkIGludCBhc2lkKQo+ICtzdGF0aWMgdm9pZCBfbWx4NV92ZHBhX2Rlc3Ryb3lfY3ZxX21yKHN0
cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldikKPiAgewo+IC0gICAgICAgaWYgKG12ZGV2LT5ncm91
cDJhc2lkW01MWDVfVkRQQV9DVlFfR1JPVVBdICE9IGFzaWQpCj4gLSAgICAgICAgICAgICAgIHJl
dHVybjsKPiAtCj4gICAgICAgICBwcnVuZV9pb3RsYihtdmRldik7Cj4gIH0KPgo+IC1zdGF0aWMg
dm9pZCBfbWx4NV92ZHBhX2Rlc3Ryb3lfZHZxX21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRl
diwgdW5zaWduZWQgaW50IGFzaWQpCj4gK3N0YXRpYyB2b2lkIF9tbHg1X3ZkcGFfZGVzdHJveV9k
dnFfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bWx4NV92ZHBhX21yICptciA9ICZtdmRldi0+bXI7Cj4KPiAtICAgICAgIGlmIChtdmRldi0+Z3Jv
dXAyYXNpZFtNTFg1X1ZEUEFfREFUQVZRX0dST1VQXSAhPSBhc2lkKQo+IC0gICAgICAgICAgICAg
ICByZXR1cm47Cj4gLQo+ICAgICAgICAgaWYgKCFtci0+aW5pdGlhbGl6ZWQpCj4gICAgICAgICAg
ICAgICAgIHJldHVybjsKPgo+IEBAIC01MjEsOCArNTE1LDEwIEBAIHZvaWQgbWx4NV92ZHBhX2Rl
c3Ryb3lfbXJfYXNpZChzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHVuc2lnbmVkIGludCBh
c2lkKQo+Cj4gICAgICAgICBtdXRleF9sb2NrKCZtci0+bWtleV9tdHgpOwo+Cj4gLSAgICAgICBf
bWx4NV92ZHBhX2Rlc3Ryb3lfZHZxX21yKG12ZGV2LCBhc2lkKTsKPiAtICAgICAgIF9tbHg1X3Zk
cGFfZGVzdHJveV9jdnFfbXIobXZkZXYsIGFzaWQpOwo+ICsgICAgICAgaWYgKG12ZGV2LT5ncm91
cDJhc2lkW01MWDVfVkRQQV9EQVRBVlFfR1JPVVBdID09IGFzaWQpCj4gKyAgICAgICAgICAgICAg
IF9tbHg1X3ZkcGFfZGVzdHJveV9kdnFfbXIobXZkZXYpOwo+ICsgICAgICAgaWYgKG12ZGV2LT5n
cm91cDJhc2lkW01MWDVfVkRQQV9DVlFfR1JPVVBdID09IGFzaWQpCj4gKyAgICAgICAgICAgICAg
IF9tbHg1X3ZkcGFfZGVzdHJveV9jdnFfbXIobXZkZXYpOwo+Cj4gICAgICAgICBtdXRleF91bmxv
Y2soJm1yLT5ta2V5X210eCk7Cj4gIH0KPiBAQCAtNTM0LDI1ICs1MzAsMTcgQEAgdm9pZCBtbHg1
X3ZkcGFfZGVzdHJveV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4gIH0KPgo+ICBz
dGF0aWMgaW50IF9tbHg1X3ZkcGFfY3JlYXRlX2N2cV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZob3N0
X2lvdGxiICppb3RsYiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgYXNpZCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3Qgdmhvc3RfaW90bGIgKmlvdGxiKQo+ICB7Cj4gLSAgICAgICBpZiAobXZkZXYtPmdyb3VwMmFz
aWRbTUxYNV9WRFBBX0NWUV9HUk9VUF0gIT0gYXNpZCkKPiAtICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gLQo+ICAgICAgICAgcmV0dXJuIGR1cF9pb3RsYihtdmRldiwgaW90bGIpOwo+ICB9Cj4K
PiAgc3RhdGljIGludCBfbWx4NV92ZHBhX2NyZWF0ZV9kdnFfbXIoc3RydWN0IG1seDVfdmRwYV9k
ZXYgKm12ZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2
aG9zdF9pb3RsYiAqaW90bGIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGFzaWQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHZob3N0X2lvdGxiICppb3RsYikKPiAgewo+ICAgICAgICAgc3RydWN0IG1seDVfdmRw
YV9tciAqbXIgPSAmbXZkZXYtPm1yOwo+ICAgICAgICAgaW50IGVycjsKPgo+IC0gICAgICAgaWYg
KG12ZGV2LT5ncm91cDJhc2lkW01MWDVfVkRQQV9EQVRBVlFfR1JPVVBdICE9IGFzaWQpCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+IC0KPiAgICAgICAgIGlmIChtci0+aW5pdGlhbGl6ZWQp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gQEAgLTU3NCwxOCArNTYyLDIyIEBAIHN0
YXRpYyBpbnQgX21seDVfdmRwYV9jcmVhdGVfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2
LAo+ICB7Cj4gICAgICAgICBpbnQgZXJyOwo+Cj4gLSAgICAgICBlcnIgPSBfbWx4NV92ZHBhX2Ny
ZWF0ZV9kdnFfbXIobXZkZXYsIGlvdGxiLCBhc2lkKTsKPiAtICAgICAgIGlmIChlcnIpCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gLQo+IC0gICAgICAgZXJyID0gX21seDVfdmRwYV9j
cmVhdGVfY3ZxX21yKG12ZGV2LCBpb3RsYiwgYXNpZCk7Cj4gLSAgICAgICBpZiAoZXJyKQo+IC0g
ICAgICAgICAgICAgICBnb3RvIG91dF9lcnI7Cj4gKyAgICAgICBpZiAobXZkZXYtPmdyb3VwMmFz
aWRbTUxYNV9WRFBBX0RBVEFWUV9HUk9VUF0gPT0gYXNpZCkgewo+ICsgICAgICAgICAgICAgICBl
cnIgPSBfbWx4NV92ZHBhX2NyZWF0ZV9kdnFfbXIobXZkZXYsIGlvdGxiKTsKPiArICAgICAgICAg
ICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsg
ICAgICAgfQo+ICsgICAgICAgaWYgKG12ZGV2LT5ncm91cDJhc2lkW01MWDVfVkRQQV9DVlFfR1JP
VVBdID09IGFzaWQpIHsKPiArICAgICAgICAgICAgICAgZXJyID0gX21seDVfdmRwYV9jcmVhdGVf
Y3ZxX21yKG12ZGV2LCBpb3RsYik7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXRfZXJyOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICBy
ZXR1cm4gMDsKPgo+ICBvdXRfZXJyOgo+IC0gICAgICAgX21seDVfdmRwYV9kZXN0cm95X2R2cV9t
cihtdmRldiwgYXNpZCk7Cj4gKyAgICAgICBpZiAobXZkZXYtPmdyb3VwMmFzaWRbTUxYNV9WRFBB
X0RBVEFWUV9HUk9VUF0gPT0gYXNpZCkKPiArICAgICAgICAgICAgICAgX21seDVfdmRwYV9kZXN0
cm95X2R2cV9tcihtdmRldik7Cj4KPiAgICAgICAgIHJldHVybiBlcnI7Cj4gIH0KPiBAQCAtNjAx
LDYgKzU5MywyOCBAQCBpbnQgbWx4NV92ZHBhX2NyZWF0ZV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2Rl
diAqbXZkZXYsIHN0cnVjdCB2aG9zdF9pb3RsYiAqaW90bGIsCj4gICAgICAgICByZXR1cm4gZXJy
Owo+ICB9Cj4KPiAraW50IG1seDVfdmRwYV9yZXNldF9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYsIHVuc2lnbmVkIGludCBhc2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbWx4NV92ZHBh
X21yICptciA9ICZtdmRldi0+bXI7Cj4gKyAgICAgICBpbnQgZXJyID0gMDsKPiArCj4gKyAgICAg
ICBpZiAoYXNpZCAhPSAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAg
ICBtdXRleF9sb2NrKCZtci0+bWtleV9tdHgpOwo+ICsgICAgICAgaWYgKCFtci0+dXNlcl9tcikK
PiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICBfbWx4NV92ZHBhX2Rlc3Ryb3lf
ZHZxX21yKG12ZGV2KTsKPiArICAgICAgIGlmIChNTFg1X0NBUF9HRU4obXZkZXYtPm1kZXYsIHVt
ZW1fdWlkXzApKSB7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IF9tbHg1X3ZkcGFfY3JlYXRlX2R2
cV9tcihtdmRldiwgTlVMTCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbWx4NV92ZHBhX3dhcm4obXZkZXYsICJjcmVhdGUgRE1BIE1SIGZhaWxl
ZFxuIik7Cj4gKyAgICAgICB9Cj4gK291dDoKPiArICAgICAgIG11dGV4X3VubG9jaygmbXItPm1r
ZXlfbXR4KTsKPiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiArCj4gIGludCBtbHg1X3ZkcGFf
aGFuZGxlX3NldF9tYXAoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCBzdHJ1Y3Qgdmhvc3Rf
aW90bGIgKmlvdGxiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAqY2hhbmdl
X21hcCwgdW5zaWduZWQgaW50IGFzaWQpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBh
L21seDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5j
Cj4gaW5kZXggMzdiZTk0NS4uM2NiNWRiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4
NS9uZXQvbWx4NV92bmV0LmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0
LmMKPiBAQCAtMjgyNCw3ICsyODI0LDYgQEAgc3RhdGljIGludCBtbHg1X3ZkcGFfcmVzZXQoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZGV2KQo+ICAgICAgICAgdW5yZWdpc3Rlcl9saW5rX25vdGlmaWVy
KG5kZXYpOwo+ICAgICAgICAgdGVhcmRvd25fZHJpdmVyKG5kZXYpOwo+ICAgICAgICAgY2xlYXJf
dnFzX3JlYWR5KG5kZXYpOwo+IC0gICAgICAgbWx4NV92ZHBhX2Rlc3Ryb3lfbXIoJm5kZXYtPm12
ZGV2KTsKPiAgICAgICAgIG5kZXYtPm12ZGV2LnN0YXR1cyA9IDA7Cj4gICAgICAgICBuZGV2LT5t
dmRldi5zdXNwZW5kZWQgPSBmYWxzZTsKPiAgICAgICAgIG5kZXYtPmN1cl9udW1fdnFzID0gMDsK
PiBAQCAtMjgzNSwxMCArMjgzNCw2IEBAIHN0YXRpYyBpbnQgbWx4NV92ZHBhX3Jlc2V0KHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRldikKPiAgICAgICAgIGluaXRfZ3JvdXBfdG9fYXNpZF9tYXAobXZk
ZXYpOwo+ICAgICAgICAgKyttdmRldi0+Z2VuZXJhdGlvbjsKPgo+IC0gICAgICAgaWYgKE1MWDVf
Q0FQX0dFTihtdmRldi0+bWRldiwgdW1lbV91aWRfMCkpIHsKPiAtICAgICAgICAgICAgICAgaWYg
KG1seDVfdmRwYV9jcmVhdGVfbXIobXZkZXYsIE5VTEwsIDApKQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIG1seDVfdmRwYV93YXJuKG12ZGV2LCAiY3JlYXRlIE1SIGZhaWxlZFxuIik7Cj4gLSAg
ICAgICB9Cj4gICAgICAgICB1cF93cml0ZSgmbmRldi0+cmVzbG9jayk7Cj4KPiAgICAgICAgIHJl
dHVybiAwOwo+IEBAIC0yOTAzLDYgKzI4OTgsMTggQEAgc3RhdGljIGludCBtbHg1X3ZkcGFfc2V0
X21hcChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBhc2lkLAo+ICAgICAg
ICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgbWx4NV92ZHBhX3Jlc2V0X21hcChz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBhc2lkKQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYgPSB0b19tdmRldih2ZGV2KTsKPiArICAgICAg
IHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2ID0gdG9fbWx4NV92ZHBhX25kZXYobXZkZXYpOwo+
ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAgICBkb3duX3dyaXRlKCZuZGV2LT5yZXNsb2Nr
KTsKPiArICAgICAgIGVyciA9IG1seDVfdmRwYV9yZXNldF9tcihtdmRldiwgYXNpZCk7Cj4gKyAg
ICAgICB1cF93cml0ZSgmbmRldi0+cmVzbG9jayk7Cj4gKyAgICAgICByZXR1cm4gZXJyOwo+ICt9
Cj4gKwo+ICBzdGF0aWMgc3RydWN0IGRldmljZSAqbWx4NV9nZXRfdnFfZG1hX2RldihzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkZXYsIHUxNiBpZHgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtbHg1X3Zk
cGFfZGV2ICptdmRldiA9IHRvX212ZGV2KHZkZXYpOwo+IEBAIC0zMTYyLDYgKzMxNjksNyBAQCBz
dGF0aWMgaW50IG1seDVfc2V0X2dyb3VwX2FzaWQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1
MzIgZ3JvdXAsCj4gICAgICAgICAuc2V0X2NvbmZpZyA9IG1seDVfdmRwYV9zZXRfY29uZmlnLAo+
ICAgICAgICAgLmdldF9nZW5lcmF0aW9uID0gbWx4NV92ZHBhX2dldF9nZW5lcmF0aW9uLAo+ICAg
ICAgICAgLnNldF9tYXAgPSBtbHg1X3ZkcGFfc2V0X21hcCwKPiArICAgICAgIC5yZXNldF9tYXAg
PSBtbHg1X3ZkcGFfcmVzZXRfbWFwLAo+ICAgICAgICAgLnNldF9ncm91cF9hc2lkID0gbWx4NV9z
ZXRfZ3JvdXBfYXNpZCwKPiAgICAgICAgIC5nZXRfdnFfZG1hX2RldiA9IG1seDVfZ2V0X3ZxX2Rt
YV9kZXYsCj4gICAgICAgICAuZnJlZSA9IG1seDVfdmRwYV9mcmVlLAo+IC0tCj4gMS44LjMuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
