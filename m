Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCE152727
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 08:43:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32C092078C;
	Wed,  5 Feb 2020 07:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvAS7Vw2tSPx; Wed,  5 Feb 2020 07:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8D28020789;
	Wed,  5 Feb 2020 07:43:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 605BFC1D85;
	Wed,  5 Feb 2020 07:43:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAA71C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9D2CE86123
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePIgYbbPqWmM
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 36DCD86100
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580888587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVkTU7RxWQeDuyaiNw1PJ1Buqj0ixoLqIGNz+I+HOCU=;
 b=Jh65Sw0fJtosA1SV2BqSHAX36c1p4z//FU4JIxTd8aVjLusNt9M7rAj0RGGjMjtKzpHpfx
 BbDUzLQGSicnWnKIhQn2BFLyht1+HyqiKeatb0e05Cu3R3h2k6GLmAlugr47xvHbeQMzQl
 jJ2is3sJpBnh4HL2kIhfiVKCZ+QTEYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-A2kebyjbOju90ImM3QHuvA-1; Wed, 05 Feb 2020 02:43:06 -0500
X-MC-Unique: A2kebyjbOju90ImM3QHuvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488F3107B79B;
 Wed,  5 Feb 2020 07:43:03 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 707207792A;
 Wed,  5 Feb 2020 07:42:22 +0000 (UTC)
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
 <2dd43fb5-6f02-2dcc-5c27-9f7419ef72fc@redhat.com>
 <20200205020547-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4e947390-da7c-52bc-c427-b1d82cc425ad@redhat.com>
