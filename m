Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A154E153D3A
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 04:08:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C2D9E207A2;
	Thu,  6 Feb 2020 03:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mu7mtn6ZjZgw; Thu,  6 Feb 2020 03:08:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6113204FB;
	Thu,  6 Feb 2020 03:08:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FD0CC08A4;
	Thu,  6 Feb 2020 03:08:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB6CC08A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 65E79204A8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMKM01BHvozY
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:08:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 12AF9203D8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 03:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580958498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ofht4rTASrG2snsF2udWXLpOAWyq8ZOtG/BsyPM5Yj4=;
 b=DfArRHpeiitC+7vYkkFUGizFqN0yjhjgtOufVxW9kTUXbCB/Om5SjKbw6MIc5udWzDfsjo
 39fgfqEZwnYNlVM0YuY8rYXZLgzFWkYdEOXa9CiW4fBTL5T6l7yT5DrxAE50/l78kRInPV
 2X07vFi2LJ0rLLX3n/vNDtlAvi3x6ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-X7uWwfe4On2D9cXt6zrN6w-1; Wed, 05 Feb 2020 22:08:17 -0500
X-MC-Unique: X7uWwfe4On2D9cXt6zrN6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8894A107BAA4;
 Thu,  6 Feb 2020 03:08:14 +0000 (UTC)
