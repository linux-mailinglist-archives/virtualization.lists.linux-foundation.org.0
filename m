Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478315D129
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 05:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BD88875AD;
	Fri, 14 Feb 2020 04:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B03ShGN7hroY; Fri, 14 Feb 2020 04:40:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F5F8875B6;
	Fri, 14 Feb 2020 04:40:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EF65C0177;
	Fri, 14 Feb 2020 04:40:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32FCCC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1BDFD875AD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBU+5--7v5Yh
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:40:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B168087595
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581655215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3yOWLF6bcHCCuN6HWm7zeGRKO0RfJCz2+K5iNwYZJc=;
 b=VtpbfIf5qma5/MKsJ/8DebfL62bx4QvkrNdvBjgDMPgiFDHHXGKSFIOQTF6c9dIt8AEeFZ
 eX+AyD8tx4UZKDyNGL/UfKfK6DsAhwFGLQ/yCYZtMXZGf8iDlQRVDZKhngEUrjxRRSM1og
 j9rBPrhXmH0G6SlM6YvrwtzXlKRoIhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-o4poq0lXOLKmZXu4jaC7VQ-1; Thu, 13 Feb 2020 23:40:13 -0500
X-MC-Unique: o4poq0lXOLKmZXu4jaC7VQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFBC81851FC6;
 Fri, 14 Feb 2020 04:40:10 +0000 (UTC)
