Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94A1526BE
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 08:17:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 712F4204A8;
	Wed,  5 Feb 2020 07:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZGJdIZj6JhB; Wed,  5 Feb 2020 07:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2175D20408;
	Wed,  5 Feb 2020 07:17:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0921EC1D85;
	Wed,  5 Feb 2020 07:17:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D48F8C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C30DA86578
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFl9VhrGYvrq
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 082388650F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580887026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUYYDYCrK2cC9uPFN+Mov6qV7HoWj39WrJabiY6WXbQ=;
 b=CDyhg5Iv7Zdyu4NWfQ1guHUCZoAeGjf5zK/uRchxUpwF6GXRUHNUN3CZ763aqhRZuU6kds
 NPlZDrLU+//pYncXn+ZWOzPewzjEoYYGkJTym7x26w6KaxTv77JrBH/Rl4zx9bQ0dj/7p0
 QjnSkIts1VGU+ITRiCcQDEJP0RvM++4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-PvLTw84bO36NYlpAYjnf-g-1; Wed, 05 Feb 2020 02:17:05 -0500
Received: by mail-qk1-f197.google.com with SMTP id w29so700707qkw.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 23:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AUYYDYCrK2cC9uPFN+Mov6qV7HoWj39WrJabiY6WXbQ=;
 b=lxDvXztn6k7Kp+xift+OQ7Ken8ePGrY0cSO7INRL0Un0gShnjaPbR/pEHe0/U2h1Rn
 VXnnjuffuO7k69Dn4fXvCGoD0phg3I7OrWslOAMwMJIFxbc5PhRp6qF2QQ69mauPiDz4
 OCF6m6w3Ji6nLWKuxtdSM/KT5xE+XM/2ITdgk+GqRjIz6UUcVD56kUqy77FEQV0YxzUS
 5E4tHnGFiPWWObB+VKcybwne+OiohCuZyI4yGCAp3Q70mXNOWC8X73QgmgrM4KC/mWO4
 udfFoCDlLzJBeon9a4NAP9gwd2OZdobdgWZB+TQ00erXvjG7bKl7L/bqZUd+PrR+NVVU
 mbMw==
X-Gm-Message-State: APjAAAUpC3NkDPF5ekKX/B5Gs+jqh0qKPLoegjdy7sTqJfoFukoSxbP3
 Jd0DLdU9zoJlmE7EqeRufsHsJjaeCooibb+gOdMQpa59/KiLMZxYsicwCfLJhoE/WXX65oUtxIX
 eUbcup55FwqSIRPyi9skC6vCsDczf+9lWmN8pP1LASA==
X-Received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr30574795qka.468.1580887024972; 
 Tue, 04 Feb 2020 23:17:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEKzoKyfcbFGYqDxB2gYfRipDCYO1D0VQXc0nLsGPa3RFooMo/xVZkmNCTCYKTGNdfzll0uw==
X-Received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr30574765qka.468.1580887024660; 
 Tue, 04 Feb 2020 23:17:04 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id y197sm3672395qka.65.2020.02.04.23.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 23:17:03 -0800 (PST)
Date: Wed, 5 Feb 2020 02:16:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205020547-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
 <20200205003048-mutt-send-email-mst@kernel.org>
 <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
 <20200205011935-mutt-send-email-mst@kernel.org>
 <2dd43fb5-6f02-2dcc-5c27-9f7419ef72fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2dd43fb5-6f02-2dcc-5c27-9f7419ef72fc@redhat.com>
