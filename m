Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA6160A34
	for <lists.virtualization@lfdr.de>; Mon, 17 Feb 2020 07:08:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E28B8563A;
	Mon, 17 Feb 2020 06:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OiI9HPVesDCH; Mon, 17 Feb 2020 06:08:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF0B685633;
	Mon, 17 Feb 2020 06:08:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F29C013E;
	Mon, 17 Feb 2020 06:08:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 499B6C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33AFC85CE2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZ6guQIqwl4N
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0340585CC7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 06:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581919677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/cqI+LSxY34TQ3+ihtn4jspo5SVW6zxs0OHLcGP5gA=;
 b=eCdLG92YnqReiEKXsigYGDouOnBcdMbIvkcsprkjE5Nw13WgQbuV0UM95yXUwcfVfUX+RE
 qSpKGAb8pRBvQrZ9l0tCI1jUvO9PP9k01udRT7bSOYzzLAhpT0lmR79NPKd6YHlvs40Aam
 P6hFPPgx4pAop2rjP70EusSeGM0dWls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-9Hm3h3wJNHmQEKu_SaHKxQ-1; Mon, 17 Feb 2020 01:07:56 -0500
X-MC-Unique: 9Hm3h3wJNHmQEKu_SaHKxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31A19107ACC9;
 Mon, 17 Feb 2020 06:07:53 +0000 (UTC)
