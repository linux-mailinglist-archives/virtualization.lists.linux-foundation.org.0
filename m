Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6C54C03E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jun 2022 05:40:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A8D361008;
	Wed, 15 Jun 2022 03:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wTUFkPPaRC4; Wed, 15 Jun 2022 03:40:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76AF16100A;
	Wed, 15 Jun 2022 03:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2A9BC0081;
	Wed, 15 Jun 2022 03:40:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE2FAC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 03:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF3D410D0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 03:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKYsG2mlPNdR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 03:40:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19D39410C7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655264432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfegYrIN8OlfIZz5kfKBxrw296wmSe2NUDXIex6E4og=;
 b=USfIfGimEXBx0n7SghhqYDoV29+5HeDF7jelnLBnkflix6tk4GzP0QCEB0WCHJ6A26f9T6
 PdEqpBcqfn25kaGyavkG7WM/PE55ZOHZLjc0iGa+p/WTvqvX277TnQrh5hJyUqtyhzzmVE
 thvVzu4LXI6p67WTtqUZQzGIOGESlcs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-fya3T802PFyPNI2nGbWUlA-1; Tue, 14 Jun 2022 23:40:31 -0400
X-MC-Unique: fya3T802PFyPNI2nGbWUlA-1
Received: by mail-lj1-f197.google.com with SMTP id
 b12-20020a2ebc0c000000b0025662e0a527so1598699ljf.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 20:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LfegYrIN8OlfIZz5kfKBxrw296wmSe2NUDXIex6E4og=;
 b=wuv6V9fPeVaG369e4vzT30+vko+A0qo1LKQm5IoBXeAe7eEsgWb1B3M+oXJZ+EtQiO
 piX/7BNI2kTEe5Z5QvAKa55LJJbKq/bUzMRfIl03tUOyfmdJGOrrtMlN1xLIlENV/Fb4
 3dDHpxF6Ee0voKaSLSz3b5lyHnnjETuqz6XVqa+JxCfee90B0ZVQZ/UaQQwqoJV5Ggbf
 lMiupdN3iguO1TA/zzTDdRGJVgxaHtofU3jtA+ldutY2+FK+8cMu4smboZhr1eR7RUbO
 hpRbBgDgq+sHC5GBdSS8qBmBOTxb/ig/eyqC4P7cjJiE3m/2Y1akR4RBLpzsH3JM7qPZ
 mq2A==
X-Gm-Message-State: AJIora+/jap6FBocS6IDvVbKNTBaGiC4XhI+p/QH3Vbaqm8QWgrbtbWK
 TSQGhYPDVmQYyZb5EdlFPMHAAcA7vy9XZPjUR9d346SpAcZ58+d57MHH6VMdR2XLRPaXUpiDXdW
 6nCHOm8QLj6eMr5uCzhXvDWHH+eEsUIg8xjN6QWK31aFMBqmtXKzghH+mJA==
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr5014726lfa.442.1655264429738; 
 Tue, 14 Jun 2022 20:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uMqDQKh5jR/R8azb60Tm/WY4bFPwDvjsnUv6Z0DkjAu3IUwrkcSVYcUBZZZvmWiJhiXaun0NnAQDZmFPVnekI=
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr5014715lfa.442.1655264429456; Tue, 14
 Jun 2022 20:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220613100433-mutt-send-email-mst@kernel.org>
 <20220614053737.82453-1-huangjie.albert@bytedance.com>
 <CACGkMEsnvj3MR8oRu-M2D9gTD2sDUJSWkMdjdm6GPum_KUY47w@mail.gmail.com>
 <CABKxMyMMQhbLCu8QN4ZD42802ZQdbGC+YvkQiWz_voecfM1jqw@mail.gmail.com>
 <CACGkMEv5=WzgJiO4QdReCLu3xSnV=r+DaL4FZB1aAqT1OmgrWA@mail.gmail.com>
 <CABKxMyPAGZeENzjw2EP6N5_Fb2FNFSdLKEv4kyn+RwqNcq+iLw@mail.gmail.com>
In-Reply-To: <CABKxMyPAGZeENzjw2EP6N5_Fb2FNFSdLKEv4kyn+RwqNcq+iLw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Jun 2022 11:40:18 +0800
Message-ID: <CACGkMEtz-1=3=+zUZvc+CX4LrufZZfZO=_zONo5GuAUX+BrpAQ@mail.gmail.com>
Subject: Re: [PATCH] virtio_ring : keep used_wrap_counter in vq->last_used_idx
To: =?UTF-8?B?6buE5p2w?= <huangjie.albert@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 yuanzhu@bytedance.com, mst <mst@redhat.com>
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