X-MC-Unique: PvLTw84bO36NYlpAYjnf-g-1
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDI6NDk6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNSDkuIvljYgyOjMwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIEZlYiAwNSwgMjAyMCBhdCAwMTo1MDoyOFBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzIvNSDkuIvljYgxOjMxLCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MTI6MjFBTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMjAvMi81IOS4iuWNiDEwOjA1LCBUaXdl
aSBCaWUgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDAyOjQ2OjE2
UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gMjAyMC8yLzQg5LiL
5Y2IMjowMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gVHVl
LCBGZWIgMDQsIDIwMjAgYXQgMTE6MzA6MTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+
ID4gPiA+ID4gPiA+ID4gNSkgZ2VuZXJhdGUgZGlmZnMgb2YgbWVtb3J5IHRhYmxlIGFuZCB1c2lu
ZyBJT01NVSBBUEkgdG8gc2V0dXAgdGhlIGRtYQo+ID4gPiA+ID4gPiA+ID4gPiBtYXBwaW5nIGlu
IHRoaXMgbWV0aG9kCj4gPiA+ID4gPiA+ID4gPiBGcmFua2x5IEkgdGhpbmsgdGhhdCdzIGEgYnVu
Y2ggb2Ygd29yay4gV2h5IG5vdCBhIE1BUC9VTk1BUCBpbnRlcmZhY2U/Cj4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiBTdXJlLCBzbyB0aGF0IGJhc2ljYWxseSBWSE9TVF9JT1RMQl9VUERB
VEUvSU5WQUxJREFURSBJIHRoaW5rPwo+ID4gPiA+ID4gPiBEbyB5b3UgbWVhbiB3ZSBsZXQgdXNl
cnNwYWNlIHRvIG9ubHkgdXNlIFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElEQVRFCj4gPiA+ID4g
PiA+IHRvIGRvIHRoZSBETUEgbWFwcGluZyBpbiB2aG9zdC12ZHBhIGNhc2U/IFdoZW4gdklPTU1V
IGlzbid0IGF2YWlsYWJsZSwKPiA+ID4gPiA+ID4gdXNlcnNwYWNlIHdpbGwgc2V0IG1zZy0+aW92
YSB0byBHUEEsIG90aGVyd2lzZSB1c2Vyc3BhY2Ugd2lsbCBzZXQKPiA+ID4gPiA+ID4gbXNnLT5p
b3ZhIHRvIEdJT1ZBLCBhbmQgdmhvc3QtdmRwYSBtb2R1bGUgd2lsbCBnZXQgSFBBIGZyb20gbXNn
LT51YWRkcj8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+ID4gVGl3
ZWkKPiA+ID4gPiA+IEkgdGhpbmsgc28uIE1pY2hhZWwsIGRvIHlvdSB0aGluayB0aGlzIG1ha2Vz
IHNlbnNlPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiB0byBtYWtlIHN1cmUs
IGNvdWxkIHlvdSBwb3N0IHRoZSBzdWdnZXN0ZWQgYXJndW1lbnQgZm9ybWF0IGZvcgo+ID4gPiA+
IHRoZXNlIGlvY3Rscz8KPiA+ID4gPiAKPiA+ID4gSXQncyB0aGUgZXhpc3RlZCB1YXBpOgo+ID4g
PiAKPiA+ID4gLyogbm8gYWxpZ25tZW50IHJlcXVpcmVtZW50ICovCj4gPiA+IHN0cnVjdCB2aG9z
dF9pb3RsYl9tc2cgewo+ID4gPiAgwqDCoMKgIF9fdTY0IGlvdmE7Cj4gPiA+ICDCoMKgwqAgX191
NjQgc2l6ZTsKPiA+ID4gIMKgwqDCoCBfX3U2NCB1YWRkcjsKPiA+ID4gI2RlZmluZSBWSE9TVF9B
Q0NFU1NfUk/CoMKgwqDCoMKgIDB4MQo+ID4gPiAjZGVmaW5lIFZIT1NUX0FDQ0VTU19XT8KgwqDC
oMKgwqAgMHgyCj4gPiA+ICNkZWZpbmUgVkhPU1RfQUNDRVNTX1JXwqDCoMKgwqDCoCAweDMKPiA+
ID4gIMKgwqDCoCBfX3U4IHBlcm07Cj4gPiA+ICNkZWZpbmUgVkhPU1RfSU9UTEJfTUlTU8KgwqDC
oMKgwqDCoMKgwqDCoMKgIDEKPiA+ID4gI2RlZmluZSBWSE9TVF9JT1RMQl9VUERBVEXCoMKgwqDC
oMKgwqDCoMKgIDIKPiA+ID4gI2RlZmluZSBWSE9TVF9JT1RMQl9JTlZBTElEQVRFwqDCoMKgwqAg
Mwo+ID4gPiAjZGVmaW5lIFZIT1NUX0lPVExCX0FDQ0VTU19GQUlMwqDCoMKgIDQKPiA+ID4gIMKg
wqDCoCBfX3U4IHR5cGU7Cj4gPiA+IH07Cj4gPiA+IAo+ID4gPiAjZGVmaW5lIFZIT1NUX0lPVExC
X01TRyAweDEKPiA+ID4gI2RlZmluZSBWSE9TVF9JT1RMQl9NU0dfVjIgMHgyCj4gPiA+IAo+ID4g
PiBzdHJ1Y3Qgdmhvc3RfbXNnIHsKPiA+ID4gIMKgwqDCoCBpbnQgdHlwZTsKPiA+ID4gIMKgwqDC
oCB1bmlvbiB7Cj4gPiA+ICDCoMKgwqAgwqDCoMKgIHN0cnVjdCB2aG9zdF9pb3RsYl9tc2cgaW90
bGI7Cj4gPiA+ICDCoMKgwqAgwqDCoMKgIF9fdTggcGFkZGluZ1s2NF07Cj4gPiA+ICDCoMKgwqAg
fTsKPiA+ID4gfTsKPiA+ID4gCj4gPiA+IHN0cnVjdCB2aG9zdF9tc2dfdjIgewo+ID4gPiAgwqDC
oMKgIF9fdTMyIHR5cGU7Cj4gPiA+ICDCoMKgwqAgX191MzIgcmVzZXJ2ZWQ7Cj4gPiA+ICDCoMKg
wqAgdW5pb24gewo+ID4gPiAgwqDCoMKgIMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNnIGlv
dGxiOwo+ID4gPiAgwqDCoMKgIMKgwqDCoCBfX3U4IHBhZGRpbmdbNjRdOwo+ID4gPiAgwqDCoMKg
IH07Cj4gPiA+IH07Cj4gPiBPaCBvay4gIFNvIHdpdGggYSByZWFsIGRldmljZSwgSSBzdXNwZWN0
IHdlIGRvIG5vdCB3YW50IHRvIHdhaXQgZm9yIGVhY2gKPiA+IGNoYW5nZSB0byBiZSBwcm9jZXNz
ZWQgYnkgZGV2aWNlIGNvbXBsZXRlbHksIHNvIHdlIG1pZ2h0IHdhbnQgYW4gYXN5bmNocm9ub3Vz
IHZhcmlhbnQKPiA+IGFuZCB0aGVuIHNvbWUga2luZCBvZiBmbHVzaCB0aGF0IHRlbGxzIGRldmlj
ZSAieW91IGJldHRlciBhcHBseSB0aGVzZSBub3ciLgo+IAo+IAo+IExldCBtZSBleHBsYWluOgo+
IAo+IFRoZXJlIGFyZSB0d28gdHlwZXMgb2YgZGV2aWNlczoKPiAKPiAxKSBkZXZpY2Ugd2l0aG91
dCBvbi1jaGlwIElPTU1VLCBETUEgd2FzIGRvbmUgdmlhIElPTU1VIEFQSSB3aGljaCBvbmx5Cj4g
c3VwcG9ydCBpbmNyZW1lbnRhbCBtYXAvdW5tYXAKCk1vc3QgSU9NTVVzIGhhdmUgcXVldWVzIG5v
d2RheXMgdGhvdWdoLiBXaGV0aGVyIEFQSXMgd2l0aGluIGtlcm5lbApleHBvc2UgdGhhdCBtYXR0
ZXJzIGJ1dCB3ZSBhcmUgYmV0dGVyIG9mZiBvbiBlbXVsYXRpbmcKaGFyZHdhcmUgbm90IHNwZWNp
ZmljIGd1ZXN0IGJlaGF2aW91ci4KCj4gMikgZGV2aWNlIHdpdGggb24tY2hpcCBJT01NVSwgRE1B
IGNvdWxkIGJlIGRvbmUgYnkgZGV2aWNlIGRyaXZlciBpdHNlbGYsIGFuZAo+IHdlIGNvdWxkIGNo
b29zZSB0byBwYXNzIHRoZSB3aG9sZSBtYXBwaW5ncyB0byB0aGUgZHJpdmVyIGF0IG9uZSB0aW1l
IHRocm91Z2gKPiB2RFBBIGJ1cyBvcGVyYXRpb24gKHNldF9tYXApCj4gCj4gRm9yIHZob3N0LXZw
ZGEsIHRoZXJlJ3JlIHR3byB0eXBlcyBvZiBtZW1vcnkgbWFwcGluZzoKPiAKPiBhKSBtZW1vcnkg
dGFibGUsIHNldHVwIGJ5IHVzZXJzcGFjZSB0aHJvdWdoIFZIT1NUX1NFVF9NRU1fVEFCTEUsIHRo
ZSB3aG9sZQo+IG1hcHBpbmcgaXMgdXBkYXRlZCBpbiB0aGlzIHdheQo+IGIpIElPVExCIEFQSSwg
aW5jcmVtZW50YWxseSBkb25lIGJ5IHVzZXJzcGFjZSB0aHJvdWdoIHZob3N0IG1lc3NhZ2UKPiAo
SU9UTEJfVVBEQVRFL0lPVExCX0lOVkFMSURBVEUpCj4gCj4gVGhlIGN1cnJlbnQgZGVzaWduIGlz
Ogo+IAo+IC0gUmV1c2UgVkhPU1RfU0VUX01FTV9UQUJMRSwgYW5kIGZvciB0eXBlIDEpLCB3ZSBj
YW4gY2hvb3NlIHRvIHNlbmQgZGlmZnMKPiB0aHJvdWdoIElPTU1VIEFQSSBvciBmbHVzaCBhbGwg
dGhlIG1hcHBpbmdzIHRoZW4gbWFwIG5ldyBvbmVzLiBGb3IgdHlwZSAyKSwKPiBqdXN0IHNlbmQg
dGhlIHdob2xlIG1hcHBpbmcgdGhyb3VnaCBzZXRfbWFwKCkKCkkga25vdyB0aGF0IGF0IGxlYXN0
IGZvciBSRE1BIGJhc2VkIHRoaW5ncywgeW91IGNhbid0IGNoYW5nZQphIG1hcHBpbmcgaWYgaXQn
cyBhY3RpdmUuIFNvIGRyaXZlcnMgd2lsbCBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhlCmRpZmZlcmVu
Y2VzIHdoaWNoIGp1c3QgbG9va3MgdWdseTogdXNlcnNwYWNlIGtub3dzIHdoYXQKaXQgd2FzIGNo
YW5naW5nIChyZWFsbHkganVzdCBhZGRpbmcvcmVtb3Zpbmcgc29tZSBndWVzdCBtZW1vcnkpLgoK
Cgo+IC0gUmV1c2Ugdmhvc3QgSU9UTEIsIHNvIGZvciB0eXBlIDEpLCBzaW1wbHkgZm9yd2FyZCB1
cGRhdGUvaW52YWxpZGF0ZQo+IHJlcXVlc3QgdmlhIElPTU1VIEFQSSwgZm9yIHR5cGUgMiksIHNl
bmQgSU9UTEIgdG8gdkRQQSBkZXZpY2UgZHJpdmVyIHZpYQo+IHNldF9tYXAoKSwgZGV2aWNlIGRy
aXZlciBtYXkgY2hvb3NlIHRvIHNlbmQgZGlmZnMgb3IgcmVidWlsZCBhbGwgbWFwcGluZyBhdAo+
IHRoZWlyIHdpbGwKPiAKPiBUZWNobmljYWxseSB3ZSBjYW4gdXNlIHZob3N0IElPVExCIEFQSSAo
bWFwL3VtYXApIGZvciBidWlsZGluZwo+IFZIT1NUX1NFVF9NRU1fVEFCTEUsIGJ1dCB0byBhdm9p
ZCBkZXZpY2UgdG8gcHJvY2VzcyB0aGUgZWFjaCByZXF1ZXN0LCBpdAo+IGxvb2tzIHRvIG1lIHdl
IG5lZWQgbmV3IFVBUEkgd2hpY2ggc2VlbXMgc3ViIG9wdGltYWwuCj4gCj4gV2hhdCdzIHlvdSB0
aG91Z2h0Pwo+IAo+IFRoYW5rcwoKSSBzdXNwZWN0IHdlIGNhbid0IGNvbXBsZXRlbHkgYXZvaWQg
YSBuZXcgVUFQSS4KCj4gCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
