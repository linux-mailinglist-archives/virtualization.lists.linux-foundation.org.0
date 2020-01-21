Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA11436C8
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 06:47:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 904EF2043F;
	Tue, 21 Jan 2020 05:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XwR6rzoqJ67; Tue, 21 Jan 2020 05:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A503520468;
	Tue, 21 Jan 2020 05:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F918C0174;
	Tue, 21 Jan 2020 05:47:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFE56C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 05:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5F1C86DE2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 05:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6pzGFiDpi6j
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 05:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D50CA86DDB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579585647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRIHR//6+tMI2y6i3aA+ZdSwTH32dw9nU4PtvoJMAts=;
 b=PcnS9eSGKLvE1veNXRncEDOQBn8o767Za8JsvTy+VbtjiPQ4kLpxKlDYvMkdjkevRcqPFg
 mTT6+Jcvyc1LWm3OvgHZHzHrngxaGnrTLorWyaNOjlRzc018WllNOmMBue1yuhLzi0N38g
 ffU+AV4fZE1XlF/aV+CEwGdVCR4QjvE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-aiLV2omIMLiV3N0KneGrzQ-1; Tue, 21 Jan 2020 00:47:26 -0500
Received: by mail-qv1-f70.google.com with SMTP id k2so912162qvu.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mRIHR//6+tMI2y6i3aA+ZdSwTH32dw9nU4PtvoJMAts=;
 b=itCFIXUBkvgHJK91rOjD0vH2ADGdkAvDZOEQmfb/Mkb1fLlNiPHrmEW/A4C6fgnZek
 9FS0qVqy/J1aN9gkfKQHJEcDE6VuclbCPhfxF0cEO/M2f6mEf9AgcvjQKFXFM+vZkcO4
 09Z48McPPmHDqq3f9Qenphunfcjl/xUEyYc0HCczQVJCMAuJP1TgTZAlBOlWJ7MGCY90
 KpBAwKI3Yz2BZtHZI/Dh20RbnnrasH5G7ybN6pG+L25+c1Ph44OrRS1m3Ly57bndlk13
 j74q786ie92Iu2E7HreKrvA3hiU5Wq1KqBebDT75JS3ciaVAmArT4qc+QZLuvJl71mar
 TIJQ==
X-Gm-Message-State: APjAAAVeMmhAgDOAggUNQ3ImtkbV5aPKqi6N7ZOKP1pY06HhaJgCCKBC
 xRqL/9cnPvUM/IkN/3TLtvPUOriVzIQrJSxdykdoGB1Vc3O/w/Ka6tI8KH0bDq/PKm5joF5qkFx
 hlTHrqNApoYmSRVa9ZFJuoB6I3Odm5Y5wc4eUu/r/Gw==
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr3086742qke.212.1579585646171; 
 Mon, 20 Jan 2020 21:47:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfdKT9tkT26VsOESb0T418l/eNKuGfLtPJgnWBbUAbKn1jVX+EvvcLfJEE9PfxETYES/rukQ==
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr3086726qke.212.1579585645935; 
 Mon, 20 Jan 2020 21:47:25 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id x3sm18835929qts.35.2020.01.20.21.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 21:47:24 -0800 (PST)
