Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28314247F
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 08:52:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8FBF20401;
	Mon, 20 Jan 2020 07:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhbXyhl1grUK; Mon, 20 Jan 2020 07:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 109AF203FB;
	Mon, 20 Jan 2020 07:52:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA5D1C0174;
	Mon, 20 Jan 2020 07:52:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77E26C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6D9A9203AD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lF0xUOijAuS7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:52:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 4AEBD20371
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579506754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Xx+mxni9g3kJmMk8VLxLFhFg3PBDXCnjO5BOpqt3H0=;
 b=UA1QDNUVQly7XoDuWJlN9R3A3004NmgXsvNVRyerM/t6Z5+8e9aD1BJe+lvBDEOo6r6H0H
 E5TPJ6x/WD4jmIIqt65sUtMeO2vvljTkHEeDE8Ns6oHAOopUA5GztR6RvdjD7RdHG1OHzY
 oow/bWze2nCLiOGke4V/54kVvtAPCSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-Qvj0d9jqMumidG240IG4qw-1; Mon, 20 Jan 2020 02:52:33 -0500
X-MC-Unique: Qvj0d9jqMumidG240IG4qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8ABE10054E3;
 Mon, 20 Jan 2020 07:52:30 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 901428BE07;
 Mon, 20 Jan 2020 07:52:13 +0000 (UTC)
Subject: Re: [PATCH 4/5] virtio: introduce a vDPA based transport
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-5-jasowang@redhat.com>
 <20200116153807.GI20978@mellanox.com>
 <8e8aa4b7-4948-5719-9618-e28daffba1a5@redhat.com>
 <20200117140013.GV20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bff37791-9640-39e0-5e93-c905ebfb5d2b@redhat.com>
