Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24D15D062
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 04:23:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB6FF86447;
	Fri, 14 Feb 2020 03:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GJgklTlP26n; Fri, 14 Feb 2020 03:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2289986448;
	Fri, 14 Feb 2020 03:23:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 057ABC0177;
	Fri, 14 Feb 2020 03:23:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FCEAC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 03:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5797D86447
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 03:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uEMG3WZdhL6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 03:23:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 845D786267
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581650633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiBwyrz6cX+xE4nXs+94fQKaFw5y/aQb69mQMK4gGl0=;
 b=cJ2J0cDSAfSqbuUnA0/Zb5HWcS9mktPZawyjTx4eaSHd16qewsGOc7sFEi8/pne7zaVW4b
 CBJVVwe0ygdTzhY4kbAkXSMxmtuRs+ZKEpJ0TvattWf09De8dUzDTuusIT1Oi4sgK2Obqo
 M8hzYuc/7imUKShiAq6LBKH5yF4sc9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-fdAi4kdyMtWwFgGd05oe8Q-1; Thu, 13 Feb 2020 22:23:51 -0500
X-MC-Unique: fdAi4kdyMtWwFgGd05oe8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C388017CC;
 Fri, 14 Feb 2020 03:23:48 +0000 (UTC)
Received: from [10.72.13.213] (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0CD338A;
 Fri, 14 Feb 2020 03:23:29 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
Date: Fri, 14 Feb 2020 11:23:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200213150542.GW4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xMyDkuIvljYgxMTowNSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDEzLCAyMDIwIGF0IDEwOjU4OjQ0UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IE9uIDIwMjAvMi8xMyDkuIvljYg5OjQxLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBPbiBU
aHUsIEZlYiAxMywgMjAyMCBhdCAxMTozNDoxMEFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
Pj4KPj4+Pj4gICAgIFlvdSBoYXZlIGRldiwgdHlwZSBvcgo+Pj4+PiBjbGFzcyB0byBjaG9vc2Ug
ZnJvbS4gVHlwZSBpcyByYXJlbHkgdXNlZCBhbmQgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQKPj4+
Pj4gYnkgdmRwYSwgc28gY2xhc3Mgc2VlbXMgdGhlIHJpZ2h0IGNob2ljZQo+Pj4+Pgo+Pj4+PiBK
YXNvbgo+Pj4+IFllcywgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMgY2xhc3MgYW5kIGJ1cyBhcmUg
bXV0dWFsbHkgZXhjbHVzaXZlLiBTbyB3ZQo+Pj4+IGNhbid0IGFkZCBhIGNsYXNzIHRvIGEgZGV2
aWNlIHdoaWNoIGlzIGFscmVhZHkgYXR0YWNoZWQgb24gYSBidXMuCj4+PiBXaGlsZSBJIHN1cHBv
c2UgdGhlcmUgYXJlIHZhcmlhdGlvbnMsIHR5cGljYWxseSAnY2xhc3MnIGRldmljZXMgYXJlCj4+
PiB1c2VyIGZhY2luZyB0aGluZ3MgYW5kICdidXMnIGRldmljZXMgYXJlIGludGVybmFsIGZhY2lu
ZyAoaWUgbGlrZSBhCj4+PiBQQ0kgZGV2aWNlKQo+Pgo+PiBUaG91Z2ggYWxsIHZEUEEgZGV2aWNl
cyBoYXZlIHRoZSBzYW1lIHByb2dyYW1taW5nIGludGVyZmFjZSwgYnV0IHRoZQo+PiBzZW1hbnRp
YyBpcyBkaWZmZXJlbnQuIFNvIGl0IGxvb2tzIHRvIG1lIHRoYXQgdXNlIGJ1cyBjb21wbGllcyB3
aGF0Cj4+IGNsYXNzLnJzdCBzYWlkOgo+Pgo+PiAiCj4+Cj4+IEVhY2ggZGV2aWNlIGNsYXNzIGRl
ZmluZXMgYSBzZXQgb2Ygc2VtYW50aWNzIGFuZCBhIHByb2dyYW1taW5nIGludGVyZmFjZQo+PiB0
aGF0IGRldmljZXMgb2YgdGhhdCBjbGFzcyBhZGhlcmUgdG8uIERldmljZSBkcml2ZXJzIGFyZSB0
aGUKPj4gaW1wbGVtZW50YXRpb24gb2YgdGhhdCBwcm9ncmFtbWluZyBpbnRlcmZhY2UgZm9yIGEg
cGFydGljdWxhciBkZXZpY2Ugb24KPj4gYSBwYXJ0aWN1bGFyIGJ1cy4KPj4KPj4gIgo+IEhlcmUg
d2UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIC9kZXYvWFggbm9kZSB0aGF0IHByb3ZpZGVzIHRoZQo+
IHByb2dyYW1taW5nIGludGVyZmFjZS4KCgpJJ20gY29uZnVzZWQgaGVyZSwgYXJlIHlvdSBzdWdn
ZXN0aW5nIHRvIHVzZSBjbGFzcyB0byBjcmVhdGUgY2hhciBkZXZpY2UgCmluIHZob3N0LXZkcGE/
IFRoYXQncyBmaW5lIGJ1dCB0aGUgY29tbWVudCBzaG91bGQgZ28gZm9yIHZob3N0LXZkcGEgcGF0
Y2guCgoKPiBBbGwgdGhlIHZkcGEgZGV2aWNlcyBoYXZlIHRoZSBzYW1lIGJhc2ljCj4gY2hhcmRl
diBpbnRlcmZhY2UgYW5kIGRpc2NvdmVyIGFueSBzZW1hbnRpYyB2YXJpYXRpb25zICdpbiBiYW5k
JwoKClRoYXQncyBub3QgdHJ1ZSwgY2hhciBpbnRlcmZhY2UgaXMgb25seSB1c2VkIGZvciB2aG9z
dC4gS2VybmVsIHZpcnRpbyAKZHJpdmVyIGRvZXMgbm90IG5lZWQgY2hhciBkZXYgYnV0IGEgZGV2
aWNlIG9uIHRoZSB2aXJ0aW8gYnVzLgoKCj4KPj4+IFNvIHdoeSBpcyB0aGlzIHVzaW5nIGEgYnVz
PyBWRFBBIGlzIGEgdXNlciBmYWNpbmcgb2JqZWN0LCBzbyB0aGUKPj4+IGRyaXZlciBzaG91bGQg
Y3JlYXRlIGEgY2xhc3Mgdmhvc3RfdmRwYSBkZXZpY2UgZGlyZWN0bHksIGFuZCB0aGF0Cj4+PiBk
cml2ZXIgc2hvdWxkIGxpdmUgaW4gdGhlIGRyaXZlcnMvdmhvc3QvIGRpcmVjdG9yeS4KPj4gICAK
Pj4gVGhpcyBpcyBiZWNhdXNlIHdlIHdhbnQgdkRQQSB0byBiZSBnZW5lcmljIGZvciBiZWluZyB1
c2VkIGJ5IGRpZmZlcmVudAo+PiBkcml2ZXJzIHdoaWNoIGlzIG5vdCBsaW1pdGVkIHRvIHZob3N0
LXZkcGEuIEUuZyBpbiB0aGlzIHNlcmllcywgaXQgYWxsb3dzCj4+IHZEUEEgdG8gYmUgdXNlZCBi
eSBrZXJuZWwgdmlydGlvIGRyaXZlcnMuIEFuZCBpbiB0aGUgZnV0dXJlLCB3ZSB3aWxsCj4+IHBy
b2JhYmx5IGludHJvZHVjZSBtb3JlIGRyaXZlcnMgaW4gdGhlIGZ1dHVyZS4KPiBJIGRvbid0IHNl
ZSBob3cgdGhhdCBjb25uZWN0cyB3aXRoIHVzaW5nIGEgYnVzLgoKClRoaXMgaXMgZGVtb25zdHJh
dGVkIGluIHRoZSB2aXJpdG8tdmRwYSBkcml2ZXIuIFNvIGlmIHlvdSB3YW50IHRvIHVzZSAKa2Vy
bmVsIHZpcml0byBkcml2ZXIgZm9yIHZEUEEgZGV2aWNlLCBhIGJ1cyBpcyBtb3N0IHN0cmFpZ2h0
IGZvcndhcmQuCgoKPgo+IEV2ZXJ5IGNsYXNzIG9mIHZpcnRpbyB0cmFmZmljIGlzIGdvaW5nIHRv
IG5lZWQgYSBzcGVjaWFsIEhXIGRyaXZlciB0bwo+IGVuYWJsZSBWRFBBLCB0aGF0IHNwZWNpYWwg
ZHJpdmVyIGNhbiBjcmVhdGUgdGhlIGNvcnJlY3Qgdmhvc3Qgc2lkZQo+IGNsYXNzIGRldmljZS4K
CgpBcmUgeW91IHNheWluZywgZS5nIGl0J3MgdGhlIGNoYXJnZSBvZiBJRkNWRiBkcml2ZXIgdG8g
Y3JlYXRlIHZob3N0IGNoYXIgCmRldiBhbmQgb3RoZXIgc3R1ZmZzPwoKCj4KPj4+IEZvciB0aGUg
UENJIFZGIGNhc2UgdGhpcyBkcml2ZXIgd291bGQgYmluZCB0byBhIFBDSSBkZXZpY2UgbGlrZQo+
Pj4gZXZlcnl0aGluZyBlbHNlCj4+Pgo+Pj4gRm9yIG91ciBmdXR1cmUgU0YvQURJIGNhc2VzIHRo
ZSBkcml2ZXIgd291bGQgYmluZCB0byBzb21lCj4+PiBTRi9BREkvd2hhdGV2ZXIgZGV2aWNlIG9u
IGEgYnVzLgo+PiBBbGwgdGhlc2UgZHJpdmVyIHdpbGwgc3RpbGwgYmUgYm91bmQgdG8gdGhlaXIg
b3duIGJ1cyAoUENJIG9yIG90aGVyKS4gQW5kCj4+IHdoYXQgdGhlIGRyaXZlciBuZWVkcyBpcyB0
byBwcmVzZW50IGEgdkRQQSBkZXZpY2UgdG8gdmlydHVhbCB2RFBBIGJ1cyBvbgo+PiB0b3AuCj4g
QWdhaW4sIEkgY2FuJ3Qgc2VlIGFueSByZWFzb24gdG8gaW5qZWN0IGEgJ3ZkcGEgdmlydHVhbCBi
dXMnIG9uCj4gdG9wLiBUaGF0IHNlZW1zIGxpa2UgbWlzLXVzaW5nIHRoZSBkcml2ZXIgY29yZS4K
CgpJIGRvbid0IHRoaW5rIHNvLiBWaG9zdCBpcyBub3QgdGhlIG9ubHkgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlIGZvciB2RFBBLiAKV2UgZG9uJ3Qgd2FudCBhIGRldmljZSB0aGF0IGNhbiBvbmx5IHdv
cmsgZm9yIHVzZXJzcGFjZSBkcml2ZXJzIGFuZCBvbmx5IApoYXZlIGEgc2luZ2xlIHNldCBvZiB1
c2Vyc3BhY2UgQVBJcy4KClRoYW5rcwoKCj4KPiBKYXNvbgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
