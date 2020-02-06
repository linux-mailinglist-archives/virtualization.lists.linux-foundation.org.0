Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B63153D28
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 04:05:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 121848558A;
	Thu,  6 Feb 2020 03:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOMG_m2cKFxH; Thu,  6 Feb 2020 03:05:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0149A85BCF;
	Thu,  6 Feb 2020 03:05:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5EBAC1D88;
	Thu,  6 Feb 2020 03:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12925C08A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC1352043C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P+IlUg0FQIRa
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:05:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 8A48C203D8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580958299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZmilr4tlxmSPvlBFFTM+7GZjr7g54JZ6ybjetf90JQ=;
 b=bBclXKWHqE0FmkFxHVOKEBkvMde4umICaVTEnS4TtKSyTx4Q5Me/DgH8V4l33o8+IWgqyy
 /DmV8YAn/VPxiK+dvQ9QpFtzeETE8Monq6YzFOZaLX3/j5UXSSWQ8JZLEis/U7Yg3VE4Jo
 fiWKJz95vox2rkS2JqqiPDGbNmaZYw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-X0XgH6JIPi2zxsSJw37NDg-1; Wed, 05 Feb 2020 22:04:58 -0500
X-MC-Unique: X0XgH6JIPi2zxsSJw37NDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 784FA2F60;
 Thu,  6 Feb 2020 03:04:55 +0000 (UTC)
