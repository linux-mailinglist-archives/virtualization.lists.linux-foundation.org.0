Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76336153D49
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 04:10:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A05CD87952;
	Thu,  6 Feb 2020 03:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o+tsUh6VNX2x; Thu,  6 Feb 2020 03:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1716787919;
	Thu,  6 Feb 2020 03:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC8FC1D88;
	Thu,  6 Feb 2020 03:10:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73CA2C08A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 594E985C0B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f35eL8cHX8-r
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:10:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BEC586292
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580958603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1TczXbUHB/A1ibG/DqEE8S0FtOzhIhbj3hz2btGu3s=;
 b=KU7FRVlHo5RI4RPTb4LiQ6cjsxX5XWoFuoDzUGJLHOqyGJwuCookEZfahYqxuhLzhbeWyJ
 5nHk6rw8i4IVH/nLGWeIuhdNBHLCETc+gLiQroV+xWmgnMx+stYvsIYtbuWOXogHkND9DE
 SZw3WeZGTb0E9b229CKOxtKVigYzv6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-i1UTngbRMf-R7FlrhRD3mg-1; Wed, 05 Feb 2020 22:10:01 -0500
X-MC-Unique: i1UTngbRMf-R7FlrhRD3mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA228018A7;
 Thu,  6 Feb 2020 03:09:58 +0000 (UTC)
