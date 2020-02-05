Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E215282E
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 10:22:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4F0785C43;
	Wed,  5 Feb 2020 09:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id damuP0w303sj; Wed,  5 Feb 2020 09:22:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10B4685C19;
	Wed,  5 Feb 2020 09:22:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7567C0174;
	Wed,  5 Feb 2020 09:22:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAC04C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BF814203FF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2lId25O-Tj8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A8641FE41
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580894560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4ADA5RYq1REkZi1n0de2jyMCM/FMnBA16Dj7PrO/fQ=;
 b=aS2eMacJvPsTtHEgGYTUfJjh7GtYLnFKhQwPirwit+HKz2ncDmU1MS8qRA700Z9yYo194F
 qLvgSaegTqTWcSvm4UjpWXH1L/LlJmDPYTOOGkW4jS02DJBEpKqKj3yQtMmV/opAVzp6ha
 9OMsEh8FKcRjbLTGoDE9YIknO1N5LwM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-SXfhQ_yMO0en_xdu7K2Z9A-1; Wed, 05 Feb 2020 04:22:36 -0500
Received: by mail-qk1-f200.google.com with SMTP id y6so861647qki.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 01:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+4ADA5RYq1REkZi1n0de2jyMCM/FMnBA16Dj7PrO/fQ=;
 b=q2wE6LTvL0s2yODGl8W2s3O++LdtsyUalGlTw3e0BC84AcZlHrrWbCVIehfloYlWwO
 jgGar2CHc987HQKWwBvVsk/L4zNhbVRo1B9s9Iiyydj9xGzi4XTGc78O5M69bOwZ75t3
 rKjaADRUg03y6JX+C+X3lXPbRcB+4j0SVXtuNHfMrGvBLwe1dVZ8P0wQMAuRMBHfy0z0
 PbKONJ2iw5cddIT9aCJwZgXkvi89l+eKhCj1XFYIi2Bb3YKX2sxTCepvOO+NNNFhdOQ9
 Rd5lxrL0qP09NuwaSrEj2W1lNJf8TQVBIwFHigqPBsm4XyUzvvymOD7L49jmiG22VEPt
 Rbnw==
X-Gm-Message-State: APjAAAX71Z0f+XxpnvTrv0n3ysj1SeHG2nD0pwFrwPTvH3vA7rb/5eRz
 6gmnroVfSmHm3eaf7ZmAhWJ5CqxhG9R3LAWSxxpQz+Q/gUqqTxHVe0Xi1oxceX7UmuHKSPM9vpf
 bsKnBfrj+K98SVs5mycTU26hqGfiFK6Ixmz2h/zO2Jw==
X-Received: by 2002:ae9:c106:: with SMTP id z6mr31970414qki.6.1580894556156;
 Wed, 05 Feb 2020 01:22:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNW6yz51xBNkYKmPewuHn/dhSffxfXzu9258rVB96SNzDJIZ1H3sTIKuDefukwjee0ClvffQ==
X-Received: by 2002:ae9:c106:: with SMTP id z6mr31970396qki.6.1580894555812;
 Wed, 05 Feb 2020 01:22:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id c45sm13902138qtd.43.2020.02.05.01.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 01:22:34 -0800 (PST)
Date: Wed, 5 Feb 2020 04:22:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205041817-mutt-send-email-mst@kernel.org>
References: <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
 <20200205003048-mutt-send-email-mst@kernel.org>
 <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
 <20200205011935-mutt-send-email-mst@kernel.org>
 <2dd43fb5-6f02-2dcc-5c27-9f7419ef72fc@redhat.com>
 <20200205020547-mutt-send-email-mst@kernel.org>
 <4e947390-da7c-52bc-c427-b1d82cc425ad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4e947390-da7c-52bc-c427-b1d82cc425ad@redhat.com>
