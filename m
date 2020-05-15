Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 985241D43D9
	for <lists.virtualization@lfdr.de>; Fri, 15 May 2020 05:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BF5E8975D;
	Fri, 15 May 2020 03:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vgryK+0wBi8; Fri, 15 May 2020 03:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06D6989767;
	Fri, 15 May 2020 03:02:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2A83C016F;
	Fri, 15 May 2020 03:02:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6801AC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 03:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5BE8889753
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 03:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94YXNVRlMN+1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 03:02:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A0D578974B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589511730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJ02bOsTsAvIFUawcVMs6WTwU2Gy+CcgbmbjJ63LKRA=;
 b=BQbXjgIUvLoXMcyw7y2NX+0NsQlOzSsH1qwNBEoQ7Xzs9CLyk1x62pFcHs26B5JfXiza12
 xusMYjLisahxAjJgrRofcRsmEIjQrN4fBqH2iynlezrxIRT5AWOUMkHYRYIuKO6XHEB0mz
 rjlDSwMv15PFOO3gqFmutQdYTTIqAak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-hIHUJaHiN5WsAxTGh3F8Zw-1; Thu, 14 May 2020 23:02:08 -0400
X-MC-Unique: hIHUJaHiN5WsAxTGh3F8Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC5380058A;
 Fri, 15 May 2020 03:02:07 +0000 (UTC)
Received: from [10.72.13.11] (ovpn-13-11.pek2.redhat.com [10.72.13.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 027181C92D;
 Fri, 15 May 2020 03:02:01 +0000 (UTC)
Subject: Re: [PATCH] vdpa_sim: do not reset IOTLB during device reset
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200514072549.29694-1-jasowang@redhat.com>
 <20200514053233-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c0353f0c-e60e-3fcd-6452-38eefca18a03@redhat.com>
Date: Fri, 15 May 2020 11:02:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514053233-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS8xNCDkuIvljYg1OjM1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBNYXkgMTQsIDIwMjAgYXQgMDM6MjU6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gV2UgcmVzZXQgSU9UTEIgZHVyaW5nIGRldmljZSByZXNldCB0aGlzIGJyZWFrcyB0aGUgYXNz
dW1wdGlvbiB0aGF0IHRoZQo+PiBtYXBwaW5nIG5lZWRzIHRvIGJlIGNvbnRyb2xsZWQgdmlhIHZE
UEEgRE1BIG9wcyBleHBsaWNpdGx5IGluIGEKPj4gaW5jcmVtZW50YWwgd2F5LiBTbyB0aGUgbmV0
d29ya2luZyB3aWxsIGJlIGJyb2tlbiBhZnRlciBlLmcgYSBndWVzdAo+PiByZXNldC4KPj4KPj4g
Rml4IHRoaXMgYnkgbm90IHJlc2V0dGluZyB0aGUgSU9UTEIgZHVyaW5nIGRldmljZSByZXNldC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPgo+
IFRoYXQncyBhIGJpdCB3ZWlyZCwgYW5kIGNhbiBiZSBhIHNlY3VyaXR5IHJpc2sgaWYgc3RhdGUK
PiBsZWFrcyBiZXR3ZWVuIHNlY3VyaXR5IGRvbWFpbnMgdGhyb3VnaCB0aGlzLgoKCkknbSBub3Qg
c3VyZSBJIGdldCB0aGlzLiBOb3RlIHRoYXQ6CgoxKSBGb3IgZGV2aWNlcyB0aGF0IGRlcGVuZCBv
biBwbGF0Zm9ybSBJT01NVSwgdGhlIG1hcHBpbmdzIGFyZSB2YWxpZCAKYWNyb3NzIGRldmljZSBy
ZXNldAoyKSB2aG9zdF92ZHBhIHdpbGwgcmVzZXQgSU9UTEIgZHVyaW5nIHJlbGVhc2UsIHNvIEkg
dGhpbmsgdGhlcmUncyBubyAKc2VjdXJpdHkgbGVhayBpbiB0aGlzIGNhc2UKCklmIHdlIHJlc2V0
IElPVExCIGR1cmluZyBkZXZpY2UgcmVzZXQsIHRoZXJlIHdpbGwgYmUgYW4gaW5jb25zaXN0ZW5j
eSAKYmV0d2VlbiBvbi1jaGlwIElPTU1VIGRldmljZXMgYW5kIHBsYXRmb3JtIElPTU1VIGRldmlj
ZXMuIFdlIGNhbiBmaXggCnRoaXMgaW5jb25zaXN0ZW5jeSBpbiBhbm90aGVyIHdheSwgZS5nIHVu
bWFwIGR1cmluZyB2aG9zdF92ZHBhX3Jlc2V0LiAKVGhpcyBtZWFucyB1c2Vyc3BhY2UgbmVlZCB0
byByZXBsYXkgdGhlIG1hcHBpbmcgYmVmb3JlIERSSVZFUl9PSywgd2hpY2ggCnNlZW1zIGEgYnVy
ZGVuIHRvIHVzZXJzcGFjZS4KCgo+IEFuZCB0aGVyZSdzIDAgY2hhbmNlIGFueSBoYXJkd2FyZSBp
bXBsZW1lbnRhdGlvbiBjYW4KPiBrZWVwIHRoZSB0cmFuc2xhdGlvbnMgYXJvdW5kIGFjcm9zcyBy
ZXNldHMgLSB0aGVyZQo+IGlzIHNpbXBseSBub3doZXJlIHRvIGtlZXAgdGhlbS4KCgpJdCBkZXBl
bmRzIG9uIHRoZSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbiwgZS5nIHRoZSBJT01NVSBkb2VzIG5v
dCBiZWxvbmcgCnRvIFZGIGJ1dCBQRi4KClRoYW5rcwoKCj4KPiBJTUhPIHdlIG5lZWQgYSBkaWZm
ZXJlbnQgd2F5IHRvIG1ha2UgdGhpcyB3b3JrLCBzaW11bGF0b3IKPiBuZWVkcyB0byBsb29rIGxp
a2UgYSBoYXJkd2FyZSBkZXZpY2UgYXMgbXVjaCBhcyBwb3NzaWJsZS4KPgo+Cj4+IC0tLQo+PiAg
IGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIHwgMiAtLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+PiBpbmRl
eCA3OTU3ZDJkNDFmYzQuLmNjNTUyNTc0M2EyNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZHBh
L3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltLmMKPj4gQEAgLTExOSw4ICsxMTksNiBAQCBzdGF0aWMgdm9pZCB2ZHBhc2ltX3Jlc2V0KHN0
cnVjdCB2ZHBhc2ltICp2ZHBhc2ltKQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgVkRQQVNJTV9WUV9O
VU07IGkrKykKPj4gICAJCXZkcGFzaW1fdnFfcmVzZXQoJnZkcGFzaW0tPnZxc1tpXSk7Cj4+ICAg
Cj4+IC0Jdmhvc3RfaW90bGJfcmVzZXQodmRwYXNpbS0+aW9tbXUpOwo+PiAtCj4+ICAgCXZkcGFz
aW0tPmZlYXR1cmVzID0gMDsKPj4gICAJdmRwYXNpbS0+c3RhdHVzID0gMDsKPj4gICAJKyt2ZHBh
c2ltLT5nZW5lcmF0aW9uOwo+PiAtLSAKPj4gMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