Date: Tue, 21 Jan 2020 00:47:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200121004047-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
X-MC-Unique: aiLV2omIMLiV3N0KneGrzQ-1
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

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTI6MDA6NTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzEvMjEg5LiK5Y2IMTo0OSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDM6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24gb2YgcGxhdGZvcm0gSU9N
TVUgcGFydCBvZiB2aG9zdC12ZHBhLiBXZQo+ID4gPiBkZWNpZGUgdG8gc2VuZCBkaWZmcyB0byBw
bGF0Zm9ybSBJT01NVSB0aGVyZS4gSWYgaXQncyBvayB0byBkbyB0aGF0IGluCj4gPiA+IGRyaXZl
ciwgd2UgY2FuIHJlcGxhY2Ugc2V0X21hcCB3aXRoIGluY3JlbWVudGFsIEFQSSBsaWtlIG1hcCgp
L3VubWFwKCkuCj4gPiA+IAo+ID4gPiBUaGVuIGRyaXZlciBuZWVkIHRvIG1haW50YWluIHJidHJl
ZSBpdHNlbGYuCj4gPiBJIHRoaW5rIHdlIHJlYWxseSBuZWVkIHRvIHNlZSB0d28gbW9kZXMsIG9u
ZSB3aGVyZSB0aGVyZSBpcyBhIGZpeGVkCj4gPiB0cmFuc2xhdGlvbiB3aXRob3V0IGR5bmFtaWMg
dklPTU1VIGRyaXZlbiBjaGFuZ2VzIGFuZCBvbmUgdGhhdAo+ID4gc3VwcG9ydHMgdklPTU1VLgo+
IAo+IAo+IEkgdGhpbmsgaW4gdGhpcyBjYXNlLCB5b3UgbWVhbnQgdGhlIG1ldGhvZCBwcm9wb3Nl
ZCBieSBTaGFoYWYgdGhhdCBzZW5kcwo+IGRpZmZzIG9mICJmaXhlZCB0cmFuc2xhdGlvbiIgdG8g
ZGV2aWNlPwo+IAo+IEl0IHdvdWxkIGJlIGtpbmQgb2YgdHJpY2t5IHRvIGRlYWwgd2l0aCB0aGUg
Zm9sbG93aW5nIGNhc2UgZm9yIGV4YW1wbGU6Cj4gCj4gb2xkIG1hcCBbNEcsIDE2RykgbmV3IG1h
cCBbNEcsIDhHKQo+IAo+IElmIHdlIGRvCj4gCj4gMSkgZmx1c2ggWzRHLCAxNkcpCj4gMikgYWRk
IFs0RywgOEcpCj4gCj4gVGhlcmUgY291bGQgYmUgYSB3aW5kb3cgYmV0d2VlbiAxKSBhbmQgMiku
Cj4gCj4gSXQgcmVxdWlyZXMgdGhlIElPTU1VIHRoYXQgY2FuIGRvCj4gCj4gMSkgcmVtb3ZlIFs4
RywgMTZHKQo+IDIpIGZsdXNoIFs4RywgMTZHKQo+IDMpIGNoYW5nZSBbNEcsIDhHKQo+IAo+IC4u
Li4KCkJhc2ljYWxseSB3aGF0IEkgaGFkIGluIG1pbmQgaXMgc29tZXRoaW5nIGxpa2UgcWVtdSBt
ZW1vcnkgYXBpCgowLiBiZWdpbgoxLiByZW1vdmUgWzhHLCAxNkcpCjIuIGFkZCBbNEcsIDhHKQoz
LiBjb21taXQKCkFueXdheSwgSSdtIGZpbmUgd2l0aCBhIG9uZS1zaG90IEFQSSBmb3Igbm93LCB3
ZSBjYW4KaW1wcm92ZSBpdCBsYXRlci4KCj4gPiAKPiA+IFRoZXJlIGFyZSBkaWZmZXJlbnQgb3B0
aW1pemF0aW9uIGdvYWxzIGluIHRoZSBkcml2ZXJzIGZvciB0aGVzZSB0d28KPiA+IGNvbmZpZ3Vy
YXRpb25zLgo+ID4gCj4gPiA+ID4gSWYgdGhlIGZpcnN0IG9uZSwgdGhlbiBJIHRoaW5rIG1lbW9y
eSBob3RwbHVnIGlzIGEgaGVhdnkgZmxvdwo+ID4gPiA+IHJlZ2FyZGxlc3MuIERvIHlvdSB0aGlu
ayB0aGUgZXh0cmEgY3ljbGVzIGZvciB0aGUgdHJlZSB0cmF2ZXJzZQo+ID4gPiA+IHdpbGwgYmUg
dmlzaWJsZSBpbiBhbnkgd2F5Pwo+ID4gPiBJIHRoaW5rIGlmIHRoZSBkcml2ZXIgY2FuIHBhdXNl
IHRoZSBETUEgZHVyaW5nIHRoZSB0aW1lIGZvciBzZXR0aW5nIHVwIG5ldwo+ID4gPiBtYXBwaW5n
LCBpdCBzaG91bGQgYmUgZmluZS4KPiA+IFRoaXMgaXMgdmVyeSB0cmlja3kgZm9yIGFueSBkcml2
ZXIgaWYgdGhlIG1hcHBpbmcgY2hhbmdlIGhpdHMgdGhlCj4gPiB2aXJ0aW8gcmluZ3MuIDooCj4g
PiAKPiA+IEV2ZW4gYSBJT01NVSB1c2luZyBkcml2ZXIgaXMgZ29pbmcgdG8gaGF2ZSBwcm9ibGVt
cyB3aXRoIHRoYXQuLgo+ID4gCj4gPiBKYXNvbgo+IAo+IAo+IE9yIEkgd29uZGVyIHdoZXRoZXIg
QVRTL1BSSSBjYW4gaGVscCBoZXJlLiBFLmcgZHVyaW5nIEkvTyBwYWdlIGZhdWx0LAo+IGRyaXZl
ci9kZXZpY2UgY2FuIHdhaXQgZm9yIHRoZSBuZXcgbWFwcGluZyB0byBiZSBzZXQgYW5kIHRoZW4g
cmVwbGF5IHRoZQo+IERNQS4KPiAKPiBUaGFua3MKPiAKCgotLSAKTVNUCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
