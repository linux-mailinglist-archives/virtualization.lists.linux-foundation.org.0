Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D019A8D6
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 11:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB0F687CE4;
	Wed,  1 Apr 2020 09:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkXMnv2u9-QJ; Wed,  1 Apr 2020 09:48:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0699287CE5;
	Wed,  1 Apr 2020 09:48:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA390C1D89;
	Wed,  1 Apr 2020 09:48:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB082C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 09:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D296887CE4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 09:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_aTKYkMgD7V
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 09:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BEE8287CE3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585734502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sKOg3cVaEaKdsaC5nuhu/PwPgLHCkghU/5N6r8sWHIM=;
 b=YczlJaU1EFVBxQH01/PQTZNJsJ7yTiuYCXMHrt1bHLQBBbBgeqOcA6AoSUqw6DuVtKRtHP
 rb7SRskJUi9yJCk0BU0/IrTdeNg/f7ZDxr02ijYfxzQo8oX3lulL6Uyn1i7uAtAk3r34tl
 UhPP1g+ITZRcsl0eJWOBeowEahKfsRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-aYOZXPjxP6q1-GDEH_wrxw-1; Wed, 01 Apr 2020 05:48:20 -0400
X-MC-Unique: aYOZXPjxP6q1-GDEH_wrxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82ECB92AE1;
 Wed,  1 Apr 2020 09:48:18 +0000 (UTC)
