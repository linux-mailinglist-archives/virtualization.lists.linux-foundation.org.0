Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E16C5CE8
	for <lists.virtualization@lfdr.de>; Thu, 23 Mar 2023 03:56:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C79941D97;
	Thu, 23 Mar 2023 02:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C79941D97
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nql9IjUm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QS60ybKmdV1p; Thu, 23 Mar 2023 02:56:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BD5AA41D83;
	Thu, 23 Mar 2023 02:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5AA41D83
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E52AEC007E;
	Thu, 23 Mar 2023 02:56:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D3D8C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 02:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03EAB405BA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 02:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03EAB405BA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nql9IjUm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffy4xtk0b6hn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 02:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8F9400CF
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C8F9400CF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 02:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679540160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bD3AYvLDdJpACgOaSgChuuGO1foK304lHU4Mz/VLtvs=;
 b=Nql9IjUm90xE+TgGiuGnfyMwke7jS+am+GAXOYbQkYGJXcN2y8aE3EWw2qV4QS9+toc/Wt
 WILbyI7TKmcHCdLoJyFM5AvQofdB2P0JOFf8YRBxp6EOhhA609ZIWvf3hldFXXgKJ0IygL
 ENQBlTTqy5F537UXGr68vBnztq5uFVs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-3WvwB47tMBSLAf03FNIK7g-1; Wed, 22 Mar 2023 22:55:59 -0400
X-MC-Unique: 3WvwB47tMBSLAf03FNIK7g-1
Received: by mail-oo1-f69.google.com with SMTP id
 f74-20020a4a584d000000b0053b693ef13dso2179297oob.16
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 19:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679540158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bD3AYvLDdJpACgOaSgChuuGO1foK304lHU4Mz/VLtvs=;
 b=wB3tHNKBVLOmLf0TyyVne49+n3PjrrQAARMHWI78KmJio6zBk8+nVJ9S2g+kgz81q2
 re/4LWko7hFKPEQg1q8aU8YR2gXPNWLhelFSv9afCfKSZgqcircR2P5cH2DFTH/phaR/
 nQVYQrhvuU/mw68dNISKkuph1G0kC7YyQgH//luyclqFio/HY4r4OivToRTwuYiC5geu
 Yu3KyL/xbfuB2x16GYExDRxR6hq+Xt0dA/IP2hLaVAB2M3pMG2qGA2wfE6mhQwCamABb
 AlY1cvpt/CoLfPOPMfgU97TZfWdloBD9XF52mNnzEbE39rnlla/XD5P7Pr3IPwf3vkdx
 +siA==
X-Gm-Message-State: AO0yUKXFbKcUDAcRZ+faG9FNSpEI4LlqulknXeJp/dYrULuFpj7FolZo
 atYdNzosRVERwoB4GZeBT0tsLuoLn+rvEYKoNB1diF1lqtXiCQQRgV1JuGJKEsO6FdU9/yxjk+F
 3OCUP7eeGnZ6vfyFX/Wn85Asa0jTUHhAb6EX2Ku1ccXi1SiahHZp7niMJhA==
X-Received: by 2002:a05:6830:1411:b0:69f:229:ce72 with SMTP id
 v17-20020a056830141100b0069f0229ce72mr1849066otp.2.1679540158283; 
 Wed, 22 Mar 2023 19:55:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set+zom00rB/ymaeJnuVBl4qZWJk6TRG8tuaoZndr7OtAG6BzhPugrygDRux2XbjBhH3tI81HagFJgev9P3nxYsg=
X-Received: by 2002:a05:6830:1411:b0:69f:229:ce72 with SMTP id
 v17-20020a056830141100b0069f0229ce72mr1849059otp.2.1679540158036; Wed, 22 Mar
 2023 19:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230321093506.6546-1-xuanzhuo@linux.alibaba.com>
 <20230321093506.6546-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230321093506.6546-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Mar 2023 10:55:46 +0800
