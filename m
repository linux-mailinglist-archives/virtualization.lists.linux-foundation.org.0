Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB115266C
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 07:50:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8CB881428;
	Wed,  5 Feb 2020 06:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRXSF82mSQey; Wed,  5 Feb 2020 06:50:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C88584EA0;
	Wed,  5 Feb 2020 06:50:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2238C0175;
	Wed,  5 Feb 2020 06:50:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D34E7C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BF60D84F27
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiuvMUVdY5tb
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:50:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB1B484EA0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580885418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE2vWrZfATx1m0Y7LHRA4jaMP+1sekxlUzJjAOwdAHM=;
 b=FsAdKZTFBUdh4E4OXGXXdmndvHslSEWlpXxB5+6/qv2pcnSTLU4FYG3XfKgR3JRmNqz39z
 HuagAtsB6fBwC4exN/Ik5OLI0/bG6fFYvFYerOrLPW8ctMrVlFKbrxoUo+7AYWQs/KlhkA
 +HzpX+xkuEvrLf1fM+k5yq7XdPL5BMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-_Ob3lLb_MXmy3zWqO6IqAQ-1; Wed, 05 Feb 2020 01:50:16 -0500
X-MC-Unique: _Ob3lLb_MXmy3zWqO6IqAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB60DBA5;
 Wed,  5 Feb 2020 06:50:14 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 394381001B09;
 Wed,  5 Feb 2020 06:49:37 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
 <20200205003048-mutt-send-email-mst@kernel.org>
 <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
 <20200205011935-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2dd43fb5-6f02-2dcc-5c27-9f7419ef72fc@redhat.com>
