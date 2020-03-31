Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9D19981F
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:07:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 666B981F85;
	Tue, 31 Mar 2020 14:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjtwVtKF-Ho8; Tue, 31 Mar 2020 14:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4E91815B5;
	Tue, 31 Mar 2020 14:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FFD5C07FF;
	Tue, 31 Mar 2020 14:07:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 301C3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 163C281F85
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNvYzHLHGoBQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 27D41815B5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585663639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtErzcoM7afpPuWAmYNyKjwkbHkmP1wrlJah8ZVehyM=;
 b=O/6nueiKd9r+mECQ+9cI11sd9/deRfvJa/HfUQCwDJhWBxf5vAQcNKOa8Z7+TZmipNinCh
 tmIEPz2z6VmIQd63Sd4uNIFnOpj6c/fqEsW9opiih62kq5jqsDNGjolGvKjxgs2+VdmI7J
 oqGdccqwBJ4AbVRwnFmA0n4vyORVI2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-3_zv_ImjPc-Azt6kl8hX8g-1; Tue, 31 Mar 2020 10:07:16 -0400
X-MC-Unique: 3_zv_ImjPc-Azt6kl8hX8g-1
Received: by mail-wm1-f72.google.com with SMTP id e16so506134wmh.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 07:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mtErzcoM7afpPuWAmYNyKjwkbHkmP1wrlJah8ZVehyM=;
 b=WP3W7Yf1ZgpBz5a19++YvJiTTYHLUIUl2baOG2M811GddJ7t57fhamLd9HDXsxW7KE
 Bpl4g3uU6RF0GRlyLxwyMSAODfOp4oaufzOSqLSLt429ojIWBGcWKL7QMSDxu07oXhXB
 GgvP34gOdwUoob8CWs2NGPcJu27du5EOwJEY8lOaHWwnNaHvUVTrXSTdqeruEVTJPEzc
 lIi3PxIPlNTSZalwYGyKba75OCi68NKoiRu+qyjtkfQQrPLD4imyNiG6NLoB1trKz7x7
 Xp4v/0wSW1TwXbsSjB8rXNP9Ypmjr0JYy+3jizZulmWYfE7I+D8BEnsvmHEvQ14Z7eT/
 t2Zg==
X-Gm-Message-State: ANhLgQ0hQw0LLluM8IfIzwKEDEq0iq3WVt/9BPIfguaLQr0GyVVJUQqU
 o7l2bCJK300HuF/dzZ4figKvyYvMXf3vr7aFZ/jGrSVqL/kXNhuosgT5AXHBigofAdxw9M2ASEP
 Qhc6/gVuCj5VJkhKwtXzv1z7gvZZOLCS21lFAT4GVfQ==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr3712848wmf.160.1585663634564; 
 Tue, 31 Mar 2020 07:07:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvunAjTTWpk3eEB7o8y8hawt8FeOLm0WnVg1qsVj8zmmbE1v+hESAXRtWS1ID2NUECm449Ccw==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr3712744wmf.160.1585663633292; 
 Tue, 31 Mar 2020 07:07:13 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w9sm29228802wrk.18.2020.03.31.07.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:07:09 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:07:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200331100359-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMDQ6MDM6MThQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMzEuMDMuMjAgMTU6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
