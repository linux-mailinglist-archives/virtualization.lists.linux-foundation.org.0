Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B814022F
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 04:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 108D886886;
	Fri, 17 Jan 2020 03:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOBiK0xMz7FM; Fri, 17 Jan 2020 03:03:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EE3186880;
	Fri, 17 Jan 2020 03:03:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02770C1D81;
	Fri, 17 Jan 2020 03:03:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29932C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 03:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 07AD387E75
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 03:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwEfwAS-95YP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 03:03:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C7B9887E6D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579230215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHZAudpQ7YKqVHyEOwRamq1WK1H7U3kwvTz/1r/Y/lU=;
 b=gS9JXooKQ6njC2mjiEuvDFSMpDEY8KWgPGd3A9B8iufRriaQpYCxyme6ZYZ9PvzOLL9N5K
 y4e2pe8lmZq8dXjIBZOERel0Yi89Xl0+Do7K16Jo9Hq77/qRC4arTsTQ6wQG9i/KwTVppi
 sd2CQEISWNkqCu2TP6XkFf/zeffRPW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-CkGX8257OWK3y6RbnjmjLQ-1; Thu, 16 Jan 2020 22:03:33 -0500
X-MC-Unique: CkGX8257OWK3y6RbnjmjLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E08FDBA3;
 Fri, 17 Jan 2020 03:03:30 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EA4E19C5B;
 Fri, 17 Jan 2020 03:03:14 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