Date: Wed, 5 Feb 2020 14:49:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205011935-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMi81IOS4i+WNiDI6MzAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAwMTo1MDoyOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzIvNSDkuIvljYgxOjMxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIEZlYiAwNSwgMjAyMCBhdCAxMToxMjoyMUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvMi81IOS4iuWNiDEwOjA1LCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+IE9u
IFR1ZSwgRmViIDA0LCAyMDIwIGF0IDAyOjQ2OjE2UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4+PiBPbiAyMDIwLzIvNCDkuIvljYgyOjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4+Pj4+Pj4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMTE6MzA6MTFBTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+Pj4gNSkgZ2VuZXJhdGUgZGlmZnMgb2YgbWVtb3J5IHRhYmxlIGFu
ZCB1c2luZyBJT01NVSBBUEkgdG8gc2V0dXAgdGhlIGRtYQo+Pj4+Pj4+PiBtYXBwaW5nIGluIHRo
aXMgbWV0aG9kCj4+Pj4+Pj4gRnJhbmtseSBJIHRoaW5rIHRoYXQncyBhIGJ1bmNoIG9mIHdvcmsu
IFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJmYWNlPwo+Pj4+Pj4+Cj4+Pj4+PiBTdXJlLCBzbyB0
aGF0IGJhc2ljYWxseSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURSBJIHRoaW5rPwo+Pj4+
PiBEbyB5b3UgbWVhbiB3ZSBsZXQgdXNlcnNwYWNlIHRvIG9ubHkgdXNlIFZIT1NUX0lPVExCX1VQ
REFURS9JTlZBTElEQVRFCj4+Pj4+IHRvIGRvIHRoZSBETUEgbWFwcGluZyBpbiB2aG9zdC12ZHBh
IGNhc2U/IFdoZW4gdklPTU1VIGlzbid0IGF2YWlsYWJsZSwKPj4+Pj4gdXNlcnNwYWNlIHdpbGwg
c2V0IG1zZy0+aW92YSB0byBHUEEsIG90aGVyd2lzZSB1c2Vyc3BhY2Ugd2lsbCBzZXQKPj4+Pj4g
bXNnLT5pb3ZhIHRvIEdJT1ZBLCBhbmQgdmhvc3QtdmRwYSBtb2R1bGUgd2lsbCBnZXQgSFBBIGZy
b20gbXNnLT51YWRkcj8KPj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+PiBUaXdlaQo+Pj4+IEkgdGhp
bmsgc28uIE1pY2hhZWwsIGRvIHlvdSB0aGluayB0aGlzIG1ha2VzIHNlbnNlPwo+Pj4+Cj4+Pj4g
VGhhbmtzCj4+PiB0byBtYWtlIHN1cmUsIGNvdWxkIHlvdSBwb3N0IHRoZSBzdWdnZXN0ZWQgYXJn
dW1lbnQgZm9ybWF0IGZvcgo+Pj4gdGhlc2UgaW9jdGxzPwo+Pj4KPj4gSXQncyB0aGUgZXhpc3Rl
ZCB1YXBpOgo+Pgo+PiAvKiBubyBhbGlnbm1lbnQgcmVxdWlyZW1lbnQgKi8KPj4gc3RydWN0IHZo
b3N0X2lvdGxiX21zZyB7Cj4+ICDCoMKgwqAgX191NjQgaW92YTsKPj4gIMKgwqDCoCBfX3U2NCBz
aXplOwo+PiAgwqDCoMKgIF9fdTY0IHVhZGRyOwo+PiAjZGVmaW5lIFZIT1NUX0FDQ0VTU19ST8Kg
wqDCoMKgwqAgMHgxCj4+ICNkZWZpbmUgVkhPU1RfQUNDRVNTX1dPwqDCoMKgwqDCoCAweDIKPj4g
I2RlZmluZSBWSE9TVF9BQ0NFU1NfUlfCoMKgwqDCoMKgIDB4Mwo+PiAgwqDCoMKgIF9fdTggcGVy
bTsKPj4gI2RlZmluZSBWSE9TVF9JT1RMQl9NSVNTwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+PiAj
ZGVmaW5lIFZIT1NUX0lPVExCX1VQREFURcKgwqDCoMKgwqDCoMKgwqAgMgo+PiAjZGVmaW5lIFZI
T1NUX0lPVExCX0lOVkFMSURBVEXCoMKgwqDCoCAzCj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfQUND
RVNTX0ZBSUzCoMKgwqAgNAo+PiAgwqDCoMKgIF9fdTggdHlwZTsKPj4gfTsKPj4KPj4gI2RlZmlu
ZSBWSE9TVF9JT1RMQl9NU0cgMHgxCj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfTVNHX1YyIDB4Mgo+
Pgo+PiBzdHJ1Y3Qgdmhvc3RfbXNnIHsKPj4gIMKgwqDCoCBpbnQgdHlwZTsKPj4gIMKgwqDCoCB1
bmlvbiB7Cj4+ICDCoMKgwqAgwqDCoMKgIHN0cnVjdCB2aG9zdF9pb3RsYl9tc2cgaW90bGI7Cj4+
ICDCoMKgwqAgwqDCoMKgIF9fdTggcGFkZGluZ1s2NF07Cj4+ICDCoMKgwqAgfTsKPj4gfTsKPj4K
Pj4gc3RydWN0IHZob3N0X21zZ192MiB7Cj4+ICDCoMKgwqAgX191MzIgdHlwZTsKPj4gIMKgwqDC
oCBfX3UzMiByZXNlcnZlZDsKPj4gIMKgwqDCoCB1bmlvbiB7Cj4+ICDCoMKgwqAgwqDCoMKgIHN0
cnVjdCB2aG9zdF9pb3RsYl9tc2cgaW90bGI7Cj4+ICDCoMKgwqAgwqDCoMKgIF9fdTggcGFkZGlu
Z1s2NF07Cj4+ICDCoMKgwqAgfTsKPj4gfTsKPiBPaCBvay4gIFNvIHdpdGggYSByZWFsIGRldmlj
ZSwgSSBzdXNwZWN0IHdlIGRvIG5vdCB3YW50IHRvIHdhaXQgZm9yIGVhY2gKPiBjaGFuZ2UgdG8g
YmUgcHJvY2Vzc2VkIGJ5IGRldmljZSBjb21wbGV0ZWx5LCBzbyB3ZSBtaWdodCB3YW50IGFuIGFz
eW5jaHJvbm91cyB2YXJpYW50Cj4gYW5kIHRoZW4gc29tZSBraW5kIG9mIGZsdXNoIHRoYXQgdGVs
bHMgZGV2aWNlICJ5b3UgYmV0dGVyIGFwcGx5IHRoZXNlIG5vdyIuCgoKTGV0IG1lIGV4cGxhaW46
CgpUaGVyZSBhcmUgdHdvIHR5cGVzIG9mIGRldmljZXM6CgoxKSBkZXZpY2Ugd2l0aG91dCBvbi1j
aGlwIElPTU1VLCBETUEgd2FzIGRvbmUgdmlhIElPTU1VIEFQSSB3aGljaCBvbmx5IApzdXBwb3J0
IGluY3JlbWVudGFsIG1hcC91bm1hcAoyKSBkZXZpY2Ugd2l0aCBvbi1jaGlwIElPTU1VLCBETUEg
Y291bGQgYmUgZG9uZSBieSBkZXZpY2UgZHJpdmVyIGl0c2VsZiwgCmFuZCB3ZSBjb3VsZCBjaG9v
c2UgdG8gcGFzcyB0aGUgd2hvbGUgbWFwcGluZ3MgdG8gdGhlIGRyaXZlciBhdCBvbmUgdGltZSAK
dGhyb3VnaCB2RFBBIGJ1cyBvcGVyYXRpb24gKHNldF9tYXApCgpGb3Igdmhvc3QtdnBkYSwgdGhl
cmUncmUgdHdvIHR5cGVzIG9mIG1lbW9yeSBtYXBwaW5nOgoKYSkgbWVtb3J5IHRhYmxlLCBzZXR1
cCBieSB1c2Vyc3BhY2UgdGhyb3VnaCBWSE9TVF9TRVRfTUVNX1RBQkxFLCB0aGUgCndob2xlIG1h
cHBpbmcgaXMgdXBkYXRlZCBpbiB0aGlzIHdheQpiKSBJT1RMQiBBUEksIGluY3JlbWVudGFsbHkg
ZG9uZSBieSB1c2Vyc3BhY2UgdGhyb3VnaCB2aG9zdCBtZXNzYWdlIAooSU9UTEJfVVBEQVRFL0lP
VExCX0lOVkFMSURBVEUpCgpUaGUgY3VycmVudCBkZXNpZ24gaXM6CgotIFJldXNlIFZIT1NUX1NF
VF9NRU1fVEFCTEUsIGFuZCBmb3IgdHlwZSAxKSwgd2UgY2FuIGNob29zZSB0byBzZW5kIApkaWZm
cyB0aHJvdWdoIElPTU1VIEFQSSBvciBmbHVzaCBhbGwgdGhlIG1hcHBpbmdzIHRoZW4gbWFwIG5l
dyBvbmVzLiBGb3IgCnR5cGUgMiksIGp1c3Qgc2VuZCB0aGUgd2hvbGUgbWFwcGluZyB0aHJvdWdo
IHNldF9tYXAoKQotIFJldXNlIHZob3N0IElPVExCLCBzbyBmb3IgdHlwZSAxKSwgc2ltcGx5IGZv
cndhcmQgdXBkYXRlL2ludmFsaWRhdGUgCnJlcXVlc3QgdmlhIElPTU1VIEFQSSwgZm9yIHR5cGUg
MiksIHNlbmQgSU9UTEIgdG8gdkRQQSBkZXZpY2UgZHJpdmVyIHZpYSAKc2V0X21hcCgpLCBkZXZp
Y2UgZHJpdmVyIG1heSBjaG9vc2UgdG8gc2VuZCBkaWZmcyBvciByZWJ1aWxkIGFsbCBtYXBwaW5n
IAphdCB0aGVpciB3aWxsCgpUZWNobmljYWxseSB3ZSBjYW4gdXNlIHZob3N0IElPVExCIEFQSSAo
bWFwL3VtYXApIGZvciBidWlsZGluZyAKVkhPU1RfU0VUX01FTV9UQUJMRSwgYnV0IHRvIGF2b2lk
IGRldmljZSB0byBwcm9jZXNzIHRoZSBlYWNoIHJlcXVlc3QsIGl0IApsb29rcyB0byBtZSB3ZSBu
ZWVkIG5ldyBVQVBJIHdoaWNoIHNlZW1zIHN1YiBvcHRpbWFsLgoKV2hhdCdzIHlvdSB0aG91Z2h0
PwoKVGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
