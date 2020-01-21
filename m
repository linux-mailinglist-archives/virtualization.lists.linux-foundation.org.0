Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54782143817
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 09:16:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1627385E7D;
	Tue, 21 Jan 2020 08:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKD5MYh1diK9; Tue, 21 Jan 2020 08:16:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE97585E25;
	Tue, 21 Jan 2020 08:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E0B1C0174;
	Tue, 21 Jan 2020 08:16:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F297AC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DEC8987933
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SkiqPm8NiJC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:15:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0F8487987
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579594557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDZZx/Gnj5ZRM82WjxYSmYyaFueti+mk2d2ohpv+jeI=;
 b=FIDiGCaHkGDCzSfEoa4lSR7IBujkPvnoLk93A+Reit4UvJBanoNWEmvkvFfy3KRrPuxKm7
 nVtKi3epqNthEn20zZzNJU77d4ZJQ4Ns70RGA5R2PaRPXUzf+5OAaFUGbPO2kdGtYcipO5
 jZTc6shJEmUgWx4OWWV4hmpXO3y3Bi0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-eJRSF7gZPjGZIq2QfGWjBA-1; Tue, 21 Jan 2020 03:15:54 -0500
Received: by mail-qt1-f197.google.com with SMTP id m8so1372563qta.20
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 00:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LDZZx/Gnj5ZRM82WjxYSmYyaFueti+mk2d2ohpv+jeI=;
 b=DbqibNOZ+P1ku9/CYNbIjrtk8I5GLryWL/dFFx7Z+VIIShiiAJ7OnQSmcsAXd6mSU8
 RWDx/a1IQ6hmTFP1F0vFk6CBUTTQ9Fx93l2lh2tSP24Uq3CGeZ9SXuzRCgQvJxApkNyM
 1u9jJx7BshSYtpLy/A855Aa+U9/XMSZGx8PrkoPLx4Bot+cyp2QQ6zEpaBnwfOT0LyRa
 FgjE8I/zNwVt9iI0WMr2+DRnufg2a+Twkj1RaYwpZ+s64GPCSFKjLc9DlO4FdR/wjVMH
 jX+XcJTzJVy0ii6/051VDeCz1xWMi92Ly8hPr4RjaM1NVU36wLDazeVvH3a1ed4zlwJr
 1cAw==
X-Gm-Message-State: APjAAAX+jUVoi9nM3CRSR14FQqCcRRIlaFVyiEPBhtKfohvQ+KvQJJj6
 WiQ9lcOrrJuExepzJxrL/UMFLhWS3xn1N1STWPs9KfRmcVndKpAmjIiv5Jj7hBs42DOZAubWEhs
 gsGNnSp5bwbA9K4GbSQBtdOvB5Ai2D8GNdZ808iz4jA==
X-Received: by 2002:a37:4792:: with SMTP id u140mr3527881qka.100.1579594553676; 
 Tue, 21 Jan 2020 00:15:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdkjBVx/UGOKVK94Xs4SyAvooIxcojAHiVS5/OG5oUdaH/4DoRhuXXCGIK/jBUqS0IK043lw==
X-Received: by 2002:a37:4792:: with SMTP id u140mr3527856qka.100.1579594553353; 
 Tue, 21 Jan 2020 00:15:53 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id z3sm18825316qtm.5.2020.01.21.00.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 00:15:52 -0800 (PST)
Date: Tue, 21 Jan 2020 03:15:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200121031506-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
 <20200121004047-mutt-send-email-mst@kernel.org>
 <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
