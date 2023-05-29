Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A6714566
	for <lists.virtualization@lfdr.de>; Mon, 29 May 2023 09:25:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27DE60AEC;
	Mon, 29 May 2023 07:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27DE60AEC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=d3e3ndgd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iL3jACbN_glH; Mon, 29 May 2023 07:25:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 87E5160EFA;
	Mon, 29 May 2023 07:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E5160EFA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3087C0089;
	Mon, 29 May 2023 07:25:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A29DC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F256C82F31
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F256C82F31
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d3e3ndgd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yUr8-iw5DzB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:25:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B4082F2D
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B4082F2D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:25:19 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af2c35fb85so29845841fa.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685345117; x=1687937117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dbJswxuikSdGXOWoUBNPK1HqbQyPIndcOVtASk695c=;
 b=d3e3ndgdfD6fKBWEdpcCFSfICCQiSidpzlKnI/vYKnkIi4znfmdBzgcBTXv776E0tS
 uMXUFP+7uojCP3A0cxMlt9p71bELw+AoqDWf/O+Fnecp+6y5MXbMSTpW+bm9CJAIvQPl
 8IEpA7OZtWb0VoCgiMJdR49quBJaJXnvRE+mLuX1pMTyTgmdNOLF5v1hnlZvoq0cKriC
 XOBsBQ1pHVVzGwhXSHkKOoENz03VO3WfMdhOuLuLAOvDPgkb8Lk8DUEiPMbykLDENjMu
 q6l1vCOJe7Cl4LVJEVP2N36t5abtJPiZ2ShxtrCgVQYK7+1PF2o+som5hBD+ZGFzPFNf
 wLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685345117; x=1687937117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dbJswxuikSdGXOWoUBNPK1HqbQyPIndcOVtASk695c=;
 b=dbNlzxwBjP58/by4wo2UJGJZN/w37Mm96nQDrbrx1bo9os2fMoUVAIcpehcwGOEEDI
 w8pbPhseV3gkMXaYRF7anJgEVZJ6ULbXt9fcwtHp2tV1tFT8gjE7CiZMjFCcCkSrsoQ/
 587pL3ITjuZOxXnthuhmT8zAJMinfD4rCsZMOfHrpC+H7HvZT4E3kk0VZxFfHsK2mbED
 fymAVbEhmplfSSQoUtyrucNVVCOtKRZUO6PyrEGtE3Fv42zA2IqWAO8c+roOa0DmONGH
 qKF5u9M0Vx/7TjoatfO1Rn8TWVlx+Q4n/tWlVHaE+a03ZHKhq2mEC6Edkb6V1NVX9oLk
 JIZw==
X-Gm-Message-State: AC+VfDw7bPH1eDewEBtGWM0dYy3vYNh67mCNyfet9j94OkZl8C7aYD1x
 PsbmCIaBtxIYXnE0PMycnOjVDrlUjgLtQXT8xcI=
X-Google-Smtp-Source: ACHHUZ52xFgAKpl/EmO2rDkI6Nn8eyjYwvFWa7SRSG7SY1gEZCSW9S5AmsC8FWr+kNxgngXqcOo0ahzZ8W9QKCbZXZM=
X-Received: by 2002:a05:651c:d0:b0:2a8:b7e9:82ee with SMTP id
 16-20020a05651c00d000b002a8b7e982eemr3451083ljr.1.1685345117194; Mon, 29 May
 2023 00:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230526054621.18371-1-liangchen.linux@gmail.com>
 <20230528021008-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230528021008-mutt-send-email-mst@kernel.org>
From: Liang Chen <liangchen.linux@gmail.com>
Date: Mon, 29 May 2023 15:25:04 +0800
Message-ID: <CAKhg4tLA9z0rMEzRJ8tRt+1jQtS9z74Se2Wvwc5SKEk=WgSd2Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] virtio_net: Fix an unsafe reference to the
 page chain
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

