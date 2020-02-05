Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5898152737
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 08:51:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48E1D8168A;
	Wed,  5 Feb 2020 07:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdUdoCxKy4zH; Wed,  5 Feb 2020 07:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 895A9861A7;
	Wed,  5 Feb 2020 07:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 688C9C0174;
	Wed,  5 Feb 2020 07:51:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80369C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 680CD20111
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rr+q4mtiYZ0r
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 8CE131FFC1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580889061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQLo/Dujelpm0XrehqZm62mCFlSLkIvoH/a0QZl9D2s=;
 b=Q99F0HvUrenx935z7sUnwylWNIvHETMvhBqHcQfA5QSeLFP0CivbbCxdWAu86vlMc8HtFB
 if9r9jUFq5/rKmxd6ngkh/5fUCitC6fr8vRDslnrMJqvA7I4uZH+3H+Eb7XcVFb73Dzzql
 lArdzsLIhSUG19TjBT6RGs9f34c7wP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-GBTihHV3M3uxJzsoVeentg-1; Wed, 05 Feb 2020 02:50:59 -0500
X-MC-Unique: GBTihHV3M3uxJzsoVeentg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826968010EF;
 Wed,  5 Feb 2020 07:50:56 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8648C7792A;
 Wed,  5 Feb 2020 07:50:23 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: Shahaf Shuler <shahafs@mellanox.com>, Tiwei Bie <tiwei.bie@intel.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