Received: from [10.72.13.85] (ovpn-13-85.pek2.redhat.com [10.72.13.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3A4D5C1B2;
 Thu,  6 Feb 2020 03:04:42 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: Shahaf Shuler <shahafs@mellanox.com>, Tiwei Bie <tiwei.bie@intel.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <AM0PR0502MB3795AD42233D69F350402A8AC3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8af7b9b1-f721-8d1c-dd1c-403424ee20b9@redhat.com>
Date: Thu, 6 Feb 2020 11:04:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB3795AD42233D69F350402A8AC3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Jiri Pirko <jiri@mellanox.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Jason Gunthorpe <jgg@mellanox.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 Parav Pandit <parav@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

Ck9uIDIwMjAvMi81IOS4i+WNiDU6MzAsIFNoYWhhZiBTaHVsZXIgd3JvdGU6Cj4gV2VkbmVzZGF5
LCBGZWJydWFyeSA1LCAyMDIwIDk6NTAgQU0sIEphc29uIFdhbmc6Cj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHZob3N0OiBpbnRyb2R1Y2UgdkRQQSBiYXNlZCBiYWNrZW5kCj4+IE9uIDIwMjAvMi81
IOS4i+WNiDM6MTUsIFNoYWhhZiBTaHVsZXIgd3JvdGU6Cj4+PiBXZWRuZXNkYXksIEZlYnJ1YXJ5
IDUsIDIwMjAgNDowMyBBTSwgVGl3ZWkgQmllOgo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZo
b3N0OiBpbnRyb2R1Y2UgdkRQQSBiYXNlZCBiYWNrZW5kCj4+Pj4KPj4+PiBPbiBUdWUsIEZlYiAw
NCwgMjAyMCBhdCAxMTozMDoxMUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiBPbiAy
MDIwLzEvMzEg5LiK5Y2IMTE6MzYsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyBhIHZEUEEgYmFzZWQgdmhvc3QgYmFja2VuZC4gVGhpcyBiYWNrZW5kIGlzCj4+
Pj4+PiBidWlsdCBvbiB0b3Agb2YgdGhlIHNhbWUgaW50ZXJmYWNlIGRlZmluZWQgaW4gdmlydGlv
LXZEUEEgYW5kCj4+Pj4+PiBwcm92aWRlcyBhIGdlbmVyaWMgdmhvc3QgaW50ZXJmYWNlIGZvciB1
c2Vyc3BhY2UgdG8gYWNjZWxlcmF0ZSB0aGUKPj4+Pj4+IHZpcnRpbyBkZXZpY2VzIGluIGd1ZXN0
Lgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgYmFja2VuZCBpcyBpbXBsZW1lbnRlZCBhcyBhIHZEUEEgZGV2
aWNlIGRyaXZlciBvbiB0b3Agb2YgdGhlCj4+Pj4+PiBzYW1lIG9wcyB1c2VkIGluIHZpcnRpby12
RFBBLiBJdCB3aWxsIGNyZWF0ZSBjaGFyIGRldmljZSBlbnRyeQo+Pj4+Pj4gbmFtZWQgdmhvc3Qt
dmRwYS8kdmRwYV9kZXZpY2VfaW5kZXggZm9yIHVzZXJzcGFjZSB0byB1c2UuCj4+IFVzZXJzcGFj
ZQo+Pj4+Pj4gY2FuIHVzZSB2aG9zdCBpb2N0bHMgb24gdG9wIG9mIHRoaXMgY2hhciBkZXZpY2Ug
dG8gc2V0dXAgdGhlIGJhY2tlbmQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVGl3ZWkg
QmllIDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+Pj4gWy4uLl0KPj4+Cj4+Pj4+PiArc3RhdGljIGxv
bmcgdmhvc3RfdmRwYV9kb19kbWFfbWFwcGluZyhzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikgewo+Pj4+
Pj4gKwkvKiBUT0RPOiBmaXggdGhpcyAqLwo+Pj4+PiBCZWZvcmUgdHJ5aW5nIHRvIGRvIHRoaXMg
aXQgbG9va3MgdG8gbWUgd2UgbmVlZCB0aGUgZm9sbG93aW5nIGR1cmluZwo+Pj4+PiB0aGUgcHJv
YmUKPj4+Pj4KPj4+Pj4gMSkgaWYgc2V0X21hcCgpIGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIHZE
UEEgZGV2aWNlIHByb2JlIHRoZSBJT01NVQo+Pj4+PiB0aGF0IGlzIHN1cHBvcnRlZCBieSB0aGUg
dkRQQSBkZXZpY2UKPj4+Pj4gMikgYWxsb2NhdGUgSU9NTVUgZG9tYWluCj4+Pj4+Cj4+Pj4+IEFu
ZCB0aGVuOgo+Pj4+Pgo+Pj4+PiAzKSBwaW4gcGFnZXMgdGhyb3VnaCBHVVAgYW5kIGRvIHByb3Bl
ciBhY2NvdW50aW5nCj4+Pj4+IDQpIHN0b3JlIEdQQS0+SFBBIG1hcHBpbmcgaW4gdGhlIHVtZW0K
Pj4+Pj4gNSkgZ2VuZXJhdGUgZGlmZnMgb2YgbWVtb3J5IHRhYmxlIGFuZCB1c2luZyBJT01NVSBB
UEkgdG8gc2V0dXAgdGhlCj4+Pj4+IGRtYSBtYXBwaW5nIGluIHRoaXMgbWV0aG9kCj4+Pj4+Cj4+
Pj4+IEZvciAxKSwgSSdtIG5vdCBzdXJlIHBhcmVudCBpcyBzdWZmaWNpZW50IGZvciB0byBkb2lu
ZyB0aGlzIG9yIG5lZWQKPj4+Pj4gdG8gaW50cm9kdWNlIG5ldyBBUEkgbGlrZSBpb21tdV9kZXZp
Y2UgaW4gbWRldi4KPj4+PiBBZ3JlZS4gV2UgbWF5IGFsc28gbmVlZCB0byBpbnRyb2R1Y2Ugc29t
ZXRoaW5nIGxpa2UgdGhlIGlvbW11X2RldmljZS4KPj4+Pgo+Pj4gV291bGQgaXQgYmUgYmV0dGVy
IGZvciB0aGUgbWFwL3VtbmFwIGxvZ2ljIHRvIGhhcHBlbiBpbnNpZGUgZWFjaCBkZXZpY2UgPwo+
Pj4gRGV2aWNlcyB0aGF0IG5lZWRzIHRoZSBJT01NVSB3aWxsIGNhbGwgaW9tbXUgQVBJcyBmcm9t
IGluc2lkZSB0aGUgZHJpdmVyCj4+IGNhbGxiYWNrLgo+Pgo+Pgo+PiBUZWNobmljYWxseSwgdGhp
cyBjYW4gd29yay4gQnV0IGlmIGl0IGNhbiBiZSBkb25lIGJ5IHZob3N0LXZwZGEgaXQgd2lsbCBt
YWtlIHRoZQo+PiB2RFBBIGRyaXZlciBtb3JlIGNvbXBhY3QgYW5kIGVhc2llciB0byBiZSBpbXBs
ZW1lbnRlZC4KPiBOZWVkIHRvIHNlZSB0aGUgbGF5ZXJpbmcgb2Ygc3VjaCBwcm9wb3NhbCBidXQg
YW0gbm90IHN1cmUuCj4gVmhvc3QtdmRwYSBpcyBnZW5lcmljIGZyYW1ld29yaywgd2hpbGUgdGhl
IERNQSBtYXBwaW5nIGlzIHZlbmRvciBzcGVjaWZpYy4KPiBNYXliZSB2aG9zdC12ZHBhIGNhbiBo
YXZlIHNvbWUgc2hhcmVkIGNvZGUgbmVlZGVkIHRvIG9wZXJhdGUgb24gaW9tbXUsIHNvIGRyaXZl
cnMgY2FuIHJlLXVzZSBpdC4gIHRvIG1lIGl0IHNlZW1zIHNpbXBsZXIgdGhhbiBleHBvc2luZyBh
IG5ldyBpb21tdSBkZXZpY2UuCgoKSSB0aGluayB5b3UgbWVhbiBvbi1jaGlwIElPTU1VIGhlcmUu
IEZvciBzaGFyZWQgY29kZSwgSSBndWVzcyB0aGlzIG9ubHkgCnRoaW5nIHRoYXQgY291bGQgYmUg
c2hhcmVkIGlzIHRoZSBtYXBwaW5nIChyYnRyZWUpIGFuZCBzb21lIGhlbHBlcnMuIE9yIAppcyB0
aGVyZSBhbnkgb3RoZXIgaW4geW91ciBtaW5kPwoKCj4+Cj4+PiBEZXZpY2VzIHRoYXQgaGFzIG90
aGVyIHdheXMgdG8gZG8gdGhlIERNQSBtYXBwaW5nIHdpbGwgY2FsbCB0aGUKPj4gcHJvcHJpZXRh
cnkgQVBJcy4KPj4KPj4KPj4gVG8gY29uZmlybSwgZG8geW91IHByZWZlcjoKPj4KPj4gMSkgbWFw
L3VubWFwCj4gSXQgaXMgbm90IG9ubHkgdGhhdC4gQUZBSVIgdGhlcmUgYWxzbyBmbHVzaCBhbmQg
aW52YWxpZGF0ZSBjYWxscywgcmlnaHQ/CgoKdW5tYXAgd2lsbCBhY2NlcHQgYSByYW5nZSBzbyBp
dCBpdCBjYW4gZG8gZmx1c2ggYW5kIGludmFsaWRhdGUuCgoKPgo+PiBvcgo+Pgo+PiAyKSBwYXNz
IGFsbCBtYXBzIGF0IG9uZSB0aW1lPwo+IFRvIG1lIHRoaXMgc2VlbXMgbW9yZSBzdHJhaWdodCBm
b3J3YXJkLgo+IEl0IGlzIGNvcnJlY3QgdGhhdCB1bmRlciBob3RwbHVnIGFuZCBsYXJnZSBudW1i
ZXIgb2YgbWVtb3J5IHNlZ21lbnRzIHRoZSBkcml2ZXIgd2lsbCBuZWVkIHRvIHVuZGVyc3RhbmQg
dGhlIGRpZmYgKG9yIG5vdCBhbmQganVzdCByZWxvYWQgdGhlIG5ldyBjb25maWd1cmF0aW9uKS4g
SG93ZXZlciwgbXkgYXNzdW1wdGlvbiBoZXJlIGlzIHRoYXQgbWVtb3J5IGhvdHBsdWcgaXMgaGVh
dnkgZmxvdyBhbnl3YXksIGFuZCB0aGUgZHJpdmVyIGV4dHJhIGN5Y2xlcyB3aWxsIG5vdCBiZSB0
aGF0IHZpc2libGUKCgpZZXMsIGFuZCB2aG9zdCBjYW4gcHJvdmlkZSBoZWxwZXJzIHRvIGdlbmVy
YXRlIHRoZSBkaWZmcy4KClRoYW5rcwoKCj4KPj4gVGhhbmtzCj4+Cj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
