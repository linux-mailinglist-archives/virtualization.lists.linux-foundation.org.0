Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDA51424AC
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 09:01:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 18601203AD;
	Mon, 20 Jan 2020 08:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0+jH6-CSRSk; Mon, 20 Jan 2020 08:01:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4186320408;
	Mon, 20 Jan 2020 08:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21540C0174;
	Mon, 20 Jan 2020 08:01:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB3AEC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B878181E93
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vwzouYwe9d8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:01:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8B4A5869FE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579507295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iz/qjvodYnEnB5eFL79FzYhZwFSrGU3EpRLL9cwpXcI=;
 b=EURITZ+SqOjV5q7tLanZ7k6cj3rvCr7qPBFeWkFZ7XF0NeUWzqDey1P9JYPhqooprN6qg6
 DG4Es+o7q7Z5QtYZ2Pb0BbyUi8g9PVA+eQlYO6u7UjbtwgoN99sw4lVJ5A/8HCnaGlhJv3
 5ASmLblzD+5ajZwzWH35AFFxwTfTQDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-gYKPL3i1Oa25naBeSRDvIw-1; Mon, 20 Jan 2020 03:01:33 -0500
X-MC-Unique: gYKPL3i1Oa25naBeSRDvIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA35A10054E3;
 Mon, 20 Jan 2020 08:01:30 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B046510013A7;
 Mon, 20 Jan 2020 08:01:11 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <20200116154658.GJ20978@mellanox.com>
 <aea2bff8-82c8-2c0f-19ee-e86db73e199f@redhat.com>
 <20200117141021.GW20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cd5477b1-7e41-aeeb-c592-09b2ec81566a@redhat.com>
