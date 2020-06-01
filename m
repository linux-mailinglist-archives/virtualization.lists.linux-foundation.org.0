Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F21EA4F6
	for <lists.virtualization@lfdr.de>; Mon,  1 Jun 2020 15:26:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 282131FC7D;
	Mon,  1 Jun 2020 13:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsUgb+yCbWg8; Mon,  1 Jun 2020 13:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 49F8C20115;
	Mon,  1 Jun 2020 13:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D12C0176;
	Mon,  1 Jun 2020 13:26:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30A98C0176
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 13:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E88A8828D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 13:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyWiVWaneX13
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 13:26:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61CE488281
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591017969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRfq5vWGxkg2iGmNT2OiJJevysZiaYLSO0DYjWQmzCo=;
 b=Jjj7afZza8hW7Z6/G39dvhqDo/CSHnnkL7cW9U+pArQgGBdoyObmyM1MLQZy+Ohwx9fRMd
 qjkcCKo5wpFkhrxNnSEdwiYsBPvEaKjSoVWLAKw7VMxBHSJe/ZHuDifAEt6cnDUsYa9oA4
 qoprxQiLMXkf1G1yP5AaYwZUto/1q5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Z5UEkz8tNP268YjBARamiw-1; Mon, 01 Jun 2020 09:26:05 -0400
X-MC-Unique: Z5UEkz8tNP268YjBARamiw-1
Received: by mail-wm1-f70.google.com with SMTP id s15so2641390wmc.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 06:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IRfq5vWGxkg2iGmNT2OiJJevysZiaYLSO0DYjWQmzCo=;
 b=bX5SkyOcgXWmqUjV6OhkkFP7NtASmUqW3FdUCd7po3AOrhuE2dk3xZJHrF2PtW/fWq
 GVTtHOv+37U0OiYMPCzMwtw/nyxzF0S+/MfTDzp77fqak1gy5XASEU0ktcd8sben7D3M
 qyZJjIMtfJ7MBKGoNfxcP2QG9nRh/nJGn2t++ybJJc5bb4sMtNO2ya6iry6bN6GcZ+fR
 DRIXcvY4Tdg6Hw23KszlYSjiZOAF93i3NzsM7BmNIQlaviMb1DH/R5sYP3jUzaqYgrDf
 fHx/t0Nf/KrkH5bEFXLwibOXXhVtKErIW6e5buCO7ONB0v1oz8JgFC/gQSrh7ZuvwAH1
 tgyQ==
X-Gm-Message-State: AOAM530bXPu0JoLkAwK/ICKvtTCQPzHeG6iLD8OpEvnV6EceM0YkHBFL
 YxKeHMgj5G5kxUNIz0ZhOUR+de19ZH0C7H8qZhWqPwJSqXGFef7E20E1xVfBdLPjdGmO1EzV9YR
 NKMuR+GFYVQXuao7g5LBz+Bb+tFDvsKPOZ0Vo4YmJ3Q==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr9035987wmj.5.1591017964167;
 Mon, 01 Jun 2020 06:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl8lRUHSE787paC5X60OoxhERxaaxtuTvkoS0LlVBYhPgpTofNEGYr/DfLFh8K2PDep2O2VQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr9035967wmj.5.1591017963973;
 Mon, 01 Jun 2020 06:26:03 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 p1sm20620154wrx.44.2020.06.01.06.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 06:26:03 -0700 (PDT)
Date: Mon, 1 Jun 2020 09:26:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next v8 7/7] net: vhost: make busyloop_intr more
 accurate