Received: from [10.72.13.85] (ovpn-13-85.pek2.redhat.com [10.72.13.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 361F060C18;
 Thu,  6 Feb 2020 03:07:56 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <20200205042259-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7519cde6-2c79-6867-d72d-05be73d947a6@redhat.com>
Date: Thu, 6 Feb 2020 11:07:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205042259-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMi81IOS4i+WNiDU6MjMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAwMzo1MDoxNFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzIvNSDDpMK44oC5w6XCjcuGMzoxNSwgU2hhaGFmIFNodWxlciB3cm90ZToKPj4+
IFdlZG5lc2RheSwgRmVicnVhcnkgNSwgMjAyMCA0OjAzIEFNLCBUaXdlaSBCaWU6Cj4+Pj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gdmhvc3Q6IGludHJvZHVjZSB2RFBBIGJhc2VkIGJhY2tlbmQKPj4+
Pgo+Pj4+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjExQU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4+Pj4+IE9uIDIwMjAvMS8zMSDDpMK4xaDDpcKNy4YxMTozNiwgVGl3ZWkgQmll
IHdyb3RlOgo+Pj4+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgdkRQQSBiYXNlZCB2aG9zdCBi
YWNrZW5kLiBUaGlzIGJhY2tlbmQgaXMKPj4+Pj4+IGJ1aWx0IG9uIHRvcCBvZiB0aGUgc2FtZSBp
bnRlcmZhY2UgZGVmaW5lZCBpbiB2aXJ0aW8tdkRQQSBhbmQKPj4+Pj4+IHByb3ZpZGVzIGEgZ2Vu
ZXJpYyB2aG9zdCBpbnRlcmZhY2UgZm9yIHVzZXJzcGFjZSB0byBhY2NlbGVyYXRlIHRoZQo+Pj4+
Pj4gdmlydGlvIGRldmljZXMgaW4gZ3Vlc3QuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBiYWNrZW5kIGlz
IGltcGxlbWVudGVkIGFzIGEgdkRQQSBkZXZpY2UgZHJpdmVyIG9uIHRvcCBvZiB0aGUKPj4+Pj4+
IHNhbWUgb3BzIHVzZWQgaW4gdmlydGlvLXZEUEEuIEl0IHdpbGwgY3JlYXRlIGNoYXIgZGV2aWNl
IGVudHJ5IG5hbWVkCj4+Pj4+PiB2aG9zdC12ZHBhLyR2ZHBhX2RldmljZV9pbmRleCBmb3IgdXNl
cnNwYWNlIHRvIHVzZS4gVXNlcnNwYWNlIGNhbgo+Pj4+Pj4gdXNlIHZob3N0IGlvY3RscyBvbiB0
b3Agb2YgdGhpcyBjaGFyIGRldmljZSB0byBzZXR1cCB0aGUgYmFja2VuZC4KPj4+Pj4+Cj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBUaXdlaSBCaWU8dGl3ZWkuYmllQGludGVsLmNvbT4KPj4+IFsuLi5d
Cj4+Pgo+Pj4+Pj4gK3N0YXRpYyBsb25nIHZob3N0X3ZkcGFfZG9fZG1hX21hcHBpbmcoc3RydWN0
IHZob3N0X3ZkcGEgKnYpIHsKPj4+Pj4+ICsJLyogVE9ETzogZml4IHRoaXMgKi8KPj4+Pj4gQmVm
b3JlIHRyeWluZyB0byBkbyB0aGlzIGl0IGxvb2tzIHRvIG1lIHdlIG5lZWQgdGhlIGZvbGxvd2lu
ZyBkdXJpbmcKPj4+Pj4gdGhlIHByb2JlCj4+Pj4+Cj4+Pj4+IDEpIGlmIHNldF9tYXAoKSBpcyBu
b3Qgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZSBwcm9iZSB0aGUgSU9NTVUKPj4+Pj4gdGhh
dCBpcyBzdXBwb3J0ZWQgYnkgdGhlIHZEUEEgZGV2aWNlCj4+Pj4+IDIpIGFsbG9jYXRlIElPTU1V
IGRvbWFpbgo+Pj4+Pgo+Pj4+PiBBbmQgdGhlbjoKPj4+Pj4KPj4+Pj4gMykgcGluIHBhZ2VzIHRo
cm91Z2ggR1VQIGFuZCBkbyBwcm9wZXIgYWNjb3VudGluZwo+Pj4+PiA0KSBzdG9yZSBHUEEtPkhQ
QSBtYXBwaW5nIGluIHRoZSB1bWVtCj4+Pj4+IDUpIGdlbmVyYXRlIGRpZmZzIG9mIG1lbW9yeSB0
YWJsZSBhbmQgdXNpbmcgSU9NTVUgQVBJIHRvIHNldHVwIHRoZSBkbWEKPj4+Pj4gbWFwcGluZyBp
biB0aGlzIG1ldGhvZAo+Pj4+Pgo+Pj4+PiBGb3IgMSksIEknbSBub3Qgc3VyZSBwYXJlbnQgaXMg
c3VmZmljaWVudCBmb3IgdG8gZG9pbmcgdGhpcyBvciBuZWVkIHRvCj4+Pj4+IGludHJvZHVjZSBu
ZXcgQVBJIGxpa2UgaW9tbXVfZGV2aWNlIGluIG1kZXYuCj4+Pj4gQWdyZWUuIFdlIG1heSBhbHNv
IG5lZWQgdG8gaW50cm9kdWNlIHNvbWV0aGluZyBsaWtlIHRoZSBpb21tdV9kZXZpY2UuCj4+Pj4K
Pj4+IFdvdWxkIGl0IGJlIGJldHRlciBmb3IgdGhlIG1hcC91bW5hcCBsb2dpYyB0byBoYXBwZW4g
aW5zaWRlIGVhY2ggZGV2aWNlID8KPj4+IERldmljZXMgdGhhdCBuZWVkcyB0aGUgSU9NTVUgd2ls
bCBjYWxsIGlvbW11IEFQSXMgZnJvbSBpbnNpZGUgdGhlIGRyaXZlciBjYWxsYmFjay4KPj4gVGVj
aG5pY2FsbHksIHRoaXMgY2FuIHdvcmsuIEJ1dCBpZiBpdCBjYW4gYmUgZG9uZSBieSB2aG9zdC12
cGRhIGl0IHdpbGwgbWFrZQo+PiB0aGUgdkRQQSBkcml2ZXIgbW9yZSBjb21wYWN0IGFuZCBlYXNp
ZXIgdG8gYmUgaW1wbGVtZW50ZWQuCj4+Cj4+Cj4+PiBEZXZpY2VzIHRoYXQgaGFzIG90aGVyIHdh
eXMgdG8gZG8gdGhlIERNQSBtYXBwaW5nIHdpbGwgY2FsbCB0aGUgcHJvcHJpZXRhcnkgQVBJcy4K
Pj4gVG8gY29uZmlybSwgZG8geW91IHByZWZlcjoKPj4KPj4gMSkgbWFwL3VubWFwCj4+Cj4+IG9y
Cj4+Cj4+IDIpIHBhc3MgYWxsIG1hcHMgYXQgb25lIHRpbWU/Cj4+Cj4+IFRoYW5rcwo+Pgo+Pgo+
IEkgbWVhbiB3ZSByZWFsbHkgYWxyZWFkeSBoYXZlIGJvdGggcmlnaHQ/IEFUTSAxIGlzIHVzZWQg
d2l0aCBhbiBpb21tdQo+IGFuZCAyIHdpdGhvdXQuIEkgZ3Vlc3Mgd2UgY2FuIGFsc28gaGF2ZSBk
cml2ZXJzIGFzayBmb3IgZWl0aGVyIG9yIGJvdGgKPiAuLi4KCgpZZXMsIHRoYXQgbG9va3MgYmV0
dGVyLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
