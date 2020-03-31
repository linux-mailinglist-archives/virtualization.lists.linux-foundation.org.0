Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7519982F
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:10:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1264524F04;
	Tue, 31 Mar 2020 14:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYNXZFW6vtF7; Tue, 31 Mar 2020 14:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 80D4E24EA2;
	Tue, 31 Mar 2020 14:10:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56A6DC1AE2;
	Tue, 31 Mar 2020 14:10:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4816C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0CDD24EA2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bkqpg1pF+k7T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 384CC2010A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585663814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zaDvsYN8BRJn6uzt9vBaEcPBXIxrW6ki6PG9mgIOd/0=;
 b=Q4fKmOtOA8aT4KVPKAsYTv/TfmmXs4ZavPD0d3vtUNvkgjXsNHmw+pUVdnee2uowKdDK3r
 +xs3/0TB1ZxCkDU7vA2qDF5RqvDyB4fUrno46S/xFSE1tEvJbs05CuUNSCenR8/Hfaq2Lv
 SgEq7FVaV0k0Jv7GI6h24nNxe1Zt914=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-rDuJkBoBOOCVSDWMqShx_A-1; Tue, 31 Mar 2020 10:10:12 -0400
X-MC-Unique: rDuJkBoBOOCVSDWMqShx_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5780A801E74;
 Tue, 31 Mar 2020 14:10:11 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2795C1C5;
 Tue, 31 Mar 2020 14:10:00 +0000 (UTC)
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
Date: Tue, 31 Mar 2020 16:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331100359-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMzEuMDMuMjAgMTY6MDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBUdWUsIE1h
ciAzMSwgMjAyMCBhdCAwNDowMzoxOFBNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToK
Pj4gT24gMzEuMDMuMjAgMTU6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIFR1
ZSwgTWFyIDMxLCAyMDIwIGF0IDAzOjMyOjA1UE0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdy
b3RlOgo+Pj4+IE9uIDMxLjAzLjIwIDE1OjI0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+
Pj4+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEyOjM1OjI0UE0gKzAyMDAsIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDMuMjAgMTA6NDksIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPj4+Pj4+PiBPbiBUaHUsIE1hciAyNiwgMjAyMCBhdCAwODo1NDowNEFNICswMTAw
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFt
IDI2LjAzLjIwMjAgdW0gMDg6MjEgc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRo
YXQuY29tPjoKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDvu79PbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAw
OTo1MToyNUFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24g
MTIuMDMuMjAgMDk6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24g
VGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6Mzc6MzJBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6Cj4+Pj4+Pj4+Pj4+PiAyLiBZb3UgYXJlIGVzc2VudGlhbGx5IHN0ZWFsaW5nIFRIUHMg
aW4gdGhlIGd1ZXN0LiBTbyB0aGUgZmFzdGVzdAo+Pj4+Pj4+Pj4+Pj4gbWFwcGluZyAoVEhQIGlu
IGd1ZXN0IGFuZCBob3N0KSBpcyBnb25lLiBUaGUgZ3Vlc3Qgd29uJ3QgYmUgYWJsZSB0byBtYWtl
Cj4+Pj4+Pj4+Pj4+PiB1c2Ugb2YgVEhQIHdoZXJlIGl0IHByZXZpb3VzbHkgd2FzIGFibGUgdG8u
IEkgY2FuIGltYWdpbmUgdGhpcyBpbXBsaWVzIGEKPj4+Pj4+Pj4+Pj4+IHBlcmZvcm1hbmNlIGRl
Z3JhZGF0aW9uIGZvciBzb21lIHdvcmtsb2Fkcy4gVGhpcyBuZWVkcyBhIHByb3Blcgo+Pj4+Pj4+
Pj4+Pj4gcGVyZm9ybWFuY2UgZXZhbHVhdGlvbi4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gSSB0
aGluayB0aGUgcHJvYmxlbSBpcyBtb3JlIHdpdGggdGhlIGFsbG9jX3BhZ2VzIEFQSS4KPj4+Pj4+
Pj4+Pj4gVGhhdCBnaXZlcyB5b3UgZXhhY3RseSB0aGUgZ2l2ZW4gb3JkZXIsIGFuZCBpZiB0aGVy
ZSdzCj4+Pj4+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQgd2lsbCBzcGxpdCBp
dCB1cC4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQnV0IGZvciBiYWxsb29uIC0gSSBzdXNwZWN0
IGxvdHMgb2Ygb3RoZXIgdXNlcnMsCj4+Pj4+Pj4+Pj4+IHdlIGRvIG5vdCB3YW50IHRvIHN0cmVz
cyB0aGUgc3lzdGVtIGJ1dCBpZiBhIGxhcmdlCj4+Pj4+Pj4+Pj4+IGNodW5rIGlzIGF2YWlsYWJs
ZSBhbnl3YXksIHRoZW4gd2UgY291bGQgaGFuZGxlCj4+Pj4+Pj4+Pj4+IHRoYXQgbW9yZSBvcHRp
bWFsbHkgYnkgZ2V0dGluZyBpdCBhbGwgaW4gb25lIGdvLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiBTbyBpZiB3ZSB3YW50IHRvIGFkZHJlc3MgdGhpcywgSU1ITyB0aGlzIGNh
bGxzIGZvciBhIG5ldyBBUEkuCj4+Pj4+Pj4+Pj4+IEFsb25nIHRoZSBsaW5lcyBvZgo+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+PiAgICBzdHJ1Y3QgcGFnZSAqYWxsb2NfcGFnZV9yYW5nZShnZnBfdCBn
ZnAsIHVuc2lnbmVkIGludCBtaW5fb3JkZXIsCj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiB0aGUgaWRlYSB3b3VsZCB0aGVuIGJlIHRvIHJldHVybiBhdCBhIG51bWJl
ciBvZiBwYWdlcyBpbiB0aGUgZ2l2ZW4KPj4+Pj4+Pj4+Pj4gcmFuZ2UuCj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rPyBXYW50IHRvIHRyeSBpbXBsZW1lbnRpbmcgdGhh
dD8KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFlvdSBjYW4ganVzdCBzdGFydCB3aXRoIHRoZSBoaWdo
ZXN0IG9yZGVyIGFuZCBkZWNyZW1lbnQgdGhlIG9yZGVyIHVudGlsCj4+Pj4+Pj4+Pj4geW91ciBh
bGxvY2F0aW9uIHN1Y2NlZWRzIHVzaW5nIGFsbG9jX3BhZ2VzKCksIHdoaWNoIHdvdWxkIGJlIGVu
b3VnaCBmb3IKPj4+Pj4+Pj4+PiBhIGZpcnN0IHZlcnNpb24uIEF0IGxlYXN0IEkgZG9uJ3Qgc2Vl
IHRoZSBpbW1lZGlhdGUgbmVlZCBmb3IgYSBuZXcKPj4+Pj4+Pj4+PiBrZXJuZWwgQVBJLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IE9LIEkgcmVtZW1iZXIgbm93LiAgVGhlIHByb2JsZW0gaXMgd2l0aCBy
ZWNsYWltLiBVbmxlc3MgcmVjbGFpbSBpcwo+Pj4+Pj4+Pj4gY29tcGxldGVseSBkaXNhYmxlZCwg
YW55IG9mIHRoZXNlIGNhbGxzIGNhbiBzbGVlcC4gQWZ0ZXIgaXQgd2FrZXMgdXAsCj4+Pj4+Pj4+
PiB3ZSB3b3VsZCBsaWtlIHRvIGdldCB0aGUgbGFyZ2VyIG9yZGVyIHRoYXQgaGFzIGJlY29tZSBh
dmFpbGFibGUKPj4+Pj4+Pj4+IG1lYW53aGlsZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IFllcywgYnV0IHRoYXTigJhzIGEgcHVyZSBvcHRpbWl6YXRpb24gSU1ITy4KPj4+Pj4+Pj4gU28g
SSB0aGluayB3ZSBzaG91bGQgZG8gYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZpcnN0IGFuZCB0
aGVuIHNlZSB3aGF0IHdlIGdhaW4gZnJvbSBhIG5ldyBhbGxvY2F0b3IgQVBJLiBUaGVuIHdlIG1p
Z2h0IGFsc28gYmUgYWJsZSB0byBqdXN0aWZ5IGl0IHVzaW5nIHJlYWwgbnVtYmVycy4KPj4+Pj4+
Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFdlbGwgaG93IGRvIHlvdSBwcm9wb3NlIGltcGxlbWVudCB0aGUg
bmVjZXNzYXJ5IHNlbWFudGljcz8KPj4+Pj4+PiBJIHRoaW5rIHdlIGFyZSBib3RoIGFncmVlZCB0
aGF0IGFsbG9jX3BhZ2VfcmFuZ2UgaXMgbW9yZSBvcgo+Pj4+Pj4+IGxlc3Mgd2hhdCdzIG5lY2Vz
c2FyeSBhbnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRlIGl0Cj4+Pj4+Pj4gb24g
dG9wIG9mIGV4aXN0aW5nIEFQSXM/Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9i
YWxsb29uX2NvbXBhY3Rpb24uaCBiL2luY2x1ZGUvbGludXgvYmFsbG9vbl9jb21wYWN0aW9uLmgK
Pj4+Cj4+PiAuLi4uLgo+Pj4KPj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vYmFsbG9vbl9jb21w
YWN0aW9uLmMgYi9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+Pj4+Pj4gaW5kZXggMjZkZTAyMGFh
ZTdiLi4wNjc4MTBiMzI4MTMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9tbS9iYWxsb29uX2NvbXBhY3Rp
b24uYwo+Pj4+Pj4gKysrIGIvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPj4+Pj4+IEBAIC0xMTIs
MjMgKzExMiwzNSBAQCBzaXplX3QgYmFsbG9vbl9wYWdlX2xpc3RfZGVxdWV1ZShzdHJ1Y3QgYmFs
bG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbywKPj4+Pj4+ICBFWFBPUlRfU1lNQk9MX0dQTChiYWxs
b29uX3BhZ2VfbGlzdF9kZXF1ZXVlKTsKPj4+Pj4+ICAKPj4+Pj4+ICAvKgo+Pj4+Pj4gLSAqIGJh
bGxvb25fcGFnZV9hbGxvYyAtIGFsbG9jYXRlcyBhIG5ldyBwYWdlIGZvciBpbnNlcnRpb24gaW50
byB0aGUgYmFsbG9vbgo+Pj4+Pj4gLSAqCQkJcGFnZSBsaXN0Lgo+Pj4+Pj4gKyAqIGJhbGxvb25f
cGFnZXNfYWxsb2MgLSBhbGxvY2F0ZXMgYSBuZXcgcGFnZSAob2YgYXQgbW9zdCB0aGUgZ2l2ZW4g
b3JkZXIpCj4+Pj4+PiArICogCQkJIGZvciBpbnNlcnRpb24gaW50byB0aGUgYmFsbG9vbiBwYWdl
IGxpc3QuCj4+Pj4+PiAgICoKPj4+Pj4+ICAgKiBEcml2ZXIgbXVzdCBjYWxsIHRoaXMgZnVuY3Rp
b24gdG8gcHJvcGVybHkgYWxsb2NhdGUgYSBuZXcgYmFsbG9vbiBwYWdlLgo+Pj4+Pj4gICAqIERy
aXZlciBtdXN0IGNhbGwgYmFsbG9vbl9wYWdlX2VucXVldWUgYmVmb3JlIGRlZmluaXRpdmVseSBy
ZW1vdmluZyB0aGUgcGFnZQo+Pj4+Pj4gICAqIGZyb20gdGhlIGd1ZXN0IHN5c3RlbS4KPj4+Pj4+
ICAgKgo+Pj4+Pj4gKyAqIFdpbGwgZmFsbCBiYWNrIHRvIHNtYWxsZXIgb3JkZXJzIGlmIGFsbG9j
YXRpb24gZmFpbHMuIFRoZSBvcmRlciBvZiB0aGUKPj4+Pj4+ICsgKiBhbGxvY2F0ZWQgcGFnZSBp
cyBzdG9yZWQgaW4gcGFnZS0+cHJpdmF0ZS4KPj4+Pj4+ICsgKgo+Pj4+Pj4gICAqIFJldHVybjog
c3RydWN0IHBhZ2UgZm9yIHRoZSBhbGxvY2F0ZWQgcGFnZSBvciBOVUxMIG9uIGFsbG9jYXRpb24g
ZmFpbHVyZS4KPj4+Pj4+ICAgKi8KPj4+Pj4+IC1zdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlX2Fs
bG9jKHZvaWQpCj4+Pj4+PiArc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZXNfYWxsb2MoaW50IG9y
ZGVyKQo+Pj4+Pj4gIHsKPj4+Pj4+IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSBhbGxvY19wYWdlKGJh
bGxvb25fbWFwcGluZ19nZnBfbWFzaygpIHwKPj4+Pj4+IC0JCQkJICAgICAgIF9fR0ZQX05PTUVN
QUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPj4+Pj4+IC0JCQkJICAgICAgIF9fR0ZQX05PV0FSTik7
Cj4+Pj4+PiAtCXJldHVybiBwYWdlOwo+Pj4+Pj4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4+Pj4+
ICsKPj4+Pj4+ICsJd2hpbGUgKG9yZGVyID49IDApIHsKPj4+Pj4+ICsJCXBhZ2UgPSBhbGxvY19w
YWdlcyhiYWxsb29uX21hcHBpbmdfZ2ZwX21hc2soKSB8Cj4+Pj4+PiArCQkJCSAgIF9fR0ZQX05P
TUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPj4+Pj4+ICsJCQkJICAgX19HRlBfTk9XQVJOLCBv
cmRlcik7Cj4+Pj4+PiArCQlpZiAocGFnZSkgewo+Pj4+Pj4gKwkJCXNldF9wYWdlX3ByaXZhdGUo
cGFnZSwgb3JkZXIpOwo+Pj4+Pj4gKwkJCXJldHVybiBwYWdlOwo+Pj4+Pj4gKwkJfQo+Pj4+Pj4g
KwkJb3JkZXItLTsKPj4+Pj4+ICsJfQo+Pj4+Pj4gKwlyZXR1cm4gTlVMTDsKPj4+Pj4+ICB9Cj4+
Pj4+PiAtRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlX2FsbG9jKTsKPj4+Pj4+ICtFWFBP
UlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VzX2FsbG9jKTsKPj4+Pj4+ICAKPj4+Pj4+ICAvKgo+
Pj4+Pj4gICAqIGJhbGxvb25fcGFnZV9lbnF1ZXVlIC0gaW5zZXJ0cyBhIG5ldyBwYWdlIGludG8g
dGhlIGJhbGxvb24gcGFnZSBsaXN0Lgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHRoaXMgd2ls
bCB0cnkgdG8gaW52b2tlIGRpcmVjdCByZWNsYWltIGZyb20gdGhlIGZpcnN0IGl0ZXJhdGlvbgo+
Pj4+PiB0byBmcmVlIHVwIHRoZSBtYXggb3JkZXIuCj4+Pj4KPj4+PiAlX19HRlBfTk9SRVRSWTog
VGhlIFZNIGltcGxlbWVudGF0aW9uIHdpbGwgdHJ5IG9ubHkgdmVyeSBsaWdodHdlaWdodAo+Pj4+
IG1lbW9yeSBkaXJlY3QgcmVjbGFpbSB0byBnZXQgc29tZSBtZW1vcnkgdW5kZXIgbWVtb3J5IHBy
ZXNzdXJlICh0aHVzIGl0Cj4+Pj4gY2FuIHNsZWVwKS4gSXQgd2lsbCBhdm9pZCBkaXNydXB0aXZl
IGFjdGlvbnMgbGlrZSBPT00ga2lsbGVyLgo+Pj4+Cj4+Pj4gQ2VydGFpbmx5IGdvb2QgZW5vdWdo
IGZvciBhIGZpcnN0IHZlcnNpb24gSSB3b3VsZCBzYXksIG5vPwo+Pj4KPj4+IEZyYW5rbHkgaG93
IHdlbGwgdGhhdCBiZWhhdmVzIHdvdWxkIGRlcGVuZCBhIGxvdCBvbiB0aGUgd29ya2xvYWQuCj4+
PiBDYW4gcmVncmVzcyBqdXN0IGFzIHdlbGwuCj4+Pgo+Pj4gRm9yIHRoZSAxc3QgdmVyc2lvbiBJ
J2QgcHJlZmVyIHNvbWV0aGluZyB0aGF0IGlzIHRoZSBsZWFzdCBkaXNydXB0aXZlLAo+Pj4gYW5k
IHRoYXQgSU1ITyBtZWFucyB3ZSBvbmx5IHRyaWdnZXIgcmVjbGFpbSBhdCBhbGwgaW4gdGhlIHNh
bWUgY29uZmlndXJhdGlvbgo+Pj4gYXMgbm93IC0gd2hlbiB3ZSBjYW4ndCBzYXRpc2Z5IHRoZSBs
b3dlc3Qgb3JkZXIgYWxsb2NhdGlvbi4KPj4KPj4gQWdyZWVkLgo+Pgo+Pj4KPj4+IEFueXRoaW5n
IGVsc2Ugd291bGQgYmUgYSBodWdlIGFtb3VudCBvZiB0ZXN0aW5nIHdpdGggYWxsIGtpbmQgb2YK
Pj4+IHdvcmtsb2Fkcy4KPj4+Cj4+Cj4+IFNvIGRvaW5nIGEgIiYgfl9fR0ZQX1JFQ0xBSU0iIGlu
IGNhc2Ugb3JkZXIgPiAwPyAoYXMgZG9uZSBpbgo+PiBHRlBfVFJBTlNIVUdFX0xJR0hUKQo+IAo+
IFRoYXQgd2lsbCBpbXByb3ZlIHRoZSBzaXR1YXRpb24gd2hlbiByZWNsYWltIGlzIG5vdCBuZWVk
ZWQsIGJ1dCBsZWF2ZQo+IHRoZSBwcm9ibGVtIGluIHBsYWNlIGZvciB3aGVuIGl0J3MgbmVlZGVk
OiBpZiByZWNsYWltIGRvZXMgdHJpZ2dlciwgd2UKPiBjYW4gZ2V0IGEgaHVnZSBmcmVlIHBhZ2Ug
YW5kIGltbWVkaWF0ZWx5IGJyZWFrIGl0IHVwLgo+IAo+IFNvIGl0J3Mgb2sgYXMgYSBmaXJzdCBz
dGVwIGJ1dCBpdCB3aWxsIG1ha2UgdGhlIHNlY29uZCBzdGVwIGhhcmRlciBhcwo+IHdlJ2xsIG5l
ZWQgdG8gdGVzdCB3aXRoIHJlY2xhaW0gOikuCgpJIGV4cGVjdCB0aGUgd2hvbGUgInN0ZWFsIGh1
Z2UgcGFnZXMgZnJvbSB5b3VyIGd1ZXN0IiB0byBiZSBwcm9ibGVtYXRpYywKYXMgSSBhbHJlYWR5
IG1lbnRpb25lZCB0byBBbGV4LiBUaGlzIG5lZWRzIGEgcGVyZm9ybWFuY2UgZXZhbHVhdGlvbi4K
ClRoaXMgYWxsIHNtZWxscyBsaWtlIGEgbG90IG9mIHdvcmtsb2FkIGRlcGVuZGVudCBmaW5lLXR1
bmluZy4gOikKCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
