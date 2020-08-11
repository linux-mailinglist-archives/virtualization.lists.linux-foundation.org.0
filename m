Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E098D241513
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 04:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BB9A87652;
	Tue, 11 Aug 2020 02:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSu-TU6Gul9b; Tue, 11 Aug 2020 02:54:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A23587695;
	Tue, 11 Aug 2020 02:54:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B5C0C004D;
	Tue, 11 Aug 2020 02:54:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34DF9C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 219E88768C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InnB+y5IpvNT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2550987652
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597114442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkQRU8e1rT0qyUbw+JJg0ZU52Alo7Rsy9OtRuJe42bU=;
 b=aORUiqIvBcHB5yyfRP/WSyqx/KKMfF2nIHkRvtMGL6yEoFkgQzoAGKRQOw9vauEOmlaVed
 2MEkYFl8LpPhu12iWU6KxEu7AMcqy/VWPtej/qxgWJtiUioLfz5FChHraTZw/yQLQe226Z
 lAwYjGC3nb9tDTzcdB9m2AVrSbzIjbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-nBBoDX1iNRmQDYLbImgUYw-1; Mon, 10 Aug 2020 22:54:00 -0400
X-MC-Unique: nBBoDX1iNRmQDYLbImgUYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B44418A0F01;
 Tue, 11 Aug 2020 02:53:59 +0000 (UTC)
Received: from [10.72.13.186] (ovpn-13-186.pek2.redhat.com [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DAB9101E7F9;
 Tue, 11 Aug 2020 02:53:49 +0000 (UTC)
Subject: Re: [PATCH V5 1/6] vhost: introduce vhost_vring_call
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200731065533.4144-1-lingshan.zhu@intel.com>
 <20200731065533.4144-2-lingshan.zhu@intel.com>
 <5e646141-ca8d-77a5-6f41-d30710d91e6d@redhat.com>
 <d51dd4e3-7513-c771-104c-b61f9ee70f30@intel.com>
 <156b8d71-6870-c163-fdfa-35bf4701987d@redhat.com>
 <20200804052050-mutt-send-email-mst@kernel.org>
 <14fd2bf1-e9c1-a192-bd6c-f1ee5fd227f6@redhat.com>
 <20200810093630-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b669a4c6-f3d7-6cf0-0f7e-8058628c0138@redhat.com>
Date: Tue, 11 Aug 2020 10:53:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810093630-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, wanpengli@tencent.com, parav@mellanox.com,
 kvm@vger.kernel.org, netdev@vger.kernel.org, sean.j.christopherson@intel.com,
 virtualization@lists.linux-foundation.org, eli@mellanox.com,
 pbonzini@redhat.com, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvOC8xMCDkuIvljYg5OjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBBdWcgMDUsIDIwMjAgYXQgMTA6MTY6MTZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC84LzQg5LiL5Y2INToyMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+
Pj4+ICAgwqAgK3N0cnVjdCB2aG9zdF92cmluZ19jYWxsIHsKPj4+Pj4+PiArwqDCoMKgIHN0cnVj
dCBldmVudGZkX2N0eCAqY3R4Owo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGlycV9ieXBhc3NfcHJv
ZHVjZXIgcHJvZHVjZXI7Cj4+Pj4+Pj4gK8KgwqDCoCBzcGlubG9ja190IGN0eF9sb2NrOwo+Pj4+
Pj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHdlIG5lZWQgY3R4X2xvY2sgaGVyZS4KPj4+Pj4+
Cj4+Pj4+PiBUaGFua3MKPj4+Pj4gSGkgSmFzb24sCj4+Pj4+Cj4+Pj4+IHdlIHVzZSB0aGlzIGxv
Y2sgdG8gcHJvdGVjdCB0aGUgZXZlbnRmZF9jdHggYW5kIGlycSBmcm9tIHJhY2UgY29uZGl0aW9u
cywKPj4+PiBXZSBkb24ndCBzdXBwb3J0IGlycSBub3RpZmljYXRpb24gZnJvbSB2RFBBIGRldmlj
ZSBkcml2ZXIgaW4gdGhpcyB2ZXJzaW9uLAo+Pj4+IGRvIHdlIHN0aWxsIGhhdmUgcmFjZSBjb25k
aXRpb24/Cj4+Pj4KPj4+PiBUaGFua3MKPj4+IEphc29uIEknbSBub3Qgc3VyZSB3aGF0IHlvdSBh
cmUgdHJ5aW5nIHRvIHNheSBoZXJlLgo+Pgo+PiBJIG1lYW50IHdlIGNoYW5nZSB0aGUgQVBJIGZy
b20gVjQgc28gZHJpdmVyIHdvbid0IG5vdGlmeSB1cyBpZiBpcnEgaXMKPj4gY2hhbmdlZC4KPj4K
Pj4gVGhlbiBpdCBsb29rcyB0byBtZSB0aGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBjdHhfbG9jaywg
ZXZlcnloaW5nIGNvdWxkIGJlCj4+IHN5bmNocm9uaXplZCB3aXRoIHZxIG11dGV4Lgo+Pgo+PiBU
aGFua3MKPiBKYXNvbiBkbyB5b3Ugd2FudCB0byBwb3N0IGEgY2xlYW51cCBwYXRjaCBzaW1wbGlm
eWluZyBjb2RlIGFsb25nIHRoZXNlCj4gbGluZXM/CgoKTGluZyBTaGFuIHByb21pc2VkIHRvIHBv
c3QgYSBwYXRjaCB0byBmaXggdGhpcy4KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4KPgo+Pj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