Message-ID: <CACGkMEvKtAZhanyvUcocct1jHBjh3Xq53=__Kzzu-RsxGmT7VQ@mail.gmail.com>
Subject: Re: [PATCH vhost v3 01/11] virtio_ring: split: separate dma codes
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNTozNeKAr1BNIFh1YW4gWmh1byA8eHVhbnpodW9AbGlu
dXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gRE1BLXJlbGF0ZWQgbG9naWMgaXMgc2VwYXJhdGVk
IGZyb20gdGhlIHZpcnRxdWV1ZV9hZGRfc3BsaXQoKSB0bwo+IG9uZSBuZXcgZnVuY3Rpb24uIERN
QSBhZGRyZXNzIHdpbGwgYmUgc2F2ZWQgYXMgc2ctPmRtYV9hZGRyZXNzIGlmCj4gdXNlX2RtYV9h
cGkgaXMgdHJ1ZSwgdGhlbiB2aXJ0cXVldWVfYWRkX3NwbGl0KCkgd2lsbCB1c2UgaXQgZGlyZWN0
bHkuCj4gVW5tYXAgb3BlcmF0aW9uIHdpbGwgYmUgc2ltcGxlci4KPgo+IFRoZSBwdXJwb3NlIG9m
IHRoaXMgaXMgdG8gZmFjaWxpdGF0ZSBzdWJzZXF1ZW50IHN1cHBvcnQgdG8gcmVjZWl2ZQo+IGRt
YSBhZGRyZXNzIG1hcHBlZCBieSBkcml2ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVv
IDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aXJ0aW8vdmly
dGlvX3JpbmcuYyB8IDEyMSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2RyaXZlcnMvdmlydGlvL3Zp
cnRpb19yaW5nLmMKPiBpbmRleCA0MTE0NGI1MjQ2YTguLmZlNzA0Y2E2YzgxMyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX3JpbmcuYwo+IEBAIC0zNzksNiArMzc5LDE0IEBAIHN0YXRpYyBkbWFfYWRkcl90IHZy
aW5nX21hcF9vbmVfc2coY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRpcmVjdGlvbik7Cj4gIH0KPgo+ICtzdGF0aWMgZG1hX2Fk
ZHJfdCB2cmluZ19zZ19hZGRyZXNzKHN0cnVjdCBzY2F0dGVybGlzdCAqc2cpCj4gK3sKPiArICAg
ICAgIGlmIChzZy0+ZG1hX2FkZHJlc3MpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBzZy0+ZG1h
X2FkZHJlc3M7Cj4gKwo+ICsgICAgICAgcmV0dXJuIChkbWFfYWRkcl90KXNnX3BoeXMoc2cpOwo+
ICt9Cj4gKwo+ICBzdGF0aWMgZG1hX2FkZHJfdCB2cmluZ19tYXBfc2luZ2xlKGNvbnN0IHN0cnVj
dCB2cmluZ192aXJ0cXVldWUgKnZxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqY3B1X2FkZHIsIHNpemVfdCBzaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQo+IEBAIC01MjAs
NiArNTI4LDgwIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHZpcnRxdWV1ZV9hZGRfZGVz
Y19zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICp2cSwKPiAgICAgICAgIHJldHVybiBuZXh0Owo+ICB9
Cj4KPiArc3RhdGljIHZvaWQgdmlydHF1ZXVlX3VubWFwX3NncyhzdHJ1Y3QgdnJpbmdfdmlydHF1
ZXVlICp2cSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzY2F0dGVy
bGlzdCAqc2dzW10sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgdG90YWxfc2csCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgb3V0X3NncywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBpbl9zZ3MpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgbjsKPiArCj4gKyAgICAgICBpZiAoIXZxLT51c2VfZG1hX2FwaSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIGZvciAobiA9IDA7IG4gPCBvdXRf
c2dzOyBuKyspIHsKPiArICAgICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNnID0g
c2dfbmV4dChzZykpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXNnLT5kbWFfYWRk
cmVzcykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZG1hX3VubWFwX3BhZ2UodnJpbmdfZG1hX2Rldih2cSksIHNn
LT5kbWFfYWRkcmVzcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
Zy0+bGVuZ3RoLCBETUFfVE9fREVWSUNFKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAg
fQo+ICsKPiArICAgICAgIGZvciAoOyBuIDwgKG91dF9zZ3MgKyBpbl9zZ3MpOyBuKyspIHsKPiAr
ICAgICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNnID0gc2dfbmV4dChzZykpIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXNnLT5kbWFfYWRkcmVzcykKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZG1hX3VubWFwX3BhZ2UodnJpbmdfZG1hX2Rldih2cSksIHNnLT5kbWFfYWRkcmVzcywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZy0+bGVuZ3RoLCBETUFf
RlJPTV9ERVZJQ0UpOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gK30KPiArCj4g
K3N0YXRpYyBpbnQgdmlydHF1ZXVlX21hcF9zZ3Moc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnc1td
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRvdGFsX3NnLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG91dF9zZ3MsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW5fc2dzKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+ICsgICAgICAgdW5zaWduZWQgaW50IG47Cj4g
Kwo+ICsgICAgICAgaWYgKCF2cS0+dXNlX2RtYV9hcGkpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICsKPiArICAgICAgIGZvciAobiA9IDA7IG4gPCBvdXRfc2dzOyBuKyspIHsKPiArICAg
ICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNnID0gc2dfbmV4dChzZykpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBkbWFfYWRkcl90IGFkZHIgPSB2cmluZ19tYXBfb25lX3Nn
KHZxLCBzZywgRE1BX1RPX0RFVklDRSk7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
ICh2cmluZ19tYXBwaW5nX2Vycm9yKHZxLCBhZGRyKSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gZXJyOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBzZy0+ZG1h
X2FkZHJlc3MgPSBhZGRyOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgZm9yICg7IG4gPCAob3V0X3NncyArIGluX3Nncyk7IG4rKykgewo+ICsgICAgICAgICAg
ICAgICBmb3IgKHNnID0gc2dzW25dOyBzZzsgc2cgPSBzZ19uZXh0KHNnKSkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgYWRkciA9IHZyaW5nX21hcF9vbmVfc2codnEsIHNn
LCBETUFfRlJPTV9ERVZJQ0UpOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodnJp
bmdfbWFwcGluZ19lcnJvcih2cSwgYWRkcikpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVycjsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2ctPmRtYV9hZGRy
ZXNzID0gYWRkcjsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IHJldHVybiAwOwo+ICsKPiArZXJyOgo+ICsgICAgICAgdmlydHF1ZXVlX3VubWFwX3Nncyh2cSwg
c2dzLCB0b3RhbF9zZywgb3V0X3NncywgaW5fc2dzKTsKPiArICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVj
dCB2aXJ0cXVldWUgKl92cSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2dzW10sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgdG90YWxfc2csCj4gQEAgLTUzMiw5ICs2MTQsOSBAQCBz
dGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92
cSwKPiAgICAgICAgIHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4g
ICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+ICAgICAgICAgc3RydWN0IHZyaW5nX2Rl
c2MgKmRlc2M7Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgaSwgbiwgYXZhaWwsIGRlc2NzX3VzZWQs
IHByZXYsIGVycl9pZHg7Cj4gLSAgICAgICBpbnQgaGVhZDsKPiArICAgICAgIHVuc2lnbmVkIGlu
dCBpLCBuLCBhdmFpbCwgZGVzY3NfdXNlZCwgcHJldjsKPiAgICAgICAgIGJvb2wgaW5kaXJlY3Q7
Cj4gKyAgICAgICBpbnQgaGVhZDsKPgo+ICAgICAgICAgU1RBUlRfVVNFKHZxKTsKPgo+IEBAIC01
ODYsMzIgKzY2OCwzMCBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0
cnVjdCB2aXJ0cXVldWUgKl92cSwKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4g
ICAgICAgICB9Cj4KPiArICAgICAgIGlmICh2aXJ0cXVldWVfbWFwX3Nncyh2cSwgc2dzLCB0b3Rh
bF9zZywgb3V0X3NncywgaW5fc2dzKSkKCkVORF9VU0UodnEpIGlzIG5lZWRlZC4KCldpdGggdGhp
cyBmaXhlZC4KCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiAgICAgICAgIGZvciAobiA9IDA7
IG4gPCBvdXRfc2dzOyBuKyspIHsKPiAgICAgICAgICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsg
c2c7IHNnID0gc2dfbmV4dChzZykpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkbWFfYWRk
cl90IGFkZHIgPSB2cmluZ19tYXBfb25lX3NnKHZxLCBzZywgRE1BX1RPX0RFVklDRSk7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZyaW5nX21hcHBpbmdfZXJyb3IodnEsIGFkZHIpKQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byB1bm1hcF9yZWxlYXNlOwo+IC0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2ID0gaTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBOb3RlIHRoYXQgd2UgdHJ1c3QgaW5kaXJlY3QgZGVzY3JpcHRvcgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIHRhYmxlIHNpbmNlIGl0IHVzZSBzdHJlYW0gRE1BIG1hcHBpbmcu
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
aSA9IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxpdChfdnEsIGRlc2MsIGksIGFkZHIsIHNnLT5sZW5n
dGgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaSA9IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxp
dChfdnEsIGRlc2MsIGksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2cmluZ19zZ19hZGRyZXNzKHNnKSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNnLT5sZW5ndGgsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19ERVNDX0Zf
TkVYVCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGluZGlyZWN0KTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+ICAgICAgICAg
Zm9yICg7IG4gPCAob3V0X3NncyArIGluX3Nncyk7IG4rKykgewo+ICAgICAgICAgICAgICAgICBm
b3IgKHNnID0gc2dzW25dOyBzZzsgc2cgPSBzZ19uZXh0KHNnKSkgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGRtYV9hZGRyX3QgYWRkciA9IHZyaW5nX21hcF9vbmVfc2codnEsIHNnLCBETUFf
RlJPTV9ERVZJQ0UpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh2cmluZ19tYXBwaW5n
X2Vycm9yKHZxLCBhZGRyKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
dW5tYXBfcmVsZWFzZTsKPiAtCj4gICAgICAgICAgICAgICAgICAgICAgICAgcHJldiA9IGk7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgLyogTm90ZSB0aGF0IHdlIHRydXN0IGluZGlyZWN0IGRl
c2NyaXB0b3IKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKiB0YWJsZSBzaW5jZSBpdCB1c2Ug
c3RyZWFtIERNQSBtYXBwaW5nLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGkgPSB2aXJ0cXVldWVfYWRkX2Rlc2Nfc3BsaXQoX3ZxLCBkZXNj
LCBpLCBhZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGkgPSB2aXJ0cXVldWVfYWRkX2Rl
c2Nfc3BsaXQoX3ZxLCBkZXNjLCBpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdnJpbmdfc2dfYWRkcmVzcyhzZyksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZy0+bGVuZ3RoLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVlJJTkdf
REVTQ19GX05FWFQgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVlJJTkdfREVTQ19GX1dSSVRFLAo+IEBAIC02NzksMjIgKzc1OSw3IEBAIHN0
YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAqX3Zx
LAo+ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgdW5tYXBfcmVsZWFzZToKPiAtICAgICAgIGVycl9p
ZHggPSBpOwo+IC0KPiAtICAgICAgIGlmIChpbmRpcmVjdCkKPiAtICAgICAgICAgICAgICAgaSA9
IDA7Cj4gLSAgICAgICBlbHNlCj4gLSAgICAgICAgICAgICAgIGkgPSBoZWFkOwo+IC0KPiAtICAg
ICAgIGZvciAobiA9IDA7IG4gPCB0b3RhbF9zZzsgbisrKSB7Cj4gLSAgICAgICAgICAgICAgIGlm
IChpID09IGVycl9pZHgpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAg
ICAgICAgICAgIGlmIChpbmRpcmVjdCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHZyaW5n
X3VubWFwX29uZV9zcGxpdF9pbmRpcmVjdCh2cSwgJmRlc2NbaV0pOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGkgPSB2aXJ0aW8xNl90b19jcHUoX3ZxLT52ZGV2LCBkZXNjW2ldLm5leHQpOwo+
IC0gICAgICAgICAgICAgICB9IGVsc2UKPiAtICAgICAgICAgICAgICAgICAgICAgICBpID0gdnJp
bmdfdW5tYXBfb25lX3NwbGl0KHZxLCBpKTsKPiAtICAgICAgIH0KPiArICAgICAgIHZpcnRxdWV1
ZV91bm1hcF9zZ3ModnEsIHNncywgdG90YWxfc2csIG91dF9zZ3MsIGluX3Nncyk7Cj4KPiAgICAg
ICAgIGlmIChpbmRpcmVjdCkKPiAgICAgICAgICAgICAgICAga2ZyZWUoZGVzYyk7Cj4gLS0KPiAy
LjMyLjAuMy5nMDExOTVjZjlmCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
