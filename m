Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEE3DE489
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 04:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4850E605E1;
	Tue,  3 Aug 2021 02:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr6p6GeBT5ff; Tue,  3 Aug 2021 02:51:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 28CF2606C4;
	Tue,  3 Aug 2021 02:51:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A83B7C000E;
	Tue,  3 Aug 2021 02:51:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03698C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 02:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA01606C4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 02:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5TZ7MuFJo2p
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 02:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDA2605E1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 02:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627959088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtFtSflpgXYpxK/P7s4u0DhYswz+8t3sa9wAOnkpUy8=;
 b=DAYnY4AHzHQ2ByO2rEoe45mofph657owAq8dzFUaaWwupCUBpJWBX2ICSbxMMIu+CqLmys
 Xt5CWV0mGqSMO//XWq6Uwqp90SeZkdThMty++2voY/lNiEqua1+oxad+/mbdCs7+XTs0zi
 0JWbq1H9bwVNQ9sYZgNMeOC1Nhu72bo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-u1RsbeIWO4yRmoGUWWZ0fA-1; Mon, 02 Aug 2021 22:51:27 -0400
X-MC-Unique: u1RsbeIWO4yRmoGUWWZ0fA-1
Received: by mail-pj1-f71.google.com with SMTP id
 o13-20020a17090a9f8db0290176ab79fd33so1410823pjp.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Aug 2021 19:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FtFtSflpgXYpxK/P7s4u0DhYswz+8t3sa9wAOnkpUy8=;
 b=NWOlZ+y8LGs2O6I947arIJ66zer6Gbtn1daPs/FmMmCcv1HFUTl6MK+eNOlk/bVUBp
 ocSkclZTBMYAxvWYNk9wY07n65UTh8amndT/7C8RbLFyldzpGRV1Fhg4oHAUNSpowLHq
 8Ol3Oey9x65YeIBFNcNjLu4w89v6v8NPYWycwU4VX27CUV5eECNP51BaQ69BEtMRTxh4
 G5zt0K18Ol9zYMgTQ/cGsIcO8dfEvLYKx9+e6gAmO8+2rhPuDWhvpWIGcmr/pKi6HIfu
 lrBkKhHSVGog7hL7WByeEMKgJoIOm7UKRNPzS0sNKdFppe/VE4iN3stkDnfu1PXD36v7
 basg==
X-Gm-Message-State: AOAM5324DzEv6A8OUWiswS/LIomtbaO9+kdfukMK8KeS4iQYJXPW/cqM
 xn+PTk21B3Anr6oI9WDKcoN3oLx4ZaEioU+vjy6vOl+ATs57yxAT5Gbzf7MNohhwuL/AEJDdiTm
 IhTzZOBbECer3HvHnMR+c5S5QJ1M0C/p7Kzh1XCqoZA==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr2010301pjb.137.1627959086376; 
 Mon, 02 Aug 2021 19:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynvB3G26Icvx22CnaMMyf/BhZyd3nCyGSIFFnymfxrtduoeR/x6KpkPMPy7rMbPYy7YYGblg==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr2010285pjb.137.1627959086131; 
 Mon, 02 Aug 2021 19:51:26 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id l1sm11858514pjq.1.2021.08.02.19.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 19:51:25 -0700 (PDT)
