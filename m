Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9141EB636
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 09:09:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1534320766;
	Tue,  2 Jun 2020 07:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiQQIhfsV2s4; Tue,  2 Jun 2020 07:09:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75E06204F2;
	Tue,  2 Jun 2020 07:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5860EC016E;
	Tue,  2 Jun 2020 07:09:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 895E4C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 648B620014
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHfQI6NcB5HH
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:09:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 6D5DE204F2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591081762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doLYACsUkvy+mrMo/XyVks5vKo9blZJESy3aPW3MWD0=;
 b=HhT59VX13H2y9BlJlWxL3HiNLX+jfgCq4wOmJtk2P+koNjGHN7L3MQ9mFypTU5lvr0k1C+
 lUwIrrdPdswoOL3mG2a7kVF4c/CaLw1yhN49Thk0l4PAUNJlaEzpKQIC+mHMN7I51GU9+n
 R1L6L7nXB9UK0/JwHVSrKk7hWmCV86s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-v0pmb4asNTWrpJVBEZG22w-1; Tue, 02 Jun 2020 03:09:18 -0400
X-MC-Unique: v0pmb4asNTWrpJVBEZG22w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66451100960F;
 Tue,  2 Jun 2020 07:09:16 +0000 (UTC)
Received: from [10.72.12.102] (ovpn-12-102.pek2.redhat.com [10.72.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802B810013C1;
 Tue,  2 Jun 2020 07:08:43 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
Date: Tue, 2 Jun 2020 15:08:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602010332-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDE6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIE1heSAyOSwgMjAyMCBhdCAwNDowMzowMlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiArc3RhdGljIHZvaWQgdnBfdmRwYV9zZXRfdnFfcmVhZHkoc3RydWN0IHZkcGFfZGV2aWNlICp2
ZHBhLAo+PiArCQkJCSB1MTYgcWlkLCBib29sIHJlYWR5KQo+PiArewo+PiArCXN0cnVjdCB2cF92
ZHBhICp2cF92ZHBhID0gdmRwYV90b192cCh2ZHBhKTsKPj4gKwo+PiArCXZwX2lvd3JpdGUxNihx
aWQsICZ2cF92ZHBhLT5jb21tb24tPnF1ZXVlX3NlbGVjdCk7Cj4+ICsJdnBfaW93cml0ZTE2KHJl
YWR5LCAmdnBfdmRwYS0+Y29tbW9uLT5xdWV1ZV9lbmFibGUpOwo+PiArfQo+PiArCj4gTG9va3Mg
bGlrZSB0aGlzIG5lZWRzIHRvIGNoZWNrIGFuZCBqdXN0IHNraXAgdGhlIHdyaXRlIGlmCj4gcmVh
ZHkgPT0gMCwgcmlnaHQ/IE9mIGNvdXJzZSB2ZHBhIGNvcmUgdGhlbiBpbnNpc3RzIG9uIGNhbGxp
bmcKPiB2cF92ZHBhX2dldF92cV9yZWFkeSB3aGljaCB3aWxsIHdhcm4uIE1heWJlIGp1c3QgZHJv
cCB0aGUKPiBjaGVjayBmcm9tIGNvcmUsIG1vdmUgaXQgdG8gZHJpdmVycyB3aGljaCBuZWVkIGl0
Pwo+Cj4gLi4uCgoKVGhhdCBtYXkgd29yaywgYnV0IGl0IG1heSBjYXVzZSBpbmNvbnNpc3RlbnQg
c2VtYW50aWMgZm9yIHNldF92cV9yZWFkeSAKaWYgd2UgbGVhdmUgaXQgdG8gdGhlIGRyaXZlci4K
Cgo+Cj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCB2cF92ZHBhX2lkX3Rh
YmxlW10gPSB7Cj4+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVU
LCBQQ0lfQU5ZX0lEKSB9LAo+PiArCXsgMCB9Cj4+ICt9Owo+IFRoaXMgbG9va3MgbGlrZSBpdCds
bCBjcmVhdGUgYSBtZXNzIHdpdGggZWl0aGVyIHZpcnRpbyBwY2kKPiBvciB2ZHBhIGJlaW5nIGxv
YWRlZCBhdCByYW5kb20uIE1heWJlIGp1c3QgZG9uJ3Qgc3BlY2lmeQo+IGFueSBJRHMgZm9yIG5v
dy4gRG93biB0aGUgcm9hZCB3ZSBjb3VsZCBnZXQgYQo+IGRpc3RpbmN0IHZlbmRvciBJRCBvciBh
IHJhbmdlIG9mIGRldmljZSBJRHMgZm9yIHRoaXMuCgoKUmlnaHQsIHdpbGwgZG8uCgpUaGFua3MK
Cgo+Cj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgdnBfdmRwYV9pZF90YWJsZSk7Cj4+ICsK
Pj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciB2cF92ZHBhX2RyaXZlciA9IHsKPj4gKwkubmFt
ZQkJPSAidnAtdmRwYSIsCj4+ICsJLmlkX3RhYmxlCT0gdnBfdmRwYV9pZF90YWJsZSwKPj4gKwku
cHJvYmUJCT0gdnBfdmRwYV9wcm9iZSwKPj4gKwkucmVtb3ZlCQk9IHZwX3ZkcGFfcmVtb3ZlLAo+
PiArfTsKPj4gKwo+PiArbW9kdWxlX3BjaV9kcml2ZXIodnBfdmRwYV9kcml2ZXIpOwo+PiArCj4+
ICtNT0RVTEVfQVVUSE9SKCJKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiIpOwo+PiAr
TU9EVUxFX0RFU0NSSVBUSU9OKCJ2cC12ZHBhIik7Cj4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7
Cj4+ICtNT0RVTEVfVkVSU0lPTigiMSIpOwo+PiAtLSAKPj4gMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