T24gV2VkLCBKdW4gMTUsIDIwMjIgYXQgMTE6MjUgQU0g6buE5p2wIDxodWFuZ2ppZS5hbGJlcnRA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
PiDkuo4yMDIy5bm0NuaciDE05pel5ZGo5LqMIDE2OjIx5YaZ6YGT77yaCj4gPgo+ID4gT24gVHVl
LCBKdW4gMTQsIDIwMjIgYXQgNDoxNyBQTSDpu4TmnbAgPGh1YW5namllLmFsYmVydEBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4g5LqOMjAyMuW5tDbmnIgxNOaXpeWRqOS6jCAxNTo0NeWGmemBk++8mgo+ID4gPiA+Cj4gPiA+
ID4gT24gVHVlLCBKdW4gMTQsIDIwMjIgYXQgMTozOCBQTSBBbGJlcnQgSHVhbmcKPiA+ID4gPiA8
aHVhbmdqaWUuYWxiZXJ0QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEZyb206ICJodWFuZ2ppZS5hbGJlcnQiIDxodWFuZ2ppZS5hbGJlcnRAYnl0ZWRhbmNlLmNvbT4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiB0aGUgdXNlZF93cmFwX2NvdW50ZXIgYW5kIHRoZSB2cS0+bGFz
dF91c2VkX2lkeCBtYXkgZ2V0Cj4gPiA+ID4gPiBvdXQgb2Ygc3luYyBpZiB0aGV5IGFyZSBzZXBh
cmF0ZSBhc3NpZ25tZW5077yMYW5kIGludGVycnVwdAo+ID4gPiA+ID4gbWlnaHQgdXNlIGFuIGlu
Y29ycmVjdCB2YWx1ZSB0byBjaGVjayBmb3IgdGhlIHVzZWQgaW5kZXguCj4gPiA+ID4gPgo+ID4g
PiA+ID4gZm9yIGV4YW1wbGU6T09CIGFjY2Vzcwo+ID4gPiA+ID4ga3NvZnRpcnFkIG1heSBjb25z
dW1lIHRoZSBwYWNrZXQgYW5kIGl0IHdpbGwgY2FsbDoKPiA+ID4gPiA+IHZpcnRuZXRfcG9sbAo+
ID4gPiA+ID4gICAgICAgICAtLT52aXJ0bmV0X3JlY2VpdmUKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAtLT52aXJ0cXVldWVfZ2V0X2J1Zl9jdHgKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tPnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQKPiA+ID4gPiA+IGFuZCBpbiB2
aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkOgo+ID4gPiA+ID4KPiA+ID4gPiA+IHZxLT5sYXN0
X3VzZWRfaWR4ICs9IHZxLT5wYWNrZWQuZGVzY19zdGF0ZVtpZF0ubnVtOwo+ID4gPiA+ID4gaWYg
KHVubGlrZWx5KHZxLT5sYXN0X3VzZWRfaWR4ID49IHZxLT5wYWNrZWQudnJpbmcubnVtKSkgewo+
ID4gPiA+ID4gICAgICAgICAgdnEtPmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5u
dW07Cj4gPiA+ID4gPiAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7
Cj4gPiA+ID4gPiB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gaWYgYXQgdGhlIHNhbWUgdGltZSwgdGhl
cmUgY29tZXMgYSB2cmluZyBpbnRlcnJ1cHTvvIxpbiB2cmluZ19pbnRlcnJ1cHQ6Cj4gPiA+ID4g
PiB3ZSB3aWxsIGNhbGw6Cj4gPiA+ID4gPiB2cmluZ19pbnRlcnJ1cHQKPiA+ID4gPiA+ICAgICAg
ICAgLS0+bW9yZV91c2VkCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgLS0+bW9yZV91c2VkX3Bh
Y2tlZAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLS0+aXNfdXNlZF9kZXNjX3Bh
Y2tlZAo+ID4gPiA+ID4gaW4gaXNfdXNlZF9kZXNjX3BhY2tlZCwgdGhlIGxhc3RfdXNlZF9pZHgg
bWF5YmUgPj0gdnEtPnBhY2tlZC52cmluZy5udW0uCj4gPiA+ID4gPiBzbyB0aGlzIGNvdWxkIGNh
c2UgYSBtZW1vcnkgb3V0IG9mIGJvdW5kcyBidWcuCj4gPiA+ID4gPgo+ID4gPiA+ID4gdGhpcyBw
YXRjaCBpcyB0byBrZWVwIHRoZSB1c2VkX3dyYXBfY291bnRlciBpbiB2cS0+bGFzdF91c2VkX2lk
eAo+ID4gPiA+ID4gc28gd2UgY2FuIGdldCB0aGUgY29ycmVjdCB2YWx1ZSB0byBjaGVjayBmb3Ig
dXNlZCBpbmRleCBpbiBpbnRlcnJ1cHQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogaHVhbmdqaWUuYWxiZXJ0IDxodWFuZ2ppZS5hbGJlcnRAYnl0ZWRhbmNlLmNvbT4KPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgICAgIHwgNjAg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ICBpbmNsdWRlL3VhcGkv
bGludXgvdmlydGlvX3JpbmcuaCB8ICA2ICsrKysKPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDQwIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX3JpbmcuYwo+ID4gPiA+ID4gaW5kZXggMTNhNzM0OGNlZGZmLi4zNWMzNzUwZTg5ZTEg
MTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+
ID4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+ID4gPiBAQCAtMTEx
LDcgKzExMSwxMiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiA+ID4gPiA+ICAgICAgICAg
LyogTnVtYmVyIHdlJ3ZlIGFkZGVkIHNpbmNlIGxhc3Qgc3luYy4gKi8KPiA+ID4gPiA+ICAgICAg
ICAgdW5zaWduZWQgaW50IG51bV9hZGRlZDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAgIC8q
IExhc3QgdXNlZCBpbmRleCB3ZSd2ZSBzZWVuLiAqLwo+ID4gPiA+ID4gKyAgICAgICAvKiBMYXN0
IHVzZWQgaW5kZXggIHdlJ3ZlIHNlZW4uCj4gPiA+ID4gPiArICAgICAgICAqIGZvciBzcGxpdCBy
aW5nLCBpdCBqdXN0IGNvbnRhaW5zIGxhc3QgdXNlZCBpbmRleAo+ID4gPiA+ID4gKyAgICAgICAg
KiBmb3IgcGFja2VkIHJpbmcsIGl0IG5vdCBvbmx5IGNvbnRhaW5zIGxhc3QgdXNlZCBpbmRleCwg
YnV0IGFsc28KPiA+ID4gPiA+ICsgICAgICAgICogdXNlZF93cmFwX2NvdW50ZXIsIHRoZSBWUklO
R19QQUNLRURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSIGlzCj4gPiA+ID4gPiArICAgICAgICAqIHRo
ZSBiaXQgc2hpZnQgaW4gbGFzdF91c2VkX2lkeAo+ID4gPiA+ID4gKyAgICAgICAgKi8KPiA+ID4g
PiA+ICAgICAgICAgdTE2IGxhc3RfdXNlZF9pZHg7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAg
ICAvKiBIaW50IGZvciBldmVudCBpZHg6IGFscmVhZHkgdHJpZ2dlcmVkIG5vIG5lZWQgdG8gZGlz
YWJsZS4gKi8KPiA+ID4gPiA+IEBAIC0xNTQsOSArMTU5LDYgQEAgc3RydWN0IHZyaW5nX3ZpcnRx
dWV1ZSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBEcml2ZXIgcmluZyB3
cmFwIGNvdW50ZXIuICovCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGF2
YWlsX3dyYXBfY291bnRlcjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAvKiBEZXZpY2UgcmluZyB3cmFwIGNvdW50ZXIuICovCj4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBib29sIHVzZWRfd3JhcF9jb3VudGVyOwo+ID4gPiA+ID4gLQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgLyogQXZhaWwgdXNlZCBmbGFncy4gKi8KPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBhdmFpbF91c2VkX2ZsYWdzOwo+ID4gPiA+
ID4KPiA+ID4gPiA+IEBAIC0xMzk3LDYgKzEzOTksOSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNf
dXNlZF9kZXNjX3BhY2tlZChjb25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwKPiA+ID4g
PiA+ICAgICAgICAgYm9vbCBhdmFpbCwgdXNlZDsKPiA+ID4gPiA+ICAgICAgICAgdTE2IGZsYWdz
Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgaWYgKGlkeCA+PSB2cS0+cGFja2VkLnZyaW5n
Lm51bSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4KPiA+
ID4gPiBJIHdvbmRlciBpZiB3ZSBjYW4gYXZvaWQgdGhpcyB0cmljaywgbW9yZSBiZWxvdy4KPiA+
ID4KPiA+ID4gWWVzLCB0aGUgaWR4IHBhc3MgdG8gdGhlIGlzX3VzZWRfZGVzY19wYWNrZWQgY2Fu
IG5ldmVyICA+PQo+ID4gPiB2cS0+cGFja2VkLnZyaW5nLm51bSBzaW5jZSB3ZQo+ID4gPiB0d2Vh
ayB0aGUgbWF0aCBoZXJlIDoKPiA+ID4gPisgICAgICAgbGFzdF91c2VkICs9IHZxLT5wYWNrZWQu
ZGVzY19zdGF0ZVtpZF0ubnVtOwo+ID4gPiA+KyAgICAgICBpZiAodW5saWtlbHkobGFzdF91c2Vk
ID49IHZxLT5wYWNrZWQudnJpbmcubnVtKSkgewo+ID4gPiA+KyAgICAgICAgICAgICAgIGxhc3Rf
dXNlZCAtPSB2cS0+cGFja2VkLnZyaW5nLm51bTsKPiA+ID4gPisgICAgICAgICAgICAgICB1c2Vk
X3dyYXBfY291bnRlciBePSAxOwo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+KyAgICAgICBsYXN0
X3VzZWQgPSAobGFzdF91c2VkIHwgKHVzZWRfd3JhcF9jb3VudGVyIDw8IFZSSU5HX1BBQ0tFRF9E
RVNDX0ZfVVNFRCkpOwo+ID4gPiA+KyAgICAgICB2cS0+bGFzdF91c2VkX2lkeCA9IGxhc3RfdXNl
ZDsKPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gICAgICAgICBmbGFncyA9IGxl
MTZfdG9fY3B1KHZxLT5wYWNrZWQudnJpbmcuZGVzY1tpZHhdLmZsYWdzKTsKPiA+ID4gPiA+ICAg
ICAgICAgYXZhaWwgPSAhIShmbGFncyAmICgxIDw8IFZSSU5HX1BBQ0tFRF9ERVNDX0ZfQVZBSUwp
KTsKPiA+ID4gPiA+ICAgICAgICAgdXNlZCA9ICEhKGZsYWdzICYgKDEgPDwgVlJJTkdfUEFDS0VE
X0RFU0NfRl9VU0VEKSk7Cj4gPiA+ID4gPiBAQCAtMTQwNiw4ICsxNDExLDEyIEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCBpc191c2VkX2Rlc2NfcGFja2VkKGNvbnN0IHN0cnVjdCB2cmluZ192aXJ0cXVl
dWUgKnZxLAo+ID4gPiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgbW9yZV91c2Vk
X3BhY2tlZChjb25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSkKPiA+ID4gPiA+ICB7Cj4g
PiA+ID4gPiAtICAgICAgIHJldHVybiBpc191c2VkX2Rlc2NfcGFja2VkKHZxLCB2cS0+bGFzdF91
c2VkX2lkeCwKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHZxLT5wYWNrZWQudXNl
ZF93cmFwX2NvdW50ZXIpOwo+ID4gPiA+ID4gKyAgICAgICB1MTYgbGFzdF91c2VkOwo+ID4gPiA+
ID4gKyAgICAgICBib29sIHVzZWRfd3JhcF9jb3VudGVyOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
KyAgICAgICBsYXN0X3VzZWQgPSB2cS0+bGFzdF91c2VkX2lkeCAmIH4oMSA8PCBWUklOR19QQUNL
RURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSKTsKPiA+ID4gPiA+ICsgICAgICAgdXNlZF93cmFwX2Nv
dW50ZXIgPSAhISgodnEtPmxhc3RfdXNlZF9pZHgpID4+IFZSSU5HX1BBQ0tFRF9VU0VEX0lOREVY
X0ZfV1JBUF9DVFIpOwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gaXNfdXNlZF9kZXNjX3BhY2tl
ZCh2cSwgbGFzdF91c2VkLCB1c2VkX3dyYXBfY291bnRlcik7Cj4gPiA+ID4gPiAgfQo+ID4gPiA+
ID4KPiA+ID4gPiA+ICBzdGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tlZChz
dHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiA+ID4gPiBAQCAtMTQxNiw2ICsxNDI1LDcgQEAgc3Rh
dGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxLAo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1
ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiA+ID4gPiA+ICAgICAgICAgdTE2IGxhc3RfdXNlZCwgaWQ7
Cj4gPiA+ID4gPiArICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiA+ID4gPiAgICAg
ICAgIHZvaWQgKnJldDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIFNUQVJUX1VTRSh2cSk7
Cj4gPiA+ID4gPiBAQCAtMTQzNCw3ICsxNDQ0LDggQEAgc3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9n
ZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+ID4gICAgICAg
ICAvKiBPbmx5IGdldCB1c2VkIGVsZW1lbnRzIGFmdGVyIHRoZXkgaGF2ZSBiZWVuIGV4cG9zZWQg
YnkgaG9zdC4gKi8KPiA+ID4gPiA+ICAgICAgICAgdmlydGlvX3JtYih2cS0+d2Vha19iYXJyaWVy
cyk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICBsYXN0X3VzZWQgPSB2cS0+bGFzdF91c2Vk
X2lkeDsKPiA+ID4gPiA+ICsgICAgICAgdXNlZF93cmFwX2NvdW50ZXIgPSAhISgodnEtPmxhc3Rf
dXNlZF9pZHggPj4gVlJJTkdfUEFDS0VEX1VTRURfSU5ERVhfRl9XUkFQX0NUUikpOwo+ID4gPiA+
ID4gKyAgICAgICBsYXN0X3VzZWQgPSAodnEtPmxhc3RfdXNlZF9pZHgpICYgKH4oMSA8PCBWUklO
R19QQUNLRURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSKSk7Cj4gPiA+ID4gPiAgICAgICAgIGlkID0g
bGUxNl90b19jcHUodnEtPnBhY2tlZC52cmluZy5kZXNjW2xhc3RfdXNlZF0uaWQpOwo+ID4gPiA+
ID4gICAgICAgICAqbGVuID0gbGUzMl90b19jcHUodnEtPnBhY2tlZC52cmluZy5kZXNjW2xhc3Rf
dXNlZF0ubGVuKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBAQCAtMTQ1MSwxMiArMTQ2MiwxNSBAQCBz
dGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVl
ICpfdnEsCj4gPiA+ID4gPiAgICAgICAgIHJldCA9IHZxLT5wYWNrZWQuZGVzY19zdGF0ZVtpZF0u
ZGF0YTsKPiA+ID4gPiA+ICAgICAgICAgZGV0YWNoX2J1Zl9wYWNrZWQodnEsIGlkLCBjdHgpOwo+
ID4gPiA+ID4KPiA+ID4gPiA+IC0gICAgICAgdnEtPmxhc3RfdXNlZF9pZHggKz0gdnEtPnBhY2tl
ZC5kZXNjX3N0YXRlW2lkXS5udW07Cj4gPiA+ID4gPiAtICAgICAgIGlmICh1bmxpa2VseSh2cS0+
bGFzdF91c2VkX2lkeCA+PSB2cS0+cGFja2VkLnZyaW5nLm51bSkpIHsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICB2cS0+bGFzdF91c2VkX2lkeCAtPSB2cS0+cGFja2VkLnZyaW5nLm51bTsKPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7
Cj4gPiA+ID4gPiArICAgICAgIGxhc3RfdXNlZCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRd
Lm51bTsKPiA+ID4gPiA+ICsgICAgICAgaWYgKHVubGlrZWx5KGxhc3RfdXNlZCA+PSB2cS0+cGFj
a2VkLnZyaW5nLm51bSkpIHsKPiA+ID4gPgo+ID4gPiA+IENhbiB3ZSB0d2VhayB0aGUgbWF0aCBo
ZXJlIHRvIGF2b2lkIHRoZSBvdXQgb2YgYm91bmQgcmVzdWx0Pwo+ID4gPgo+ID4gPiAgICBZZXMs
IHRoaXMgY2FuIGF2b2lkIHRoZSBvdXQgb2YgYm91bmQgcmVzdWx0LiBiZWNhdXNlIG9mICBXZSBq
dXN0Cj4gPiA+IGFzc2lnbiBsYXN0X3VzZWRfaWR4IGluIHRoZSBmb2xsb3dpbmcgY29kZe+8mgo+
ID4gPiAgIHZxLT5sYXN0X3VzZWRfaWR4ID0gbGFzdF91c2VkOwo+ID4gPiAgIGFuZCBpdCBpcyBh
IDE2Yml0LzMyYml0IG9wZXJhdGlvbnMsYW5kIGFyZSBndWFyYW50ZWVkIHRvIGJlIGF0b21pYwo+
ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgbGFzdF91c2VkIC09IHZxLT5w
YWNrZWQudnJpbmcubnVtOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHVzZWRfd3JhcF9jb3Vu
dGVyIF49IDE7Cj4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAg
IGxhc3RfdXNlZCA9IChsYXN0X3VzZWQgfCAodXNlZF93cmFwX2NvdW50ZXIgPDwgVlJJTkdfUEFD
S0VEX0RFU0NfRl9VU0VEKSk7Cj4gPiA+ID4gPiArICAgICAgIHZxLT5sYXN0X3VzZWRfaWR4ID0g
bGFzdF91c2VkOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gICAgICAgICAvKgo+ID4gPiA+ID4gICAg
ICAgICAgKiBJZiB3ZSBleHBlY3QgYW4gaW50ZXJydXB0IGZvciB0aGUgbmV4dCBlbnRyeSwgdGVs
bCBob3N0Cj4gPiA+ID4gPiAgICAgICAgICAqIGJ5IHdyaXRpbmcgZXZlbnQgaW5kZXggYW5kIGZs
dXNoIG91dCB0aGUgd3JpdGUgYmVmb3JlCj4gPiA+ID4gPiBAQCAtMTQ2NSw5ICsxNDc5LDcgQEAg
c3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1
ZSAqX3ZxLAo+ID4gPiA+ID4gICAgICAgICBpZiAodnEtPnBhY2tlZC5ldmVudF9mbGFnc19zaGFk
b3cgPT0gVlJJTkdfUEFDS0VEX0VWRU5UX0ZMQUdfREVTQykKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICB2aXJ0aW9fc3RvcmVfbWIodnEtPndlYWtfYmFycmllcnMsCj4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZ2cS0+cGFja2VkLnZyaW5nLmRyaXZlci0+b2ZmX3dy
YXAsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV90b19sZTE2
KHZxLT5sYXN0X3VzZWRfaWR4IHwKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciA8PAo+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19QQUNLRURfRVZF
TlRfRl9XUkFQX0NUUikpKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3B1X3RvX2xlMTYodnEtPmxhc3RfdXNlZF9pZHgpKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAg
ICAgICAgIExBU1RfQUREX1RJTUVfSU5WQUxJRCh2cSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQEAg
LTE0OTksOSArMTUxMSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgdmlydHF1ZXVlX2VuYWJsZV9j
Yl9wcmVwYXJlX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gPiA+ID4gPgo+ID4gPiA+
ID4gICAgICAgICBpZiAodnEtPmV2ZW50KSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgdnEt
PnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93cmFwID0KPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGNwdV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4IHwKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIg
PDwKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZSSU5HX1BBQ0tF
RF9FVkVOVF9GX1dSQVBfQ1RSKSk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
cHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
LyoKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBXZSBuZWVkIHRvIHVwZGF0ZSBldmVudCBv
ZmZzZXQgYW5kIGV2ZW50IHdyYXAKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBjb3VudGVy
IGZpcnN0IGJlZm9yZSB1cGRhdGluZyBldmVudCBmbGFncy4KPiA+ID4gPiA+IEBAIC0xNTE4LDgg
KzE1MjgsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHZpcnRxdWV1ZV9lbmFibGVfY2JfcHJlcGFy
ZV9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ID4gPiA+ID4gICAgICAgICB9Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gICAgICAgICBFTkRfVVNFKHZxKTsKPiA+ID4gPiA+IC0gICAgICAgcmV0
dXJuIHZxLT5sYXN0X3VzZWRfaWR4IHwgKCh1MTYpdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRl
ciA8PAo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgVlJJTkdfUEFDS0VEX0VWRU5U
X0ZfV1JBUF9DVFIpOwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gdnEtPmxhc3RfdXNlZF9pZHg7
Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgYm9vbCB2aXJ0cXVldWVf
cG9sbF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLCB1MTYgb2ZmX3dyYXApCj4gPiA+ID4g
PiBAQCAtMTU1MCw5ICsxNTU5LDkgQEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2VuYWJsZV9jYl9k
ZWxheWVkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gPiA+ID4gPiAgICAgICAgIGlm
ICh2cS0+ZXZlbnQpIHsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAvKiBUT0RPOiB0dW5lIHRo
aXMgdGhyZXNob2xkICovCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgYnVmcyA9ICh2cS0+cGFj
a2VkLnZyaW5nLm51bSAtIHZxLT52cS5udW1fZnJlZSkgKiAzIC8gNDsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICB3cmFwX2NvdW50ZXIgPSB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyOwo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHdyYXBfY291bnRlciA9ICEhKHZxLT5sYXN0X3VzZWRf
aWR4ID4+IFZSSU5HX1BBQ0tFRF9VU0VEX0lOREVYX0ZfV1JBUF9DVFIpOwo+ID4gPiA+ID4KPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICB1c2VkX2lkeCA9IHZxLT5sYXN0X3VzZWRfaWR4ICsgYnVm
czsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB1c2VkX2lkeCA9ICh2cS0+bGFzdF91c2VkX2lk
eCAmIH4oMSA8PCBWUklOR19QQUNLRURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSKSkgKyBidWZzOwo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1c2VkX2lkeCA+PSB2cS0+cGFja2VkLnZyaW5n
Lm51bSkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdXNlZF9pZHggLT0gdnEt
PnBhY2tlZC52cmluZy5udW07Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB3cmFw
X2NvdW50ZXIgXj0gMTsKPiA+ID4gPiA+IEBAIC0xNTgyLDkgKzE1OTEsOSBAQCBzdGF0aWMgYm9v
bCB2aXJ0cXVldWVfZW5hYmxlX2NiX2RlbGF5ZWRfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92
cSkKPiA+ID4gPiA+ICAgICAgICAgICovCj4gPiA+ID4gPiAgICAgICAgIHZpcnRpb19tYih2cS0+
d2Vha19iYXJyaWVycyk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICBpZiAoaXNfdXNlZF9k
ZXNjX3BhY2tlZCh2cSwKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dnEtPmxhc3RfdXNlZF9pZHgsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIpKSB7Cj4gPiA+ID4gPiArICAgICAgIHdy
YXBfY291bnRlciA9ICEhKHZxLT5sYXN0X3VzZWRfaWR4ID4+IFZSSU5HX1BBQ0tFRF9VU0VEX0lO
REVYX0ZfV1JBUF9DVFIpOwo+ID4gPiA+ID4gKyAgICAgICB1c2VkX2lkeCA9ICh2cS0+bGFzdF91
c2VkX2lkeCAmIH4oMSA8PCBWUklOR19QQUNLRURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSKSk7Cj4g
PiA+ID4gPiArICAgICAgIGlmIChpc191c2VkX2Rlc2NfcGFja2VkKHZxLCB1c2VkX2lkeCwgd3Jh
cF9jb3VudGVyKSkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIEVORF9VU0UodnEpOwo+ID4g
PiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+ICAgICAgICAgfQo+
ID4gPiA+ID4gQEAgLTE2ODksNyArMTY5OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2
cmluZ19jcmVhdGVfdmlydHF1ZXVlX3BhY2tlZCgKPiA+ID4gPiA+ICAgICAgICAgdnEtPm5vdGlm
eSA9IG5vdGlmeTsKPiA+ID4gPiA+ICAgICAgICAgdnEtPndlYWtfYmFycmllcnMgPSB3ZWFrX2Jh
cnJpZXJzOwo+ID4gPiA+ID4gICAgICAgICB2cS0+YnJva2VuID0gdHJ1ZTsKPiA+ID4gPiA+IC0g
ICAgICAgdnEtPmxhc3RfdXNlZF9pZHggPSAwOwo+ID4gPiA+ID4gKyAgICAgICB2cS0+bGFzdF91
c2VkX2lkeCA9IDAgfCAoMSA8PCBWUklOR19QQUNLRURfVVNFRF9JTkRFWF9GX1dSQVBfQ1RSKTsK
PiA+ID4gPiA+ICAgICAgICAgdnEtPmV2ZW50X3RyaWdnZXJlZCA9IGZhbHNlOwo+ID4gPiA+ID4g
ICAgICAgICB2cS0+bnVtX2FkZGVkID0gMDsKPiA+ID4gPiA+ICAgICAgICAgdnEtPnBhY2tlZF9y
aW5nID0gdHJ1ZTsKPiA+ID4gPiA+IEBAIC0xNzIwLDcgKzE3MjksNiBAQCBzdGF0aWMgc3RydWN0
IHZpcnRxdWV1ZSAqdnJpbmdfY3JlYXRlX3ZpcnRxdWV1ZV9wYWNrZWQoCj4gPiA+ID4gPgo+ID4g
PiA+ID4gICAgICAgICB2cS0+cGFja2VkLm5leHRfYXZhaWxfaWR4ID0gMDsKPiA+ID4gPiA+ICAg
ICAgICAgdnEtPnBhY2tlZC5hdmFpbF93cmFwX2NvdW50ZXIgPSAxOwo+ID4gPiA+ID4gLSAgICAg
ICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyID0gMTsKPiA+ID4gPiA+ICAgICAgICAgdnEt
PnBhY2tlZC5ldmVudF9mbGFnc19zaGFkb3cgPSAwOwo+ID4gPiA+ID4gICAgICAgICB2cS0+cGFj
a2VkLmF2YWlsX3VzZWRfZmxhZ3MgPSAxIDw8IFZSSU5HX1BBQ0tFRF9ERVNDX0ZfQVZBSUw7Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9f
cmluZy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPiA+ID4gPiA+IGluZGV4
IDQ3NmQzZTVjMGZlNy4uOTZiY2M0ZDUyZmNlIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9s
aW51eC92aXJ0aW9fcmluZy5oCj4gPiA+ID4gPiBAQCAtNzcsNiArNzcsMTIgQEAKPiA+ID4gPiA+
ICAgKi8KPiA+ID4gPiA+ICAjZGVmaW5lIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSICAx
NQo+ID4gPiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKgo+ID4gPiA+ID4gKyAqIHVzZWQg
d3JhcCBDb3VudGVyIGJpdCBzaGlmdCBpbiB2cS0+bGFzdF91c2VkX2lkeCBmb3IgcGFja2VkIHJp
bmcKPiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFZSSU5HX1BBQ0tFRF9VU0VEX0lO
REVYX0ZfV1JBUF9DVFIgIDE1Cj4gPiA+ID4KPiA+ID4gPiBMZXQncyBzaW1wbHkgcmV1c2UgVlJJ
TkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgPwo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzCj4gPiA+
Cj4gPiA+IEFsdGhvdWdoIHRoZSB0d28gdmFsdWVzIGFyZSB0aGUgc2FtZSwgSSBzZWUgdGhlIG1l
YW5pbmdzIGFyZSBkaWZmZXJlbnQsCj4gPiA+IHNvIEkgcmVkZWZpbmUgb25lLiBJcyBpdCBwb3Nz
aWJsZSB0byByZW5hbWUKPiA+ID4gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgdG8gVlJJ
TkdfUEFDS0VEX0ZfV1JBUF9DVFI/Cj4gPiA+Cj4gPiA+IEphc29uLCB3aGF0IGlzIHlvdXIgdGFr
ZT8KPiA+Cj4gPiBUaGF0IGxvb2tzIGV2ZW4gd29yc2UuIFNvIEknbSBmaW5lIHRvIGRlZmluZSBh
IG5ldyBtYWNybyBhcyAxNS4KPiA+Cj4gPiBUaGFua3MKPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICAvKiBXZSBzdXBwb3J0IGluZGlyZWN0IGJ1ZmZlciBkZXNjcmlwdG9y
cyAqLwo+ID4gPiA+ID4gICNkZWZpbmUgVklSVElPX1JJTkdfRl9JTkRJUkVDVF9ERVNDICAgIDI4
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMzEuMQo+ID4gPiA+ID4KPiA+ID4g
Pgo+ID4gPgo+ID4KPiBoZWxsbywgIEphc29uCj4KPiBBbnkgb3RoZXIgc3VnZ2VzdGlvbnM/CgpM
b29raW5nIGF0IHRoZSBjdXJyZW50IGNvZGUgYWdhaW4sIGl0IHNlZW1zIHdlJ3ZlIGFscmVhZHkg
dXNlZApWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUiBmb3IgcGFja2luZyBpbmZvcm1hdGlv
bi4gc2VlCnZpcnRxdWV1ZV9lbmFibGVfY2JfcHJlcGFyZV9wYWNrZWQoKToKCiAgICAgICAgcmV0
dXJuIHZxLT5sYXN0X3VzZWRfaWR4IHwgKCh1MTYpdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRl
ciA8PAogICAgICAgIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKTsKClNvIEkgc3RpbGwg
cHJlZmVyIHRvIHNpbXBseSB1c2UgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIuCgpPdGhl
cnMgc2hvdWxkIGJlIGZpbmUuCgpUaGFua3MKCj4gIEkgd2lsbCBkbyBzb21lIHN0YWJpbGl0eSBh
bmQgZnVuY3Rpb25hbAo+IHRlc3RpbmcgYmVmb3JlIHJlbWFraW5nIGEgcGF0Y2ggZm9yIHBhdGNo
IHYyLgo+Cj4gVGhhbmtzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