T24gU3VuLCBNYXkgMjgsIDIwMjMgYXQgMjoxNuKAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDE6NDY6MTdQ
TSArMDgwMCwgTGlhbmcgQ2hlbiB3cm90ZToKPiA+ICJwcml2YXRlIiBvZiBidWZmZXIgcGFnZSBp
cyBjdXJyZW50bHkgdXNlZCBmb3IgYmlnIG1vZGUgdG8gY2hhaW4gcGFnZXMuCj4gPiBCdXQgaW4g
bWVyZ2VhYmxlIG1vZGUsIHRoYXQgb2Zmc2V0IG9mIHBhZ2UgY291bGQgbWVhbiBzb21ldGhpbmcg
ZWxzZSwKPiA+IGUuZy4gd2hlbiBwYWdlX3Bvb2wgcGFnZSBpcyB1c2VkIGluc3RlYWQuIFNvIGV4
Y2x1ZGluZyBtZXJnZWFibGUgbW9kZSB0bwo+ID4gYXZvaWQgc3VjaCBhIHByb2JsZW0uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTGlhbmcgQ2hlbiA8bGlhbmdjaGVuLmxpbnV4QGdtYWlsLmNvbT4K
Pgo+IFVnaCB0aGUgc3ViamVjdCBtYWtlcyBpdCBsb29rcyBsaWtlIGN1cnJlbnQgY29kZSBoYXMg
YSBwcm9ibGVtCj4gYnV0IEkgZG9uJ3QgdGhpbmsgc28gYmVjYXVzZSBJIGRvbid0IHRoaW5rIGFu
eXRoaW5nIGJlc2lkZXMKPiBiaWcgcGFja2V0cyB1c2VzIHBhZ2UtPnByaXZhdGUuCj4KPiBUaGUg
cmVhc29uIHBhdGNoIGlzIG5lZWRlZCBpcyBiZWNhdXNlIGZvbGxvdyB1cCBwYXRjaGVzCj4gdXNl
IHBhZ2VfcG9vbC4KPiBwbHMgYWRqdXN0IGNvbW1pdCBsb2cgYW5kIHN1YmplY3QgdG8gbWFrZSBh
bGwgdGhpcyBjbGVhci4KPgo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMg
fCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBiL2RyaXZlcnMv
bmV0L3ZpcnRpb19uZXQuYwo+ID4gaW5kZXggNWE3ZjdhNzZiOTIwLi5jNWRjYTBkOTJlNjQgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiA+ICsrKyBiL2RyaXZlcnMv
bmV0L3ZpcnRpb19uZXQuYwo+ID4gQEAgLTQ5Nyw3ICs0OTcsNyBAQCBzdGF0aWMgc3RydWN0IHNr
X2J1ZmYgKnBhZ2VfdG9fc2tiKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4KPiA+ICAgICAgICAgICAgICAgcGFnZSA9IChz
dHJ1Y3QgcGFnZSAqKXBhZ2UtPnByaXZhdGU7Cj4gPiAtICAgICAgICAgICAgIGlmIChwYWdlKQo+
ID4gKyAgICAgICAgICAgICBpZiAoIXZpLT5tZXJnZWFibGVfcnhfYnVmcyAmJiBwYWdlKQo+Cj4g
VG8gYmUgc2FmZSBsZXQncyBsaW1pdCB0byBiaWcgcGFja2V0cyB0b286Cj4KPiAgICAgICAgIGlm
ICghdmktPm1lcmdlYWJsZV9yeF9idWZzICYmIHZpLT5iaWdfcGFja2V0cyAmJiBwYWdlKQo+Cj4K
PgoKU3VyZSwgdGhhbmtzIQoKPiA+ICAgICAgICAgICAgICAgICAgICAgICBnaXZlX3BhZ2VzKHJx
LCBwYWdlKTsKPiA+ICAgICAgICAgICAgICAgZ290byBvazsKPiA+ICAgICAgIH0KPiA+IC0tCj4g
PiAyLjMxLjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
