Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D109199811
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:04:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DEDB688889;
	Tue, 31 Mar 2020 14:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnoptlAA6Z3X; Tue, 31 Mar 2020 14:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CE3988885;
	Tue, 31 Mar 2020 14:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00D99C07FF;
	Tue, 31 Mar 2020 14:04:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 814B3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70A458887F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34YfwRO5Lb42
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C6F88887E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585663468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9MLKi3hVsWa92fWPVaRnYiUED++tA8U3XyTe3Icms10=;
 b=erBGhYLkklvMIh7qit3oEP16ig4z/15v0TWC32ak6/Q1e98eyDovGssnHGx2gYfRvR90kn
 a2IlHVOsxVuxDo2Te9lcxOOzIBVdBsjro9CsLbH0c2QdA3G2uAw7cBJUd4UuVICx9TiEnW
 9PI30slyjNGf0XNS3rt8j5nbjr0V6/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-RcHVlwR8N-2_gfVY1LSM_Q-1; Tue, 31 Mar 2020 10:04:24 -0400
X-MC-Unique: RcHVlwR8N-2_gfVY1LSM_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2EE98010FF;
 Tue, 31 Mar 2020 14:03:32 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B9FE51331;
 Tue, 31 Mar 2020 14:03:18 +0000 (UTC)
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
Date: Tue, 31 Mar 2020 16:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331093300-mutt-send-email-mst@kernel.org>
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