X-MC-Unique: SXfhQ_yMO0en_xdu7K2Z9A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, maxime.coquelin@redhat.com,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDM6NDI6MThQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNSDkuIvljYgzOjE2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIEZlYiAwNSwgMjAyMCBhdCAwMjo0OTozMVBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzIvNSDkuIvljYgyOjMwLCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDE6NTA6MjhQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMjAvMi81IOS4i+WNiDE6MzEsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQg
MTE6MTI6MjFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiAyMDIw
LzIvNSDkuIrljYgxMDowNSwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gVHVl
LCBGZWIgMDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+
ID4gPiA+ID4gPiA+ID4gT24gMjAyMC8yLzQg5LiL5Y2IMjowMSwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMw
OjExQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA1KSBn
ZW5lcmF0ZSBkaWZmcyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1VIEFQSSB0byBzZXR1
cCB0aGUgZG1hCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBtYXBwaW5nIGluIHRoaXMgbWV0aG9kCj4g
PiA+ID4gPiA+ID4gPiA+ID4gRnJhbmtseSBJIHRoaW5rIHRoYXQncyBhIGJ1bmNoIG9mIHdvcmsu
IFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJmYWNlPwo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+ID4gPiBTdXJlLCBzbyB0aGF0IGJhc2ljYWxseSBWSE9TVF9JT1RMQl9VUERBVEUv
SU5WQUxJREFURSBJIHRoaW5rPwo+ID4gPiA+ID4gPiA+ID4gRG8geW91IG1lYW4gd2UgbGV0IHVz
ZXJzcGFjZSB0byBvbmx5IHVzZSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURQo+ID4gPiA+
ID4gPiA+ID4gdG8gZG8gdGhlIERNQSBtYXBwaW5nIGluIHZob3N0LXZkcGEgY2FzZT8gV2hlbiB2
SU9NTVUgaXNuJ3QgYXZhaWxhYmxlLAo+ID4gPiA+ID4gPiA+ID4gdXNlcnNwYWNlIHdpbGwgc2V0
IG1zZy0+aW92YSB0byBHUEEsIG90aGVyd2lzZSB1c2Vyc3BhY2Ugd2lsbCBzZXQKPiA+ID4gPiA+
ID4gPiA+IG1zZy0+aW92YSB0byBHSU9WQSwgYW5kIHZob3N0LXZkcGEgbW9kdWxlIHdpbGwgZ2V0
IEhQQSBmcm9tIG1zZy0+dWFkZHI/Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFRo
YW5rcywKPiA+ID4gPiA+ID4gPiA+IFRpd2VpCj4gPiA+ID4gPiA+ID4gSSB0aGluayBzby4gTWlj
aGFlbCwgZG8geW91IHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2U/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+IHRvIG1ha2Ugc3VyZSwgY291bGQgeW91IHBvc3Qg
dGhlIHN1Z2dlc3RlZCBhcmd1bWVudCBmb3JtYXQgZm9yCj4gPiA+ID4gPiA+IHRoZXNlIGlvY3Rs
cz8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCdzIHRoZSBleGlzdGVkIHVhcGk6Cj4gPiA+ID4g
PiAKPiA+ID4gPiA+IC8qIG5vIGFsaWdubWVudCByZXF1aXJlbWVudCAqLwo+ID4gPiA+ID4gc3Ry
dWN0IHZob3N0X2lvdGxiX21zZyB7Cj4gPiA+ID4gPiAgIMKgwqDCoCBfX3U2NCBpb3ZhOwo+ID4g
PiA+ID4gICDCoMKgwqAgX191NjQgc2l6ZTsKPiA+ID4gPiA+ICAgwqDCoMKgIF9fdTY0IHVhZGRy
Owo+ID4gPiA+ID4gI2RlZmluZSBWSE9TVF9BQ0NFU1NfUk/CoMKgwqDCoMKgIDB4MQo+ID4gPiA+
ID4gI2RlZmluZSBWSE9TVF9BQ0NFU1NfV0/CoMKgwqDCoMKgIDB4Mgo+ID4gPiA+ID4gI2RlZmlu
ZSBWSE9TVF9BQ0NFU1NfUlfCoMKgwqDCoMKgIDB4Mwo+ID4gPiA+ID4gICDCoMKgwqAgX191OCBw
ZXJtOwo+ID4gPiA+ID4gI2RlZmluZSBWSE9TVF9JT1RMQl9NSVNTwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMQo+ID4gPiA+ID4gI2RlZmluZSBWSE9TVF9JT1RMQl9VUERBVEXCoMKgwqDCoMKgwqDCoMKg
IDIKPiA+ID4gPiA+ICNkZWZpbmUgVkhPU1RfSU9UTEJfSU5WQUxJREFURcKgwqDCoMKgIDMKPiA+
ID4gPiA+ICNkZWZpbmUgVkhPU1RfSU9UTEJfQUNDRVNTX0ZBSUzCoMKgwqAgNAo+ID4gPiA+ID4g
ICDCoMKgwqAgX191OCB0eXBlOwo+ID4gPiA+ID4gfTsKPiA+ID4gPiA+IAo+ID4gPiA+ID4gI2Rl
ZmluZSBWSE9TVF9JT1RMQl9NU0cgMHgxCj4gPiA+ID4gPiAjZGVmaW5lIFZIT1NUX0lPVExCX01T
R19WMiAweDIKPiA+ID4gPiA+IAo+ID4gPiA+ID4gc3RydWN0IHZob3N0X21zZyB7Cj4gPiA+ID4g
PiAgIMKgwqDCoCBpbnQgdHlwZTsKPiA+ID4gPiA+ICAgwqDCoMKgIHVuaW9uIHsKPiA+ID4gPiA+
ICAgwqDCoMKgIMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNnIGlvdGxiOwo+ID4gPiA+ID4g
ICDCoMKgwqAgwqDCoMKgIF9fdTggcGFkZGluZ1s2NF07Cj4gPiA+ID4gPiAgIMKgwqDCoCB9Owo+
ID4gPiA+ID4gfTsKPiA+ID4gPiA+IAo+ID4gPiA+ID4gc3RydWN0IHZob3N0X21zZ192MiB7Cj4g
PiA+ID4gPiAgIMKgwqDCoCBfX3UzMiB0eXBlOwo+ID4gPiA+ID4gICDCoMKgwqAgX191MzIgcmVz
ZXJ2ZWQ7Cj4gPiA+ID4gPiAgIMKgwqDCoCB1bmlvbiB7Cj4gPiA+ID4gPiAgIMKgwqDCoCDCoMKg
wqAgc3RydWN0IHZob3N0X2lvdGxiX21zZyBpb3RsYjsKPiA+ID4gPiA+ICAgwqDCoMKgIMKgwqDC
oCBfX3U4IHBhZGRpbmdbNjRdOwo+ID4gPiA+ID4gICDCoMKgwqAgfTsKPiA+ID4gPiA+IH07Cj4g
PiA+ID4gT2ggb2suICBTbyB3aXRoIGEgcmVhbCBkZXZpY2UsIEkgc3VzcGVjdCB3ZSBkbyBub3Qg
d2FudCB0byB3YWl0IGZvciBlYWNoCj4gPiA+ID4gY2hhbmdlIHRvIGJlIHByb2Nlc3NlZCBieSBk
ZXZpY2UgY29tcGxldGVseSwgc28gd2UgbWlnaHQgd2FudCBhbiBhc3luY2hyb25vdXMgdmFyaWFu
dAo+ID4gPiA+IGFuZCB0aGVuIHNvbWUga2luZCBvZiBmbHVzaCB0aGF0IHRlbGxzIGRldmljZSAi
eW91IGJldHRlciBhcHBseSB0aGVzZSBub3ciLgo+ID4gPiAKPiA+ID4gTGV0IG1lIGV4cGxhaW46
Cj4gPiA+IAo+ID4gPiBUaGVyZSBhcmUgdHdvIHR5cGVzIG9mIGRldmljZXM6Cj4gPiA+IAo+ID4g
PiAxKSBkZXZpY2Ugd2l0aG91dCBvbi1jaGlwIElPTU1VLCBETUEgd2FzIGRvbmUgdmlhIElPTU1V
IEFQSSB3aGljaCBvbmx5Cj4gPiA+IHN1cHBvcnQgaW5jcmVtZW50YWwgbWFwL3VubWFwCj4gPiBN
b3N0IElPTU1VcyBoYXZlIHF1ZXVlcyBub3dkYXlzIHRob3VnaC4gV2hldGhlciBBUElzIHdpdGhp
biBrZXJuZWwKPiA+IGV4cG9zZSB0aGF0IG1hdHRlcnMgYnV0IHdlIGFyZSBiZXR0ZXIgb2ZmIG9u
IGVtdWxhdGluZwo+ID4gaGFyZHdhcmUgbm90IHNwZWNpZmljIGd1ZXN0IGJlaGF2aW91ci4KPiAK
PiAKPiBMYXN0IHRpbWUgSSBjaGVja2VkIEludGVsIElPTU1VIGRyaXZlciwgSSBzZWUgdGhlIGFz
eW5jIFFJIGlzIG5vdCB1c2VkCj4gdGhlcmUuIEFuZCBJJ20gbm90IHN1cmUgaG93IHF1ZXVlIHdp
bGwgaGVscCBtdWNoIGhlcmUuIFFlbXUgc3RpbGwgbmVlZCB0bwo+IHdhaXQgZm9yIGFsbCB0aGUg
RE1BIGlzIHNldHVwIHRvIGxldCBndWVzdCB3b3JrLgo+IAo+ID4gCj4gPiA+IDIpIGRldmljZSB3
aXRoIG9uLWNoaXAgSU9NTVUsIERNQSBjb3VsZCBiZSBkb25lIGJ5IGRldmljZSBkcml2ZXIgaXRz
ZWxmLCBhbmQKPiA+ID4gd2UgY291bGQgY2hvb3NlIHRvIHBhc3MgdGhlIHdob2xlIG1hcHBpbmdz
IHRvIHRoZSBkcml2ZXIgYXQgb25lIHRpbWUgdGhyb3VnaAo+ID4gPiB2RFBBIGJ1cyBvcGVyYXRp
b24gKHNldF9tYXApCj4gPiA+IAo+ID4gPiBGb3Igdmhvc3QtdnBkYSwgdGhlcmUncmUgdHdvIHR5
cGVzIG9mIG1lbW9yeSBtYXBwaW5nOgo+ID4gPiAKPiA+ID4gYSkgbWVtb3J5IHRhYmxlLCBzZXR1
cCBieSB1c2Vyc3BhY2UgdGhyb3VnaCBWSE9TVF9TRVRfTUVNX1RBQkxFLCB0aGUgd2hvbGUKPiA+
ID4gbWFwcGluZyBpcyB1cGRhdGVkIGluIHRoaXMgd2F5Cj4gPiA+IGIpIElPVExCIEFQSSwgaW5j
cmVtZW50YWxseSBkb25lIGJ5IHVzZXJzcGFjZSB0aHJvdWdoIHZob3N0IG1lc3NhZ2UKPiA+ID4g
KElPVExCX1VQREFURS9JT1RMQl9JTlZBTElEQVRFKQo+ID4gPiAKPiA+ID4gVGhlIGN1cnJlbnQg
ZGVzaWduIGlzOgo+ID4gPiAKPiA+ID4gLSBSZXVzZSBWSE9TVF9TRVRfTUVNX1RBQkxFLCBhbmQg
Zm9yIHR5cGUgMSksIHdlIGNhbiBjaG9vc2UgdG8gc2VuZCBkaWZmcwo+ID4gPiB0aHJvdWdoIElP
TU1VIEFQSSBvciBmbHVzaCBhbGwgdGhlIG1hcHBpbmdzIHRoZW4gbWFwIG5ldyBvbmVzLiBGb3Ig
dHlwZSAyKSwKPiA+ID4ganVzdCBzZW5kIHRoZSB3aG9sZSBtYXBwaW5nIHRocm91Z2ggc2V0X21h
cCgpCj4gPiBJIGtub3cgdGhhdCBhdCBsZWFzdCBmb3IgUkRNQSBiYXNlZCB0aGluZ3MsIHlvdSBj
YW4ndCBjaGFuZ2UKPiA+IGEgbWFwcGluZyBpZiBpdCdzIGFjdGl2ZS4gU28gZHJpdmVycyB3aWxs
IG5lZWQgdG8gZmlndXJlIG91dCB0aGUKPiA+IGRpZmZlcmVuY2VzIHdoaWNoIGp1c3QgbG9va3Mg
dWdseTogdXNlcnNwYWNlIGtub3dzIHdoYXQKPiA+IGl0IHdhcyBjaGFuZ2luZyAocmVhbGx5IGp1
c3QgYWRkaW5nL3JlbW92aW5nIHNvbWUgZ3Vlc3QgbWVtb3J5KS4KPiAKPiAKPiBUd28gbWV0aG9k
czoKPiAKPiAxKSB1c2luZyBJT1RMQiBtZXNzYWdlIFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElE
QVRFCj4gMikgbGV0IHZob3N0IGRpZmZlcnMgZnJvbSB0d28gbWVtb3J5IHRhYmxlcyB3aGljaCBz
aG91bGQgbm90IGJlIHRvbyBoYXJkCj4gKGNvbXBhcmUgdHdvIHJiIHRyZWVzKQoKClJpZ2h0IGJ1
dCAyIGlzIGp1c3Qgc3VjaCBhbiBvYnZpb3VzIHdhc3RlIG9mIGN5Y2xjZXMuIHVzZXJzcGFjZSBr
bm93cyB3aGF0IGNoYW5nZWQKd2h5IGRvZXMgdmhvc3QgbmVlZCB0byByZS1jYWxjdWxhdGUgaXQ/
IE5vPwoKPiAKPiA+IAo+ID4gCj4gPiAKPiA+ID4gLSBSZXVzZSB2aG9zdCBJT1RMQiwgc28gZm9y
IHR5cGUgMSksIHNpbXBseSBmb3J3YXJkIHVwZGF0ZS9pbnZhbGlkYXRlCj4gPiA+IHJlcXVlc3Qg
dmlhIElPTU1VIEFQSSwgZm9yIHR5cGUgMiksIHNlbmQgSU9UTEIgdG8gdkRQQSBkZXZpY2UgZHJp
dmVyIHZpYQo+ID4gPiBzZXRfbWFwKCksIGRldmljZSBkcml2ZXIgbWF5IGNob29zZSB0byBzZW5k
IGRpZmZzIG9yIHJlYnVpbGQgYWxsIG1hcHBpbmcgYXQKPiA+ID4gdGhlaXIgd2lsbAo+ID4gPiAK
PiA+ID4gVGVjaG5pY2FsbHkgd2UgY2FuIHVzZSB2aG9zdCBJT1RMQiBBUEkgKG1hcC91bWFwKSBm
b3IgYnVpbGRpbmcKPiA+ID4gVkhPU1RfU0VUX01FTV9UQUJMRSwgYnV0IHRvIGF2b2lkIGRldmlj
ZSB0byBwcm9jZXNzIHRoZSBlYWNoIHJlcXVlc3QsIGl0Cj4gPiA+IGxvb2tzIHRvIG1lIHdlIG5l
ZWQgbmV3IFVBUEkgd2hpY2ggc2VlbXMgc3ViIG9wdGltYWwuCj4gPiA+IAo+ID4gPiBXaGF0J3Mg
eW91IHRob3VnaHQ/Cj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+IEkgc3VzcGVjdCB3ZSBjYW4ndCBj
b21wbGV0ZWx5IGF2b2lkIGEgbmV3IFVBUEkuCj4gCj4gCj4gQUZBSUssIG1lbW9yeSB0YWJsZSB1
c3VhbGx5IGNvbnRhaW4ganVzdCBmZXcgZW50cmllcywgdGhlIHBlcmZvcm1hbmNlIGNvc3QKPiBz
aG91bGQgYmUgZmluZS4gKEF0IGxlYXN0IHNob3VsZCBiZSB0aGUgc2FtZSBhcyB0aGUgY2FzZSBv
ZiBWRklPKS4KPiAKPiBTbyBpbiBxZW11LCBzaW1wbHkgaG9va2luZyBhZGRfcmVnaW9uL3JlbW92
ZV9yZWdpb24gdG8KPiBWSE9TVF9JT1RMQl9VUERBVEUvVkhPU1RfSU9UTEJfSU5WQUxJREFURSBz
aG91bGQgd29yaz8KPiAKPiBJZiB3ZSBpbnRyb2R1Y2UgQVBJIGxpa2UgeW91IHByb3Bvc2VkIHBy
ZXZpb3VzbHkgKG1lbW9yeSBsaXN0ZW5lciBzdHlsZSk6Cj4gCj4gYmVnaW4KPiBhZGQKPiByZW1v
dmUKPiBjb21taXQKPiAKPiBJIHN1c3BlY3QgaXQgd2lsbCBiZSB0b28gaGVhdndlaWdodCBmb3Ig
dGhlIGNhc2Ugb2YgdklPTU1VIGFuZCBmb3IgdGhlCj4gZHJpdmVyIHRoYXQgd2FudCB0byBidWls
ZCBuZXcgbWFwcGluZywgd2UgbmVlZCBhZGRub3AgZXRjLi4uCj4gCj4gVGhhbmtzCj4gCgpJIGZl
ZWwgdGhpcyBjYW4gaGVscCBzb21lIHdvcmtsb2FkcyBidXQgdGhpcyBjYW4gd2FpdCwgZm9yIHN1
cmUuCgoKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