Date: Wed, 5 Feb 2020 15:50:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Ck9uIDIwMjAvMi81IOS4i+WNiDM6MTUsIFNoYWhhZiBTaHVsZXIgd3JvdGU6Cj4gV2VkbmVzZGF5
LCBGZWJydWFyeSA1LCAyMDIwIDQ6MDMgQU0sIFRpd2VpIEJpZToKPj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdmhvc3Q6IGludHJvZHVjZSB2RFBBIGJhc2VkIGJhY2tlbmQKPj4KPj4gT24gVHVlLCBG
ZWIgMDQsIDIwMjAgYXQgMTE6MzA6MTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9u
IDIwMjAvMS8zMSDkuIrljYgxMTozNiwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyBhIHZEUEEgYmFzZWQgdmhvc3QgYmFja2VuZC4gVGhpcyBiYWNrZW5kIGlzCj4+
Pj4gYnVpbHQgb24gdG9wIG9mIHRoZSBzYW1lIGludGVyZmFjZSBkZWZpbmVkIGluIHZpcnRpby12
RFBBIGFuZAo+Pj4+IHByb3ZpZGVzIGEgZ2VuZXJpYyB2aG9zdCBpbnRlcmZhY2UgZm9yIHVzZXJz
cGFjZSB0byBhY2NlbGVyYXRlIHRoZQo+Pj4+IHZpcnRpbyBkZXZpY2VzIGluIGd1ZXN0Lgo+Pj4+
Cj4+Pj4gVGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgdkRQQSBkZXZpY2UgZHJpdmVy
IG9uIHRvcCBvZiB0aGUKPj4+PiBzYW1lIG9wcyB1c2VkIGluIHZpcnRpby12RFBBLiBJdCB3aWxs
IGNyZWF0ZSBjaGFyIGRldmljZSBlbnRyeSBuYW1lZAo+Pj4+IHZob3N0LXZkcGEvJHZkcGFfZGV2
aWNlX2luZGV4IGZvciB1c2Vyc3BhY2UgdG8gdXNlLiBVc2Vyc3BhY2UgY2FuCj4+Pj4gdXNlIHZo
b3N0IGlvY3RscyBvbiB0b3Agb2YgdGhpcyBjaGFyIGRldmljZSB0byBzZXR1cCB0aGUgYmFja2Vu
ZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRpd2VpIEJpZSA8dGl3ZWkuYmllQGludGVsLmNv
bT4KPiBbLi4uXQo+Cj4+Pj4gK3N0YXRpYyBsb25nIHZob3N0X3ZkcGFfZG9fZG1hX21hcHBpbmco
c3RydWN0IHZob3N0X3ZkcGEgKnYpIHsKPj4+PiArCS8qIFRPRE86IGZpeCB0aGlzICovCj4+Pgo+
Pj4gQmVmb3JlIHRyeWluZyB0byBkbyB0aGlzIGl0IGxvb2tzIHRvIG1lIHdlIG5lZWQgdGhlIGZv
bGxvd2luZyBkdXJpbmcKPj4+IHRoZSBwcm9iZQo+Pj4KPj4+IDEpIGlmIHNldF9tYXAoKSBpcyBu
b3Qgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZSBwcm9iZSB0aGUgSU9NTVUKPj4+IHRoYXQg
aXMgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZQo+Pj4gMikgYWxsb2NhdGUgSU9NTVUgZG9t
YWluCj4+Pgo+Pj4gQW5kIHRoZW46Cj4+Pgo+Pj4gMykgcGluIHBhZ2VzIHRocm91Z2ggR1VQIGFu
ZCBkbyBwcm9wZXIgYWNjb3VudGluZwo+Pj4gNCkgc3RvcmUgR1BBLT5IUEEgbWFwcGluZyBpbiB0
aGUgdW1lbQo+Pj4gNSkgZ2VuZXJhdGUgZGlmZnMgb2YgbWVtb3J5IHRhYmxlIGFuZCB1c2luZyBJ
T01NVSBBUEkgdG8gc2V0dXAgdGhlIGRtYQo+Pj4gbWFwcGluZyBpbiB0aGlzIG1ldGhvZAo+Pj4K
Pj4+IEZvciAxKSwgSSdtIG5vdCBzdXJlIHBhcmVudCBpcyBzdWZmaWNpZW50IGZvciB0byBkb2lu
ZyB0aGlzIG9yIG5lZWQgdG8KPj4+IGludHJvZHVjZSBuZXcgQVBJIGxpa2UgaW9tbXVfZGV2aWNl
IGluIG1kZXYuCj4+IEFncmVlLiBXZSBtYXkgYWxzbyBuZWVkIHRvIGludHJvZHVjZSBzb21ldGhp
bmcgbGlrZSB0aGUgaW9tbXVfZGV2aWNlLgo+Pgo+IFdvdWxkIGl0IGJlIGJldHRlciBmb3IgdGhl
IG1hcC91bW5hcCBsb2dpYyB0byBoYXBwZW4gaW5zaWRlIGVhY2ggZGV2aWNlID8KPiBEZXZpY2Vz
IHRoYXQgbmVlZHMgdGhlIElPTU1VIHdpbGwgY2FsbCBpb21tdSBBUElzIGZyb20gaW5zaWRlIHRo
ZSBkcml2ZXIgY2FsbGJhY2suCgoKVGVjaG5pY2FsbHksIHRoaXMgY2FuIHdvcmsuIEJ1dCBpZiBp
dCBjYW4gYmUgZG9uZSBieSB2aG9zdC12cGRhIGl0IHdpbGwgCm1ha2UgdGhlIHZEUEEgZHJpdmVy
IG1vcmUgY29tcGFjdCBhbmQgZWFzaWVyIHRvIGJlIGltcGxlbWVudGVkLgoKCj4gRGV2aWNlcyB0
aGF0IGhhcyBvdGhlciB3YXlzIHRvIGRvIHRoZSBETUEgbWFwcGluZyB3aWxsIGNhbGwgdGhlIHBy
b3ByaWV0YXJ5IEFQSXMuCgoKVG8gY29uZmlybSwgZG8geW91IHByZWZlcjoKCjEpIG1hcC91bm1h
cAoKb3IKCjIpIHBhc3MgYWxsIG1hcHMgYXQgb25lIHRpbWU/CgpUaGFua3MKCgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
