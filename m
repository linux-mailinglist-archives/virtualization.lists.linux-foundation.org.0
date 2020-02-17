Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF817160A39
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 07:08:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA4128586F;
	Mon, 17 Feb 2020 06:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwiaR5y8E5ib; Mon, 17 Feb 2020 06:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1247786CF0;
	Mon, 17 Feb 2020 06:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD789C013E;
	Mon, 17 Feb 2020 06:08:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBCBDC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A98CA20382
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9A5BntJT2Kbi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0D36A2011B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581919712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhhQHDShnd+KbggLHB4NhxmgV88eVkpntzyZ9x/aC1Y=;
 b=OQf4Ri/jr2s5lAJCiPhj6s1Lx2JIGCdxCzLIYqWvt0mzXLr48zMUD7PkFr7tDdeRcOhEP+
 hSgVFyOIm0dqntnJKMmT4PCTVEBetDLBCPZQpJ98PpFesZhidQQ6X8oxODW5BQvNqq9ZOB
 AZU75P4+B8jVaDAj1tCdNJ/qFohoyCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-AdituZYSOqeZ40wGvdePjQ-1; Mon, 17 Feb 2020 01:08:26 -0500
X-MC-Unique: AdituZYSOqeZ40wGvdePjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77805800D50;
 Mon, 17 Feb 2020 06:08:23 +0000 (UTC)