Message-ID: <20200601092522-mutt-send-email-mst@kernel.org>
References: <1534680686-3108-1-git-send-email-xiangxia.m.yue@gmail.com>
 <1534680686-3108-8-git-send-email-xiangxia.m.yue@gmail.com>
 <f85bfa97-ab9c-2d51-2053-1fe6bb3d45bc@redhat.com>
 <8460e039-d58e-85df-cef9-c87933f46cc2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8460e039-d58e-85df-cef9-c87933f46cc2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 makita.toshiaki@lab.ntt.co.jp
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

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDg6NDc6MzVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiAKPiBPbiAyMDE45bm0MDjmnIgyMeaXpSAwODozMywgSmFzb24gV2FuZyB3cm90ZToK
PiA+IAo+ID4gCj4gPiBPbiAyMDE45bm0MDjmnIgxOeaXpSAyMDoxMSwgeGlhbmd4aWEubS55dWVA
Z21haWwuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBUb25naGFvIFpoYW5nIDx4aWFuZ3hpYS5tLnl1
ZUBnbWFpbC5jb20+Cj4gPiA+IAo+ID4gPiBUaGUgcGF0Y2ggdXNlcyB2aG9zdF9oYXNfd29ya19w
ZW5kaW5nKCkgdG8gY2hlY2sgaWYKPiA+ID4gdGhlIHNwZWNpZmllZCBoYW5kbGVyIGlzIHNjaGVk
dWxlZCwgYmVjYXVzZSBpbiB0aGUgbW9zdCBjYXNlLAo+ID4gPiB2aG9zdF9oYXNfd29yaygpIHJl
dHVybiB0cnVlIHdoZW4gb3RoZXIgc2lkZSBoYW5kbGVyIGlzIGFkZGVkCj4gPiA+IHRvIHdvcmtl
ciBsaXN0LiBVc2UgdGhlIHZob3N0X2hhc193b3JrX3BlbmRpbmcoKSBpbnNlYWQgb2YKPiA+ID4g
dmhvc3RfaGFzX3dvcmsoKS4KPiA+ID4gCj4gPiA+IFRvcG9sb2d5Ogo+ID4gPiBbSG9zdF0gLT5s
aW51eCBicmlkZ2UgLT4gdGFwIHZob3N0LW5ldCAtPltHdWVzdF0KPiA+ID4gCj4gPiA+IFRDUF9T
VFJFQU0gKG5ldHBlcmYpOgo+ID4gPiAqIFdpdGhvdXQgdGhlIHBhdGNoOsKgIDM4MDM1LjM5IE1i
cHMsIDMuMzcgdXMgbWVhbiBsYXRlbmN5Cj4gPiA+ICogV2l0aCB0aGUgcGF0Y2g6wqDCoMKgwqAg
Mzg0MDkuNDQgTWJwcywgMy4zNCB1cyBtZWFuIGxhdGVuY3kKPiA+IAo+ID4gVGhlIGltcHJvdmVt
ZW50IGlzIG5vdCBvYnZpb3VzIGFzIGxhc3QgdmVyc2lvbi4gRG8geW91IGltcGx5IHRoZXJlJ3MK
PiA+IHNvbWUgcmVjZW50IGNoYW5nZXMgb2Ygdmhvc3QgdGhhdCBtYWtlIGl0IGZhc3Rlcj8KPiA+
IAo+IAo+IEkgbWlzdW5kZXJzdG9vZCB0aGUgbnVtYmVycywgcGxlYXNlIGlnbm9yZSB0aGlzLgo+
IAo+IEl0IHNob3dzIGxlc3MgdGhhbiAxJSBpbXByb3ZlbWVudC4gSSdtIG5vdCBzdXJlIGl0J3Mg
d29ydGggdG8gZG8gc28uIENhbiB5b3UKPiB0cnkgYmktZGlyZWN0aW9uYWwgcGt0Z2VuIHRvIHNl
ZSBpZiBpdCBoYXMgbW9yZSBvYnZpb3VzIGVmZmVjdD8KPiAKPiBUaGFua3MKCgpSaWdodCwgdGhp
cyBraW5kIG9mIGdhaW4gaXMgaW4gdGhlIG5vaXNlLiBUcnkgbWVhc3VyaW5nIENQVSB1dGlsaXph
dGlvbj8KCj4gPiBUaGFua3MKPiA+IAo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9uZ2hh
byBaaGFuZyA8eGlhbmd4aWEubS55dWVAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqAgZHJp
dmVycy92aG9zdC9uZXQuYyB8IDkgKysrKysrLS0tCj4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aG9zdC9uZXQuYyBiL2RyaXZlcnMvdmhvc3QvbmV0LmMKPiA+ID4gaW5kZXggZGI2
M2FlMi4uYjY5MzllZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC9uZXQuYwo+ID4g
PiArKysgYi9kcml2ZXJzL3Zob3N0L25ldC5jCj4gPiA+IEBAIC00ODcsMTAgKzQ4Nyw4IEBAIHN0
YXRpYyB2b2lkIHZob3N0X25ldF9idXN5X3BvbGwoc3RydWN0Cj4gPiA+IHZob3N0X25ldCAqbmV0
LAo+ID4gPiDCoMKgwqDCoMKgIGVuZHRpbWUgPSBidXN5X2Nsb2NrKCkgKyBidXN5bG9vcF90aW1l
b3V0Owo+ID4gPiDCoCDCoMKgwqDCoMKgIHdoaWxlICh2aG9zdF9jYW5fYnVzeV9wb2xsKGVuZHRp
bWUpKSB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoCBpZiAodmhvc3RfaGFzX3dvcmsoJm5ldC0+ZGV2
KSkgewo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqYnVzeWxvb3BfaW50ciA9IHRydWU7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiAodmhvc3RfaGFzX3dvcmsoJm5ldC0+ZGV2KSkKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+IC3CoMKgwqDCoMKgwqDC
oCB9Cj4gPiA+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKHNvY2tfaGFzX3J4X2RhdGEoc29j
aykgJiYKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhdmhvc3RfdnFfYXZhaWxf
ZW1wdHkoJm5ldC0+ZGV2LCBydnEpKSB8fAo+ID4gPiBAQCAtNTEzLDYgKzUxMSwxMSBAQCBzdGF0
aWMgdm9pZCB2aG9zdF9uZXRfYnVzeV9wb2xsKHN0cnVjdAo+ID4gPiB2aG9zdF9uZXQgKm5ldCwK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgICF2aG9zdF9oYXNfd29ya19wZW5kaW5nKCZuZXQtPmRl
diwgVkhPU1RfTkVUX1ZRX1JYKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIHZob3N0X25ldF9l
bmFibGVfdnEobmV0LCBydnEpOwo+ID4gPiDCoCArwqDCoMKgIGlmICh2aG9zdF9oYXNfd29ya19w
ZW5kaW5nKCZuZXQtPmRldiwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwb2xsX3J4ID8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBWSE9TVF9ORVRfVlFfUlg6IFZIT1NUX05FVF9WUV9UWCkpCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oCAqYnVzeWxvb3BfaW50ciA9IHRydWU7Cj4gPiA+ICsKPiA+ID4gwqDCoMKgwqDCoCBtdXRleF91
bmxvY2soJnZxLT5tdXRleCk7Cj4gPiA+IMKgIH0KPiA+IAo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IFZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdAo+ID4gVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiA+IGh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