Received: from [10.72.13.213] (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB4B68AC40;
 Fri, 14 Feb 2020 04:39:49 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
 <20200213155154.GX4271@mellanox.com>
 <20200213105743-mutt-send-email-mst@kernel.org>
 <20200213161320.GY4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <da994ac0-6f44-109f-962e-5df9cfbc3221@redhat.com>
Date: Fri, 14 Feb 2020 12:39:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200213161320.GY4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
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

Ck9uIDIwMjAvMi8xNCDkuIrljYgxMjoxMywgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDEzLCAyMDIwIGF0IDEwOjU5OjM0QU0gLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPj4gT24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6NTE6NTRBTSAtMDQwMCwgSmFzb24g
R3VudGhvcnBlIHdyb3RlOgo+Pj4gVGhlICdjbGFzcycgaXMgc3VwcG9zZWQgdG8gcHJvdmlkZSBh
bGwgdGhlIGxpYnJhcnkgZnVuY3Rpb25zIHRvIHJlbW92ZQo+Pj4gdGhpcyBkdXBsaWNhdGlvbi4g
SW5zdGVhZCBvZiBwbHVnZ2luZyB0aGUgSFcgZHJpdmVyIGluIHZpYSBzb21lIGJ1cwo+Pj4gc2No
ZW1lIGV2ZXJ5IHN1YnN5c3RlbSBoYXMgaXRzIG93biAnb3BzJyB0aGF0IHRoZSBIVyBkcml2ZXIg
cHJvdmlkZXMKPj4+IHRvIHRoZSBzdWJzeXN0ZW0ncyBjbGFzcyB2aWEgc3Vic3lzdGVtX3JlZ2lz
dGVyKCkKPj4gSG1tIEknbSBub3QgZmFtaWxpYXIgd2l0aCBzdWJzeXN0ZW1fcmVnaXN0ZXIuIEEg
Z3JlcCBkaWRuJ3QgZmluZCBpdAo+PiBpbiB0aGUga2VybmVsIGVpdGhlciAuLi4KPiBJIG1lYW4g
aXQgaXMgdGhlIHJlZ2lzdHJhdGlvbiBmdW5jdGlvbiBwcm92aWRlZCBieSB0aGUgc3Vic3lzdGVt
IHRoYXQKPiBvd25zIHRoZSBjbGFzcywgZm9yIGluc3RhbmNlIHRwbV9jaGlwX3JlZ2lzdGVyKCks
Cj4gaWJfcmVnaXN0ZXJfZGV2aWNlKCksIHJlZ2lzdGVyX25ldGRldigpLCBydGNfcmVnaXN0ZXJf
ZGV2aWNlKCkgZXRjCj4KPiBTbyBpZiB5b3UgaGF2ZSBzb21lIHZob3N0ICh2aG9zdCBuZXQ/KSBj
bGFzcyB0aGVuIHlvdSdkIGhhdmUgc29tZQo+IHZob3N0X3ZkcGFfaW5pdC9hbGxvYygpOyB2aG9z
dF92ZHBhX3JlZ2lzdGVyKCksIHNlcXVlbmNlCj4gcHJlc3VtYWJseS4gKHZzIHRyeWluZyB0byBk
byBpdCB3aXRoIGEgYnVzIG1hdGNoZXIpCj4KPiBJIHJlY29tbWVuZCB0byBsb29rIGF0IHJ0YyBh
bmQgdHBtIGZvciBmYWlybHkgc2ltcGxlIGVhc3kgdG8gZm9sbG93Cj4gcGF0dGVybnMgZm9yIGNy
ZWF0aW5nIGEgc3Vic3lzdGVtIGluIHRoZSBrZXJuZWwuIEEgc3Vic3lzdGVtIG93bnMgYSBjbGFz
cywKPiBhbGxvd3MgSFcgZHJpdmVycyB0byBwbHVnIGluIHRvIGl0LCBhbmQgcHJvdmlkZXMgYSBj
b25zaXN0ZW50IHVzZXIKPiBBUEkgdmlhIGEgY2Rldi9zeXNmcy9ldGMuCj4KPiBUaGUgZHJpdmVy
IG1vZGVsIGNsYXNzIHNob3VsZCByZXZvbHZlIGFyb3VuZCB0aGUgY2hhciBkZXYgYW5kIHN5c2Zz
Cj4gdUFCSSAtIGlmIHlvdSBlbnVtZXJhdGUgdGhlIGRldmljZXMgb24gdGhlIGNsYXNzIHRoZW4g
dGhleSBzaG91bGQgYWxsCj4gZm9sbG93IHRoZSBjaGFyIGRldiBhbmQgc3lzZnMgaW50ZXJmYWNl
cyBjb250cmFjdCBvZiB0aGF0IGNsYXNzLgo+Cj4gVGhvc2UgZXhhbXBsZXMgc2hvdyBob3cgdG8g
ZG8gYWxsIHRoZSByZWZjb3VudGluZyBzZW1pLXNhbmVseSwKPiBpbnRyb2R1Y2Ugc3lzZnMsIGNk
ZXZzLCBldGMuCj4KPiBJIHRob3VnaHQgdGhlIGxhdGVzdCBwcm9wb3NhbCB3YXMgdG8gdXNlIHRo
ZSBleGlzdGluZyB2aG9zdCBjbGFzcyBhbmQKPiBsYXJnZWx5IHRoZSBleGlzdGluZyB2aG9zdCBB
UEksIHNvIGl0IHByb2JhYmx5IGp1c3QgbmVlZHMgdG8gbWFrZSBzdXJlCj4gdGhlIGNvbW1vbiBj
bGFzcy13aWRlIHN0dWZmIGlzIHNwbGl0IGZyb20gdGhlICdkcml2ZXInIHN0dWZmIG9mIHRoZQo+
IGV4aXN0aW5nIHZob3N0IHRvIG5ldGRldi4KCgpTdGlsbCwgbmV0ZGV2IGlzIG9ubHkgb25lIG9m
IHRoZSB0eXBlIHdlIHdhbnQgdG8gc3VwcG9ydC4gQW5kIHdlIGNhbiBub3QgCmd1YXJhbnRlZSBv
ciBmb3JlY2FzdCB0aGF0IHZob3N0IGlzIHRoZSBvbmx5IEFQSSB0aGF0IGlzIHVzZWQuCgpMZXQn
cyB0YWtlIHZpcnRpbyBhcyBhbiBleGFtcGxlLCBpdCBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIGEg
YnVzIHdoaWNoIAphbGxvd3MgZGlmZmVyZW50IHN1YnN5c3RlbXMgb24gdG9wLiBBbmQgaXQgY2Fu
IHByb3ZpZGUgYSB2YXJpZXR5IG9mIApkaWZmZXJlbnQgdUFQSXMuIEZvciBiZXN0IHBlcmZvcm1h
bmNlLCBWRklPIGNvdWxkIGJlIHVzZWQgZm9yIHVzZXJzcGFjZSAKZHJpdmVycywgYnV0IGl0IHJl
cXVpcmVzIHRoZSBidXMgaGFzIHN1cHBvcnQgZnJvbSBWRklPLgoKRm9yIHZEUEEgZGV2aWNlcywg
aXQncyBqdXN0IHRoZSBzYW1lIGxvZ2ljLiBBIGJ1cyBhbGxvd3MgZGlmZmVyZW50IApkcml2ZXJz
IGFuZCBzdWJzeXN0ZW1zIG9uIHRvcC4gT25lIG9mIHRoZSBzdWJzeXN0ZW0gY291bGQgYmUgdmhv
c3QgdGhhdCAKcHJvdmlkZXMgYSB1bmlmaWVkIEFQSSBmb3IgdXNlcnNwYWNlIGRyaXZlci4KClRo
YW5rcwoKCj4KPiBKYXNvbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