Date: Mon, 20 Jan 2020 16:01:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117141021.GW20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "kuba@kernel.org" <kuba@kernel.org>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMDoxMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZy
aSwgSmFuIDE3LCAyMDIwIGF0IDA1OjMyOjM5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IE9uIDIwMjAvMS8xNiDkuIvljYgxMTo0NywgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24g
VGh1LCBKYW4gMTYsIDIwMjAgYXQgMDg6NDI6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4+PiBUaGlzIHBhdGNoIGltcGxlbWVudHMgYSBzb2Z0d2FyZSB2RFBBIG5ldHdvcmtpbmcgZGV2
aWNlLiBUaGUgZGF0YXBhdGgKPj4+PiBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naCBhbmQg
d29ya3F1ZXVlLiBUaGUgZGV2aWNlIGhhcyBhbiBvbi1jaGlwCj4+Pj4gSU9NTVUgd2hpY2ggdHJh
bnNsYXRlcyBJT1ZBIHRvIFBBLiBGb3Iga2VybmVsIHZpcnRpbyBkcml2ZXJzLCB2RFBBCj4+Pj4g
c2ltdWxhdG9yIGRyaXZlciBwcm92aWRlcyBkbWFfb3BzLiBGb3Igdmhvc3QgZHJpZXJzLCBzZXRf
bWFwKCkgbWV0aG9kcwo+Pj4+IG9mIHZkcGFfY29uZmlnX29wcyBpcyBpbXBsZW1lbnRlZCB0byBh
Y2NlcHQgbWFwcGluZ3MgZnJvbSB2aG9zdC4KPj4+Pgo+Pj4+IEEgc3lzZnMgYmFzZWQgbWFuYWdl
bWVudCBpbnRlcmZhY2UgaXMgaW1wbGVtZW50ZWQsIGRldmljZXMgYXJlCj4+Pj4gY3JlYXRlZCBh
bmQgcmVtb3ZlZCB0aHJvdWdoOgo+Pj4+Cj4+Pj4gL3N5cy9kZXZpY2VzL3ZpcnR1YWwvdmRwYV9z
aW11bGF0b3IvbmV0ZGV2L3tjcmVhdGV8cmVtb3ZlfQo+Pj4gVGhpcyBpcyB2ZXJ5IGdyb3NzLCBj
cmVhdGluZyBhIGNsYXNzIGp1c3QgdG8gZ2V0IGEgY3JlYXRlL3JlbW92ZSBhbmQKPj4+IHRoZW4g
bm90IHVzaW5nIHRoZSBjbGFzcyBmb3IgYW55dGhpbmcgZWxzZT8gWXVrLgo+Pgo+PiBJdCBpbmNs
dWRlcyBtb3JlIGluZm9ybWF0aW9uLCBlLmcgdGhlIGRldmljZXMgYW5kIHRoZSBsaW5rIGZyb20g
dmRwYV9zaW0KPj4gZGV2aWNlIGFuZCB2ZHBhIGRldmljZS4KPiBJIGZlZWwgbGlrZSByZWdhcmRs
ZXNzIG9mIGhvdyB0aGUgZGV2aWNlIGlzIGNyZWF0ZWQgdGhlcmUgc2hvdWxkIGJlIGEKPiBjb25z
aXN0ZW50IHZpcnRpbyBjZW50cmljIG1hbmFnZW1lbnQgZm9yIHBvc3QtY3JlYXRpb24gdGFza3Ms
IHN1Y2ggYXMKPiBpbnRyb3NwZWN0aW9uIGFuZCBkZXN0cnVjdGlvbgoKClJpZ2h0LCBhY3R1YWxs
eSwgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBkb25lIGJ5IHN5c2ZzIGFzIHdlbGwu
IApIYXZpbmcgYW4gaW50ZXJtZWRpYXRlIHN0ZXBzIGFzICJhY3RpdmF0ZSIgYW5kIGludHJvZHVj
aW5nIGF0dHJpYnV0ZXMgCmZvciBwb3N0LWNyZWF0aW9uIHRhc2tzLgoKCj4KPiBBIHZpcnRvIHN0
cnVjdCBkZXZpY2Ugc2hvdWxkIGFscmVhZHkgaGF2ZSBiYWNrIHBvaW50ZXJzIHRvIGl0J3MgcGFy
ZW50Cj4gZGV2aWNlLCB3aGljaCBzaG91bGQgYmUgZW5vdWdoIHRvIGRpc2NvdmVyIHRoZSB2ZHBh
X3NpbSwgbm9uZSBvZiB0aGUKPiBleHRyYSBzeXNmcyBtdW5naW5nIHNob3VsZCBiZSBuZWVkZWQu
Cj4KPj4+PiBOZXRsaW5rIGJhc2VkIGxpZmVjeWNsZSBtYW5hZ2VtZW50IGNvdWxkIGJlIGltcGxl
bWVudGVkIGZvciB2RFBBCj4+Pj4gc2ltdWxhdG9yIGFzIHdlbGwuCj4+PiBUaGlzIGlzIGp1c3Qg
YmVnZ2luZyBmb3IgYSBuZXRsaW5rIGJhc2VkIGFwcHJvYWNoLgo+Pj4KPj4+IENlcnRhaW5seSBu
ZXRsaW5rIGRyaXZlbiByZW1vdmFsIHNob3VsZCBiZSBhbiBhZ3JlZWFibGUgc3RhbmRhcmQgZm9y
Cj4+PiBhbGwgZGV2aWNlcywgSSB0aGluay4KPj4KPj4gV2VsbCwgSSB0aGluayBQYXJhdiBoYWQg
c29tZSBwcm9wb3NhbHMgZHVyaW5nIHRoZSBkaXNjdXNzaW9uIG9mIG1kZXYKPj4gYXBwcm9hY2gu
IEJ1dCBJJ20gbm90IHN1cmUgaWYgaGUgaGFkIGFueSBSRkMgY29kZXMgZm9yIG1lIHRvIGludGVn
cmF0ZSBpdAo+PiBpbnRvIHZkcGFzaW0uCj4+Cj4+IE9yIGRvIHlvdSB3YW50IG1lIHRvIHByb3Bv
c2UgdGhlIG5ldGxpbmsgQVBJPyBJZiB5ZXMsIHdvdWxkIHlvdSBwcmVmZXIgdG8gYQo+PiBuZXcg
dmlydGlvIGRlZGljYXRlZCBvbmUgb3IgYmUgYSBzdWJzZXQgb2YgZGV2bGluaz8KPiBXZWxsLCBs
ZXRzIHNlZSB3aGF0IGZlZWQgYmFjayBQYXJhdiBoYXMKPgo+IEphc29uCgoKT2suCgpUaGFua3MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
