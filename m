Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848A142478
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 08:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2477384906;
	Mon, 20 Jan 2020 07:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZTGeyvAMWCQ; Mon, 20 Jan 2020 07:50:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C8CE84627;
	Mon, 20 Jan 2020 07:50:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74FA0C0174;
	Mon, 20 Jan 2020 07:50:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67993C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5F12786FAF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-T32hi4PwAx
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:50:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BA28286FAD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579506631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U004lfJPbgC8DDvgY0vYrnnQi6voPmz5PbAj1bvuBr0=;
 b=WHFUwt/1xYWgox8NL8DpKdh7AARRj+DDNhEiPPIqz/4jgUQDy36BRzxOW6+RbOV1SHEqBH
 ZPj2D2JOg2BXlorJvMwrEIABnl9/kvFqyHDoeKqGKy6MyWzejYbwfJum75Ii0wSFyOFAo8
 jZReMH4sVGHYQPwCBzAR1gCbNoRpUz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-8P1DRx1hN7GiWnnH17Bchg-1; Mon, 20 Jan 2020 02:50:28 -0500
X-MC-Unique: 8P1DRx1hN7GiWnnH17Bchg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE4F10054E3;
 Mon, 20 Jan 2020 07:50:25 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23C8E84DB4;
 Mon, 20 Jan 2020 07:50:02 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <20200117135435.GU20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ea4639ba-d991-c95c-8cb1-48588e5b42c0@redhat.com>
