Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CF152652
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 07:30:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7175985604;
	Wed,  5 Feb 2020 06:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVmJP8PebrD4; Wed,  5 Feb 2020 06:30:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE60484F58;
	Wed,  5 Feb 2020 06:30:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8541C0174;
	Wed,  5 Feb 2020 06:30:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28C7DC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 10B24855CC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUdOhQQ3JoI2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:30:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C56884F58
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580884241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK/6EZm6JjjZrHYe/o5W90LoH1mAJQFt67RmR4CQh0M=;
 b=YgkvhRC6oEL83OP1ymGPPJJYiDFnwqsRhnOqo6LV6h3nEX9VZU9anBYQ21hs7Z5J20uNUo
 SZkb5eDb9rwubWni2fiPnCTX/RV+OcncXVRiQM2oD1RClkX3Lh0WSI/9zxSuVou9yIT6+R
 71AwJ2Jy8XqBF7f3VnpPDgJV6RPSpvI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-DlC57l6vO2C2d2cwQUTEbw-1; Wed, 05 Feb 2020 01:30:40 -0500
Received: by mail-qt1-f198.google.com with SMTP id a13so704353qtp.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 22:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SK/6EZm6JjjZrHYe/o5W90LoH1mAJQFt67RmR4CQh0M=;
 b=Wqo3Jk6T7kFhpckHbGnU/e7EdPDYyF/rql98ei5a9O7SLU3cxG/6GjrbqLnxwYse1o
 R4XYAuEf/JKubaxQsOxmiHO2/vvy4HknBgVJrjMptxnIayuYIJuaGp7n49C8Nn5ZRXcT
 emP219QPthOXeLdi8TXE6+JULXPfLXMoeQE1GsLaRknsczgmK5lpr3CCJkdTKBaKm44M
 XowwIauyic3PfymM+Hq8csdxHjxuRHuvss285ElWSqxH4Mjqu3Gzd+3Ynsok+eVG3nFu
 Ygjht3QEmK75USwyPLqJk76NGnYIR7BpDf1J9qzcrX9VzU980Tz3E9Vv2TUM3/7wn6lR
 7IlQ==
X-Gm-Message-State: APjAAAUMioDCNEeGBMGlqNsEWb9CpEpTIwvY/84TMpwr33PWgOLicHtd
 wfsEABMVdolmSeh0WNvOUQUkjuLLjhMUBxr1SxuVXlEAW5KQZtDmaneEGWL5B7gz51hQk3c6j9k
 Swwk6JoMwjT5vE4M0MBvxzRg9JvZVPhsC6PRss7KXfw==
X-Received: by 2002:a05:6214:11a8:: with SMTP id
 u8mr30684187qvv.16.1580884239902; 
 Tue, 04 Feb 2020 22:30:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkD0A2RyJgsZhuekPIPi4xkOg0VrIIr3OXInSUl8ooLyFt/kzVDntwDVhZLhJKb38ZnUEwpg==
X-Received: by 2002:a05:6214:11a8:: with SMTP id
 u8mr30684150qvv.16.1580884239611; 
 Tue, 04 Feb 2020 22:30:39 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id a36sm13471539qtk.29.2020.02.04.22.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:30:38 -0800 (PST)
Date: Wed, 5 Feb 2020 01:30:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205011935-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
 <20200205003048-mutt-send-email-mst@kernel.org>
 <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