X-MC-Unique: eJRSF7gZPjGZIq2QfGWjBA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDQ6MDA6MzhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzEvMjEg5LiL5Y2IMTo0NywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTI6MDA6NTdQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC8xLzIxIOS4iuWNiDE6NDksIEphc29uIEd1bnRob3JwZSB3
cm90ZToKPiA+ID4gPiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAwNDo0Mzo1M1BNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24g
b2YgcGxhdGZvcm0gSU9NTVUgcGFydCBvZiB2aG9zdC12ZHBhLiBXZQo+ID4gPiA+ID4gZGVjaWRl
IHRvIHNlbmQgZGlmZnMgdG8gcGxhdGZvcm0gSU9NTVUgdGhlcmUuIElmIGl0J3Mgb2sgdG8gZG8g
dGhhdCBpbgo+ID4gPiA+ID4gZHJpdmVyLCB3ZSBjYW4gcmVwbGFjZSBzZXRfbWFwIHdpdGggaW5j
cmVtZW50YWwgQVBJIGxpa2UgbWFwKCkvdW5tYXAoKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhl
biBkcml2ZXIgbmVlZCB0byBtYWludGFpbiByYnRyZWUgaXRzZWxmLgo+ID4gPiA+IEkgdGhpbmsg
d2UgcmVhbGx5IG5lZWQgdG8gc2VlIHR3byBtb2Rlcywgb25lIHdoZXJlIHRoZXJlIGlzIGEgZml4
ZWQKPiA+ID4gPiB0cmFuc2xhdGlvbiB3aXRob3V0IGR5bmFtaWMgdklPTU1VIGRyaXZlbiBjaGFu
Z2VzIGFuZCBvbmUgdGhhdAo+ID4gPiA+IHN1cHBvcnRzIHZJT01NVS4KPiA+ID4gCj4gPiA+IEkg
dGhpbmsgaW4gdGhpcyBjYXNlLCB5b3UgbWVhbnQgdGhlIG1ldGhvZCBwcm9wb3NlZCBieSBTaGFo
YWYgdGhhdCBzZW5kcwo+ID4gPiBkaWZmcyBvZiAiZml4ZWQgdHJhbnNsYXRpb24iIHRvIGRldmlj
ZT8KPiA+ID4gCj4gPiA+IEl0IHdvdWxkIGJlIGtpbmQgb2YgdHJpY2t5IHRvIGRlYWwgd2l0aCB0
aGUgZm9sbG93aW5nIGNhc2UgZm9yIGV4YW1wbGU6Cj4gPiA+IAo+ID4gPiBvbGQgbWFwIFs0Rywg
MTZHKSBuZXcgbWFwIFs0RywgOEcpCj4gPiA+IAo+ID4gPiBJZiB3ZSBkbwo+ID4gPiAKPiA+ID4g
MSkgZmx1c2ggWzRHLCAxNkcpCj4gPiA+IDIpIGFkZCBbNEcsIDhHKQo+ID4gPiAKPiA+ID4gVGhl
cmUgY291bGQgYmUgYSB3aW5kb3cgYmV0d2VlbiAxKSBhbmQgMikuCj4gPiA+IAo+ID4gPiBJdCBy
ZXF1aXJlcyB0aGUgSU9NTVUgdGhhdCBjYW4gZG8KPiA+ID4gCj4gPiA+IDEpIHJlbW92ZSBbOEcs
IDE2RykKPiA+ID4gMikgZmx1c2ggWzhHLCAxNkcpCj4gPiA+IDMpIGNoYW5nZSBbNEcsIDhHKQo+
ID4gPiAKPiA+ID4gLi4uLgo+ID4gQmFzaWNhbGx5IHdoYXQgSSBoYWQgaW4gbWluZCBpcyBzb21l
dGhpbmcgbGlrZSBxZW11IG1lbW9yeSBhcGkKPiA+IAo+ID4gMC4gYmVnaW4KPiA+IDEuIHJlbW92
ZSBbOEcsIDE2RykKPiA+IDIuIGFkZCBbNEcsIDhHKQo+ID4gMy4gY29tbWl0Cj4gCj4gCj4gVGhp
cyBzb3VuZHMgbW9yZSBmbGV4aWJsZSBlLmcgZHJpdmVyIG1heSBjaG9vc2UgdG8gaW1wbGVtZW50
IHN0YXRpYyBtYXBwaW5nCj4gb25lIHRocm91Z2ggY29tbWl0LiBCdXQgYSBxdWVzdGlvbiBoZXJl
LCBpdCBsb29rcyB0byBtZSB0aGlzIHN0aWxsIHJlcXVpcmVzCj4gdGhlIERNQSB0byBiZSBzeW5j
ZWQgd2l0aCBhdCBsZWFzdCBjb21taXQgaGVyZS4gT3RoZXJ3aXNlIGRldmljZSBtYXkgZ2V0IERN
QQo+IGZhdWx0PyBPciBkZXZpY2UgaXMgZXhwZWN0ZWQgdG8gYmUgcGF1c2VkIERNQSBkdXJpbmcg
YmVnaW4/Cj4gCj4gVGhhbmtzCgpGb3IgZXhhbXBsZSwgY29tbWl0IG1pZ2h0IHN3aXRjaCBvbmUg
c2V0IG9mIHRhYmxlcyBmb3IgYW5vdGhlciwKd2l0aG91dCBuZWVkIHRvIHBhdXNlIERNQS4KCj4g
Cj4gPiAKPiA+IEFueXdheSwgSSdtIGZpbmUgd2l0aCBhIG9uZS1zaG90IEFQSSBmb3Igbm93LCB3
ZSBjYW4KPiA+IGltcHJvdmUgaXQgbGF0ZXIuCj4gPiAKPiA+ID4gPiBUaGVyZSBhcmUgZGlmZmVy
ZW50IG9wdGltaXphdGlvbiBnb2FscyBpbiB0aGUgZHJpdmVycyBmb3IgdGhlc2UgdHdvCj4gPiA+
ID4gY29uZmlndXJhdGlvbnMuCj4gPiA+ID4gCj4gPiA+ID4gPiA+IElmIHRoZSBmaXJzdCBvbmUs
IHRoZW4gSSB0aGluayBtZW1vcnkgaG90cGx1ZyBpcyBhIGhlYXZ5IGZsb3cKPiA+ID4gPiA+ID4g
cmVnYXJkbGVzcy4gRG8geW91IHRoaW5rIHRoZSBleHRyYSBjeWNsZXMgZm9yIHRoZSB0cmVlIHRy
YXZlcnNlCj4gPiA+ID4gPiA+IHdpbGwgYmUgdmlzaWJsZSBpbiBhbnkgd2F5Pwo+ID4gPiA+ID4g
SSB0aGluayBpZiB0aGUgZHJpdmVyIGNhbiBwYXVzZSB0aGUgRE1BIGR1cmluZyB0aGUgdGltZSBm
b3Igc2V0dGluZyB1cCBuZXcKPiA+ID4gPiA+IG1hcHBpbmcsIGl0IHNob3VsZCBiZSBmaW5lLgo+
ID4gPiA+IFRoaXMgaXMgdmVyeSB0cmlja3kgZm9yIGFueSBkcml2ZXIgaWYgdGhlIG1hcHBpbmcg
Y2hhbmdlIGhpdHMgdGhlCj4gPiA+ID4gdmlydGlvIHJpbmdzLiA6KAo+ID4gPiA+IAo+ID4gPiA+
IEV2ZW4gYSBJT01NVSB1c2luZyBkcml2ZXIgaXMgZ29pbmcgdG8gaGF2ZSBwcm9ibGVtcyB3aXRo
IHRoYXQuLgo+ID4gPiA+IAo+ID4gPiA+IEphc29uCj4gPiA+IAo+ID4gPiBPciBJIHdvbmRlciB3
aGV0aGVyIEFUUy9QUkkgY2FuIGhlbHAgaGVyZS4gRS5nIGR1cmluZyBJL08gcGFnZSBmYXVsdCwK
PiA+ID4gZHJpdmVyL2RldmljZSBjYW4gd2FpdCBmb3IgdGhlIG5ldyBtYXBwaW5nIHRvIGJlIHNl
dCBhbmQgdGhlbiByZXBsYXkgdGhlCj4gPiA+IERNQS4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4g
PiAKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