T24gMzEuMDMuMjAgMTU6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBUdWUsIE1h
ciAzMSwgMjAyMCBhdCAwMzozMjowNVBNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToK
Pj4gT24gMzEuMDMuMjAgMTU6MjQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIFR1
ZSwgTWFyIDMxLCAyMDIwIGF0IDEyOjM1OjI0UE0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdy
b3RlOgo+Pj4+IE9uIDI2LjAzLjIwIDEwOjQ5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+
Pj4+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA4OjU0OjA0QU0gKzAxMDAsIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gQW0gMjYuMDMuMjAyMCB1bSAwODoy
MSBzY2hyaWViIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ogo+Pj4+Pj4+Cj4+
Pj4+Pj4g77u/T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6NTE6MjVBTSArMDEwMCwgRGF2aWQg
SGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxMi4wMy4yMCAwOTo0NywgTWljaGFlbCBT
LiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6Mzc6
MzJBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+Pj4gMi4gWW91IGFy
ZSBlc3NlbnRpYWxseSBzdGVhbGluZyBUSFBzIGluIHRoZSBndWVzdC4gU28gdGhlIGZhc3Rlc3QK
Pj4+Pj4+Pj4+PiBtYXBwaW5nIChUSFAgaW4gZ3Vlc3QgYW5kIGhvc3QpIGlzIGdvbmUuIFRoZSBn
dWVzdCB3b24ndCBiZSBhYmxlIHRvIG1ha2UKPj4+Pj4+Pj4+PiB1c2Ugb2YgVEhQIHdoZXJlIGl0
IHByZXZpb3VzbHkgd2FzIGFibGUgdG8uIEkgY2FuIGltYWdpbmUgdGhpcyBpbXBsaWVzIGEKPj4+
Pj4+Pj4+PiBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Igc29tZSB3b3JrbG9hZHMuIFRoaXMg
bmVlZHMgYSBwcm9wZXIKPj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9yZSB3aXRoIHRoZSBhbGxvY19w
YWdlcyBBUEkuCj4+Pj4+Pj4+PiBUaGF0IGdpdmVzIHlvdSBleGFjdGx5IHRoZSBnaXZlbiBvcmRl
ciwgYW5kIGlmIHRoZXJlJ3MKPj4+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQg
d2lsbCBzcGxpdCBpdCB1cC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCdXQgZm9yIGJhbGxvb24gLSBJ
IHN1c3BlY3QgbG90cyBvZiBvdGhlciB1c2VycywKPj4+Pj4+Pj4+IHdlIGRvIG5vdCB3YW50IHRv
IHN0cmVzcyB0aGUgc3lzdGVtIGJ1dCBpZiBhIGxhcmdlCj4+Pj4+Pj4+PiBjaHVuayBpcyBhdmFp
bGFibGUgYW55d2F5LCB0aGVuIHdlIGNvdWxkIGhhbmRsZQo+Pj4+Pj4+Pj4gdGhhdCBtb3JlIG9w
dGltYWxseSBieSBnZXR0aW5nIGl0IGFsbCBpbiBvbmUgZ28uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFNvIGlmIHdlIHdhbnQgdG8gYWRkcmVzcyB0aGlzLCBJTUhPIHRoaXMgY2FsbHMg
Zm9yIGEgbmV3IEFQSS4KPj4+Pj4+Pj4+IEFsb25nIHRoZSBsaW5lcyBvZgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+ICAgIHN0cnVjdCBwYWdlICphbGxvY19wYWdlX3JhbmdlKGdmcF90IGdmcCwgdW5zaWdu
ZWQgaW50IG1pbl9vcmRlciwKPj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IHRo
ZSBpZGVhIHdvdWxkIHRoZW4gYmUgdG8gcmV0dXJuIGF0IGEgbnVtYmVyIG9mIHBhZ2VzIGluIHRo
ZSBnaXZlbgo+Pj4+Pj4+Pj4gcmFuZ2UuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2hhdCBkbyB5b3Ug
dGhpbms/IFdhbnQgdG8gdHJ5IGltcGxlbWVudGluZyB0aGF0Pwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBZ
b3UgY2FuIGp1c3Qgc3RhcnQgd2l0aCB0aGUgaGlnaGVzdCBvcmRlciBhbmQgZGVjcmVtZW50IHRo
ZSBvcmRlciB1bnRpbAo+Pj4+Pj4+PiB5b3VyIGFsbG9jYXRpb24gc3VjY2VlZHMgdXNpbmcgYWxs
b2NfcGFnZXMoKSwgd2hpY2ggd291bGQgYmUgZW5vdWdoIGZvcgo+Pj4+Pj4+PiBhIGZpcnN0IHZl
cnNpb24uIEF0IGxlYXN0IEkgZG9uJ3Qgc2VlIHRoZSBpbW1lZGlhdGUgbmVlZCBmb3IgYSBuZXcK
Pj4+Pj4+Pj4ga2VybmVsIEFQSS4KPj4+Pj4+Pgo+Pj4+Pj4+IE9LIEkgcmVtZW1iZXIgbm93LiAg
VGhlIHByb2JsZW0gaXMgd2l0aCByZWNsYWltLiBVbmxlc3MgcmVjbGFpbSBpcwo+Pj4+Pj4+IGNv
bXBsZXRlbHkgZGlzYWJsZWQsIGFueSBvZiB0aGVzZSBjYWxscyBjYW4gc2xlZXAuIEFmdGVyIGl0
IHdha2VzIHVwLAo+Pj4+Pj4+IHdlIHdvdWxkIGxpa2UgdG8gZ2V0IHRoZSBsYXJnZXIgb3JkZXIg
dGhhdCBoYXMgYmVjb21lIGF2YWlsYWJsZQo+Pj4+Pj4+IG1lYW53aGlsZS4KPj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IFllcywgYnV0IHRoYXTigJhzIGEgcHVyZSBvcHRpbWl6YXRpb24gSU1ITy4KPj4+
Pj4+IFNvIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIGEgdHJpdmlhbCBpbXBsZW1lbnRhdGlvbiBmaXJz
dCBhbmQgdGhlbiBzZWUgd2hhdCB3ZSBnYWluIGZyb20gYSBuZXcgYWxsb2NhdG9yIEFQSS4gVGhl
biB3ZSBtaWdodCBhbHNvIGJlIGFibGUgdG8ganVzdGlmeSBpdCB1c2luZyByZWFsIG51bWJlcnMu
Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBXZWxsIGhvdyBkbyB5b3UgcHJvcG9zZSBpbXBsZW1lbnQgdGhl
IG5lY2Vzc2FyeSBzZW1hbnRpY3M/Cj4+Pj4+IEkgdGhpbmsgd2UgYXJlIGJvdGggYWdyZWVkIHRo
YXQgYWxsb2NfcGFnZV9yYW5nZSBpcyBtb3JlIG9yCj4+Pj4+IGxlc3Mgd2hhdCdzIG5lY2Vzc2Fy
eSBhbnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRlIGl0Cj4+Pj4+IG9uIHRvcCBv
ZiBleGlzdGluZyBBUElzPwo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JhbGxvb25f
Y29tcGFjdGlvbi5oIGIvaW5jbHVkZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24uaAo+IAo+IC4u
Li4uCj4gCj4gCj4+Pj4gZGlmZiAtLWdpdCBhL21tL2JhbGxvb25fY29tcGFjdGlvbi5jIGIvbW0v
YmFsbG9vbl9jb21wYWN0aW9uLmMKPj4+PiBpbmRleCAyNmRlMDIwYWFlN2IuLjA2NzgxMGIzMjgx
MyAxMDA2NDQKPj4+PiAtLS0gYS9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+Pj4+ICsrKyBiL21t
L2JhbGxvb25fY29tcGFjdGlvbi5jCj4+Pj4gQEAgLTExMiwyMyArMTEyLDM1IEBAIHNpemVfdCBi
YWxsb29uX3BhZ2VfbGlzdF9kZXF1ZXVlKHN0cnVjdCBiYWxsb29uX2Rldl9pbmZvICpiX2Rldl9p
bmZvLAo+Pj4+ICBFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VfbGlzdF9kZXF1ZXVlKTsK
Pj4+PiAgCj4+Pj4gIC8qCj4+Pj4gLSAqIGJhbGxvb25fcGFnZV9hbGxvYyAtIGFsbG9jYXRlcyBh
IG5ldyBwYWdlIGZvciBpbnNlcnRpb24gaW50byB0aGUgYmFsbG9vbgo+Pj4+IC0gKgkJCXBhZ2Ug
bGlzdC4KPj4+PiArICogYmFsbG9vbl9wYWdlc19hbGxvYyAtIGFsbG9jYXRlcyBhIG5ldyBwYWdl
IChvZiBhdCBtb3N0IHRoZSBnaXZlbiBvcmRlcikKPj4+PiArICogCQkJIGZvciBpbnNlcnRpb24g
aW50byB0aGUgYmFsbG9vbiBwYWdlIGxpc3QuCj4+Pj4gICAqCj4+Pj4gICAqIERyaXZlciBtdXN0
IGNhbGwgdGhpcyBmdW5jdGlvbiB0byBwcm9wZXJseSBhbGxvY2F0ZSBhIG5ldyBiYWxsb29uIHBh
Z2UuCj4+Pj4gICAqIERyaXZlciBtdXN0IGNhbGwgYmFsbG9vbl9wYWdlX2VucXVldWUgYmVmb3Jl
IGRlZmluaXRpdmVseSByZW1vdmluZyB0aGUgcGFnZQo+Pj4+ICAgKiBmcm9tIHRoZSBndWVzdCBz
eXN0ZW0uCj4+Pj4gICAqCj4+Pj4gKyAqIFdpbGwgZmFsbCBiYWNrIHRvIHNtYWxsZXIgb3JkZXJz
IGlmIGFsbG9jYXRpb24gZmFpbHMuIFRoZSBvcmRlciBvZiB0aGUKPj4+PiArICogYWxsb2NhdGVk
IHBhZ2UgaXMgc3RvcmVkIGluIHBhZ2UtPnByaXZhdGUuCj4+Pj4gKyAqCj4+Pj4gICAqIFJldHVy
bjogc3RydWN0IHBhZ2UgZm9yIHRoZSBhbGxvY2F0ZWQgcGFnZSBvciBOVUxMIG9uIGFsbG9jYXRp
b24gZmFpbHVyZS4KPj4+PiAgICovCj4+Pj4gLXN0cnVjdCBwYWdlICpiYWxsb29uX3BhZ2VfYWxs
b2Modm9pZCkKPj4+PiArc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZXNfYWxsb2MoaW50IG9yZGVy
KQo+Pj4+ICB7Cj4+Pj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IGFsbG9jX3BhZ2UoYmFsbG9vbl9t
YXBwaW5nX2dmcF9tYXNrKCkgfAo+Pj4+IC0JCQkJICAgICAgIF9fR0ZQX05PTUVNQUxMT0MgfCBf
X0dGUF9OT1JFVFJZIHwKPj4+PiAtCQkJCSAgICAgICBfX0dGUF9OT1dBUk4pOwo+Pj4+IC0JcmV0
dXJuIHBhZ2U7Cj4+Pj4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4+PiArCj4+Pj4gKwl3aGlsZSAo
b3JkZXIgPj0gMCkgewo+Pj4+ICsJCXBhZ2UgPSBhbGxvY19wYWdlcyhiYWxsb29uX21hcHBpbmdf
Z2ZwX21hc2soKSB8Cj4+Pj4gKwkJCQkgICBfX0dGUF9OT01FTUFMTE9DIHwgX19HRlBfTk9SRVRS
WSB8Cj4+Pj4gKwkJCQkgICBfX0dGUF9OT1dBUk4sIG9yZGVyKTsKPj4+PiArCQlpZiAocGFnZSkg
ewo+Pj4+ICsJCQlzZXRfcGFnZV9wcml2YXRlKHBhZ2UsIG9yZGVyKTsKPj4+PiArCQkJcmV0dXJu
IHBhZ2U7Cj4+Pj4gKwkJfQo+Pj4+ICsJCW9yZGVyLS07Cj4+Pj4gKwl9Cj4+Pj4gKwlyZXR1cm4g
TlVMTDsKPj4+PiAgfQo+Pj4+IC1FWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VfYWxsb2Mp
Owo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VzX2FsbG9jKTsKPj4+PiAgCj4+
Pj4gIC8qCj4+Pj4gICAqIGJhbGxvb25fcGFnZV9lbnF1ZXVlIC0gaW5zZXJ0cyBhIG5ldyBwYWdl
IGludG8gdGhlIGJhbGxvb24gcGFnZSBsaXN0Lgo+Pj4KPj4+Cj4+PiBJIHRoaW5rIHRoaXMgd2ls
bCB0cnkgdG8gaW52b2tlIGRpcmVjdCByZWNsYWltIGZyb20gdGhlIGZpcnN0IGl0ZXJhdGlvbgo+
Pj4gdG8gZnJlZSB1cCB0aGUgbWF4IG9yZGVyLgo+Pgo+PiAlX19HRlBfTk9SRVRSWTogVGhlIFZN
IGltcGxlbWVudGF0aW9uIHdpbGwgdHJ5IG9ubHkgdmVyeSBsaWdodHdlaWdodAo+PiBtZW1vcnkg
ZGlyZWN0IHJlY2xhaW0gdG8gZ2V0IHNvbWUgbWVtb3J5IHVuZGVyIG1lbW9yeSBwcmVzc3VyZSAo
dGh1cyBpdAo+PiBjYW4gc2xlZXApLiBJdCB3aWxsIGF2b2lkIGRpc3J1cHRpdmUgYWN0aW9ucyBs
aWtlIE9PTSBraWxsZXIuCj4+Cj4+IENlcnRhaW5seSBnb29kIGVub3VnaCBmb3IgYSBmaXJzdCB2
ZXJzaW9uIEkgd291bGQgc2F5LCBubz8KPiAKPiBGcmFua2x5IGhvdyB3ZWxsIHRoYXQgYmVoYXZl
cyB3b3VsZCBkZXBlbmQgYSBsb3Qgb24gdGhlIHdvcmtsb2FkLgo+IENhbiByZWdyZXNzIGp1c3Qg
YXMgd2VsbC4KPiAKPiBGb3IgdGhlIDFzdCB2ZXJzaW9uIEknZCBwcmVmZXIgc29tZXRoaW5nIHRo
YXQgaXMgdGhlIGxlYXN0IGRpc3J1cHRpdmUsCj4gYW5kIHRoYXQgSU1ITyBtZWFucyB3ZSBvbmx5
IHRyaWdnZXIgcmVjbGFpbSBhdCBhbGwgaW4gdGhlIHNhbWUgY29uZmlndXJhdGlvbgo+IGFzIG5v
dyAtIHdoZW4gd2UgY2FuJ3Qgc2F0aXNmeSB0aGUgbG93ZXN0IG9yZGVyIGFsbG9jYXRpb24uCgpB
Z3JlZWQuCgo+IAo+IEFueXRoaW5nIGVsc2Ugd291bGQgYmUgYSBodWdlIGFtb3VudCBvZiB0ZXN0
aW5nIHdpdGggYWxsIGtpbmQgb2YKPiB3b3JrbG9hZHMuCj4gCgpTbyBkb2luZyBhICImIH5fX0dG
UF9SRUNMQUlNIiBpbiBjYXNlIG9yZGVyID4gMD8gKGFzIGRvbmUgaW4KR0ZQX1RSQU5TSFVHRV9M
SUdIVCkKCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