Date: Fri, 17 Jan 2020 11:03:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200116152209.GH20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvMS8xNiDkuIvljYgxMToyMiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgSmFuIDE2LCAyMDIwIGF0IDA4OjQyOjI5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IHZEUEEgZGV2aWNlIGlzIGEgZGV2aWNlIHRoYXQgdXNlcyBhIGRhdGFwYXRoIHdoaWNoIGNvbXBs
aWVzIHdpdGggdGhlCj4+IHZpcnRpbyBzcGVjaWZpY2F0aW9ucyB3aXRoIHZlbmRvciBzcGVjaWZp
YyBjb250cm9sIHBhdGguIHZEUEEgZGV2aWNlcwo+PiBjYW4gYmUgYm90aCBwaHlzaWNhbGx5IGxv
Y2F0ZWQgb24gdGhlIGhhcmR3YXJlIG9yIGVtdWxhdGVkIGJ5Cj4+IHNvZnR3YXJlLiB2RFBBIGhh
cmR3YXJlIGRldmljZXMgYXJlIHVzdWFsbHkgaW1wbGVtZW50ZWQgdGhyb3VnaCBQQ0lFCj4+IHdp
dGggdGhlIGZvbGxvd2luZyB0eXBlczoKPj4KPj4gLSBQRiAoUGh5c2ljYWwgRnVuY3Rpb24pIC0g
QSBzaW5nbGUgUGh5c2ljYWwgRnVuY3Rpb24KPj4gLSBWRiAoVmlydHVhbCBGdW5jdGlvbikgLSBE
ZXZpY2UgdGhhdCBzdXBwb3J0cyBzaW5nbGUgcm9vdCBJL08KPj4gICAgdmlydHVhbGl6YXRpb24g
KFNSLUlPVikuIEl0cyBWaXJ0dWFsIEZ1bmN0aW9uIChWRikgcmVwcmVzZW50cyBhCj4+ICAgIHZp
cnR1YWxpemVkIGluc3RhbmNlIG9mIHRoZSBkZXZpY2UgdGhhdCBjYW4gYmUgYXNzaWduZWQgdG8g
ZGlmZmVyZW50Cj4+ICAgIHBhcnRpdGlvbnMKPj4gLSBWREVWIChWaXJ0dWFsIERldmljZSkgLSBX
aXRoIHRlY2hub2xvZ2llcyBzdWNoIGFzIEludGVsIFNjYWxhYmxlCj4+ICAgIElPViwgYSB2aXJ0
dWFsIGRldmljZSBjb21wb3NlZCBieSBob3N0IE9TIHV0aWxpemluZyBvbmUgb3IgbW9yZQo+PiAg
ICBBRElzLgo+PiAtIFNGIChTdWIgZnVuY3Rpb24pIC0gVmVuZG9yIHNwZWNpZmljIGludGVyZmFj
ZSB0byBzbGljZSB0aGUgUGh5c2ljYWwKPj4gICAgRnVuY3Rpb24gdG8gbXVsdGlwbGUgc3ViIGZ1
bmN0aW9ucyB0aGF0IGNhbiBiZSBhc3NpZ25lZCB0byBkaWZmZXJlbnQKPj4gICAgcGFydGl0aW9u
cyBhcyB2aXJ0dWFsIGRldmljZXMuCj4gSSByZWFsbHkgaG9wZSB3ZSBkb24ndCBlbmQgdXAgd2l0
aCB0d28gZGlmZmVyZW50IHdheXMgdG8gc3BlbGwgdGhpcwo+IHNhbWUgdGhpbmcuCgoKSSB0aGlu
ayB5b3UgbWVhbnQgQURJIHZzIFNGLiBJdCBsb29rcyB0byBtZSB0aGF0IEFESSBpcyBsaW1pdGVk
IHRvIHRoZSAKc2NvcGUgb2Ygc2NhbGFibGUgSU9WIGJ1dCBTRiBub3QuCgoKPgo+PiBAQCAtMCww
ICsxLDIgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gK29iai0k
KENPTkZJR19WRFBBKSArPSB2ZHBhLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3Zk
cGEvdmRwYS5jIGIvZHJpdmVycy92aXJ0aW8vdmRwYS92ZHBhLmMKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yYjBlNGE5ZjEwNWQKPj4gKysrIGIvZHJpdmVy
cy92aXJ0aW8vdmRwYS92ZHBhLmMKPj4gQEAgLTAsMCArMSwxNDEgQEAKPj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4gKy8qCj4+ICsgKiB2RFBBIGJ1cy4KPj4g
KyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTksIFJlZCBIYXQuIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCj4+ICsgKiAgICAgQXV0aG9yOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+
IDIwMjAgdGVzdHMgZGF5cwoKCldpbGwgZml4LgoKCj4KPj4gKyAqCj4+ICsgKi8KPj4gKwo+PiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2lkci5oPgo+PiAr
I2luY2x1ZGUgPGxpbnV4L3ZkcGEuaD4KPj4gKwo+PiArI2RlZmluZSBNT0RfVkVSU0lPTiAgIjAu
MSIKPiBJIHRoaW5rIG1vZHVsZSB2ZXJzaW9ucyBhcmUgZGlzY291cmFnZWQgdGhlc2UgZGF5cwoK
CldpbGwgcmVtb3ZlLgoKCj4KPj4gKyNkZWZpbmUgTU9EX0RFU0MgICAgICJ2RFBBIGJ1cyIKPj4g
KyNkZWZpbmUgTU9EX0FVVEhPUiAgICJKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiIK
Pj4gKyNkZWZpbmUgTU9EX0xJQ0VOU0UgICJHUEwgdjIiCj4+ICsKPj4gK3N0YXRpYyBERUZJTkVf
SURBKHZkcGFfaW5kZXhfaWRhKTsKPj4gKwo+PiArc3RydWN0IGRldmljZSAqdmRwYV9nZXRfcGFy
ZW50KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkKPj4gK3sKPj4gKwlyZXR1cm4gdmRwYS0+ZGV2
LnBhcmVudDsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0wodmRwYV9nZXRfcGFyZW50KTsKPj4gKwo+
PiArdm9pZCB2ZHBhX3NldF9wYXJlbnQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCBzdHJ1Y3Qg
ZGV2aWNlICpwYXJlbnQpCj4+ICt7Cj4+ICsJdmRwYS0+ZGV2LnBhcmVudCA9IHBhcmVudDsKPj4g
K30KPj4gK0VYUE9SVF9TWU1CT0wodmRwYV9zZXRfcGFyZW50KTsKPj4gKwo+PiArc3RydWN0IHZk
cGFfZGV2aWNlICpkZXZfdG9fdmRwYShzdHJ1Y3QgZGV2aWNlICpfZGV2KQo+PiArewo+PiArCXJl
dHVybiBjb250YWluZXJfb2YoX2Rldiwgc3RydWN0IHZkcGFfZGV2aWNlLCBkZXYpOwo+PiArfQo+
PiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2X3RvX3ZkcGEpOwo+PiArCj4+ICtzdHJ1Y3QgZGV2aWNl
ICp2ZHBhX3RvX2RldihzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4+ICt7Cj4+ICsJcmV0dXJu
ICZ2ZHBhLT5kZXY7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTCh2ZHBhX3RvX2Rldik7Cj4g
V2h5IHRoZXNlIHRyaXZpYWwgYXNzZXNzb3JzPyBTZWVtcyB1bm5lY2Vzc2FyeSwgb3Igc2hvdWxk
IGF0IGxlYXN0IGJlCj4gc3RhdGljIGlubGluZXMgaW4gYSBoZWFkZXIKCgpXaWxsIGZpeC4KCgo+
Cj4+ICtpbnQgcmVnaXN0ZXJfdmRwYV9kZXZpY2Uoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+
PiArewo+IFVzdWFsbHkgd2Ugd2FudCB0byBzZWUgc3ltYm9scyBjb25zaXN0ZW50bHkgcHJlZml4
ZWQgd2l0aCB2ZHBhXyosIGlzCj4gdGhlcmUgYSByZWFzb24gd2h5IHJlZ2lzdGVyL3VucmVnaXN0
ZXIgYXJlIHN3YXBwZWQ/CgoKSSBmb2xsb3cgdGhlIG5hbWUgZnJvbSB2aXJ0aW8uIEkgd2lsbCBz
d2l0Y2ggdG8gdmRwYV8qLgoKCj4KPj4gKwlpbnQgZXJyOwo+PiArCj4+ICsJaWYgKCF2ZHBhX2dl
dF9wYXJlbnQodmRwYSkpCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICsJaWYgKCF2ZHBh
LT5jb25maWcpCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICsJZXJyID0gaWRhX3NpbXBs
ZV9nZXQoJnZkcGFfaW5kZXhfaWRhLCAwLCAwLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoZXJyIDwg
MCkKPj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4+ICsKPj4gKwl2ZHBhLT5kZXYuYnVzID0gJnZkcGFf
YnVzOwo+PiArCWRldmljZV9pbml0aWFsaXplKCZ2ZHBhLT5kZXYpOwo+IElNSE8gZGV2aWNlX2lu
aXRpYWxpemUgc2hvdWxkIG5vdCBiZSBjYWxsZWQgaW5zaWRlIHNvbWV0aGluZyBjYWxsZWQKPiBy
ZWdpc3RlciwgdG9vb2Z0ZW4gd2UgZmluZCBvdXQgdGhhdCB0aGUgY2FsbGVyIGRyaXZlcnMgbmVl
ZCB0aGUgZGV2aWNlCj4gdG8gYmUgaW5pdGlhbGl6ZWQgZWFybGllciwgaWUgdG8gdXNlIHRoZSBr
cmVmLCBvciBzb21ldGhpbmcuCj4KPiBJIGZpbmQgdGhlIGJlc3QgZmxvdyBpcyB0byBoYXZlIHNv
bWUgaW5pdCBmdW5jdGlvbiB0aGF0IGRvZXMgdGhlCj4gZGV2aWNlX2luaXRpYWxpemUgYW5kIHNl
dHMgdGhlIGRldmljZV9uYW1lIHRoYXQgdGhlIGRyaXZlciBjYW4gY2FsbAo+IGVhcmx5LgoKCk9r
LCB3aWxsIGRvLgoKCj4KPiBTaG91bGRuJ3QgdGhlcmUgYmUgYSBkZXZpY2UvZHJpdmVyIG1hdGNo
aW5nIHByb2Nlc3Mgb2Ygc29tZSBraW5kPwoKClRoZSBxdWVzdGlvbiBpcyB3aGF0IGRvIHdlIHdh
bnQgZG8gbWF0Y2ggaGVyZS4KCjEpICJ2aXJ0aW8iIHZzICJ2aG9zdCIsIEkgaW1wbGVtZW50ZWQg
bWF0Y2hpbmcgbWV0aG9kIGZvciB0aGlzIGluIG1kZXYgCnNlcmllcywgYnV0IGl0IGxvb2tzIHVu
bmVjZXNzYXJ5IGZvciB2RFBBIGRldmljZSBkcml2ZXIgdG8ga25vdyBhYm91dCAKdGhpcy4gQW55
d2F5IHdlIGNhbiB1c2Ugc3lzZnMgZHJpdmVyIGJpbmQvdW5iaW5kIHRvIHN3aXRjaCBkcml2ZXJz
CjIpIHZpcnRpbyBkZXZpY2UgaWQgYW5kIHZlbmRvciBpZC4gSSdtIG5vdCBzdXJlIHdlIG5lZWQg
dGhpcyBjb25zaWRlciAKdGhlIHR3byBkcml2ZXJzIHNvIGZhciAodmlydGlvL3Zob3N0KSBhcmUg
YWxsIGJ1cyBkcml2ZXJzLgoKVGhhbmtzCgoKPgo+IEphc29uCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
