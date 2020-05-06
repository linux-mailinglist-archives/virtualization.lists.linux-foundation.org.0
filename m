Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55B1C6635
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 05:14:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C33A187681;
	Wed,  6 May 2020 03:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmqBlPUvesJ1; Wed,  6 May 2020 03:14:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60947876A6;
	Wed,  6 May 2020 03:14:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D479C0859;
	Wed,  6 May 2020 03:14:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49815C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 03:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E8B985EC4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 03:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELoOhqhl0o1C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 03:14:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E4B3C85E83
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 03:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588734884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjz45BVF6T5sMebPlQMTFgFYAhbinpFhZsVFs3iz1J0=;
 b=TtOwom0mH1W4L3vF+8Az7/Lh5q9gwllxkNv/Ci+x+R6dGt9vC+shDwvrGHmp1hh9sdgrTn
 cYKbnYLYIdTgrDs5ToLj/lR4nY2aR/B4lDf0EG7cqUtDg8E/tjhG6GwIX++HN025j3YH5o
 56S/j8TZr39mCsxGyvdix/++yhrGkhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-fGADfY5VMyWR8_3xGFvimA-1; Tue, 05 May 2020 23:14:40 -0400
X-MC-Unique: fGADfY5VMyWR8_3xGFvimA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 246F5107ACCA;
 Wed,  6 May 2020 03:14:39 +0000 (UTC)