Date: Mon, 20 Jan 2020 15:50:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117135435.GU20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvMS8xNyDkuIvljYg5OjU0LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJp
LCBKYW4gMTcsIDIwMjAgYXQgMTE6MDM6MTJBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
T24gMjAyMC8xLzE2IOS4i+WNiDExOjIyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBPbiBU
aHUsIEphbiAxNiwgMjAyMCBhdCAwODo0MjoyOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
Pj4+IHZEUEEgZGV2aWNlIGlzIGEgZGV2aWNlIHRoYXQgdXNlcyBhIGRhdGFwYXRoIHdoaWNoIGNv
bXBsaWVzIHdpdGggdGhlCj4+Pj4gdmlydGlvIHNwZWNpZmljYXRpb25zIHdpdGggdmVuZG9yIHNw
ZWNpZmljIGNvbnRyb2wgcGF0aC4gdkRQQSBkZXZpY2VzCj4+Pj4gY2FuIGJlIGJvdGggcGh5c2lj
YWxseSBsb2NhdGVkIG9uIHRoZSBoYXJkd2FyZSBvciBlbXVsYXRlZCBieQo+Pj4+IHNvZnR3YXJl
LiB2RFBBIGhhcmR3YXJlIGRldmljZXMgYXJlIHVzdWFsbHkgaW1wbGVtZW50ZWQgdGhyb3VnaCBQ
Q0lFCj4+Pj4gd2l0aCB0aGUgZm9sbG93aW5nIHR5cGVzOgo+Pj4+Cj4+Pj4gLSBQRiAoUGh5c2lj
YWwgRnVuY3Rpb24pIC0gQSBzaW5nbGUgUGh5c2ljYWwgRnVuY3Rpb24KPj4+PiAtIFZGIChWaXJ0
dWFsIEZ1bmN0aW9uKSAtIERldmljZSB0aGF0IHN1cHBvcnRzIHNpbmdsZSByb290IEkvTwo+Pj4+
ICAgICB2aXJ0dWFsaXphdGlvbiAoU1ItSU9WKS4gSXRzIFZpcnR1YWwgRnVuY3Rpb24gKFZGKSBy
ZXByZXNlbnRzIGEKPj4+PiAgICAgdmlydHVhbGl6ZWQgaW5zdGFuY2Ugb2YgdGhlIGRldmljZSB0
aGF0IGNhbiBiZSBhc3NpZ25lZCB0byBkaWZmZXJlbnQKPj4+PiAgICAgcGFydGl0aW9ucwo+Pj4+
IC0gVkRFViAoVmlydHVhbCBEZXZpY2UpIC0gV2l0aCB0ZWNobm9sb2dpZXMgc3VjaCBhcyBJbnRl
bCBTY2FsYWJsZQo+Pj4+ICAgICBJT1YsIGEgdmlydHVhbCBkZXZpY2UgY29tcG9zZWQgYnkgaG9z
dCBPUyB1dGlsaXppbmcgb25lIG9yIG1vcmUKPj4+PiAgICAgQURJcy4KPj4+PiAtIFNGIChTdWIg
ZnVuY3Rpb24pIC0gVmVuZG9yIHNwZWNpZmljIGludGVyZmFjZSB0byBzbGljZSB0aGUgUGh5c2lj
YWwKPj4+PiAgICAgRnVuY3Rpb24gdG8gbXVsdGlwbGUgc3ViIGZ1bmN0aW9ucyB0aGF0IGNhbiBi
ZSBhc3NpZ25lZCB0byBkaWZmZXJlbnQKPj4+PiAgICAgcGFydGl0aW9ucyBhcyB2aXJ0dWFsIGRl
dmljZXMuCj4+PiBJIHJlYWxseSBob3BlIHdlIGRvbid0IGVuZCB1cCB3aXRoIHR3byBkaWZmZXJl
bnQgd2F5cyB0byBzcGVsbCB0aGlzCj4+PiBzYW1lIHRoaW5nLgo+PiBJIHRoaW5rIHlvdSBtZWFu
dCBBREkgdnMgU0YuIEl0IGxvb2tzIHRvIG1lIHRoYXQgQURJIGlzIGxpbWl0ZWQgdG8gdGhlIHNj
b3BlCj4+IG9mIHNjYWxhYmxlIElPViBidXQgU0Ygbm90Lgo+IEkgdGhpbmsgaWYgb25lIGxvb2tz
IGNhcmVmdWxseSB5b3UnZCBmaW5kIHRoYXQgU0YgYW5kIEFESSBhcmUgdXNpbmcKPiB2ZXJ5IHNp
bWlsYXIgdGVjaGluaXF1ZXMuIEZvciBpbnN0YW5jZSB3ZSdkIGFsc28gbGlrZSB0byB1c2UgdGhl
IGNvZGUKPiByZW9yZyBvZiB0aGUgTVNJWCB2ZWN0b3Igc2V0dXAgd2l0aCBTRnMgdGhhdCBJbnRl
bCBpcyBjYWxsaW5nIElNUy4KPgo+IFJlYWxseSBTSU9WIGlzIHNpbXBseSBhIGJ1bmRsZSBvZiBw
cmUtZXhpc3Rpbmcgc3R1ZmYgdW5kZXIgYSB0aWR5Cj4gbmFtZSwgd2hhdGV2ZXIgY29kZSBza2Vs
ZXRvbiB3ZSBjb21lIHVwIHdpdGggZm9yIFNGcyBzaG91bGQgYmUgcmUtdXNlZAo+IGZvciBBREku
CgoKT2ssIGJ1dCBkbyB5b3UgcHJlZmVyIHRvIG1lbnRpb24gQURJIG9ubHkgZm9yIHRoZSBuZXh0
IHZlcnNpb24/CgoKPgo+Pj4gU2hvdWxkbid0IHRoZXJlIGJlIGEgZGV2aWNlL2RyaXZlciBtYXRj
aGluZyBwcm9jZXNzIG9mIHNvbWUga2luZD8KPj4KPj4gVGhlIHF1ZXN0aW9uIGlzIHdoYXQgZG8g
d2Ugd2FudCBkbyBtYXRjaCBoZXJlLgo+Pgo+PiAxKSAidmlydGlvIiB2cyAidmhvc3QiLCBJIGlt
cGxlbWVudGVkIG1hdGNoaW5nIG1ldGhvZCBmb3IgdGhpcyBpbiBtZGV2Cj4+IHNlcmllcywgYnV0
IGl0IGxvb2tzIHVubmVjZXNzYXJ5IGZvciB2RFBBIGRldmljZSBkcml2ZXIgdG8ga25vdyBhYm91
dCB0aGlzLgo+PiBBbnl3YXkgd2UgY2FuIHVzZSBzeXNmcyBkcml2ZXIgYmluZC91bmJpbmQgdG8g
c3dpdGNoIGRyaXZlcnMKPj4gMikgdmlydGlvIGRldmljZSBpZCBhbmQgdmVuZG9yIGlkLiBJJ20g
bm90IHN1cmUgd2UgbmVlZCB0aGlzIGNvbnNpZGVyIHRoZQo+PiB0d28gZHJpdmVycyBzbyBmYXIg
KHZpcnRpby92aG9zdCkgYXJlIGFsbCBidXMgZHJpdmVycy4KPiBBcyB3ZSBzZWVtIHRvIGJlIGNv
bnRlbXBsYXRpbmcgc29tZSBkeW5hbWljIGNyZWF0aW9uIG9mIHZkcGEgZGV2aWNlcyBJCj4gdGhp
bmsgdXBvbiBjcmVhdGlvbiB0aW1lIGl0IHNob3VsZCBiZSBzcGVjaWZpZWQgd2hhdCBtb2RlIHRo
ZXkgc2hvdWxkCj4gcnVuIGl0IGFuZCB0aGVuIGFsbCBkcml2ZXIgYmluZGluZyBhbmQgYXV0b2xv
YWRpbmcgc2hvdWxkIGhhcHBlbgo+IGF1dG9tYXRpY2FsbHkuIFRlbGxpbmcgdGhlIHVzZXIgdG8g
YmluZC91bmJpbmQgaXMgYSB2ZXJ5IHBvb3IKPiBleHBlcmllbmNlLgo+Cj4gSmFzb24KCgpPaywg
SSB3aWxsIGFkZCB0aGUgdHlwZSAodmlydGlvIHZzIHZob3N0KSBhbmQgZHJpdmVyIG1hdGNoaW5n
IG1ldGhvZCBiYWNrLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