PiA+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDAzOjMyOjA1UE0gKzAyMDAsIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+ID4+IE9uIDMxLjAzLjIwIDE1OjI0LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPj4+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEyOjM1OjI0UE0gKzAyMDAsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4gT24gMjYuMDMuMjAgMTA6NDksIE1pY2hhZWwg
Uy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+PiBPbiBUaHUsIE1hciAyNiwgMjAyMCBhdCAwODo1NDow
NEFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+
Pj4+Pj4+IEFtIDI2LjAzLjIwMjAgdW0gMDg6MjEgc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4g
PG1zdEByZWRoYXQuY29tPjoKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiDvu79PbiBUaHUsIE1hciAxMiwg
MjAyMCBhdCAwOTo1MToyNUFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+Pj4+
Pj4+Pj4gT24gMTIuMDMuMjAgMDk6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+
Pj4+Pj4gT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6Mzc6MzJBTSArMDEwMCwgRGF2aWQgSGls
ZGVuYnJhbmQgd3JvdGU6Cj4gPj4+Pj4+Pj4+PiAyLiBZb3UgYXJlIGVzc2VudGlhbGx5IHN0ZWFs
aW5nIFRIUHMgaW4gdGhlIGd1ZXN0LiBTbyB0aGUgZmFzdGVzdAo+ID4+Pj4+Pj4+Pj4gbWFwcGlu
ZyAoVEhQIGluIGd1ZXN0IGFuZCBob3N0KSBpcyBnb25lLiBUaGUgZ3Vlc3Qgd29uJ3QgYmUgYWJs
ZSB0byBtYWtlCj4gPj4+Pj4+Pj4+PiB1c2Ugb2YgVEhQIHdoZXJlIGl0IHByZXZpb3VzbHkgd2Fz
IGFibGUgdG8uIEkgY2FuIGltYWdpbmUgdGhpcyBpbXBsaWVzIGEKPiA+Pj4+Pj4+Pj4+IHBlcmZv
cm1hbmNlIGRlZ3JhZGF0aW9uIGZvciBzb21lIHdvcmtsb2Fkcy4gVGhpcyBuZWVkcyBhIHByb3Bl
cgo+ID4+Pj4+Pj4+Pj4gcGVyZm9ybWFuY2UgZXZhbHVhdGlvbi4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4gSSB0aGluayB0aGUgcHJvYmxlbSBpcyBtb3JlIHdpdGggdGhlIGFsbG9jX3BhZ2VzIEFQ
SS4KPiA+Pj4+Pj4+Pj4gVGhhdCBnaXZlcyB5b3UgZXhhY3RseSB0aGUgZ2l2ZW4gb3JkZXIsIGFu
ZCBpZiB0aGVyZSdzCj4gPj4+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQgd2ls
bCBzcGxpdCBpdCB1cC4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gQnV0IGZvciBiYWxsb29uIC0g
SSBzdXNwZWN0IGxvdHMgb2Ygb3RoZXIgdXNlcnMsCj4gPj4+Pj4+Pj4+IHdlIGRvIG5vdCB3YW50
IHRvIHN0cmVzcyB0aGUgc3lzdGVtIGJ1dCBpZiBhIGxhcmdlCj4gPj4+Pj4+Pj4+IGNodW5rIGlz
IGF2YWlsYWJsZSBhbnl3YXksIHRoZW4gd2UgY291bGQgaGFuZGxlCj4gPj4+Pj4+Pj4+IHRoYXQg
bW9yZSBvcHRpbWFsbHkgYnkgZ2V0dGluZyBpdCBhbGwgaW4gb25lIGdvLgo+ID4+Pj4+Pj4+Pgo+
ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBTbyBpZiB3ZSB3YW50IHRvIGFkZHJlc3MgdGhpcywgSU1I
TyB0aGlzIGNhbGxzIGZvciBhIG5ldyBBUEkuCj4gPj4+Pj4+Pj4+IEFsb25nIHRoZSBsaW5lcyBv
Zgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiAgICBzdHJ1Y3QgcGFnZSAqYWxsb2NfcGFnZV9yYW5n
ZShnZnBfdCBnZnAsIHVuc2lnbmVkIGludCBtaW5fb3JkZXIsCj4gPj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+
ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiB0aGUgaWRlYSB3b3VsZCB0aGVuIGJlIHRvIHJldHVybiBh
dCBhIG51bWJlciBvZiBwYWdlcyBpbiB0aGUgZ2l2ZW4KPiA+Pj4+Pj4+Pj4gcmFuZ2UuCj4gPj4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rPyBXYW50IHRvIHRyeSBpbXBsZW1l
bnRpbmcgdGhhdD8KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IFlvdSBjYW4ganVzdCBzdGFydCB3aXRo
IHRoZSBoaWdoZXN0IG9yZGVyIGFuZCBkZWNyZW1lbnQgdGhlIG9yZGVyIHVudGlsCj4gPj4+Pj4+
Pj4geW91ciBhbGxvY2F0aW9uIHN1Y2NlZWRzIHVzaW5nIGFsbG9jX3BhZ2VzKCksIHdoaWNoIHdv
dWxkIGJlIGVub3VnaCBmb3IKPiA+Pj4+Pj4+PiBhIGZpcnN0IHZlcnNpb24uIEF0IGxlYXN0IEkg
ZG9uJ3Qgc2VlIHRoZSBpbW1lZGlhdGUgbmVlZCBmb3IgYSBuZXcKPiA+Pj4+Pj4+PiBrZXJuZWwg
QVBJLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IE9LIEkgcmVtZW1iZXIgbm93LiAgVGhlIHByb2JsZW0g
aXMgd2l0aCByZWNsYWltLiBVbmxlc3MgcmVjbGFpbSBpcwo+ID4+Pj4+Pj4gY29tcGxldGVseSBk
aXNhYmxlZCwgYW55IG9mIHRoZXNlIGNhbGxzIGNhbiBzbGVlcC4gQWZ0ZXIgaXQgd2FrZXMgdXAs
Cj4gPj4+Pj4+PiB3ZSB3b3VsZCBsaWtlIHRvIGdldCB0aGUgbGFyZ2VyIG9yZGVyIHRoYXQgaGFz
IGJlY29tZSBhdmFpbGFibGUKPiA+Pj4+Pj4+IG1lYW53aGlsZS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+
Cj4gPj4+Pj4+IFllcywgYnV0IHRoYXTigJhzIGEgcHVyZSBvcHRpbWl6YXRpb24gSU1ITy4KPiA+
Pj4+Pj4gU28gSSB0aGluayB3ZSBzaG91bGQgZG8gYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZp
cnN0IGFuZCB0aGVuIHNlZSB3aGF0IHdlIGdhaW4gZnJvbSBhIG5ldyBhbGxvY2F0b3IgQVBJLiBU
aGVuIHdlIG1pZ2h0IGFsc28gYmUgYWJsZSB0byBqdXN0aWZ5IGl0IHVzaW5nIHJlYWwgbnVtYmVy
cy4KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFdlbGwgaG93IGRvIHlvdSBwcm9wb3NlIGltcGxl
bWVudCB0aGUgbmVjZXNzYXJ5IHNlbWFudGljcz8KPiA+Pj4+PiBJIHRoaW5rIHdlIGFyZSBib3Ro
IGFncmVlZCB0aGF0IGFsbG9jX3BhZ2VfcmFuZ2UgaXMgbW9yZSBvcgo+ID4+Pj4+IGxlc3Mgd2hh
dCdzIG5lY2Vzc2FyeSBhbnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRlIGl0Cj4g
Pj4+Pj4gb24gdG9wIG9mIGV4aXN0aW5nIEFQSXM/Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24uaCBiL2luY2x1ZGUvbGludXgvYmFsbG9vbl9jb21w
YWN0aW9uLmgKPiA+IAo+ID4gLi4uLi4KPiA+IAo+ID4gCj4gPj4+PiBkaWZmIC0tZ2l0IGEvbW0v
YmFsbG9vbl9jb21wYWN0aW9uLmMgYi9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+ID4+Pj4gaW5k
ZXggMjZkZTAyMGFhZTdiLi4wNjc4MTBiMzI4MTMgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9tbS9iYWxs
b29uX2NvbXBhY3Rpb24uYwo+ID4+Pj4gKysrIGIvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPiA+
Pj4+IEBAIC0xMTIsMjMgKzExMiwzNSBAQCBzaXplX3QgYmFsbG9vbl9wYWdlX2xpc3RfZGVxdWV1
ZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbywKPiA+Pj4+ICBFWFBPUlRfU1lN
Qk9MX0dQTChiYWxsb29uX3BhZ2VfbGlzdF9kZXF1ZXVlKTsKPiA+Pj4+ICAKPiA+Pj4+ICAvKgo+
ID4+Pj4gLSAqIGJhbGxvb25fcGFnZV9hbGxvYyAtIGFsbG9jYXRlcyBhIG5ldyBwYWdlIGZvciBp
bnNlcnRpb24gaW50byB0aGUgYmFsbG9vbgo+ID4+Pj4gLSAqCQkJcGFnZSBsaXN0Lgo+ID4+Pj4g
KyAqIGJhbGxvb25fcGFnZXNfYWxsb2MgLSBhbGxvY2F0ZXMgYSBuZXcgcGFnZSAob2YgYXQgbW9z
dCB0aGUgZ2l2ZW4gb3JkZXIpCj4gPj4+PiArICogCQkJIGZvciBpbnNlcnRpb24gaW50byB0aGUg
YmFsbG9vbiBwYWdlIGxpc3QuCj4gPj4+PiAgICoKPiA+Pj4+ICAgKiBEcml2ZXIgbXVzdCBjYWxs
IHRoaXMgZnVuY3Rpb24gdG8gcHJvcGVybHkgYWxsb2NhdGUgYSBuZXcgYmFsbG9vbiBwYWdlLgo+
ID4+Pj4gICAqIERyaXZlciBtdXN0IGNhbGwgYmFsbG9vbl9wYWdlX2VucXVldWUgYmVmb3JlIGRl
ZmluaXRpdmVseSByZW1vdmluZyB0aGUgcGFnZQo+ID4+Pj4gICAqIGZyb20gdGhlIGd1ZXN0IHN5
c3RlbS4KPiA+Pj4+ICAgKgo+ID4+Pj4gKyAqIFdpbGwgZmFsbCBiYWNrIHRvIHNtYWxsZXIgb3Jk
ZXJzIGlmIGFsbG9jYXRpb24gZmFpbHMuIFRoZSBvcmRlciBvZiB0aGUKPiA+Pj4+ICsgKiBhbGxv
Y2F0ZWQgcGFnZSBpcyBzdG9yZWQgaW4gcGFnZS0+cHJpdmF0ZS4KPiA+Pj4+ICsgKgo+ID4+Pj4g
ICAqIFJldHVybjogc3RydWN0IHBhZ2UgZm9yIHRoZSBhbGxvY2F0ZWQgcGFnZSBvciBOVUxMIG9u
IGFsbG9jYXRpb24gZmFpbHVyZS4KPiA+Pj4+ICAgKi8KPiA+Pj4+IC1zdHJ1Y3QgcGFnZSAqYmFs
bG9vbl9wYWdlX2FsbG9jKHZvaWQpCj4gPj4+PiArc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZXNf
YWxsb2MoaW50IG9yZGVyKQo+ID4+Pj4gIHsKPiA+Pj4+IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSBh
bGxvY19wYWdlKGJhbGxvb25fbWFwcGluZ19nZnBfbWFzaygpIHwKPiA+Pj4+IC0JCQkJICAgICAg
IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPiA+Pj4+IC0JCQkJICAgICAgIF9f
R0ZQX05PV0FSTik7Cj4gPj4+PiAtCXJldHVybiBwYWdlOwo+ID4+Pj4gKwlzdHJ1Y3QgcGFnZSAq
cGFnZTsKPiA+Pj4+ICsKPiA+Pj4+ICsJd2hpbGUgKG9yZGVyID49IDApIHsKPiA+Pj4+ICsJCXBh
Z2UgPSBhbGxvY19wYWdlcyhiYWxsb29uX21hcHBpbmdfZ2ZwX21hc2soKSB8Cj4gPj4+PiArCQkJ
CSAgIF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPiA+Pj4+ICsJCQkJICAgX19H
RlBfTk9XQVJOLCBvcmRlcik7Cj4gPj4+PiArCQlpZiAocGFnZSkgewo+ID4+Pj4gKwkJCXNldF9w
YWdlX3ByaXZhdGUocGFnZSwgb3JkZXIpOwo+ID4+Pj4gKwkJCXJldHVybiBwYWdlOwo+ID4+Pj4g
KwkJfQo+ID4+Pj4gKwkJb3JkZXItLTsKPiA+Pj4+ICsJfQo+ID4+Pj4gKwlyZXR1cm4gTlVMTDsK
PiA+Pj4+ICB9Cj4gPj4+PiAtRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlX2FsbG9jKTsK
PiA+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VzX2FsbG9jKTsKPiA+Pj4+ICAK
PiA+Pj4+ICAvKgo+ID4+Pj4gICAqIGJhbGxvb25fcGFnZV9lbnF1ZXVlIC0gaW5zZXJ0cyBhIG5l
dyBwYWdlIGludG8gdGhlIGJhbGxvb24gcGFnZSBsaXN0Lgo+ID4+Pgo+ID4+Pgo+ID4+PiBJIHRo
aW5rIHRoaXMgd2lsbCB0cnkgdG8gaW52b2tlIGRpcmVjdCByZWNsYWltIGZyb20gdGhlIGZpcnN0
IGl0ZXJhdGlvbgo+ID4+PiB0byBmcmVlIHVwIHRoZSBtYXggb3JkZXIuCj4gPj4KPiA+PiAlX19H
RlBfTk9SRVRSWTogVGhlIFZNIGltcGxlbWVudGF0aW9uIHdpbGwgdHJ5IG9ubHkgdmVyeSBsaWdo
dHdlaWdodAo+ID4+IG1lbW9yeSBkaXJlY3QgcmVjbGFpbSB0byBnZXQgc29tZSBtZW1vcnkgdW5k
ZXIgbWVtb3J5IHByZXNzdXJlICh0aHVzIGl0Cj4gPj4gY2FuIHNsZWVwKS4gSXQgd2lsbCBhdm9p
ZCBkaXNydXB0aXZlIGFjdGlvbnMgbGlrZSBPT00ga2lsbGVyLgo+ID4+Cj4gPj4gQ2VydGFpbmx5
IGdvb2QgZW5vdWdoIGZvciBhIGZpcnN0IHZlcnNpb24gSSB3b3VsZCBzYXksIG5vPwo+ID4gCj4g
PiBGcmFua2x5IGhvdyB3ZWxsIHRoYXQgYmVoYXZlcyB3b3VsZCBkZXBlbmQgYSBsb3Qgb24gdGhl
IHdvcmtsb2FkLgo+ID4gQ2FuIHJlZ3Jlc3MganVzdCBhcyB3ZWxsLgo+ID4gCj4gPiBGb3IgdGhl
IDFzdCB2ZXJzaW9uIEknZCBwcmVmZXIgc29tZXRoaW5nIHRoYXQgaXMgdGhlIGxlYXN0IGRpc3J1
cHRpdmUsCj4gPiBhbmQgdGhhdCBJTUhPIG1lYW5zIHdlIG9ubHkgdHJpZ2dlciByZWNsYWltIGF0
IGFsbCBpbiB0aGUgc2FtZSBjb25maWd1cmF0aW9uCj4gPiBhcyBub3cgLSB3aGVuIHdlIGNhbid0
IHNhdGlzZnkgdGhlIGxvd2VzdCBvcmRlciBhbGxvY2F0aW9uLgo+IAo+IEFncmVlZC4KPiAKPiA+
IAo+ID4gQW55dGhpbmcgZWxzZSB3b3VsZCBiZSBhIGh1Z2UgYW1vdW50IG9mIHRlc3Rpbmcgd2l0
aCBhbGwga2luZCBvZgo+ID4gd29ya2xvYWRzLgo+ID4gCj4gCj4gU28gZG9pbmcgYSAiJiB+X19H
RlBfUkVDTEFJTSIgaW4gY2FzZSBvcmRlciA+IDA/IChhcyBkb25lIGluCj4gR0ZQX1RSQU5TSFVH
RV9MSUdIVCkKClRoYXQgd2lsbCBpbXByb3ZlIHRoZSBzaXR1YXRpb24gd2hlbiByZWNsYWltIGlz
IG5vdCBuZWVkZWQsIGJ1dCBsZWF2ZQp0aGUgcHJvYmxlbSBpbiBwbGFjZSBmb3Igd2hlbiBpdCdz
IG5lZWRlZDogaWYgcmVjbGFpbSBkb2VzIHRyaWdnZXIsIHdlCmNhbiBnZXQgYSBodWdlIGZyZWUg
cGFnZSBhbmQgaW1tZWRpYXRlbHkgYnJlYWsgaXQgdXAuCgpTbyBpdCdzIG9rIGFzIGEgZmlyc3Qg
c3RlcCBidXQgaXQgd2lsbCBtYWtlIHRoZSBzZWNvbmQgc3RlcCBoYXJkZXIgYXMKd2UnbGwgbmVl
ZCB0byB0ZXN0IHdpdGggcmVjbGFpbSA6KS4KCgo+IC0tIAo+IFRoYW5rcywKPiAKPiBEYXZpZCAv
IGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