Date: Wed, 5 Feb 2020 15:42:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205020547-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Ck9uIDIwMjAvMi81IOS4i+WNiDM6MTYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAwMjo0OTozMVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzIvNSDkuIvljYgyOjMwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIEZlYiAwNSwgMjAyMCBhdCAwMTo1MDoyOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvMi81IOS4i+WNiDE6MzEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MTI6MjFBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+Pj4+IE9uIDIwMjAvMi81IOS4iuWNiDEwOjA1LCBUaXdlaSBCaWUgd3JvdGU6
Cj4+Pj4+Pj4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+Pj4gT24gMjAyMC8yLzQg5LiL5Y2IMjowMSwgTWljaGFlbCBTLiBU
c2lya2luIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMTE6MzA6MTFB
TSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+Pj4+PiA1KSBnZW5lcmF0ZSBkaWZmcyBv
ZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1VIEFQSSB0byBzZXR1cCB0aGUgZG1hCj4+Pj4+
Pj4+Pj4gbWFwcGluZyBpbiB0aGlzIG1ldGhvZAo+Pj4+Pj4+Pj4gRnJhbmtseSBJIHRoaW5rIHRo
YXQncyBhIGJ1bmNoIG9mIHdvcmsuIFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJmYWNlPwo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4gU3VyZSwgc28gdGhhdCBiYXNpY2FsbHkgVkhPU1RfSU9UTEJfVVBEQVRF
L0lOVkFMSURBVEUgSSB0aGluaz8KPj4+Pj4+PiBEbyB5b3UgbWVhbiB3ZSBsZXQgdXNlcnNwYWNl
IHRvIG9ubHkgdXNlIFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElEQVRFCj4+Pj4+Pj4gdG8gZG8g
dGhlIERNQSBtYXBwaW5nIGluIHZob3N0LXZkcGEgY2FzZT8gV2hlbiB2SU9NTVUgaXNuJ3QgYXZh
aWxhYmxlLAo+Pj4+Pj4+IHVzZXJzcGFjZSB3aWxsIHNldCBtc2ctPmlvdmEgdG8gR1BBLCBvdGhl
cndpc2UgdXNlcnNwYWNlIHdpbGwgc2V0Cj4+Pj4+Pj4gbXNnLT5pb3ZhIHRvIEdJT1ZBLCBhbmQg
dmhvc3QtdmRwYSBtb2R1bGUgd2lsbCBnZXQgSFBBIGZyb20gbXNnLT51YWRkcj8KPj4+Pj4+Pgo+
Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+PiBUaXdlaQo+Pj4+Pj4gSSB0aGluayBzby4gTWljaGFlbCwg
ZG8geW91IHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2U/Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzCj4+Pj4+
IHRvIG1ha2Ugc3VyZSwgY291bGQgeW91IHBvc3QgdGhlIHN1Z2dlc3RlZCBhcmd1bWVudCBmb3Jt
YXQgZm9yCj4+Pj4+IHRoZXNlIGlvY3Rscz8KPj4+Pj4KPj4+PiBJdCdzIHRoZSBleGlzdGVkIHVh
cGk6Cj4+Pj4KPj4+PiAvKiBubyBhbGlnbm1lbnQgcmVxdWlyZW1lbnQgKi8KPj4+PiBzdHJ1Y3Qg
dmhvc3RfaW90bGJfbXNnIHsKPj4+PiAgIMKgwqDCoCBfX3U2NCBpb3ZhOwo+Pj4+ICAgwqDCoMKg
IF9fdTY0IHNpemU7Cj4+Pj4gICDCoMKgwqAgX191NjQgdWFkZHI7Cj4+Pj4gI2RlZmluZSBWSE9T
VF9BQ0NFU1NfUk/CoMKgwqDCoMKgIDB4MQo+Pj4+ICNkZWZpbmUgVkhPU1RfQUNDRVNTX1dPwqDC
oMKgwqDCoCAweDIKPj4+PiAjZGVmaW5lIFZIT1NUX0FDQ0VTU19SV8KgwqDCoMKgwqAgMHgzCj4+
Pj4gICDCoMKgwqAgX191OCBwZXJtOwo+Pj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfTUlTU8KgwqDC
oMKgwqDCoMKgwqDCoMKgIDEKPj4+PiAjZGVmaW5lIFZIT1NUX0lPVExCX1VQREFURcKgwqDCoMKg
wqDCoMKgwqAgMgo+Pj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfSU5WQUxJREFURcKgwqDCoMKgIDMK
Pj4+PiAjZGVmaW5lIFZIT1NUX0lPVExCX0FDQ0VTU19GQUlMwqDCoMKgIDQKPj4+PiAgIMKgwqDC
oCBfX3U4IHR5cGU7Cj4+Pj4gfTsKPj4+Pgo+Pj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfTVNHIDB4
MQo+Pj4+ICNkZWZpbmUgVkhPU1RfSU9UTEJfTVNHX1YyIDB4Mgo+Pj4+Cj4+Pj4gc3RydWN0IHZo
b3N0X21zZyB7Cj4+Pj4gICDCoMKgwqAgaW50IHR5cGU7Cj4+Pj4gICDCoMKgwqAgdW5pb24gewo+
Pj4+ICAgwqDCoMKgIMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNnIGlvdGxiOwo+Pj4+ICAg
wqDCoMKgIMKgwqDCoCBfX3U4IHBhZGRpbmdbNjRdOwo+Pj4+ICAgwqDCoMKgIH07Cj4+Pj4gfTsK
Pj4+Pgo+Pj4+IHN0cnVjdCB2aG9zdF9tc2dfdjIgewo+Pj4+ICAgwqDCoMKgIF9fdTMyIHR5cGU7
Cj4+Pj4gICDCoMKgwqAgX191MzIgcmVzZXJ2ZWQ7Cj4+Pj4gICDCoMKgwqAgdW5pb24gewo+Pj4+
ICAgwqDCoMKgIMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNnIGlvdGxiOwo+Pj4+ICAgwqDC
oMKgIMKgwqDCoCBfX3U4IHBhZGRpbmdbNjRdOwo+Pj4+ICAgwqDCoMKgIH07Cj4+Pj4gfTsKPj4+
IE9oIG9rLiAgU28gd2l0aCBhIHJlYWwgZGV2aWNlLCBJIHN1c3BlY3Qgd2UgZG8gbm90IHdhbnQg
dG8gd2FpdCBmb3IgZWFjaAo+Pj4gY2hhbmdlIHRvIGJlIHByb2Nlc3NlZCBieSBkZXZpY2UgY29t
cGxldGVseSwgc28gd2UgbWlnaHQgd2FudCBhbiBhc3luY2hyb25vdXMgdmFyaWFudAo+Pj4gYW5k
IHRoZW4gc29tZSBraW5kIG9mIGZsdXNoIHRoYXQgdGVsbHMgZGV2aWNlICJ5b3UgYmV0dGVyIGFw
cGx5IHRoZXNlIG5vdyIuCj4+Cj4+IExldCBtZSBleHBsYWluOgo+Pgo+PiBUaGVyZSBhcmUgdHdv
IHR5cGVzIG9mIGRldmljZXM6Cj4+Cj4+IDEpIGRldmljZSB3aXRob3V0IG9uLWNoaXAgSU9NTVUs
IERNQSB3YXMgZG9uZSB2aWEgSU9NTVUgQVBJIHdoaWNoIG9ubHkKPj4gc3VwcG9ydCBpbmNyZW1l
bnRhbCBtYXAvdW5tYXAKPiBNb3N0IElPTU1VcyBoYXZlIHF1ZXVlcyBub3dkYXlzIHRob3VnaC4g
V2hldGhlciBBUElzIHdpdGhpbiBrZXJuZWwKPiBleHBvc2UgdGhhdCBtYXR0ZXJzIGJ1dCB3ZSBh
cmUgYmV0dGVyIG9mZiBvbiBlbXVsYXRpbmcKPiBoYXJkd2FyZSBub3Qgc3BlY2lmaWMgZ3Vlc3Qg
YmVoYXZpb3VyLgoKCkxhc3QgdGltZSBJIGNoZWNrZWQgSW50ZWwgSU9NTVUgZHJpdmVyLCBJIHNl
ZSB0aGUgYXN5bmMgUUkgaXMgbm90IHVzZWQgCnRoZXJlLiBBbmQgSSdtIG5vdCBzdXJlIGhvdyBx
dWV1ZSB3aWxsIGhlbHAgbXVjaCBoZXJlLiBRZW11IHN0aWxsIG5lZWQgCnRvIHdhaXQgZm9yIGFs
bCB0aGUgRE1BIGlzIHNldHVwIHRvIGxldCBndWVzdCB3b3JrLgoKCj4KPj4gMikgZGV2aWNlIHdp
dGggb24tY2hpcCBJT01NVSwgRE1BIGNvdWxkIGJlIGRvbmUgYnkgZGV2aWNlIGRyaXZlciBpdHNl
bGYsIGFuZAo+PiB3ZSBjb3VsZCBjaG9vc2UgdG8gcGFzcyB0aGUgd2hvbGUgbWFwcGluZ3MgdG8g
dGhlIGRyaXZlciBhdCBvbmUgdGltZSB0aHJvdWdoCj4+IHZEUEEgYnVzIG9wZXJhdGlvbiAoc2V0
X21hcCkKPj4KPj4gRm9yIHZob3N0LXZwZGEsIHRoZXJlJ3JlIHR3byB0eXBlcyBvZiBtZW1vcnkg
bWFwcGluZzoKPj4KPj4gYSkgbWVtb3J5IHRhYmxlLCBzZXR1cCBieSB1c2Vyc3BhY2UgdGhyb3Vn
aCBWSE9TVF9TRVRfTUVNX1RBQkxFLCB0aGUgd2hvbGUKPj4gbWFwcGluZyBpcyB1cGRhdGVkIGlu
IHRoaXMgd2F5Cj4+IGIpIElPVExCIEFQSSwgaW5jcmVtZW50YWxseSBkb25lIGJ5IHVzZXJzcGFj
ZSB0aHJvdWdoIHZob3N0IG1lc3NhZ2UKPj4gKElPVExCX1VQREFURS9JT1RMQl9JTlZBTElEQVRF
KQo+Pgo+PiBUaGUgY3VycmVudCBkZXNpZ24gaXM6Cj4+Cj4+IC0gUmV1c2UgVkhPU1RfU0VUX01F
TV9UQUJMRSwgYW5kIGZvciB0eXBlIDEpLCB3ZSBjYW4gY2hvb3NlIHRvIHNlbmQgZGlmZnMKPj4g
dGhyb3VnaCBJT01NVSBBUEkgb3IgZmx1c2ggYWxsIHRoZSBtYXBwaW5ncyB0aGVuIG1hcCBuZXcg
b25lcy4gRm9yIHR5cGUgMiksCj4+IGp1c3Qgc2VuZCB0aGUgd2hvbGUgbWFwcGluZyB0aHJvdWdo
IHNldF9tYXAoKQo+IEkga25vdyB0aGF0IGF0IGxlYXN0IGZvciBSRE1BIGJhc2VkIHRoaW5ncywg
eW91IGNhbid0IGNoYW5nZQo+IGEgbWFwcGluZyBpZiBpdCdzIGFjdGl2ZS4gU28gZHJpdmVycyB3
aWxsIG5lZWQgdG8gZmlndXJlIG91dCB0aGUKPiBkaWZmZXJlbmNlcyB3aGljaCBqdXN0IGxvb2tz
IHVnbHk6IHVzZXJzcGFjZSBrbm93cyB3aGF0Cj4gaXQgd2FzIGNoYW5naW5nIChyZWFsbHkganVz
dCBhZGRpbmcvcmVtb3Zpbmcgc29tZSBndWVzdCBtZW1vcnkpLgoKClR3byBtZXRob2RzOgoKMSkg
dXNpbmcgSU9UTEIgbWVzc2FnZSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURQoyKSBsZXQg
dmhvc3QgZGlmZmVycyBmcm9tIHR3byBtZW1vcnkgdGFibGVzIHdoaWNoIHNob3VsZCBub3QgYmUg
dG9vIGhhcmQgCihjb21wYXJlIHR3byByYiB0cmVlcykKCgo+Cj4KPgo+PiAtIFJldXNlIHZob3N0
IElPVExCLCBzbyBmb3IgdHlwZSAxKSwgc2ltcGx5IGZvcndhcmQgdXBkYXRlL2ludmFsaWRhdGUK
Pj4gcmVxdWVzdCB2aWEgSU9NTVUgQVBJLCBmb3IgdHlwZSAyKSwgc2VuZCBJT1RMQiB0byB2RFBB
IGRldmljZSBkcml2ZXIgdmlhCj4+IHNldF9tYXAoKSwgZGV2aWNlIGRyaXZlciBtYXkgY2hvb3Nl
IHRvIHNlbmQgZGlmZnMgb3IgcmVidWlsZCBhbGwgbWFwcGluZyBhdAo+PiB0aGVpciB3aWxsCj4+
Cj4+IFRlY2huaWNhbGx5IHdlIGNhbiB1c2Ugdmhvc3QgSU9UTEIgQVBJIChtYXAvdW1hcCkgZm9y
IGJ1aWxkaW5nCj4+IFZIT1NUX1NFVF9NRU1fVEFCTEUsIGJ1dCB0byBhdm9pZCBkZXZpY2UgdG8g
cHJvY2VzcyB0aGUgZWFjaCByZXF1ZXN0LCBpdAo+PiBsb29rcyB0byBtZSB3ZSBuZWVkIG5ldyBV
QVBJIHdoaWNoIHNlZW1zIHN1YiBvcHRpbWFsLgo+Pgo+PiBXaGF0J3MgeW91IHRob3VnaHQ/Cj4+
Cj4+IFRoYW5rcwo+IEkgc3VzcGVjdCB3ZSBjYW4ndCBjb21wbGV0ZWx5IGF2b2lkIGEgbmV3IFVB
UEkuCgoKQUZBSUssIG1lbW9yeSB0YWJsZSB1c3VhbGx5IGNvbnRhaW4ganVzdCBmZXcgZW50cmll
cywgdGhlIHBlcmZvcm1hbmNlIApjb3N0IHNob3VsZCBiZSBmaW5lLiAoQXQgbGVhc3Qgc2hvdWxk
IGJlIHRoZSBzYW1lIGFzIHRoZSBjYXNlIG9mIFZGSU8pLgoKU28gaW4gcWVtdSwgc2ltcGx5IGhv
b2tpbmcgYWRkX3JlZ2lvbi9yZW1vdmVfcmVnaW9uIHRvIApWSE9TVF9JT1RMQl9VUERBVEUvVkhP
U1RfSU9UTEJfSU5WQUxJREFURSBzaG91bGQgd29yaz8KCklmIHdlIGludHJvZHVjZSBBUEkgbGlr
ZSB5b3UgcHJvcG9zZWQgcHJldmlvdXNseSAobWVtb3J5IGxpc3RlbmVyIHN0eWxlKToKCmJlZ2lu
CmFkZApyZW1vdmUKY29tbWl0CgpJIHN1c3BlY3QgaXQgd2lsbCBiZSB0b28gaGVhdndlaWdodCBm
b3IgdGhlIGNhc2Ugb2YgdklPTU1VIGFuZCBmb3IgdGhlIApkcml2ZXIgdGhhdCB3YW50IHRvIGJ1
aWxkIG5ldyBtYXBwaW5nLCB3ZSBuZWVkIGFkZG5vcCBldGMuLi4KClRoYW5rcwoKCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