Subject: Re: [PATCH net-next] virtio-net: realign page_to_skb() after merges
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
References: <20210802175729.2042133-1-kuba@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b076c30d-2e45-3181-9f1a-bb530511db88@redhat.com>
Date: Tue, 3 Aug 2021 10:51:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802175729.2042133-1-kuba@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 mst@redhat.com
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvOC8zIMnPzucxOjU3LCBKYWt1YiBLaWNpbnNraSDQtLXAOgo+IFdlIGVuZGVkIHVw
IG1lcmdpbmcgdHdvIHZlcnNpb25zIG9mIHRoZSBzYW1lIHBhdGNoIHNldDoKPgo+IGNvbW1pdCA4
ZmI3ZGE5ZTk5MDcgKCJ2aXJ0aW9fbmV0OiBnZXQgYnVpbGRfc2tiKCkgYnVmIGJ5IGRhdGEgcHRy
IikKPiBjb21taXQgNWMzNzcxMWQ5ZjI3ICgidmlydGlvLW5ldDogZml4IGZvciB1bmFibGUgdG8g
aGFuZGxlIHBhZ2UgZmF1bHQgZm9yIGFkZHJlc3MiKQo+Cj4gaW50byBuZXQsIGFuZAo+Cj4gY29t
bWl0IDdiZjY0NDYwZTNiMiAoInZpcnRpby1uZXQ6IGdldCBidWlsZF9za2IoKSBidWYgYnkgZGF0
YSBwdHIiKQo+IGNvbW1pdCA2YzY2YzE0N2I5YTQgKCJ2aXJ0aW8tbmV0OiBmaXggZm9yIHVuYWJs
ZSB0byBoYW5kbGUgcGFnZSBmYXVsdCBmb3IgYWRkcmVzcyIpCj4KPiBpbnRvIG5ldC1uZXh0LiBS
ZWRvIHRoZSBtZXJnZSBmcm9tIGNvbW1pdCAxMjYyODU2NTFiN2YgKCJNZXJnZQo+IHJhLmtlcm5l
bC5vcmc6L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXRkZXYvbmV0IiksIHNvIHRoYXQKPiB0
aGUgbW9zdCByZWNlbnQgY29kZSByZW1haW5zLgo+Cj4gQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNp
cmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFrdWIgS2ljaW5za2kgPGt1
YmFAa2VybmVsLm9yZz4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4KCgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgMjcgKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9k
cml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiBpbmRleCA1NmMzZjg1MTkwOTMuLjc0NDgyYTUyZjA3
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiArKysgYi9kcml2ZXJz
L25ldC92aXJ0aW9fbmV0LmMKPiBAQCAtMzgwLDcgKzM4MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tf
YnVmZiAqcGFnZV90b19za2Ioc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksCj4gICAJCQkJICAgc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4gICAJCQkJICAgdW5zaWduZWQg
aW50IGxlbiwgdW5zaWduZWQgaW50IHRydWVzaXplLAo+ICAgCQkJCSAgIGJvb2wgaGRyX3ZhbGlk
LCB1bnNpZ25lZCBpbnQgbWV0YXNpemUsCj4gLQkJCQkgICBib29sIHdob2xlX3BhZ2UpCj4gKwkJ
CQkgICB1bnNpZ25lZCBpbnQgaGVhZHJvb20pCj4gICB7Cj4gICAJc3RydWN0IHNrX2J1ZmYgKnNr
YjsKPiAgIAlzdHJ1Y3QgdmlydGlvX25ldF9oZHJfbXJnX3J4YnVmICpoZHI7Cj4gQEAgLTM5OCwy
OCArMzk4LDE2IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcGFnZV90b19za2Ioc3RydWN0IHZp
cnRuZXRfaW5mbyAqdmksCj4gICAJZWxzZQo+ICAgCQloZHJfcGFkZGVkX2xlbiA9IHNpemVvZihz
dHJ1Y3QgcGFkZGVkX3ZuZXRfaGRyKTsKPiAgIAo+IC0JLyogSWYgd2hvbGVfcGFnZSwgdGhlcmUg
aXMgYW4gb2Zmc2V0IGJldHdlZW4gdGhlIGJlZ2lubmluZyBvZiB0aGUKPiArCS8qIElmIGhlYWRy
b29tIGlzIG5vdCAwLCB0aGVyZSBpcyBhbiBvZmZzZXQgYmV0d2VlbiB0aGUgYmVnaW5uaW5nIG9m
IHRoZQo+ICAgCSAqIGRhdGEgYW5kIHRoZSBhbGxvY2F0ZWQgc3BhY2UsIG90aGVyd2lzZSB0aGUg
ZGF0YSBhbmQgdGhlIGFsbG9jYXRlZAo+ICAgCSAqIHNwYWNlIGFyZSBhbGlnbmVkLgo+ICAgCSAq
Cj4gICAJICogQnVmZmVycyB3aXRoIGhlYWRyb29tIHVzZSBQQUdFX1NJWkUgYXMgYWxsb2Mgc2l6
ZSwgc2VlCj4gICAJICogYWRkX3JlY3ZidWZfbWVyZ2VhYmxlKCkgKyBnZXRfbWVyZ2VhYmxlX2J1
Zl9sZW4oKQo+ICAgCSAqLwo+IC0JaWYgKHdob2xlX3BhZ2UpIHsKPiAtCQkvKiBCdWZmZXJzIHdp
dGggd2hvbGVfcGFnZSB1c2UgUEFHRV9TSVpFIGFzIGFsbG9jIHNpemUsCj4gLQkJICogc2VlIGFk
ZF9yZWN2YnVmX21lcmdlYWJsZSgpICsgZ2V0X21lcmdlYWJsZV9idWZfbGVuKCkKPiAtCQkgKi8K
PiAtCQl0cnVlc2l6ZSA9IFBBR0VfU0laRTsKPiAtCj4gLQkJLyogcGFnZSBtYXliZSBoZWFkIHBh
Z2UsIHNvIHdlIHNob3VsZCBnZXQgdGhlIGJ1ZiBieSBwLCBub3QgdGhlCj4gLQkJICogcGFnZQo+
IC0JCSAqLwo+IC0JCXRhaWxyb29tID0gdHJ1ZXNpemUgLSBsZW4gLSBvZmZzZXRfaW5fcGFnZShw
KTsKPiAtCQlidWYgPSAoY2hhciAqKSgodW5zaWduZWQgbG9uZylwICYgUEFHRV9NQVNLKTsKPiAt
CX0gZWxzZSB7Cj4gLQkJdGFpbHJvb20gPSB0cnVlc2l6ZSAtIGxlbjsKPiAtCQlidWYgPSBwOwo+
IC0JfQo+ICsJdHJ1ZXNpemUgPSBoZWFkcm9vbSA/IFBBR0VfU0laRSA6IHRydWVzaXplOwo+ICsJ
dGFpbHJvb20gPSB0cnVlc2l6ZSAtIGxlbiAtIGhlYWRyb29tOwo+ICsJYnVmID0gcCAtIGhlYWRy
b29tOwo+ICAgCj4gICAJbGVuIC09IGhkcl9sZW47Cj4gICAJb2Zmc2V0ICs9IGhkcl9wYWRkZWRf
bGVuOwo+IEBAIC05NzgsNyArOTY2LDggQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZl
X21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ICAgCQkJCXB1dF9wYWdlKHBhZ2Up
Owo+ICAgCQkJCWhlYWRfc2tiID0gcGFnZV90b19za2IodmksIHJxLCB4ZHBfcGFnZSwgb2Zmc2V0
LAo+ICAgCQkJCQkJICAgICAgIGxlbiwgUEFHRV9TSVpFLCBmYWxzZSwKPiAtCQkJCQkJICAgICAg
IG1ldGFzaXplLCB0cnVlKTsKPiArCQkJCQkJICAgICAgIG1ldGFzaXplLAo+ICsJCQkJCQkgICAg
ICAgVklSVElPX1hEUF9IRUFEUk9PTSk7Cj4gICAJCQkJcmV0dXJuIGhlYWRfc2tiOwo+ICAgCQkJ
fQo+ICAgCQkJYnJlYWs7Cj4gQEAgLTEwMjksNyArMTAxOCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tf
YnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiAgIAlyY3Vf
cmVhZF91bmxvY2soKTsKPiAgIAo+ICAgCWhlYWRfc2tiID0gcGFnZV90b19za2IodmksIHJxLCBw
YWdlLCBvZmZzZXQsIGxlbiwgdHJ1ZXNpemUsICF4ZHBfcHJvZywKPiAtCQkJICAgICAgIG1ldGFz
aXplLCAhIWhlYWRyb29tKTsKPiArCQkJICAgICAgIG1ldGFzaXplLCBoZWFkcm9vbSk7Cj4gICAJ
Y3Vycl9za2IgPSBoZWFkX3NrYjsKPiAgIAo+ICAgCWlmICh1bmxpa2VseSghY3Vycl9za2IpKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