Received: from [10.36.114.59] (ovpn-114-59.ams2.redhat.com [10.36.114.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFF9ADA0E0;
 Wed,  1 Apr 2020 09:48:09 +0000 (UTC)
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
To: Nadav Amit <namit@vmware.com>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
 <85f699d4-459a-a319-0a8f-96c87d345c49@redhat.com>
 <BABD09DC-217E-4F00-9C05-74ABB4B1E13D@vmware.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <5e0e0659-5f70-2162-96be-5fcd0d3f46ad@redhat.com>
Date: Wed, 1 Apr 2020 11:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <BABD09DC-217E-4F00-9C05-74ABB4B1E13D@vmware.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "pagupta@redhat.com" <pagupta@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "mojha@codeaurora.org" <mojha@codeaurora.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LKML <linux-kernel@vger.kernel.org>, Hui Zhu <teawaterz@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hui Zhu <teawater@gmail.com>
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

T24gMzEuMDMuMjAgMTg6MzcsIE5hZGF2IEFtaXQgd3JvdGU6Cj4+IE9uIE1hciAzMSwgMjAyMCwg
YXQgNzowOSBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAzMS4wMy4yMCAxNjowNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4gT24g
VHVlLCBNYXIgMzEsIDIwMjAgYXQgMDQ6MDM6MThQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6Cj4+Pj4gT24gMzEuMDMuMjAgMTU6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gT24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMDM6MzI6MDVQTSArMDIwMCwgRGF2aWQgSGls
ZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+PiBPbiAzMS4wMy4yMCAxNToyNCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+Pj4+Pj4+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEyOjM1OjI0UE0gKzAy
MDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyNi4wMy4yMCAxMDo0OSwg
TWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gVGh1LCBNYXIgMjYsIDIwMjAg
YXQgMDg6NTQ6MDRBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+Pj4+
IEFtIDI2LjAzLjIwMjAgdW0gMDg6MjEgc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPjoKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4g77u/T24gVGh1LCBNYXIgMTIsIDIw
MjAgYXQgMDk6NTE6MjVBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+
Pj4+Pj4gT24gMTIuMDMuMjAgMDk6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4+
Pj4+Pj4+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAwOTozNzozMkFNICswMTAwLCBEYXZpZCBI
aWxkZW5icmFuZCB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4gMi4gWW91IGFyZSBlc3NlbnRpYWxseSBz
dGVhbGluZyBUSFBzIGluIHRoZSBndWVzdC4gU28gdGhlIGZhc3Rlc3QKPj4+Pj4+Pj4+Pj4+Pj4g
bWFwcGluZyAoVEhQIGluIGd1ZXN0IGFuZCBob3N0KSBpcyBnb25lLiBUaGUgZ3Vlc3Qgd29uJ3Qg
YmUgYWJsZSB0byBtYWtlCj4+Pj4+Pj4+Pj4+Pj4+IHVzZSBvZiBUSFAgd2hlcmUgaXQgcHJldmlv
dXNseSB3YXMgYWJsZSB0by4gSSBjYW4gaW1hZ2luZSB0aGlzIGltcGxpZXMgYQo+Pj4+Pj4+Pj4+
Pj4+PiBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Igc29tZSB3b3JrbG9hZHMuIFRoaXMgbmVl
ZHMgYSBwcm9wZXIKPj4+Pj4+Pj4+Pj4+Pj4gcGVyZm9ybWFuY2UgZXZhbHVhdGlvbi4KPj4+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9yZSB3aXRoIHRo
ZSBhbGxvY19wYWdlcyBBUEkuCj4+Pj4+Pj4+Pj4+Pj4gVGhhdCBnaXZlcyB5b3UgZXhhY3RseSB0
aGUgZ2l2ZW4gb3JkZXIsIGFuZCBpZiB0aGVyZSdzCj4+Pj4+Pj4+Pj4+Pj4gYSBsYXJnZXIgY2h1
bmsgYXZhaWxhYmxlLCBpdCB3aWxsIHNwbGl0IGl0IHVwLgo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+Pj4gQnV0IGZvciBiYWxsb29uIC0gSSBzdXNwZWN0IGxvdHMgb2Ygb3RoZXIgdXNlcnMsCj4+
Pj4+Pj4+Pj4+Pj4gd2UgZG8gbm90IHdhbnQgdG8gc3RyZXNzIHRoZSBzeXN0ZW0gYnV0IGlmIGEg
bGFyZ2UKPj4+Pj4+Pj4+Pj4+PiBjaHVuayBpcyBhdmFpbGFibGUgYW55d2F5LCB0aGVuIHdlIGNv
dWxkIGhhbmRsZQo+Pj4+Pj4+Pj4+Pj4+IHRoYXQgbW9yZSBvcHRpbWFsbHkgYnkgZ2V0dGluZyBp
dCBhbGwgaW4gb25lIGdvLgo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
PiBTbyBpZiB3ZSB3YW50IHRvIGFkZHJlc3MgdGhpcywgSU1ITyB0aGlzIGNhbGxzIGZvciBhIG5l
dyBBUEkuCj4+Pj4+Pj4+Pj4+Pj4gQWxvbmcgdGhlIGxpbmVzIG9mCj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+PiAgIHN0cnVjdCBwYWdlICphbGxvY19wYWdlX3JhbmdlKGdmcF90IGdmcCwgdW5z
aWduZWQgaW50IG1pbl9vcmRlciwKPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+Pj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pj4gdGhlIGlkZWEgd291bGQgdGhlbiBiZSB0byByZXR1cm4gYXQgYSBudW1iZXIg
b2YgcGFnZXMgaW4gdGhlIGdpdmVuCj4+Pj4+Pj4+Pj4+Pj4gcmFuZ2UuCj4+Pj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4+PiBXaGF0IGRvIHlvdSB0aGluaz8gV2FudCB0byB0cnkgaW1wbGVtZW50aW5n
IHRoYXQ/Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gWW91IGNhbiBqdXN0IHN0YXJ0IHdpdGgg
dGhlIGhpZ2hlc3Qgb3JkZXIgYW5kIGRlY3JlbWVudCB0aGUgb3JkZXIgdW50aWwKPj4+Pj4+Pj4+
Pj4+IHlvdXIgYWxsb2NhdGlvbiBzdWNjZWVkcyB1c2luZyBhbGxvY19wYWdlcygpLCB3aGljaCB3
b3VsZCBiZSBlbm91Z2ggZm9yCj4+Pj4+Pj4+Pj4+PiBhIGZpcnN0IHZlcnNpb24uIEF0IGxlYXN0
IEkgZG9uJ3Qgc2VlIHRoZSBpbW1lZGlhdGUgbmVlZCBmb3IgYSBuZXcKPj4+Pj4+Pj4+Pj4+IGtl
cm5lbCBBUEkuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IE9LIEkgcmVtZW1iZXIgbm93LiAgVGhl
IHByb2JsZW0gaXMgd2l0aCByZWNsYWltLiBVbmxlc3MgcmVjbGFpbSBpcwo+Pj4+Pj4+Pj4+PiBj
b21wbGV0ZWx5IGRpc2FibGVkLCBhbnkgb2YgdGhlc2UgY2FsbHMgY2FuIHNsZWVwLiBBZnRlciBp
dCB3YWtlcyB1cCwKPj4+Pj4+Pj4+Pj4gd2Ugd291bGQgbGlrZSB0byBnZXQgdGhlIGxhcmdlciBv
cmRlciB0aGF0IGhhcyBiZWNvbWUgYXZhaWxhYmxlCj4+Pj4+Pj4+Pj4+IG1lYW53aGlsZS4KPj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFllcywgYnV0IHRoYXTigJhzIGEgcHVyZSBvcHRpbWl6YXRpb24g
SU1ITy4KPj4+Pj4+Pj4+PiBTbyBJIHRoaW5rIHdlIHNob3VsZCBkbyBhIHRyaXZpYWwgaW1wbGVt
ZW50YXRpb24gZmlyc3QgYW5kIHRoZW4gc2VlIHdoYXQgd2UgZ2FpbiBmcm9tIGEgbmV3IGFsbG9j
YXRvciBBUEkuIFRoZW4gd2UgbWlnaHQgYWxzbyBiZSBhYmxlIHRvIGp1c3RpZnkgaXQgdXNpbmcg
cmVhbCBudW1iZXJzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdlbGwgaG93IGRvIHlvdSBwcm9wb3Nl
IGltcGxlbWVudCB0aGUgbmVjZXNzYXJ5IHNlbWFudGljcz8KPj4+Pj4+Pj4+IEkgdGhpbmsgd2Ug
YXJlIGJvdGggYWdyZWVkIHRoYXQgYWxsb2NfcGFnZV9yYW5nZSBpcyBtb3JlIG9yCj4+Pj4+Pj4+
PiBsZXNzIHdoYXQncyBuZWNlc3NhcnkgYW55d2F5IC0gc28gaG93IHdvdWxkIHlvdSBhcHByb3hp
bWF0ZSBpdAo+Pj4+Pj4+Pj4gb24gdG9wIG9mIGV4aXN0aW5nIEFQSXM/Cj4+Pj4+Pj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2JhbGxvb25fY29tcGFjdGlvbi5oIGIvaW5jbHVkZS9saW51
eC9iYWxsb29uX2NvbXBhY3Rpb24uaAo+Pj4+Pgo+Pj4+PiAuLi4uLgo+Pj4+Pgo+Pj4+Pgo+Pj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMgYi9tbS9iYWxsb29uX2Nv
bXBhY3Rpb24uYwo+Pj4+Pj4+PiBpbmRleCAyNmRlMDIwYWFlN2IuLjA2NzgxMGIzMjgxMyAxMDA2
NDQKPj4+Pj4+Pj4gLS0tIGEvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPj4+Pj4+Pj4gKysrIGIv
bW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPj4+Pj4+Pj4gQEAgLTExMiwyMyArMTEyLDM1IEBAIHNp
emVfdCBiYWxsb29uX3BhZ2VfbGlzdF9kZXF1ZXVlKHN0cnVjdCBiYWxsb29uX2Rldl9pbmZvICpi
X2Rldl9pbmZvLAo+Pj4+Pj4+PiBFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VfbGlzdF9k
ZXF1ZXVlKTsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gLyoKPj4+Pj4+Pj4gLSAqIGJhbGxvb25fcGFnZV9h
bGxvYyAtIGFsbG9jYXRlcyBhIG5ldyBwYWdlIGZvciBpbnNlcnRpb24gaW50byB0aGUgYmFsbG9v
bgo+Pj4+Pj4+PiAtICoJCQlwYWdlIGxpc3QuCj4+Pj4+Pj4+ICsgKiBiYWxsb29uX3BhZ2VzX2Fs
bG9jIC0gYWxsb2NhdGVzIGEgbmV3IHBhZ2UgKG9mIGF0IG1vc3QgdGhlIGdpdmVuIG9yZGVyKQo+
Pj4+Pj4+PiArICogCQkJIGZvciBpbnNlcnRpb24gaW50byB0aGUgYmFsbG9vbiBwYWdlIGxpc3Qu
Cj4+Pj4+Pj4+ICAqCj4+Pj4+Pj4+ICAqIERyaXZlciBtdXN0IGNhbGwgdGhpcyBmdW5jdGlvbiB0
byBwcm9wZXJseSBhbGxvY2F0ZSBhIG5ldyBiYWxsb29uIHBhZ2UuCj4+Pj4+Pj4+ICAqIERyaXZl
ciBtdXN0IGNhbGwgYmFsbG9vbl9wYWdlX2VucXVldWUgYmVmb3JlIGRlZmluaXRpdmVseSByZW1v
dmluZyB0aGUgcGFnZQo+Pj4+Pj4+PiAgKiBmcm9tIHRoZSBndWVzdCBzeXN0ZW0uCj4+Pj4+Pj4+
ICAqCj4+Pj4+Pj4+ICsgKiBXaWxsIGZhbGwgYmFjayB0byBzbWFsbGVyIG9yZGVycyBpZiBhbGxv
Y2F0aW9uIGZhaWxzLiBUaGUgb3JkZXIgb2YgdGhlCj4+Pj4+Pj4+ICsgKiBhbGxvY2F0ZWQgcGFn
ZSBpcyBzdG9yZWQgaW4gcGFnZS0+cHJpdmF0ZS4KPj4+Pj4+Pj4gKyAqCj4+Pj4+Pj4+ICAqIFJl
dHVybjogc3RydWN0IHBhZ2UgZm9yIHRoZSBhbGxvY2F0ZWQgcGFnZSBvciBOVUxMIG9uIGFsbG9j
YXRpb24gZmFpbHVyZS4KPj4+Pj4+Pj4gICovCj4+Pj4+Pj4+IC1zdHJ1Y3QgcGFnZSAqYmFsbG9v
bl9wYWdlX2FsbG9jKHZvaWQpCj4+Pj4+Pj4+ICtzdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlc19h
bGxvYyhpbnQgb3JkZXIpCj4+Pj4+Pj4+IHsKPj4+Pj4+Pj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9
IGFsbG9jX3BhZ2UoYmFsbG9vbl9tYXBwaW5nX2dmcF9tYXNrKCkgfAo+Pj4+Pj4+PiAtCQkJCSAg
ICAgICBfX0dGUF9OT01FTUFMTE9DIHwgX19HRlBfTk9SRVRSWSB8Cj4+Pj4+Pj4+IC0JCQkJICAg
ICAgIF9fR0ZQX05PV0FSTik7Cj4+Pj4+Pj4+IC0JcmV0dXJuIHBhZ2U7Cj4+Pj4+Pj4+ICsJc3Ry
dWN0IHBhZ2UgKnBhZ2U7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKwl3aGlsZSAob3JkZXIgPj0gMCkg
ewo+Pj4+Pj4+PiArCQlwYWdlID0gYWxsb2NfcGFnZXMoYmFsbG9vbl9tYXBwaW5nX2dmcF9tYXNr
KCkgfAo+Pj4+Pj4+PiArCQkJCSAgIF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwK
Pj4+Pj4+Pj4gKwkJCQkgICBfX0dGUF9OT1dBUk4sIG9yZGVyKTsKPj4+Pj4+Pj4gKwkJaWYgKHBh
Z2UpIHsKPj4+Pj4+Pj4gKwkJCXNldF9wYWdlX3ByaXZhdGUocGFnZSwgb3JkZXIpOwo+Pj4+Pj4+
PiArCQkJcmV0dXJuIHBhZ2U7Cj4+Pj4+Pj4+ICsJCX0KPj4+Pj4+Pj4gKwkJb3JkZXItLTsKPj4+
Pj4+Pj4gKwl9Cj4+Pj4+Pj4+ICsJcmV0dXJuIE5VTEw7Cj4+Pj4+Pj4+IH0KPj4+Pj4+Pj4gLUVY
UE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZV9hbGxvYyk7Cj4+Pj4+Pj4+ICtFWFBPUlRfU1lN
Qk9MX0dQTChiYWxsb29uX3BhZ2VzX2FsbG9jKTsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gLyoKPj4+Pj4+
Pj4gICogYmFsbG9vbl9wYWdlX2VucXVldWUgLSBpbnNlcnRzIGEgbmV3IHBhZ2UgaW50byB0aGUg
YmFsbG9vbiBwYWdlIGxpc3QuCj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgdGhpbmsgdGhpcyB3
aWxsIHRyeSB0byBpbnZva2UgZGlyZWN0IHJlY2xhaW0gZnJvbSB0aGUgZmlyc3QgaXRlcmF0aW9u
Cj4+Pj4+Pj4gdG8gZnJlZSB1cCB0aGUgbWF4IG9yZGVyLgo+Pj4+Pj4KPj4+Pj4+ICVfX0dGUF9O
T1JFVFJZOiBUaGUgVk0gaW1wbGVtZW50YXRpb24gd2lsbCB0cnkgb25seSB2ZXJ5IGxpZ2h0d2Vp
Z2h0Cj4+Pj4+PiBtZW1vcnkgZGlyZWN0IHJlY2xhaW0gdG8gZ2V0IHNvbWUgbWVtb3J5IHVuZGVy
IG1lbW9yeSBwcmVzc3VyZSAodGh1cyBpdAo+Pj4+Pj4gY2FuIHNsZWVwKS4gSXQgd2lsbCBhdm9p
ZCBkaXNydXB0aXZlIGFjdGlvbnMgbGlrZSBPT00ga2lsbGVyLgo+Pj4+Pj4KPj4+Pj4+IENlcnRh
aW5seSBnb29kIGVub3VnaCBmb3IgYSBmaXJzdCB2ZXJzaW9uIEkgd291bGQgc2F5LCBubz8KPj4+
Pj4KPj4+Pj4gRnJhbmtseSBob3cgd2VsbCB0aGF0IGJlaGF2ZXMgd291bGQgZGVwZW5kIGEgbG90
IG9uIHRoZSB3b3JrbG9hZC4KPj4+Pj4gQ2FuIHJlZ3Jlc3MganVzdCBhcyB3ZWxsLgo+Pj4+Pgo+
Pj4+PiBGb3IgdGhlIDFzdCB2ZXJzaW9uIEknZCBwcmVmZXIgc29tZXRoaW5nIHRoYXQgaXMgdGhl
IGxlYXN0IGRpc3J1cHRpdmUsCj4+Pj4+IGFuZCB0aGF0IElNSE8gbWVhbnMgd2Ugb25seSB0cmln
Z2VyIHJlY2xhaW0gYXQgYWxsIGluIHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24KPj4+Pj4gYXMgbm93
IC0gd2hlbiB3ZSBjYW4ndCBzYXRpc2Z5IHRoZSBsb3dlc3Qgb3JkZXIgYWxsb2NhdGlvbi4KPj4+
Pgo+Pj4+IEFncmVlZC4KPj4+Pgo+Pj4+PiBBbnl0aGluZyBlbHNlIHdvdWxkIGJlIGEgaHVnZSBh
bW91bnQgb2YgdGVzdGluZyB3aXRoIGFsbCBraW5kIG9mCj4+Pj4+IHdvcmtsb2Fkcy4KPj4+Pgo+
Pj4+IFNvIGRvaW5nIGEgIiYgfl9fR0ZQX1JFQ0xBSU0iIGluIGNhc2Ugb3JkZXIgPiAwPyAoYXMg
ZG9uZSBpbgo+Pj4+IEdGUF9UUkFOU0hVR0VfTElHSFQpCj4+Pgo+Pj4gVGhhdCB3aWxsIGltcHJv
dmUgdGhlIHNpdHVhdGlvbiB3aGVuIHJlY2xhaW0gaXMgbm90IG5lZWRlZCwgYnV0IGxlYXZlCj4+
PiB0aGUgcHJvYmxlbSBpbiBwbGFjZSBmb3Igd2hlbiBpdCdzIG5lZWRlZDogaWYgcmVjbGFpbSBk
b2VzIHRyaWdnZXIsIHdlCj4+PiBjYW4gZ2V0IGEgaHVnZSBmcmVlIHBhZ2UgYW5kIGltbWVkaWF0
ZWx5IGJyZWFrIGl0IHVwLgo+Pj4KPj4+IFNvIGl0J3Mgb2sgYXMgYSBmaXJzdCBzdGVwIGJ1dCBp
dCB3aWxsIG1ha2UgdGhlIHNlY29uZCBzdGVwIGhhcmRlciBhcwo+Pj4gd2UnbGwgbmVlZCB0byB0
ZXN0IHdpdGggcmVjbGFpbSA6KS4KPj4KPj4gSSBleHBlY3QgdGhlIHdob2xlICJzdGVhbCBodWdl
IHBhZ2VzIGZyb20geW91ciBndWVzdCIgdG8gYmUgcHJvYmxlbWF0aWMsCj4+IGFzIEkgYWxyZWFk
eSBtZW50aW9uZWQgdG8gQWxleC4gVGhpcyBuZWVkcyBhIHBlcmZvcm1hbmNlIGV2YWx1YXRpb24u
Cj4+Cj4+IFRoaXMgYWxsIHNtZWxscyBsaWtlIGEgbG90IG9mIHdvcmtsb2FkIGRlcGVuZGVudCBm
aW5lLXR1bmluZy4gOikKPiAKPiBBRkFJSyB0aGUgaGFyZHdhcmUgb3ZlcmhlYWRzIG9mIGtlZXBp
bmcgaHVnZS1wYWdlcyBpbiB0aGUgZ3Vlc3QgYW5kIGJhY2tpbmcKPiB0aGVtIHdpdGggNEtCIHBh
Z2VzIGFyZSBub24tbmVnbGlnaWJsZS4gRGlkIHlvdSB0YWtlIHRob3NlIGludG8gYWNjb3VudD8K
Ck9mIGNvdXJzZSwgdGhlIGZhc3Rlc3QgbWFwcGluZyB3aWxsIGJlIGh1Z2UgcGFnZXMgaW4gaG9z
dCBhbmQgZ3Vlc3QuCkhhdmluZyBodWdlIHBhZ2VzIGluIHlvdXIgZ3Vlc3QgYnV0IG5vdCBpbiB5
b3VyIGhvc3QgY2Fubm90IHJlYWxseSBiZQpzb2x2ZWQgdXNpbmcgYmFsbG9vbmluZyBBRkFJS3Mu
IEhvcGVmdWxseSBUSFAgaW4gdGhlIGhvc3Qgd2lsbCBiZSBkb2luZwppdHMgam9iIHByb3Blcmx5
IDopCgouLi4gaG93ZXZlciwgc28gZmFyLCB3ZSBoYXZlbid0IGRvbmUgYW55IHBlcmZvcm1hbmNl
IGNvbXBhcmlzb25zIGF0IGFsbC4KVGhlIG9ubHkgbnVtYmVycyBmcm9tIEh1aSBaaHUgdGhhdCBJ
IGNhbiBzcG90IGFyZSBudW1iZXIgb2YgVEhQIGluIHRoZQpob3N0LCB3aGljaCBpcyBub3QgcmVh
bGx5IGV4cHJlc3NpbmcgYWN0dWFsIGd1ZXN0IHBlcmZvcm1hbmNlIElNSE8uIFRoYXQKZGVmaW5p
dGVseSBoYXMgdG8gYmUgZG9uZSB0byBldmFsdWF0ZSB0aGUgZGlmZmVyZW50IG9wdGltaXphdGlv
bnMgd2UKbWlnaHQgd2FudCB0byB0cnkgb3V0LgoKLS0gClRoYW5rcywKCkRhdmlkIC8gZGhpbGRl
bmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