Date: Mon, 20 Jan 2020 15:52:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117140013.GV20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMDowMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZy
aSwgSmFuIDE3LCAyMDIwIGF0IDA1OjMyOjM1UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
Pj4gKwljb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4+
Pj4gKwlzdHJ1Y3QgdmlydGlvX3ZkcGFfZGV2aWNlICp2ZF9kZXY7Cj4+Pj4gKwlpbnQgcmM7Cj4+
Pj4gKwo+Pj4+ICsJdmRfZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2ZF9kZXYpLCBH
RlBfS0VSTkVMKTsKPj4+PiArCWlmICghdmRfZGV2KQo+Pj4+ICsJCXJldHVybiAtRU5PTUVNOwo+
Pj4gVGhpcyBpcyBub3QgcmlnaHQsIHRoZSBzdHJ1Y3QgZGV2aWNlIGxpZmV0aW1lIGlzIGNvbnRy
b2xlZCBieSBhIGtyZWYsCj4+PiBub3QgdmlhIGRldm0uIElmIHlvdSB3YW50IHRvIHVzZSBhIGRl
dm0gdW53aW5kIHRoZW4gdGhlIHVud2luZCBpcwo+Pj4gcHV0X2RldmljZSwgbm90IGRldm1fa2Zy
ZWUuCj4+IEknbSBub3Qgc3VyZSBJIGdldCB0aGUgcG9pbnQgaGVyZS4gVGhlIGxpZmV0aW1lIGlz
IGJvdW5kIHRvIHVuZGVybHlpbmcgdkRQQQo+PiBkZXZpY2UgYW5kIGRldnJlcyBhbGxvdyB0byBi
ZSBmcmVlZCBiZWZvcmUgdGhlIHZwZGEgZGV2aWNlIGlzIHJlbGVhc2VkLiBCdXQKPj4gSSBhZ3Jl
ZSB1c2luZyBkZXZyZXMgb2YgdW5kZXJseWluZyB2ZHBhIGRldmljZSBsb29rcyB3aXJlZC4KPiBP
bmNlIGRldmljZV9pbml0aWFsaXplIGlzIGNhbGxlZCB0aGUgb25seSB3YXkgdG8gZnJlZSBhIHN0
cnVjdCBkZXZpY2UKPiBpcyB2aWEgcHV0X2RldmljZSwgd2hpbGUgaGVyZSB5b3UgaGF2ZSBhIGRl
dm0gdHJpZ2dlciB0aGF0IHdpbGwKPiB1bmNvbmRpdGlvbmFsbHkgZG8ga2ZyZWUgb24gYSBzdHJ1
Y3QgZGV2aWNlIHdpdGhvdXQgcmVzcGVjdGluZyB0aGUKPiByZWZlcmVuY2UgY291bnQuCj4KPiBy
ZWZlcmVuY2UgY291bnRlZCBtZW1vcnkgbXVzdCBuZXZlciBiZSBhbGxvY2F0ZWQgd2l0aCBkZXZt
LgoKClJpZ2h0LCBmaXhlZC4KCgo+Cj4+Pj4gKwl2ZF9kZXYtPnZkZXYuZGV2LnJlbGVhc2UgPSB2
aXJ0aW9fdmRwYV9yZWxlYXNlX2RldjsKPj4+PiArCXZkX2Rldi0+dmRldi5jb25maWcgPSAmdmly
dGlvX3ZkcGFfY29uZmlnX29wczsKPj4+PiArCXZkX2Rldi0+dmRwYSA9IHZkcGE7Cj4+Pj4gKwlJ
TklUX0xJU1RfSEVBRCgmdmRfZGV2LT52aXJ0cXVldWVzKTsKPj4+PiArCXNwaW5fbG9ja19pbml0
KCZ2ZF9kZXYtPmxvY2spOwo+Pj4+ICsKPj4+PiArCXZkX2Rldi0+dmRldi5pZC5kZXZpY2UgPSBv
cHMtPmdldF9kZXZpY2VfaWQodmRwYSk7Cj4+Pj4gKwlpZiAodmRfZGV2LT52ZGV2LmlkLmRldmlj
ZSA9PSAwKQo+Pj4+ICsJCXJldHVybiAtRU5PREVWOwo+Pj4+ICsKPj4+PiArCXZkX2Rldi0+dmRl
di5pZC52ZW5kb3IgPSBvcHMtPmdldF92ZW5kb3JfaWQodmRwYSk7Cj4+Pj4gKwlyYyA9IHJlZ2lz
dGVyX3ZpcnRpb19kZXZpY2UoJnZkX2Rldi0+dmRldik7Cj4+Pj4gKwlpZiAocmMpCj4+Pj4gKwkJ
cHV0X2RldmljZShkZXYpOwo+Pj4gQW5kIGEgdWdseSB1bndpbmQgbGlrZSB0aGlzIGlzIHdoeSB5
b3Ugd2FudCB0byBoYXZlIGRldmljZV9pbml0aWFsaXplKCkKPj4+IGV4cG9zZWQgdG8gdGhlIGRy
aXZlciwKPj4gSW4gdGhpcyBjb250ZXh0LCB3aGljaCAiZHJpdmVyIiBkaWQgeW91IG1lYW4gaGVy
ZT8gKE5vdGUsIHZpcnRpby12ZHBhIGlzIHRoZQo+PiBkcml2ZXIgZm9yIHZEUEEgYnVzIGhlcmUp
Lgo+ICdkcml2ZXInIGlzIHRoZSB0aGluZyB1c2luZyB0aGUgJ2NvcmUnIGxpYnJhcnkgY2FsbHMg
dG8gaW1wbGVtZW50IGEKPiBkZXZpY2UsIHNvIGhlcmUgdGhlICd2ZF9kZXYnIGlzIHRoZSBkcml2
ZXIgYW5kCj4gJ3JlZ2lzdGVyX3ZpcnRpb19kZXZpY2UnIGlzIHRoZSBjb3JlCgoKT2suCgoKPgo+
Pj4gV2hlcmUgaXMgdGhlIHZhcmlvdXMgVEhJU19NT0RVTEUncyBJIGV4cGVjdCB0byBzZWUgaW4g
YSBzY2hlbWUgbGlrZQo+Pj4gdGhpcz8KPj4+Cj4+PiBBbGwgZnVuY3Rpb24gcG9pbnRlcnMgbXVz
dCBiZSBwcm90ZWN0ZWQgYnkgYSBoZWxkIG1vZHVsZSByZWZlcmVuY2UKPj4+IGNvdW50LCBpZSB0
aGUgYWJvdmUgcHJvYmUvcmVtb3ZlIGFuZCBhbGwgdGhlIHBvaW50ZXJzIGluIG9wcy4KPj4gV2ls
bCBkb3VibGUgY2hlY2ssIHNpbmNlIEkgZG9uJ3Qgc2VlIHRoaXMgaW4gb3RoZXIgdmlydGlvIHRy
YW5zcG9ydCBkcml2ZXJzCj4+IChQQ0kgb3IgTU1JTykuCj4gcGNpX3JlZ2lzdGVyX2RyaXZlciBp
cyBhIG1hY3JvIHRoYXQgcHJvdmlkZXMgYSBUSElTX01PRFVMRSwgYW5kIHRoZQo+IHBjaSBjb3Jl
IGNvZGUgc2V0cyBkcml2ZXIub3duZXIsIHRoZW4gdGhlIHJlc3Qgb2YgdGhlIHN0dWZmIHJlbGF0
ZWQgdG8KPiBkcml2ZXIgb3BzIGlzIHN1cHBvc2VkIHRvIHdvcmsgYWdhaW5zdCB0aGF0IHRvIHBy
b3RlY3QgdGhlIGRyaXZlciBvcHMuCj4KPiBGb3IgdGhlIGRldmljZSBtb2R1bGUgcmVmY291bnRp
bmcgeW91IGVpdGhlciBuZWVkIHRvIGVuc3VyZSB0aGF0Cj4gJ3VucmVnaXN0ZXInIGlzIGEgc3Ry
b25nIGZlbmNlIGFuZCBndWFuZW50ZWVzIHRoYXQgbm8gZGV2aWNlIG9wcyBhcmUKPiBjYWxsZWQg
cGFzdCB1bnJlZ2lzdGVyIChub3RpbmcgdGhhdCB0aGlzIGlzIGltcG9zc2libGUgZm9yIHJlbGVh
c2UpLAo+IG9yIHlvdSBuZWVkIHRvIGhvbGQgdGhlIG1vZHVsZSBsb2NrIHVudGlsIHJlbGVhc2Uu
Cj4KPiBJdCBpcyBjb21tb24gdG8gc2VlIG5vbi1jb3JlIHN1YnN5c3RlbXMgZ2V0IHRoaXMgc3R1
ZmYgd3JvbmcuCj4KPiBKYXNvbgoKCk9rLiBJIHNlZS4KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
