Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2F1F4E2F
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 08:29:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6421D86354;
	Wed, 10 Jun 2020 06:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQrfEHrGnbYj; Wed, 10 Jun 2020 06:29:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BFAB286457;
	Wed, 10 Jun 2020 06:29:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D790C016F;
	Wed, 10 Jun 2020 06:29:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DAA6C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4686388A0E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHiMBK6L+Fpw
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A63C488A0D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591770556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2x7M7QCGAsae1BplgLRSy2XsJ6miBlImwYneWZ/p2I=;
 b=eAaE5BnBhIi2OcqLA+OT+7Tn3CFX0hWBdJDwi38cFPDua1gEoetspb7penfqkEJJPelfTR
 TQdKDDICM4YPpbUet71gxVeWYtvCp7PAPIHX9mUC7P4lyffSGWZQRDPvz8mzxCEauMsvV5
 GhSpkANVqMilQj6IIVQ9auJ24uhaLnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-YVENjHhqNzm2zgOrDGL04w-1; Wed, 10 Jun 2020 02:29:12 -0400
X-MC-Unique: YVENjHhqNzm2zgOrDGL04w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE9051883600;
 Wed, 10 Jun 2020 06:29:10 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1912C7BFE2;
 Wed, 10 Jun 2020 06:29:02 +0000 (UTC)
Subject: Re: [PATCH RESEND V2] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200610054951.16197-1-jasowang@redhat.com>
 <20200610020728-mutt-send-email-mst@kernel.org>
 <0964bd2d-8329-a091-41ed-a9b912ec4283@redhat.com>
 <20200610022030-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <be938f8f-8f98-b55e-34b8-b0faf560ef30@redhat.com>
Date: Wed, 10 Jun 2020 14:29:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610022030-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8xMCDkuIvljYgyOjIxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdW4gMTAsIDIwMjAgYXQgMDI6MTY6MjZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC82LzEwIOS4i+WNiDI6MDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgSnVuIDEwLCAyMDIwIGF0IDAxOjQ5OjUxUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgYSB2RFBBIGRyaXZlciBmb3IgdmlydGlvLXBj
aSBkZXZpY2UuIEl0IGJyaWRnZXMKPj4+PiB0aGUgdmlydGlvLXBjaSBjb250cm9sIGNvbW1hbmQg
dG8gdGhlIHZEUEEgYnVzLiBUaGlzIHdpbGwgYmUgdXNlZCBmb3IKPj4+PiBkZXZlbG9waW5nIG5l
dyBmZWF0dXJlcyBmb3IgYm90aCBzb2Z0d2FyZSB2RFBBIGZyYW1ld29yayBhbmQgaGFyZHdhcmUK
Pj4+PiB2RFBBIGZlYXR1cmUuCj4+Pj4KPj4+PiBDb21wYXJlZCB0byB2ZHBhX3NpbSwgaXQgaGFz
IHNldmVyYWwgYWR2YW50YWdlczoKPj4+Pgo+Pj4+IC0gaXQncyBhIHJlYWwgZGV2aWNlIGRyaXZl
ciB3aGljaCBhbGxvdyB1cyB0byBwbGF5IHdpdGggcmVhbCBoYXJkd2FyZQo+Pj4+ICAgICBmZWF0
dXJlcwo+Pj4+IC0gdHlwZSBpbmRlcGVuZGVudCBpbnN0ZWFkIG9mIG5ldHdvcmtpbmcgc3BlY2lm
aWMKPj4+Pgo+Pj4+IE5vdGUgdGhhdCBzaW5jZSB2aXJ0aW8gc3BlY2lmaWNhdGlvbiBkb2VzIG5v
dCBzdXBwb3J0IGdldC9yZXN0b3JlCj4+Pj4gdmlydHF1ZXVlIHN0YXRlLiBTbyB3ZSBjYW4gbm90
IHVzZSB0aGlzIGRyaXZlciBmb3IgVk0uIFRoaXMgY2FuIGJlCj4+Pj4gYWRkcmVzc2VkIGJ5IGV4
dGVuZGluZyB0aGUgdmlydGlvIHNwZWNpZmljYXRpb24uCj4+Pj4KPj4+PiBDb25zaWRlciB0aGUg
ZHJpdmVyIGlzIG1haW5seSBmb3IgdGVzdGluZyBhbmQgZGV2ZWxvcG1lbnQgZm9yIHZEUEEKPj4+
PiBmZWF0dXJlcywgaXQgY2FuIG9ubHkgYmUgYm91bmQgdmlhIGR5bmFtaWMgaWRzIHRvIG1ha2Ug
c3VyZSBpdCdzIG5vdAo+Pj4+IGNvbmZsaWN0IHdpdGggdGhlIGRyaXZlcnMgbGlrZSB2aXJ0aW8t
cGNpIG9yIElGQ1ZGLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2Fu
Z0ByZWRoYXQuY29tPgo+Pj4gZXJyb3I6IHNoYTEgaW5mb3JtYXRpb24gaXMgbGFja2luZyBvciB1
c2VsZXNzIChkcml2ZXJzL3ZkcGEvS2NvbmZpZykuCj4+Pgo+Pj4gd2hpY2ggdHJlZSBpcyB0aGlz
IG9uIHRvcCBvZj8KPj4KPj4gWW91ciB2aG9zdC5naXQgdmhvc3QgYnJhbmNoLCBIRUFEIGlzIGJi
ZWEzYmNmZDFkNiB2ZHBhOiBmaXggdHlwb3MgaW4gdGhlCj4+IGNvbW1lbnRzIGZvciBfX3ZkcGFf
YWxsb2NfZGV2aWNlKCkKPj4KPj4gRG8gSSBuZWVkIHRvIHVzZSBvdGhlciBicmFuY2g/Cj4+Cj4+
IFRoYW5rcwo+IE5vIGl0J3Mgb2ssIEkgYW0ganVzdCB3b25kZXJpbmcgd2h5IGRvZXNuJ3QgaXQg
YXBwbHkgdGhlbi4KCgpJIGZvdW5kIHRoZSByZWFzb24sIEkgZ2VuZXJhdGUgdGhlIHBhdGNoIG9u
IGFub3RoZXIgYnJhbmNoIHdob3NlIGJhc2UgCmRvZXMgbm90IGV4aXN0ZWQgaW4gdGhlIHZob3N0
IGJyYW5jaC4gV2lsbCByZXBvc3QuCgpTb3JyeS4KCgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
