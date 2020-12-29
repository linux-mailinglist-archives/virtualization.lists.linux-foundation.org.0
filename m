Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C662E6F3A
	for <lists.virtualization@lfdr.de>; Tue, 29 Dec 2020 10:11:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83090871B3;
	Tue, 29 Dec 2020 09:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqEDx1xxSM+8; Tue, 29 Dec 2020 09:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77CCD85EA2;
	Tue, 29 Dec 2020 09:11:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D6AC0893;
	Tue, 29 Dec 2020 09:11:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CB85C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3898986D2F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kO8ywBhhe7C1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9005F86D2E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609233094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4ZbLL6gLiqu8bhAJp7vBUQdf9XdTVKfkKmlq8ZgHmE=;
 b=IHuOJTBMUM0P5glrFzUgS/Un5YjLcjSPCfP+bUkAMfWIjQS8C+dcAgVutSPnzI8FJQEB/J
 aUgWt1KIN+Y1InHXaZriCtvfFw9+iL96EQ4cpQPrk3WHL8ixg38y36C5uNfBIPr+KEBzkM
 L0wavAsq5pNuQpDxeNFrrYHkFyBFsuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-52sI5t4GNvatqdItb3kogA-1; Tue, 29 Dec 2020 04:11:30 -0500
X-MC-Unique: 52sI5t4GNvatqdItb3kogA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CACA8800D55;
 Tue, 29 Dec 2020 09:11:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AAA35D9DC;
 Tue, 29 Dec 2020 09:11:27 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 138524BB40;
 Tue, 29 Dec 2020 09:11:26 +0000 (UTC)
Date: Tue, 29 Dec 2020 04:11:08 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Message-ID: <1356137727.40748805.1609233068675.JavaMail.zimbra@redhat.com>
In-Reply-To: <CACycT3soQoX5avZiFBLEGBuJpdni6-UxdhAPGpWHBWVf+dEySg@mail.gmail.com>
References: <20201222145221.711-1-xieyongji@bytedance.com>
 <CACycT3s=m=PQb5WFoMGhz8TNGme4+=rmbbBTtrugF9ZmNnWxEw@mail.gmail.com>
 <0e6faf9c-117a-e23c-8d6d-488d0ec37412@redhat.com>
 <CACycT3uwXBYvRbKDWdN3oCekv+o6_Lc=-KTrxejD=fr-zgibGw@mail.gmail.com>
 <2b24398c-e6d9-14ec-2c0d-c303d528e377@redhat.com>
 <CACycT3uDV43ecScrMh1QVpStuwDETHykJzzY=pkmZjP2Dd2kvg@mail.gmail.com>
 <e77c97c5-6bdc-cdd0-62c0-6ff75f6dbdff@redhat.com>
 <CACycT3soQoX5avZiFBLEGBuJpdni6-UxdhAPGpWHBWVf+dEySg@mail.gmail.com>