Received: from [10.72.12.250] (ovpn-12-250.pek2.redhat.com [10.72.12.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA9C87B12;
 Mon, 17 Feb 2020 06:07:36 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
 <20200213155154.GX4271@mellanox.com>
 <20200213105425-mutt-send-email-mst@kernel.org>
 <20200213162407.GZ4271@mellanox.com>
 <5625f971-0455-6463-2c0a-cbca6a1f8271@redhat.com>
 <20200214140446.GD4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <312c3a04-4cc5-650c-48bc-ffbc7c765c22@redhat.com>
Date: Mon, 17 Feb 2020 14:07:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200214140446.GD4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xNCDkuIvljYgxMDowNCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZy
aSwgRmViIDE0LCAyMDIwIGF0IDEyOjA1OjMyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4K
Pj4+IFRoZSBzdGFuZGFyZCBkcml2ZXIgbW9kZWwgaXMgYSAnYnVzJyBkcml2ZXIgcHJvdmlkZXMg
dGhlIEhXIGFjY2Vzcwo+Pj4gKHRoaW5rIFBDSSBsZXZlbCB0aGluZ3MpLCBhbmQgYSAnaHcgZHJp
dmVyJyBhdHRhY2hlcyB0byB0aGUgYnVzCj4+PiBkZXZpY2UsCj4+IFRoaXMgaXMgbm90IHRydWUs
IGtlcm5lbCBoYWQgYWxyZWFkeSBoYWQgcGxlbnR5IHZpcnR1YWwgYnVzIHdoZXJlIHZpcnR1YWwK
Pj4gZGV2aWNlcyBhbmQgZHJpdmVycyBjb3VsZCBiZSBhdHRhY2hlZCwgYmVzaWRlcyBtZGV2IGFu
ZCB2aXJ0aW8sIHlvdSBjYW4gc2VlCj4+IHZvcCwgcnBtc2csIHZpc29yYnVzIGV0Yy4KPiBTdXJl
LCBidXQgdGhvc2UgYXJlIG5vdCBjb25uZWN0aW5nIEhXIGludG8gdGhlIGtlcm5lbC4uCgoKV2Vs
bCB0aGUgdmlydHVhbCBkZXZpY2VzIGFyZSBub3JtYWxseSBpbXBsZW1lbnRlZCB2aWEgYSByZWFs
IEhXIGRyaXZlci4gCkUuZyBmb3IgdmlyaW8gYnVzLCBpdHMgdHJhbnNwb3J0IGRyaXZlciBjb3Vs
ZCBiZSBkcml2ZXIgb2YgcmVhbCBoYXJkd2FyZSAKKGUuZyBQQ0kpLgoKCj4gICAKPj4+IGFuZCBp
bnN0YW50aWF0ZXMgYSAnc3Vic3lzdGVtIGRldmljZScgKHRoaW5rIG5ldGRldiwgcmRtYSwKPj4+
IGV0YykgdXNpbmcgc29tZSBwZXItc3Vic3lzdGVtIFhYWF9yZWdpc3RlcigpLgo+Pgo+PiBXZWxs
LCBpZiB5b3UgZ28gdGhyb3VnaCB2aXJ0aW8gc3BlYywgd2Ugc3VwcG9ydCB+MjAgdHlwZXMgb2Yg
ZGlmZmVyZW50Cj4+IGRldmljZXMuIENsYXNzZXMgbGlrZSBuZXRkZXYgYW5kIHJkbWEgYXJlIGNv
cnJlY3Qgc2luY2UgdGhleSBoYXZlIGEgY2xlYXIKPj4gc2V0IG9mIHNlbWFudGljcyB0aGVpciBv
d24uIEJ1dCBncm91cGluZyBuZXR3b3JrIGFuZCBzY3NpIGludG8gYSBzaW5nbGUKPj4gY2xhc3Mg
bG9va3Mgd3JvbmcsIHRoYXQncyB0aGUgd29yayBvZiBhIHZpcnR1YWwgYnVzLgo+IHJkbWEgYWxz
byBoYXMgYWJvdXQgMjAgZGlmZmVyZW50IHR5cGVzIG9mIHRoaW5ncyBpdCBzdXBwb3J0cyBvbiB0
b3Agb2YKPiB0aGUgZ2VuZXJpYyBpYl9kZXZpY2UuCj4KPiBUaGUgY2VudHJhbCBwb2ludCBpbiBS
RE1BIGlzIHRoZSAnc3RydWN0IGliX2RldmljZScgd2hpY2ggaXMgYSBkZXZpY2UKPiBjbGFzcy4g
WW91IGNhbiBkaXNjb3ZlciBhbGwgUkRNQSBkZXZpY2VzIGJ5IGxvb2tpbmcgaW4gL3N5cy9jbGFz
cy9pbmZpbmliYW5kLwo+Cj4gSXQgaGFzIGFuIGludGVybmFsIGJ1cyBsaWtlIHRoaW5nICh3aGlj
aCBwcm9iYWJseSBzaG91bGQgaGF2ZSBiZWVuIGFuCj4gYWN0dWFsIGJ1cywgYnV0IHRoaXMgd2Fz
IGRvbmUgMTUgeWVhcnMgYWdvKSB3aGljaCBhbGxvd3Mgb3RoZXIKPiBzdWJzeXN0ZW1zIHRvIGhh
dmUgZHJpdmVycyB0byBtYXRjaCBhbmQgYmluZCB0aGVpciBvd24gZHJpdmVycyB0byB0aGUKPiBz
dHJ1Y3QgaWJfZGV2aWNlLgoKClJpZ2h0LgoKCj4KPiBTbyB5b3UnZCBoYXZlIGEgY2hhaW4gbGlr
ZToKPgo+IHN0cnVjdCBwY2lfZGV2aWNlIC0+IHN0cnVjdCBpYl9kZXZpY2UgLT4gW2liIGNsaWVu
dCBidXMgdGhpbmddIC0+IHN0cnVjdCBuZXRfZGV2aWNlCgoKU28gZm9yIHZEUEEgd2Ugd2FudCB0
byBoYXZlOgoKa2VybmVsIGRhdGFwYXRoOgoKc3RydWN0IHBjaV9kZXZpY2UgLT4gc3RydWN0IHZE
UEEgZGV2aWNlIC0+IFsgdkRQQSBidXNdIC0+IHN0cnVjdCAKdmlydGlvX2RldmljZSAtPiBbdmly
dGlvIGJ1c10gLT4gc3RydWN0IG5ldF9kZXZpY2UKCnVzZXJzcGFjZSBkYXRhcGF0aDoKCnN0cnVj
dCBwY2lfZGV2aWNlIC0+IHN0cnVjdCB2RFBBIGRldmljZSAtPiBbIHZEUEEgYnVzXSAtPiBzdHJ1
Y3QgCnZob3N0X2RldmljZSAtPiBVQVBJIC0+IHVzZXJzcGFjZSBkcml2ZXIKCgo+Cj4gQW5kIHRo
ZSB2YXJpb3VzIGNoYXIgZGV2cyBhcmUgY3JlYXRlZCBieSBjbGllbnRzIGNvbm5lY3RpbmcgdG8g
dGhlCj4gaWJfZGV2aWNlIGFuZCBjcmVhdGluZyBjaGFyIGRldnMgb24gdGhlaXIgb3duIGNsYXNz
ZXMuCj4KPiBTaW5jZSBpYl9kZXZpY2VzIGFyZSBtdWx0aS1xdWV1ZSB3ZSBjYW4gaGF2ZSBhbGwg
MjAgZGV2aWNlcyBydW5uaW5nCj4gY29uY3VycmVudGx5IGFuZCB0aGVyZSBhcmUgdmFyaW91cyBz
Y2hlbWVzIHRvIG1hbmFnZSB3aGVuIHRoZSB2YXJpb3VzCj4gdGhpbmdzIGFyZSBjcmVhdGVkLgo+
Cj4+PiBUaGUgJ2h3IGRyaXZlcicgcHVsbHMgaW4KPj4+IGZ1bmN0aW9ucyBmcm9tIHRoZSAnc3Vi
c3lzdGVtJyB1c2luZyBhIGNvbWJpbmF0aW9uIG9mIGNhbGxiYWNrcyBhbmQKPj4+IGxpYnJhcnkt
c3R5bGUgY2FsbHMgc28gdGhlcmUgaXMgbm8gY29kZSBkdXBsaWNhdGlvbi4KPj4gVGhlIHBvaW50
IGlzIHdlIHdhbnQgdkRQQSBkZXZpY2VzIHRvIGJlIHVzZWQgYnkgZGlmZmVyZW50IHN1YnN5c3Rl
bXMsIG5vdAo+PiBvbmx5IHZob3N0LCBidXQgYWxzbyBuZXRkZXYsIGJsaywgY3J5cHRvIChldmVy
eSBzdWJzeXN0ZW0gdGhhdCBjYW4gdXNlCj4+IHZpcnRpbyBkZXZpY2VzKS4gVGhhdCdzIHdoeSB3
ZSBpbnRyb2R1Y2UgdkRQQSBidXMgYW5kIGludHJvZHVjZSBkaWZmZXJlbnQKPj4gZHJpdmVycyBv
biB0b3AuCj4gU2VlIHRoZSBvdGhlciBtYWlsLCBpdCBzZWVtcyBzdHJ1Y3QgdmlydGlvX2Rldmlj
ZSBzZXJ2ZXMgdGhpcyBwdXJwb3NlCj4gYWxyZWFkeSwgY29uZnVzZWQgd2h5IGEgc3RydWN0IHZk
cGFfZGV2aWNlIGFuZCBhbm90aGVyIGJ1cyBpcyBiZWluZwo+IGludHJvZHVjZWQKPgo+PiBUaGVy
ZSdyZSBzZXZlcmFsIGV4YW1wbGVzIHRoYXQgYSBidXMgaXMgbmVlZGVkIG9uIHRvcC4KPj4KPj4g
QSBnb29kIGV4YW1wbGUgaXMgTWVsbGFub3ggVG1GSUZPIGRyaXZlciB3aGljaCBpcyBhIHBsYXRm
b3JtIGRldmljZSBkcml2ZXIKPj4gYnV0IHJlZ2lzdGVyIGl0c2VsZiBhcyBhIHZpcnRpbyBkZXZp
Y2UgaW4gb3JkZXIgdG8gYmUgdXNlZCBieSB2aXJpdG8tY29uc29sZQo+PiBkcml2ZXIgb24gdGhl
IHZpcnRpbyBidXMuCj4gSG93IGlzIHRoYXQgYW5vdGhlciBidXM/IFRoZSBwbGF0Zm9ybSBidXMg
aXMgdGhlIEhXIGJ1cywgdGhlIFRtRklGTyBpcwo+IHRoZSBIVyBkcml2ZXIsIGFuZCB2aXJ0aW9f
ZGV2aWNlIGlzIHRoZSBzdWJzeXN0ZW0uCj4KPiBUaGlzIHNlZW1zIHJlYXNvbmFibGUvbm9ybWFs
IHNvIGZhci4uCgoKWWVzLCB0aGF0J3MgcmVhc29uYWJsZS4gVGhpcyBleGFtcGxlIGlzIHRvIGFu
c3dlciB0aGUgcXVlc3Rpb24gd2h5IGJ1cyAKaXMgdXNlZCBpbnN0ZWFkIG9mIGNsYXNzIGhlcmUu
CgoKPgo+PiBCdXQgaXQncyBhIHBpdHkgdGhhdCB0aGUgZGV2aWNlIGNhbiBub3QgYmUgdXNlZCBi
eSB1c2Vyc3BhY2UgZHJpdmVyIGR1ZSB0bwo+PiB0aGUgbGltaXRhdGlvbiBvZiB2aXJpdG8gYnVz
IHdoaWNoIGlzIGRlc2lnbmVkIGZvciBrZXJuZWwgZHJpdmVyLiBUaGF0J3Mgd2h5Cj4+IHZEUEEg
YnVzIGlzIGludHJvZHVjZWQgd2hpY2ggYWJzdHJhY3QgdGhlIGNvbW1vbiByZXF1aXJlbWVudHMg
b2YgYm90aCBrZXJuZWwKPj4gYW5kIHVzZXJzcGFjZSBkcml2ZXJzIHdoaWNoIGFsbG93IHRoZSBh
IHNpbmdsZSBIVyBkcml2ZXIgdG8gYmUgdXNlZCBieQo+PiBrZXJuZWwgZHJpdmVycyAoYW5kIHRo
ZSBzdWJzeXN0ZW1zIG9uIHRvcCkgYW5kIHVzZXJzcGFjZSBkcml2ZXJzLgo+IEFoISBNYXliZSB0
aGlzIGlzIHRoZSBzb3VyY2Ugb2YgYWxsIHRoaXMgc3RyYW5nZW5lc3MgLSB0aGUgdXNlcnNwYWNl
Cj4gZHJpdmVyIGlzIHNvbWV0aGluZyBwYXJhbGxlbCB0byB0aGUgc3RydWN0IHZpcnRpb19kZXZp
Y2UgaW5zdGVhZCBvZgo+IGJlaW5nIGEgY29uc3VtZXIgb2YgaXQ/PwoKCnVzZXJzcGFjZSBkcml2
ZXIgaXMgbm90IHBhcmFsbGVsIHRvIHZpcnRpb19kZXZpY2UuIFRoZSB2aG9zdF9kZXZpY2UgaXMg
CnBhcmFsbGVsIHRvIHZpcnRpb19kZXZpY2UgYWN0dWFsbHkuCgoKPiAgIFRoYXQgY2VydGlhbmx5
IHdvdWxkIG1lc3MgdXAgdGhlIGRyaXZlciBtb2RlbAo+IHF1aXRlIGEgbG90Lgo+Cj4gVGhlbiB5
b3Ugd2FudCB0byBhZGQgYW5vdGhlciBidXMgdG8gc3dpdGNoIGJldHdlZW4gdmhvc3QgYW5kIHN0
cnVjdAo+IHZpcnRpb19kZXZpY2U/IEJ1dCBvbmx5IGZvciB2ZHBhPwoKClN0aWxsLCB2aG9zdCB3
b3JrcyBvbiB0b3Agb2YgdkRQQSBidXMgZGlyZWN0bHkgKHNlZSB0aGUgcmVwbHkgYWJvdmUpLgoK
Cj4KPiBCdXQgYXMgeW91IHBvaW50IG91dCBzb21ldGhpbmcgbGlrZSBUbUZJRk8gaXMgbGVmdCBo
YW5naW5nLiBTZWVtcyBsaWtlCj4gdGhlIHdyb25nIGFic3RyYWN0aW9uIHBvaW50Li4KCgpZb3Ug
a25vdywgZXZlbiByZWZhY3RvcmluZyB2aXJ0aW8tYnVzIGlzIG5vdCBmb3IgZnJlZSwgVG1GSUZP
IGRyaXZlciAKbmVlZHMgY2hhbmdlcyBhbnlob3cuCgpUaGFua3MKCgo+Cj4gSmFzb24KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
