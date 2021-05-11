Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC137A236
	for <lists.virtualization@lfdr.de>; Tue, 11 May 2021 10:34:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277D660D5A;
	Tue, 11 May 2021 08:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkvAQZ05D1NX; Tue, 11 May 2021 08:34:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02EED60D5B;
	Tue, 11 May 2021 08:34:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 807AAC0024;
	Tue, 11 May 2021 08:34:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEBDDC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 08:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC6124038C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 08:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=daynix-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBgtmCp-ocnS
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 08:34:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D937A40389
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 08:34:12 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso16847502otn.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wgdPV/AcewZdrV8IdLTwGyLrFumxsFWQvFFQfDf0wVQ=;
 b=0ZapcwACbS75HaNUVIMJA2nF3TdzK7yHK93AEsDFWQj8EPz+9cmwgw80lvA1lgAEcQ
 uz/w0p69/JLKKlrFul/W9WeNdp8+jOwBZg2fofcQkFW61UPtzJvJ6gvbq69u/kBAquis
 kkgdUMlLxWCwi3BvPFR7IUQn9zq0xmg0bVmILplyvwK/wfPbwPqlmjJeWI9Eko1doGGi
 FQWXi7kHsmCKdsmfuA+BBVIHnQXevwiPUdnh+rcK2HqBBC387AtQ519eZkHJ0SsnceXB
 Yd3siNFoRrVgjmFLca5F43CEhd/Qe8uE1M9/C1PkehqGJTLCCUm2OQX0W3w6auokH3Nm
 CFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wgdPV/AcewZdrV8IdLTwGyLrFumxsFWQvFFQfDf0wVQ=;
 b=fDXBONVK3ILW1tte7uVR0PKGZz+TlOnFMfMhlSmIeKtJUCErcogXyykotPs+cTTHbL
 vokPksSMNMsMAPRZ6a7UW38UOQ8unvrmK4DBr61UnLERB7DQZfkeuEnMeFUss9Y2qr56
 uUpQK1qVi+fkaj5yswobiE5fdAD17b2uP6J7/S2w9mlVFqtGaGKpVEqrURDFcIJrM4tJ
 Iu9wSAHvH70BVtDdsjt3FwRwKV/J0nwVfDxU3rWZnM0VZW0xcYDK2q7xKsawH3eU6oMa
 MLpZ9+8AwQGJNauAWMR8HhW7CbmblhlTKt0lz8CLp9tWgESvrXaytua97Cq5E+IRtk08
 iNdA==
X-Gm-Message-State: AOAM5331CsxVe6+Z1leyMSxcJX6hWQtpMZefPuwytIAWDMn1DT15jCuH
 arsiuww7j6qSd3ESzS1VbMoSIJqb6Pz6XBpuBJyL0Q==
X-Google-Smtp-Source: ABdhPJzVt5nVC9XjXq5gIom64lU88TpjNEqpB89DApWc6nOZvte02Xy9S4mlekR3eFeF5u5HlWWwHuHrS+XxZjZHixU=
X-Received: by 2002:a05:6830:4103:: with SMTP id
 w3mr20719290ott.27.1620722051869; 
 Tue, 11 May 2021 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210511044253.469034-1-yuri.benditovich@daynix.com>
 <20210511044253.469034-5-yuri.benditovich@daynix.com>
 <eb8c4984-f0cc-74ee-537f-fc60deaaaa73@redhat.com>
In-Reply-To: <eb8c4984-f0cc-74ee-537f-fc60deaaaa73@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 11 May 2021 11:33:59 +0300
Message-ID: <CAOEp5OdrCDPx4ijLcEOm=Wxma6hc=nyqw4Xm6bggBxvgtR0tbg@mail.gmail.com>
Subject: Re: [PATCH 4/4] tun: indicate support for USO feature
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Yan Vugenfirer <yan@daynix.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

T24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgOTo1MCBBTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+Cj4g5ZyoIDIwMjEvNS8xMSDkuIvljYgxMjo0MiwgWXVyaSBCZW5k
aXRvdmljaCDlhpnpgZM6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdXJpIEJlbmRpdG92aWNoIDx5dXJp
LmJlbmRpdG92aWNoQGRheW5peC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9uZXQvdHVuLmMg
fCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC90dW4uYyBiL2RyaXZlcnMvbmV0L3R1
bi5jCj4gPiBpbmRleCA4NGY4MzI4MDYzMTMuLmEzNTA1NGY5ZDk0MSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L3R1bi5jCj4gPiArKysgYi9kcml2ZXJzL25ldC90dW4uYwo+ID4gQEAgLTI4
MTIsNyArMjgxMiw3IEBAIHN0YXRpYyBpbnQgc2V0X29mZmxvYWQoc3RydWN0IHR1bl9zdHJ1Y3Qg
KnR1biwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYXJnICY9
IH4oVFVOX0ZfVFNPNHxUVU5fRl9UU082KTsKPiA+ICAgICAgICAgICAgICAgfQo+ID4KPiA+IC0g
ICAgICAgICAgICAgYXJnICY9IH5UVU5fRl9VRk87Cj4gPiArICAgICAgICAgICAgIGFyZyAmPSB+
KFRVTl9GX1VGT3xUVU5fRl9VU08pOwo+Cj4KPiBJdCBsb29rcyB0byBtZSBrZXJuZWwgZG9lc24n
dCB1c2UgIlVTTyIsIHNvIFRVTl9GX1VEUF9HU09fTDQgaXMgYSBiZXR0ZXIKPiBuYW1lIGZvciB0
aGlzCgpObyBwcm9ibGVtLCBJIGNhbiBjaGFuZ2UgaXQgaW4gdjIKCiBhbmQgSSBndWVzcyB3ZSBz
aG91bGQgdG9nZ2xlIE5FVElGX0ZfVURQX0dTT19sNCBoZXJlPwoKTm8sIHdlIGRvIG5vdCwgYmVj
YXVzZSB0aGlzIGluZGljYXRlcyBvbmx5IHRoZSBmYWN0IHRoYXQgdGhlIGd1ZXN0IGNhbgpzZW5k
IGxhcmdlIFVEUCBwYWNrZXRzIGFuZCBoYXZlIHRoZW0gc3BsaXR0ZWQgdG8gVURQIHNlZ21lbnRz
LgoKPgo+IEFuZCBob3cgYWJvdXQgbWFjdnRhcD8KCldlIHdpbGwgY2hlY2sgaG93IHRvIGRvIHRo
YXQgZm9yIG1hY3Z0YXAuIFdlIHdpbGwgc2VuZCBhIHNlcGFyYXRlCnBhdGNoIGZvciBtYWN2dGFw
IG9yIGFzayBmb3IgYWR2aWNlLgoKPgo+IFRoYW5rcwo+Cj4KPiA+ICAgICAgIH0KPiA+Cj4gPiAg
ICAgICAvKiBUaGlzIGdpdmVzIHRoZSB1c2VyIGEgd2F5IHRvIHRlc3QgZm9yIG5ldyBmZWF0dXJl
cyBpbiBmdXR1cmUgYnkKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