Received: from [10.72.12.250] (ovpn-12-250.pek2.redhat.com [10.72.12.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0783787B12;
 Mon, 17 Feb 2020 06:08:04 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
 <20200214135232.GB4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
Date: Mon, 17 Feb 2020 14:08:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200214135232.GB4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xNCDkuIvljYg5OjUyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJp
LCBGZWIgMTQsIDIwMjAgYXQgMTE6MjM6MjdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPgo+
Pj4+IFRob3VnaCBhbGwgdkRQQSBkZXZpY2VzIGhhdmUgdGhlIHNhbWUgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlLCBidXQgdGhlCj4+Pj4gc2VtYW50aWMgaXMgZGlmZmVyZW50LiBTbyBpdCBsb29rcyB0
byBtZSB0aGF0IHVzZSBidXMgY29tcGxpZXMgd2hhdAo+Pj4+IGNsYXNzLnJzdCBzYWlkOgo+Pj4+
Cj4+Pj4gIgo+Pj4+Cj4+Pj4gRWFjaCBkZXZpY2UgY2xhc3MgZGVmaW5lcyBhIHNldCBvZiBzZW1h
bnRpY3MgYW5kIGEgcHJvZ3JhbW1pbmcgaW50ZXJmYWNlCj4+Pj4gdGhhdCBkZXZpY2VzIG9mIHRo
YXQgY2xhc3MgYWRoZXJlIHRvLiBEZXZpY2UgZHJpdmVycyBhcmUgdGhlCj4+Pj4gaW1wbGVtZW50
YXRpb24gb2YgdGhhdCBwcm9ncmFtbWluZyBpbnRlcmZhY2UgZm9yIGEgcGFydGljdWxhciBkZXZp
Y2Ugb24KPj4+PiBhIHBhcnRpY3VsYXIgYnVzLgo+Pj4+Cj4+Pj4gIgo+Pj4gSGVyZSB3ZSBhcmUg
dGFsa2luZyBhYm91dCB0aGUgL2Rldi9YWCBub2RlIHRoYXQgcHJvdmlkZXMgdGhlCj4+PiBwcm9n
cmFtbWluZyBpbnRlcmZhY2UuCj4+Cj4+IEknbSBjb25mdXNlZCBoZXJlLCBhcmUgeW91IHN1Z2dl
c3RpbmcgdG8gdXNlIGNsYXNzIHRvIGNyZWF0ZSBjaGFyIGRldmljZSBpbgo+PiB2aG9zdC12ZHBh
PyBUaGF0J3MgZmluZSBidXQgdGhlIGNvbW1lbnQgc2hvdWxkIGdvIGZvciB2aG9zdC12ZHBhIHBh
dGNoLgo+IENlcnRhaW5seSB5ZXMsIHNvbWV0aGluZyBjcmVhdGluZyBtYW55IGNoYXIgZGV2cyBz
aG91bGQgaGF2ZSBhCj4gY2xhc3MuIFRoYXQgbWFrZXMgdGhlIHN5c2ZzIHdvcmsgYXMgZXhwZWN0
ZWQKPgo+IEkgc3VwcG9zZSB0aGlzIGlzIHZob3N0IHVzZXI/CgoKQWN0dWFsbHkgbm90LgoKVmhv
c3QtdXNlciBpcyB0aGUgdmhvc3QgcHJvdG9jb2wgdGhhdCBpcyB1c2VkIGZvciB1c2Vyc3BhY2Ug
dmhvc3QgCmJhY2tlbmQgKHVzdWFsbHkgdGhvdWdoIGEgVU5JWCBkb21haW4gc29ja2V0KS4KCldo
YXQncyBiZWluZyBkb25lIGluIHRoZSB2aG9zdC12cGRhIGlzIGEgbmV3IHR5cGUgb2YgdGhlIHZo
b3N0IGluIGtlcm5lbC4KCgo+IEkgYWRtaXQgSSBkb24ndCByZWFsbHkgc2VlIGhvdyB0aGlzCj4g
dmhvc3Qgc3R1ZmYgd29ya3MsIGFsbCBJIHNlZSBhcmUgZ2xvYmFsIG1pc2MgZGV2aWNlcz8gVmVy
eSB1bnVzdWFsIGZvcgo+IGEgbmV3IHN1YnN5c3RlbSB0byBiZSB1c2luZyBnbG9iYWwgbWlzYyBk
ZXZpY2VzLi4KCgpWaG9zdCBpcyBub3QgYSBzdWJzeXN0ZW0gcmlnaHQgbm93LCBlLmcgZm9yIGl0
J3MgbmV0IGltcGxlbWVudGF0aW9uLCBpdCAKd2FzIGxvb3NlbHkgY291cGxlZCB3aXRoIGEgc29j
a2V0LgoKSSB0aG91Z2h0IHlvdSB3ZXJlIGNvcGllZCBpbiB0aGUgcGF0Y2ggWzFdLCBtYXliZSB3
ZSBjYW4gbW92ZSB2aG9zdCAKcmVsYXRlZCBkaXNjdXNzaW9uIHRoZXJlIHRvIGF2b2lkIGNvbmZ1
c2lvbi4KClsxXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvODExMjEwLwoKCj4KPiBJIHdvdWxk
IGhhdmUgZXhwZWN0ZWQgdGhhdCBhIHNpbmdsZSBWRFBBIGRldmljZSBjb21lcyBvdXQgYXMgYSBz
aW5nbGUKPiBjaGFyIGRldiBsaW5rZWQgdG8gb25seSB0aGF0IFZEUEEgZGV2aWNlLgo+Cj4+PiBB
bGwgdGhlIHZkcGEgZGV2aWNlcyBoYXZlIHRoZSBzYW1lIGJhc2ljCj4+PiBjaGFyZGV2IGludGVy
ZmFjZSBhbmQgZGlzY292ZXIgYW55IHNlbWFudGljIHZhcmlhdGlvbnMgJ2luIGJhbmQnCj4+IFRo
YXQncyBub3QgdHJ1ZSwgY2hhciBpbnRlcmZhY2UgaXMgb25seSB1c2VkIGZvciB2aG9zdC4gS2Vy
bmVsIHZpcnRpbyBkcml2ZXIKPj4gZG9lcyBub3QgbmVlZCBjaGFyIGRldiBidXQgYSBkZXZpY2Ug
b24gdGhlIHZpcnRpbyBidXMuCj4gT2theSwgdGhpcyBpcyBmaW5lLCBidXQgd2h5IGRvIHlvdSBu
ZWVkIHR3byBidXNzZXMgdG8gYWNjb21wbGlzaCB0aGlzPwoKClRoZSByZWFzb25zIGFyZToKCi0g
dkRQQSBvcHMgaXMgZGVzaWduZWQgdG8gYmUgZnVuY3Rpb25hbCBhcyBhIHNvZnR3YXJlIGFzc2lz
dGVkIHRyYW5zcG9ydCAKKGNvbnRyb2wgcGF0aCkgZm9yIHZpcnRpbywgc28gaXQncyBmaXQgZm9y
IGEgbmV3IHRyYW5zcG9ydCBkcml2ZXIgYnV0IApub3QgZGlyZWN0bHkgaW50byB2aXJ0aW8gYnVz
LiBWT1AgdXNlIHNpbWlsYXIgZGVzaWduLgotIHZpcnRpbyBidXMgaXMgZGVzaWduZWQgZm9yIGtl
cm5lbCBkcml2ZXJzIGJ1dCBub3QgdXNlcnNwYWNlLCBhbmQgaXQgCmNhbiBub3QgYmUgZWFzaWx5
IGV4dGVuZGVkIHRvIHN1cHBvcnQgdXNlcnNwYWNlIGRyaXZlciBidXQgcmVxdWlyZXMgc29tZSAK
bWFqb3IgcmVmYWN0b3JpbmcuIEUuZyB0aGUgdmlydGlvIGJ1cyBvcGVyYXRpb25zIHJlcXVpcmVz
IHRoZSB2aXJ0cXVldWUgCnRvIGJlIGFsbG9jYXRlZCBieSB0aGUgdHJhbnNwb3J0IGRyaXZlci4K
ClNvIGl0J3MgY2hlYXBlciBhbmQgc2ltcGxlciB0byBpbnRyb2R1Y2UgYSBuZXcgYnVzIGluc3Rl
YWQgb2YgCnJlZmFjdG9yaW5nIGEgd2VsbCBrbm93biBidXMgYW5kIEFQSSB3aGVyZSBicnVuY2hl
cyBvZiBkcml2ZXJzIGFuZCAKZGV2aWNlcyBoYWQgYmVlbiBpbXBsZW1lbnRlZCBmb3IgeWVhcnMu
CgoKPgo+IFNob3VsZG4ndCB0aGUgJ3N0cnVjdCB2aXJpdG9fZGV2aWNlJyBiZSB0aGUgcGx1ZyBp
biBwb2ludCBmb3IgSFcKPiBkcml2ZXJzIEkgd2FzIHRhbGtpbmcgYWJvdXQgLSBhbmQgZnJvbSB0
aGVyZSBhIHZob3N0LXVzZXIgY2FuIGNvbm5lY3QKPiB0byB0aGUgc3RydWN0IHZpcnRpb19kZXZp
Y2UgdG8gZ2l2ZSBpdCBhIGNoYXIgZGV2IG9yIGEga2VybmVsIGRyaXZlcgo+IGNhbiBjb25uZWN0
IHRvIGxpbmsgaXQgdG8gYW5vdGhlciBzdWJzeXN0ZW0/CgoKIEZyb20gdmhvc3QgcG9pbnQgb2Yg
dmlldywgaXQgd291bGQgb25seSBuZWVkIHRvIGNvbm5lY3QgdkRQQSBidXMsIG5vIApuZWVkIHRv
IGdvIGZvciB2aXJ0aW8gYnVzLiBWaG9zdCBkZXZpY2UgdGFsa3MgdG8gdkRQQSBkZXZpY2UgdGhy
b3VnaCAKdkRQQSBidXMuIFZpcml0byBkZXZpY2UgdGFsa3MgdG8gdkRQQSBkZXZpY2UgdGhyb3Vn
aCBhIG5ldyB2RFBBIAp0cmFuc3BvcnQgZHJpdmVyLgoKCj4KPiBJdCBpcyBlYXN5IHRvIHNlZSBz
b21ldGhpbmcgaXMgZ29pbmcgd3Jvbmcgd2l0aCB0aGlzIGRlc2lnbiBiZWNhdXNlCj4gdGhlIGRy
aXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMgbWFpbmx5IGNvbnRhaW5zIGEgYnVuY2ggb2YgdHJh
bXBvbGluZQo+IGZ1bmN0aW9ucyByZWZsZWN0aW5nIGlkZW50aWNhbCBjYWxscyBmcm9tIG9uZSBv
cHMgc3RydWN0IHRvIGEKPiBkaWZmZXJlbnQgb3BzIHN0cnVjdC4KCgpUaGF0J3MgcHJldHR5IG5v
cm1hbCwgc2luY2UgcGFydCBvZiB0aGUgdmlydGlvIG9wcyBjb3VsZCBiZSAxOjEgbWFwcGVkIAp0
byBzb21lIGRldmljZSBmdW5jdGlvbi4gSWYgeW91IHNlZSBNTUlPIGFuZCBQQ0kgdHJhbnNwb3J0
LCB5b3UgY2FuIHNlZSAKc29tZXRoaW5nIHNpbWlsYXIuIFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMg
dGhhdCBpbiB0aGUgY2FzZSBvZiBWRFBBIHRoZSAKZnVuY3Rpb24gaXMgYXNzaXN0ZWQgb3IgZW11
bGF0ZWQgYnkgaGFyZHdhcmUgdkRQQSBkcml2ZXIuCgoKPiAgIFRoaXMgc3VnZ2VzdHMgdGhlICd2
ZHBhJyBpcyBzb21lIHN1YmNsYXNzIG9mCj4gJ3ZpcnRpbycgYW5kIGl0IGlzIHBvc3NpYmx5IGJl
dHRlciB0byBtb2RlbCBpdCBieSBleHRlbmRpbmcgJ3N0cnVjdAo+IHZpcml0b19kZXZpY2UnIHRv
IGluY2x1ZGUgdGhlIHZkcGEgc3BlY2lmaWMgc3R1ZmYuCgoKR29pbmcgZm9yIHN1Y2gga2luZCBv
ZiBtb2RlbGluZywgdmlydGlvLXBjaSBhbmQgdmlydGlvLW1taW8gY291bGQgYmUgCmFsc28gdHJl
YXRlZCBhcyBhIHN1YmNsYXNzIG9mIHZpcnRpbyBhcyB3ZWxsLCB0aGV5IHdlcmUgYWxsIGltcGxl
bWVudGVkIAp2aWEgYSBkZWRpY2F0ZWQgdHJhbnNwb3J0IGRyaXZlci4KCgo+Cj4gV2hlcmUgZG9l
cyB0aGUgdmhvc3QtdXNlciBjaGFyIGRldiBnZXQgaW52b3ZsZWQgaW4gd2l0aCB0aGUgdjIgc2Vy
aWVzPwo+IElzIHRoYXQgaW5jbHVkZWQ/CgoKV2UncmUgd29ya2luZyBvbiB0aGUgYSBuZXcgdmVy
c2lvbiwgYnV0IGZvciB0aGUgYnVzL2RyaXZlciBwYXJ0IGl0IApzaG91bGQgYmUgdGhlIHNhbWUg
YXMgdmVyc2lvbiAxLgoKVGhhbmtzCgoKPgo+Pj4gRXZlcnkgY2xhc3Mgb2YgdmlydGlvIHRyYWZm
aWMgaXMgZ29pbmcgdG8gbmVlZCBhIHNwZWNpYWwgSFcgZHJpdmVyIHRvCj4+PiBlbmFibGUgVkRQ
QSwgdGhhdCBzcGVjaWFsIGRyaXZlciBjYW4gY3JlYXRlIHRoZSBjb3JyZWN0IHZob3N0IHNpZGUK
Pj4+IGNsYXNzIGRldmljZS4KPj4gQXJlIHlvdSBzYXlpbmcsIGUuZyBpdCdzIHRoZSBjaGFyZ2Ug
b2YgSUZDVkYgZHJpdmVyIHRvIGNyZWF0ZSB2aG9zdCBjaGFyIGRldgo+PiBhbmQgb3RoZXIgc3R1
ZmZzPwo+IE5vLgo+Cj4gSmFzb24KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