Received: from [10.72.13.50] (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A49E264429;
 Wed,  6 May 2020 03:14:31 +0000 (UTC)
Subject: Re: [PATCH 0/1] Add uvirtio for testing
To: lepton <ytht.net@gmail.com>
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
 <CALqoU4yK3ffLJDQ8GcEdoGM8XPGLF7u0skdNN1gii9qa7UeFDw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a7572f21-9f59-2d32-2a37-bd551a6bf762@redhat.com>
Date: Wed, 6 May 2020 11:14:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALqoU4yK3ffLJDQ8GcEdoGM8XPGLF7u0skdNN1gii9qa7UeFDw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNC8zMCDkuIrljYgxMTo1NiwgbGVwdG9uIHdyb3RlOgo+IE9uIFdlZCwgQXByIDI5
LCAyMDIwIGF0IDI6NTcgQU0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIDIwMjAvNC8yOSDkuIrljYg0OjQ3LCBMZXB0b24gV3Ugd3JvdGU6Cj4+PiBUaGlz
IGlzIGEgd2F5IHRvIGNyZWF0ZSB2aXJ0aW8gYmFzZWQgZGV2aWNlcyBmcm9tIHVzZXIgc3BhY2Uu
IFRoaXMgaXMgdGhlCj4+PiBiYWNrZ3JvdW5kIGZvciB0aGlzIHBhdGNoOgo+Pj4KPj4+IFdlIGhh
dmUgc29tZSBpbWFnZXMgd29ya3MgZmluZSB1bmRlciBxZW11LCB3ZSdkIGxpa2UgdG8gYWxzbyBy
dW4gdGhlIHNhbWUgaW1hZ2UKPj4+IG9uIEdvb2dsZSBDbG91ZC4gQ3VycmVudGx5IEdvb2dsZSBD
bG91ZCBkb2Vzbid0IHN1cHBvcnQgdmlydGlvLXZnYS4gSSBoYWQgYQo+Pj4gcGF0Y2ggdG8gY3Jl
YXRlIGEgdmlydGlvLXZnYSBmcm9tIGtlcm5lbCBkaXJlY3RseToKPj4+IGh0dHBzOi8vd3d3LnNw
aW5pY3MubmV0L2xpc3RzL2RyaS1kZXZlbC9tc2cyNDg1NzMuaHRtbAo+Pj4KPj4+IFRoZW4gSSBn
b3QgZmVlZGJhY2sgZnJvbSBHZXJkIHRoYXQgbWF5YmUgaXQncyBiZXR0ZXIgdG8gY2hhbmdlIHRo
YXQgdG8gc29tZXRoaW5nCj4+PiBsaWtlIHV2aXJ0aW8uIFNpbmNlIEkgcmVhbGx5IGRvbid0IGhh
dmUgb3RoZXIgdXNlIGNhc2VzIGZvciBub3csIEkganVzdCBpbXBsZW1lbnRlZCB0aGUgbWluaW1h
bCBzdHVmZiB3aGljaCB3b3JrIGZvciBteSB1c2UgY2FzZS4KPj4KPj4gSW50ZXJlc3RpbmcsIHNl
dmVyYWwgcXVlc3Rpb25zOgo+Pgo+PiAxKSBBcmUgeW91IGF3YXJlIG9mIHZpcnRpbyB2aG9zdC11
c2VyIGRyaXZlciBkb25lIGJ5IFVNIGd1eXM/Cj4+IChhcmNoL3VtL2RyaXZlcnMvdmlydGlvX3Vt
bC5jKSBUaGUgbWVtb3J5IHBhcnQgaXMgdHJpY2t5IGJ1dCBvdmVyYWxsCj4+IGJvdGggb2YgeW91
IGhhdmUgc2ltaWxhciB0YXJnZXQuCj4gVGhhbmtzIGZvciByZW1pbmRpbmcgbWUsIEkgd2FzIG5v
dCBhd2FyZSBvZiBpdC4gVGhlIHVzZSBjYXNlIGxvb2tzIGEKPiBsaXR0bGUgZGlmZmVyZW50OiB0
aGV5IGFyZSB0cnlpbmcgY3JlYXRlIHZpcnRpbyBkZXZpY2VzIGZvciB1c2VyIG1vZGUKPiBsaW51
eCBhbmQgaXQgY29tbXVuaWNhdGVkIHdpdGggImhvc3QiIHNpZGUuIE15IGRyaXZlciBkb2Vzbid0
IGRlcGVuZHMKPiBvbiBhbnkgSE9TVC9WTU0gc2lkZSBzdHVmZi4KCgpZZXMsIGJ1dCBhcyBJIHNh
aWQuIEV4Y2VwdCBmb3IgdGhlIG1lbW9yeSB0YWJsZSBwYXJ0LCB0aGUgcmVzdCBjb3VsZCBiZSAK
cHJvYmFibHkgcmV1c2VkPwoKVGhlIG9ubHkgZGlmZmVyZW5jZSB0byBtZSBpcyB0aGF0LCB5b3Ug
ZGV2ZWxvcCB5b3VyIG93biB1QUJJIHdoaWxlIAp2aXJ0aW9fdW1sIHVzZXMgdmhvc3QtdXNlci4K
Cgo+IEJhc2ljYWxseSB3ZSBjYW4gdXNlIGl0IHRvIGNyZWF0ZSB2aXJ0aW8KPiBkZXZpY2UgZnJv
bSBndWVzdCBpdHNlbGYuIE9yIGV2ZW4gY3JlYXRlIHZpcnRpbyBkZXZpY2Ugb24gYmFyZSBtZXRh
bC4KPj4gMikgUGF0Y2ggMSBzYWlkIGl0J3MgdXNlcnNwYWNlIHZpcnRpbyBkcml2ZXIsIHdoaWNo
IEkgdGhpbmsgaXQgaXMKPj4gYWN0dWFsbHkgInVzZXJzcGFjZSB2aXJ0aW8gZGV2aWNlIgo+IFVw
ZGF0ZWQgaW4gdmVyc2lvbiAyIG9mIHRoaXMgcGF0Y2guCj4+IDMpIE5lZWQgdG8gYmUgdmVyYm9z
ZSBvbiBob3cgdGhlIHZyaW5nIHByb2Nlc3Npbmcgd29yayBpbiB0aGUgY29tbWl0IGxvZwo+PiBv
ZiBwYXRjaCAxCj4gVXBkYXRlZC4KPj4gNCkgSSdtIGN1cmlvdXMgd2hpY2ggdGVzdGluZyB5b3Ug
d2FudCB0byBhY2NvbXBsaXNoIHRocm91Z2ggdGhpcyBuZXcKPj4gdHJhbnNwb3J0LCBJIGd1ZXNz
IHlvdSB3YW50IHRvIHRlc3QgYSBzcGVjaWZpYyB2aXJ0aW8gZHJpdmVyPwo+IEhlcmUgaXMgdGhl
IHdob2xlIHN0b3J5OiB3ZSB3YW50IHRvIHRlc3Qgb3VyIGN1c3RvbSBsaW51eCBpbWFnZS4gSW4K
PiB0aGUgcGFzdCwgd2UganVzdCB0ZXN0IG91ciBjdXN0b20gbGludXggaW1hZ2Ugd2l0aCBxZW11
IChhbmQgdmlydGlvCj4gdmdhKSwgYW5kIHJ1biBxZW11IHNlc3Npb24gb24gR29vZ2xlIENsb3Vk
LiBBcyB5b3UgY2FuIHNlZSwgdGhpcyBpcwo+IG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBhbmQgcGVy
Zm9ybWFuY2UgaHVydHMuIEFuZCBtb3JlLCB3ZSBoYXZlIGFub3RoZXIKPiB2bSBpbnNpZGUgb3Vy
IGN1c3RvbSBsaW51eCBpbWFnZS4gU28gd2Ugd2FudCB0byByZW1vdmUgdGhlIHFlbXUgbGF5ZXIs
Cj4ganVzdCBydW4gb3VyIGN1c3RvbSBsaW51eCBpbWFnZSBvbiBHb29nbGUgQ2xvdWQgZGlyZWN0
bHkuIFRoZW4gd2UgbmVlZAo+IHNvbWUga2luZCBvZiBWR0EuICBTbyBhICJkdW1teSIgdmlydGlv
IHZnYSBsb29rcyBhIGdvb2QgZml0LgoKClRoZW4gaXQncyBiZXR0ZXIgdG8gbWVudGlvbiB0aGlz
IGluIHRoZSBjb3ZlciBsZXR0ZXIuCgoKPj4gNSkgWW91IG1lbnRpb25lZCB0aGF0IHlvdSBtYXkg
d2FudCB0byBkZXZlbG9wIGNvbW11bmljYXRpb24gYmV0d2Vlbgo+PiBrZXJuZWwgYW5kIHVzZXJz
cGFjZSwgYW55IG1vcmUgZGV0YWlscyBvbiB0aGF0Pwo+IEN1cnJlbnRseSwgd2UgZG9uJ3QgaGF2
ZSBzdWNoIHVzZSBjYXNlLiBCdXQgbWF5YmUgb3RoZXJzIGNhbgo+IGZ1cnRoZXJtb3JlIHRvIGV4
dGVuZCB1dmlydGlvIGZvciB0aGlzLiBGb3IgZXhhbXBsZSwgdXNlciBzcGFjZSBjYW4KPiB1c2Ug
cmVhZC93cml0ZSB0byBhY3R1YWxseSBleGNoYW5nZSBkYXRhIHdpdGgga2VybmVsLiBUaGVuIHRo
YXQgY291bGQKPiBiZSB1c2VkIGZvciBzaW11bGF0ZSBtb3JlIGNvbXBsZXggdXNlIGNhc2UuCgoK
T0suCgpUaGFua3MKCgo+PiBUaGFua3MKPj4KPj4KPj4+IExlcHRvbiBXdSAoMSk6Cj4+PiAgICAg
dmlydGlvOiBBZGQgdXZpcnRpbyBkcml2ZXIKPj4+Cj4+PiAgICBkcml2ZXJzL3ZpcnRpby9LY29u
ZmlnICAgICAgICB8ICAgOCArCj4+PiAgICBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAgICB8
ICAgMSArCj4+PiAgICBkcml2ZXJzL3ZpcnRpby91dmlydGlvLmMgICAgICB8IDQwNSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgICBpbmNsdWRlL2xpbnV4L3V2aXJ0aW8u
aCAgICAgICB8ICAgOCArCj4+PiAgICBpbmNsdWRlL3VhcGkvbGludXgvdXZpcnRpby5oICB8ICA2
OSArKysrKysKPj4+ICAgIHNhbXBsZXMvdXZpcnRpby9NYWtlZmlsZSAgICAgIHwgICA5ICsKPj4+
ICAgIHNhbXBsZXMvdXZpcnRpby91dmlydGlvLXZnYS5jIHwgIDYzICsrKysrKwo+Pj4gICAgNyBm
aWxlcyBjaGFuZ2VkLCA1NjMgaW5zZXJ0aW9ucygrKQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdmlydGlvL3V2aXJ0aW8uYwo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvdXZpcnRpby5oCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBp
L2xpbnV4L3V2aXJ0aW8uaAo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNhbXBsZXMvdXZpcnRp
by9NYWtlZmlsZQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNhbXBsZXMvdXZpcnRpby91dmly
dGlvLXZnYS5jCj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