Subject: Re: [RFC v2 09/13] vduse: Add support for processing vhost iotlb
 message
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.9]
Thread-Topic: vduse: Add support for processing vhost iotlb message
Thread-Index: OBugpafsf525DDt1uUEs5wc+oTZ2vg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: axboe@kernel.dk, corbet@lwn.net, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-aio@kvack.org,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gTW9uLCBEZWMgMjgsIDIwMjAgYXQg
NDo0MyBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPgo+
ID4gT24gMjAyMC8xMi8yOCDkuIvljYg0OjE0LCBZb25namkgWGllIHdyb3RlOgo+ID4gPj4gSSBz
ZWUuIFNvIGFsbCB0aGUgYWJvdmUgdHdvIHF1ZXN0aW9ucyBhcmUgYmVjYXVzZSBWSE9TVF9JT1RM
Ql9JTlZBTElEQVRFCj4gPiA+PiBpcyBleHBlY3RlZCB0byBiZSBzeW5jaHJvbm91cy4gVGhpcyBu
ZWVkIHRvIGJlIHNvbHZlZCBieSB0d2Vha2luZyB0aGUKPiA+ID4+IGN1cnJlbnQgVkRVU0UgQVBJ
IG9yIHdlIGNhbiByZS12aXNpdCB0byBnbyB3aXRoIGRlc2NyaXB0b3JzIHJlbGF5aW5nCj4gPiA+
PiBmaXJzdC4KPiA+ID4+Cj4gPiA+IEFjdHVhbGx5IGFsbCB2ZHBhIHJlbGF0ZWQgb3BlcmF0aW9u
cyBhcmUgc3luY2hyb25vdXMgaW4gY3VycmVudAo+ID4gPiBpbXBsZW1lbnRhdGlvbi4gVGhlIG9w
cy5zZXRfbWFwL2RtYV9tYXAvZG1hX3VubWFwIHNob3VsZCBub3QgcmV0dXJuCj4gPiA+IHVudGls
IHRoZSBWRFVTRV9VUERBVEVfSU9UTEIvVkRVU0VfSU5WQUxJREFURV9JT1RMQiBtZXNzYWdlIGlz
IHJlcGxpZWQKPiA+ID4gYnkgdXNlcnNwYWNlLiBDb3VsZCBpdCBzb2x2ZSB0aGlzIHByb2JsZW0/
Cj4gPgo+ID4KPiA+ICAgSSB3YXMgdGhpbmtpbmcgd2hldGhlciBvciBub3Qgd2UgbmVlZCB0byBn
ZW5lcmF0ZSBJT1RMQl9JTlZBTElEQVRFCj4gPiBtZXNzYWdlIHRvIFZEVVNFIGR1cmluZyBkbWFf
dW5tYXAgKHZkdXNlX2Rldl91bm1hcF9wYWdlKS4KPiA+Cj4gPiBJZiB3ZSBkb24ndCwgd2UncmUg
cHJvYmFibHkgZmluZS4KPiA+Cj4gCj4gSXQgc2VlbXMgbm90IGZlYXNpYmxlLiBUaGlzIG1lc3Nh
Z2Ugd2lsbCBiZSBhbHNvIHVzZWQgaW4gdGhlCj4gdmlydGlvLXZkcGEgY2FzZSB0byBub3RpZnkg
dXNlcnNwYWNlIHRvIHVubWFwIHNvbWUgcGFnZXMgZHVyaW5nCj4gY29uc2lzdGVudCBkbWEgdW5t
YXBwaW5nLiBNYXliZSB3ZSBjYW4gZG9jdW1lbnQgaXQgdG8gbWFrZSBzdXJlIHRoZQo+IHVzZXJz
IGNhbiBoYW5kbGUgdGhlIG1lc3NhZ2UgY29ycmVjdGx5LgoKSnVzdCB0byBtYWtlIHN1cmUgSSB1
bmRlcnN0YW5kIHlvdXIgcG9pbnQuCgpEbyB5b3UgbWVhbiB5b3UgcGxhbiB0byBub3RpZnkgdGhl
IHVubWFwIG9mIDEpIHN0cmVhbWluZyBETUEgb3IgMikKY29oZXJlbnQgRE1BPwoKRm9yIDEpIHlv
dSBwcm9iYWJseSBuZWVkIGEgd29ya3F1ZXVlIHRvIGRvIHRoYXQgc2luY2UgZG1hIHVubWFwIGNh
bgpiZSBkb25lIGluIGlycSBvciBiaCBjb250ZXh0LiBBbmQgaWYgdXNyc3BhY2UgZG9lcyd0IGRv
IHRoZSB1bm1hcCwgaXQKY2FuIHN0aWxsIGFjY2VzcyB0aGUgYm91bmNlIGJ1ZmZlciAoaWYgeW91
IGRvbid0IHphcCBwdGUpPwoKVGhhbmtzCgoKPiAKPiBUaGFua3MsCj4gWW9uZ2ppCj4gCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