X-MC-Unique: DlC57l6vO2C2d2cwQUTEbw-1
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDE6NTA6MjhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNSDkuIvljYgxOjMxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIEZlYiAwNSwgMjAyMCBhdCAxMToxMjoyMUFNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzIvNSDkuIrljYgxMDowNSwgVGl3ZWkgQmllIHdyb3RlOgo+
ID4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDAyOjQ2OjE2UE0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiAyMDIwLzIvNCDkuIvljYgyOjAxLCBNaWNoYWVsIFMuIFRz
aXJraW4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjEx
QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gNSkgZ2VuZXJhdGUgZGlm
ZnMgb2YgbWVtb3J5IHRhYmxlIGFuZCB1c2luZyBJT01NVSBBUEkgdG8gc2V0dXAgdGhlIGRtYQo+
ID4gPiA+ID4gPiA+IG1hcHBpbmcgaW4gdGhpcyBtZXRob2QKPiA+ID4gPiA+ID4gRnJhbmtseSBJ
IHRoaW5rIHRoYXQncyBhIGJ1bmNoIG9mIHdvcmsuIFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJm
YWNlPwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IFN1cmUsIHNvIHRoYXQgYmFzaWNhbGx5IFZIT1NU
X0lPVExCX1VQREFURS9JTlZBTElEQVRFIEkgdGhpbms/Cj4gPiA+ID4gRG8geW91IG1lYW4gd2Ug
bGV0IHVzZXJzcGFjZSB0byBvbmx5IHVzZSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURQo+
ID4gPiA+IHRvIGRvIHRoZSBETUEgbWFwcGluZyBpbiB2aG9zdC12ZHBhIGNhc2U/IFdoZW4gdklP
TU1VIGlzbid0IGF2YWlsYWJsZSwKPiA+ID4gPiB1c2Vyc3BhY2Ugd2lsbCBzZXQgbXNnLT5pb3Zh
IHRvIEdQQSwgb3RoZXJ3aXNlIHVzZXJzcGFjZSB3aWxsIHNldAo+ID4gPiA+IG1zZy0+aW92YSB0
byBHSU9WQSwgYW5kIHZob3N0LXZkcGEgbW9kdWxlIHdpbGwgZ2V0IEhQQSBmcm9tIG1zZy0+dWFk
ZHI/Cj4gPiA+ID4gCj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IFRpd2VpCj4gPiA+IEkgdGhpbmsg
c28uIE1pY2hhZWwsIGRvIHlvdSB0aGluayB0aGlzIG1ha2VzIHNlbnNlPwo+ID4gPiAKPiA+ID4g
VGhhbmtzCj4gPiB0byBtYWtlIHN1cmUsIGNvdWxkIHlvdSBwb3N0IHRoZSBzdWdnZXN0ZWQgYXJn
dW1lbnQgZm9ybWF0IGZvcgo+ID4gdGhlc2UgaW9jdGxzPwo+ID4gCj4gCj4gSXQncyB0aGUgZXhp
c3RlZCB1YXBpOgo+IAo+IC8qIG5vIGFsaWdubWVudCByZXF1aXJlbWVudCAqLwo+IHN0cnVjdCB2
aG9zdF9pb3RsYl9tc2cgewo+IMKgwqDCoCBfX3U2NCBpb3ZhOwo+IMKgwqDCoCBfX3U2NCBzaXpl
Owo+IMKgwqDCoCBfX3U2NCB1YWRkcjsKPiAjZGVmaW5lIFZIT1NUX0FDQ0VTU19ST8KgwqDCoMKg
wqAgMHgxCj4gI2RlZmluZSBWSE9TVF9BQ0NFU1NfV0/CoMKgwqDCoMKgIDB4Mgo+ICNkZWZpbmUg
VkhPU1RfQUNDRVNTX1JXwqDCoMKgwqDCoCAweDMKPiDCoMKgwqAgX191OCBwZXJtOwo+ICNkZWZp
bmUgVkhPU1RfSU9UTEJfTUlTU8KgwqDCoMKgwqDCoMKgwqDCoMKgIDEKPiAjZGVmaW5lIFZIT1NU
X0lPVExCX1VQREFURcKgwqDCoMKgwqDCoMKgwqAgMgo+ICNkZWZpbmUgVkhPU1RfSU9UTEJfSU5W
QUxJREFURcKgwqDCoMKgIDMKPiAjZGVmaW5lIFZIT1NUX0lPVExCX0FDQ0VTU19GQUlMwqDCoMKg
IDQKPiDCoMKgwqAgX191OCB0eXBlOwo+IH07Cj4gCj4gI2RlZmluZSBWSE9TVF9JT1RMQl9NU0cg
MHgxCj4gI2RlZmluZSBWSE9TVF9JT1RMQl9NU0dfVjIgMHgyCj4gCj4gc3RydWN0IHZob3N0X21z
ZyB7Cj4gwqDCoMKgIGludCB0eXBlOwo+IMKgwqDCoCB1bmlvbiB7Cj4gwqDCoMKgIMKgwqDCoCBz
dHJ1Y3Qgdmhvc3RfaW90bGJfbXNnIGlvdGxiOwo+IMKgwqDCoCDCoMKgwqAgX191OCBwYWRkaW5n
WzY0XTsKPiDCoMKgwqAgfTsKPiB9Owo+IAo+IHN0cnVjdCB2aG9zdF9tc2dfdjIgewo+IMKgwqDC
oCBfX3UzMiB0eXBlOwo+IMKgwqDCoCBfX3UzMiByZXNlcnZlZDsKPiDCoMKgwqAgdW5pb24gewo+
IMKgwqDCoCDCoMKgwqAgc3RydWN0IHZob3N0X2lvdGxiX21zZyBpb3RsYjsKPiDCoMKgwqAgwqDC
oMKgIF9fdTggcGFkZGluZ1s2NF07Cj4gwqDCoMKgIH07Cj4gfTsKCk9oIG9rLiAgU28gd2l0aCBh
IHJlYWwgZGV2aWNlLCBJIHN1c3BlY3Qgd2UgZG8gbm90IHdhbnQgdG8gd2FpdCBmb3IgZWFjaApj
aGFuZ2UgdG8gYmUgcHJvY2Vzc2VkIGJ5IGRldmljZSBjb21wbGV0ZWx5LCBzbyB3ZSBtaWdodCB3
YW50IGFuIGFzeW5jaHJvbm91cyB2YXJpYW50CmFuZCB0aGVuIHNvbWUga2luZCBvZiBmbHVzaCB0
aGF0IHRlbGxzIGRldmljZSAieW91IGJldHRlciBhcHBseSB0aGVzZSBub3ciLgoKLS0gCk1TVAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