Received: from [10.72.13.85] (ovpn-13-85.pek2.redhat.com [10.72.13.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 400941A7E3;
 Thu,  6 Feb 2020 03:09:43 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: "Michael S. Tsirkin" <mst@redhat.com>, Shahaf Shuler <shahafs@mellanox.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <AM0PR0502MB3795AD42233D69F350402A8AC3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200205053129-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <80b4a5f9-8cc0-326a-a133-07a0ae3c7909@redhat.com>
Date: Thu, 6 Feb 2020 11:09:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205053129-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jiri Pirko <jiri@mellanox.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
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
 "lulu@redhat.com" <lulu@redhat.com>,
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

Ck9uIDIwMjAvMi81IOS4i+WNiDY6MzMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAwOTozMDoxNEFNICswMDAwLCBTaGFoYWYgU2h1bGVyIHdyb3Rl
Ogo+PiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUsIDIwMjAgOTo1MCBBTSwgSmFzb24gV2FuZzoKPj4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZob3N0OiBpbnRyb2R1Y2UgdkRQQSBiYXNlZCBiYWNrZW5k
Cj4+PiBPbiAyMDIwLzIvNSDkuIvljYgzOjE1LCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+Pj4+IFdl
ZG5lc2RheSwgRmVicnVhcnkgNSwgMjAyMCA0OjAzIEFNLCBUaXdlaSBCaWU6Cj4+Pj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIHZob3N0OiBpbnRyb2R1Y2UgdkRQQSBiYXNlZCBiYWNrZW5kCj4+Pj4+
Cj4+Pj4+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjExQU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4+Pj4+PiBPbiAyMDIwLzEvMzEg5LiK5Y2IMTE6MzYsIFRpd2VpIEJpZSB3cm90
ZToKPj4+Pj4+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSB2RFBBIGJhc2VkIHZob3N0IGJhY2tl
bmQuIFRoaXMgYmFja2VuZCBpcwo+Pj4+Pj4+IGJ1aWx0IG9uIHRvcCBvZiB0aGUgc2FtZSBpbnRl
cmZhY2UgZGVmaW5lZCBpbiB2aXJ0aW8tdkRQQSBhbmQKPj4+Pj4+PiBwcm92aWRlcyBhIGdlbmVy
aWMgdmhvc3QgaW50ZXJmYWNlIGZvciB1c2Vyc3BhY2UgdG8gYWNjZWxlcmF0ZSB0aGUKPj4+Pj4+
PiB2aXJ0aW8gZGV2aWNlcyBpbiBndWVzdC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgYmFja2VuZCBp
cyBpbXBsZW1lbnRlZCBhcyBhIHZEUEEgZGV2aWNlIGRyaXZlciBvbiB0b3Agb2YgdGhlCj4+Pj4+
Pj4gc2FtZSBvcHMgdXNlZCBpbiB2aXJ0aW8tdkRQQS4gSXQgd2lsbCBjcmVhdGUgY2hhciBkZXZp
Y2UgZW50cnkKPj4+Pj4+PiBuYW1lZCB2aG9zdC12ZHBhLyR2ZHBhX2RldmljZV9pbmRleCBmb3Ig
dXNlcnNwYWNlIHRvIHVzZS4KPj4+IFVzZXJzcGFjZQo+Pj4+Pj4+IGNhbiB1c2Ugdmhvc3QgaW9j
dGxzIG9uIHRvcCBvZiB0aGlzIGNoYXIgZGV2aWNlIHRvIHNldHVwIHRoZSBiYWNrZW5kLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVGl3ZWkgQmllPHRpd2VpLmJpZUBpbnRlbC5jb20+
Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+Pj4+ICtzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX2RvX2RtYV9t
YXBwaW5nKHN0cnVjdCB2aG9zdF92ZHBhICp2KSB7Cj4+Pj4+Pj4gKwkvKiBUT0RPOiBmaXggdGhp
cyAqLwo+Pj4+Pj4gQmVmb3JlIHRyeWluZyB0byBkbyB0aGlzIGl0IGxvb2tzIHRvIG1lIHdlIG5l
ZWQgdGhlIGZvbGxvd2luZyBkdXJpbmcKPj4+Pj4+IHRoZSBwcm9iZQo+Pj4+Pj4KPj4+Pj4+IDEp
IGlmIHNldF9tYXAoKSBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZSBwcm9iZSB0
aGUgSU9NTVUKPj4+Pj4+IHRoYXQgaXMgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZQo+Pj4+
Pj4gMikgYWxsb2NhdGUgSU9NTVUgZG9tYWluCj4+Pj4+Pgo+Pj4+Pj4gQW5kIHRoZW46Cj4+Pj4+
Pgo+Pj4+Pj4gMykgcGluIHBhZ2VzIHRocm91Z2ggR1VQIGFuZCBkbyBwcm9wZXIgYWNjb3VudGlu
Zwo+Pj4+Pj4gNCkgc3RvcmUgR1BBLT5IUEEgbWFwcGluZyBpbiB0aGUgdW1lbQo+Pj4+Pj4gNSkg
Z2VuZXJhdGUgZGlmZnMgb2YgbWVtb3J5IHRhYmxlIGFuZCB1c2luZyBJT01NVSBBUEkgdG8gc2V0
dXAgdGhlCj4+Pj4+PiBkbWEgbWFwcGluZyBpbiB0aGlzIG1ldGhvZAo+Pj4+Pj4KPj4+Pj4+IEZv
ciAxKSwgSSdtIG5vdCBzdXJlIHBhcmVudCBpcyBzdWZmaWNpZW50IGZvciB0byBkb2luZyB0aGlz
IG9yIG5lZWQKPj4+Pj4+IHRvIGludHJvZHVjZSBuZXcgQVBJIGxpa2UgaW9tbXVfZGV2aWNlIGlu
IG1kZXYuCj4+Pj4+IEFncmVlLiBXZSBtYXkgYWxzbyBuZWVkIHRvIGludHJvZHVjZSBzb21ldGhp
bmcgbGlrZSB0aGUgaW9tbXVfZGV2aWNlLgo+Pj4+Pgo+Pj4+IFdvdWxkIGl0IGJlIGJldHRlciBm
b3IgdGhlIG1hcC91bW5hcCBsb2dpYyB0byBoYXBwZW4gaW5zaWRlIGVhY2ggZGV2aWNlID8KPj4+
PiBEZXZpY2VzIHRoYXQgbmVlZHMgdGhlIElPTU1VIHdpbGwgY2FsbCBpb21tdSBBUElzIGZyb20g
aW5zaWRlIHRoZSBkcml2ZXIKPj4+IGNhbGxiYWNrLgo+Pj4KPj4+Cj4+PiBUZWNobmljYWxseSwg
dGhpcyBjYW4gd29yay4gQnV0IGlmIGl0IGNhbiBiZSBkb25lIGJ5IHZob3N0LXZwZGEgaXQgd2ls
bCBtYWtlIHRoZQo+Pj4gdkRQQSBkcml2ZXIgbW9yZSBjb21wYWN0IGFuZCBlYXNpZXIgdG8gYmUg
aW1wbGVtZW50ZWQuCj4+IE5lZWQgdG8gc2VlIHRoZSBsYXllcmluZyBvZiBzdWNoIHByb3Bvc2Fs
IGJ1dCBhbSBub3Qgc3VyZS4KPj4gVmhvc3QtdmRwYSBpcyBnZW5lcmljIGZyYW1ld29yaywgd2hp
bGUgdGhlIERNQSBtYXBwaW5nIGlzIHZlbmRvciBzcGVjaWZpYy4KPj4gTWF5YmUgdmhvc3QtdmRw
YSBjYW4gaGF2ZSBzb21lIHNoYXJlZCBjb2RlIG5lZWRlZCB0byBvcGVyYXRlIG9uIGlvbW11LCBz
byBkcml2ZXJzIGNhbiByZS11c2UgaXQuICB0byBtZSBpdCBzZWVtcyBzaW1wbGVyIHRoYW4gZXhw
b3NpbmcgYSBuZXcgaW9tbXUgZGV2aWNlLgo+Pgo+Pj4+IERldmljZXMgdGhhdCBoYXMgb3RoZXIg
d2F5cyB0byBkbyB0aGUgRE1BIG1hcHBpbmcgd2lsbCBjYWxsIHRoZQo+Pj4gcHJvcHJpZXRhcnkg
QVBJcy4KPj4+Cj4+Pgo+Pj4gVG8gY29uZmlybSwgZG8geW91IHByZWZlcjoKPj4+Cj4+PiAxKSBt
YXAvdW5tYXAKPj4gSXQgaXMgbm90IG9ubHkgdGhhdC4gQUZBSVIgdGhlcmUgYWxzbyBmbHVzaCBh
bmQgaW52YWxpZGF0ZSBjYWxscywgcmlnaHQ/Cj4+Cj4+PiBvcgo+Pj4KPj4+IDIpIHBhc3MgYWxs
IG1hcHMgYXQgb25lIHRpbWU/Cj4+IFRvIG1lIHRoaXMgc2VlbXMgbW9yZSBzdHJhaWdodCBmb3J3
YXJkLgo+PiBJdCBpcyBjb3JyZWN0IHRoYXQgdW5kZXIgaG90cGx1ZyBhbmQgbGFyZ2UgbnVtYmVy
IG9mIG1lbW9yeSBzZWdtZW50cwo+PiB0aGUgZHJpdmVyIHdpbGwgbmVlZCB0byB1bmRlcnN0YW5k
IHRoZSBkaWZmIChvciBub3QgYW5kIGp1c3QgcmVsb2FkCj4+IHRoZSBuZXcgY29uZmlndXJhdGlv
bikuCj4+IEhvd2V2ZXIsIG15IGFzc3VtcHRpb24gaGVyZSBpcyB0aGF0IG1lbW9yeQo+PiBob3Rw
bHVnIGlzIGhlYXZ5IGZsb3cgYW55d2F5LCBhbmQgdGhlIGRyaXZlciBleHRyYSBjeWNsZXMgd2ls
bCBub3QgYmUKPj4gdGhhdCB2aXNpYmxlCj4gSSB0aGluayB3ZSBjYW4ganVzdCBhbGxvdyBib3Ro
LCBhZnRlciBhbGwgdmhvc3QgYWxyZWFkeSBoYXMgYm90aCBpbnRlcmZhY2VzIC4uLgo+IFdlIGp1
c3QgbmVlZCBhIGZsYWcgdGhhdCB0ZWxscyB1c2Vyc3BhY2Ugd2hldGhlciBpdCBuZWVkcyB0bwo+
IHVwZGF0ZSBhbGwgbWFwcyBhZ2dyZXNzaXZlbHkgb3IgY2FuIHdhaXQgZm9yIGEgZmF1bHQuCgoK
SXQgbG9va3MgdG8gbWUgc3VjaCBmbGFnIGlzIG5vdCBhIG11c3QgYW5kIHdlIGNhbiBpbnRyb2R1
Y2UgaXQgbGF0ZXIgCndoZW4gZGV2aWNlIHN1cHBvcnQgcGFnZSBmYXVsdC4KClRoYW5rcwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
