Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29918CA02
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 10:18:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3DA787FEF;
	Fri, 20 Mar 2020 09:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IADh9Vz7L2c; Fri, 20 Mar 2020 09:18:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7E8B880DF;
	Fri, 20 Mar 2020 09:18:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CE49C07FF;
	Fri, 20 Mar 2020 09:18:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DFD3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F3255888C8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YSf-Gyc1w+1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:17:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0E06886F5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584695875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RA5PQJx7YSzfov+hXIk77JXzaA1GFtyaspVCOD3A7E4=;
 b=PyG3+Vd+eY3YH4UeVmeA4/oVPH/1XrAw5sxIL8G9WcBni68+ztZdoqmR5iHCCkfk+S4CVr
 9xtCZ5SVHAga4/eLRiVBHSnbMNWnqhCuciiUisixuu2eFeF5hrTkbdVMIcKG0eRuGjDVbR
 95ztcs6VEsTVdvtA2NdtotU5nhqnccE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-fCe8-lhaPCenFclKrajMdw-1; Fri, 20 Mar 2020 05:17:54 -0400
X-MC-Unique: fCe8-lhaPCenFclKrajMdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7B6710753FB;
 Fri, 20 Mar 2020 09:17:50 +0000 (UTC)
Received: from [10.72.13.250] (ovpn-13-250.pek2.redhat.com [10.72.13.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A4D210493BD;
 Fri, 20 Mar 2020 09:17:32 +0000 (UTC)
Subject: Re: [PATCH V6 8/8] virtio: Intel IFC VF driver for VDPA
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200318080327.21958-1-jasowang@redhat.com>
 <20200318080327.21958-9-jasowang@redhat.com>
 <20200318122255.GG13183@mellanox.com>
 <30359bae-d66a-0311-0028-d7d33b8295f2@redhat.com>
 <20200319130239.GW13183@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <055f10a8-0b7d-ec2b-4fd4-d47ba96ddd5f@redhat.com>
Date: Fri, 20 Mar 2020 17:17:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200319130239.GW13183@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvMy8xOSDkuIvljYg5OjAyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBNYXIgMTksIDIwMjAgYXQgMDQ6MTQ6MzdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
T24gMjAyMC8zLzE4IOS4i+WNiDg6MjIsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IE9uIFdl
ZCwgTWFyIDE4LCAyMDIwIGF0IDA0OjAzOjI3UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
Pj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+Pj4+ICsKPj4+
PiArc3RhdGljIGludCBpZmN2Zl92ZHBhX2F0dGFjaChzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRh
cHRlcikKPj4+PiArewo+Pj4+ICsJaW50IHJldDsKPj4+PiArCj4+Pj4gKwlhZGFwdGVyLT52ZHBh
X2RldiAgPSB2ZHBhX2FsbG9jX2RldmljZShhZGFwdGVyLT5kZXYsIGFkYXB0ZXItPmRldiwKPj4+
PiArCQkJCQkgICAgICAgJmlmY192ZHBhX29wcyk7Cj4+Pj4gKwlpZiAoSVNfRVJSKGFkYXB0ZXIt
PnZkcGFfZGV2KSkgewo+Pj4+ICsJCUlGQ1ZGX0VSUihhZGFwdGVyLT5kZXYsICJGYWlsZWQgdG8g
aW5pdCBpZmN2ZiBvbiB2ZHBhIGJ1cyIpOwo+Pj4+ICsJCXB1dF9kZXZpY2UoJmFkYXB0ZXItPnZk
cGFfZGV2LT5kZXYpOwo+Pj4+ICsJCXJldHVybiAtRU5PREVWOwo+Pj4+ICsJfQo+Pj4gVGhlIHBv
aW50IG9mIGhhdmluZyBhbiBhbGxvYyBjYWxsIGlzIHNvIHRoYXQgdGhlIGRyaXZlcnMKPj4+IGlm
Y3ZmX2FkYXB0b3IgbWVtb3J5IGNvdWxkIGJlIHBsYWNlZCBpbiB0aGUgc2FtZSBzdHJ1Y3QgLSBl
ZyB1c2UKPj4+IGNvbnRhaW5lcl9vZiB0byBmbGlwIGJldHdlZW4gdGhlbSwgYW5kIGhhdmUgYSBr
cmVmIGZvciBib3RoIG1lbW9yaWVzLgo+Pj4KPj4+IEl0IHNlZW0gcmVhbGx5IHdlaXJkIHRvIGhh
dmUgYW4gYWxsb2MgZm9sbG93ZWQgaW1tZWRpYXRlbHkgYnkKPj4+IHJlZ2lzdGVyLgo+Pgo+PiBJ
IGFkbWl0IHRoZSBpZmN2Zl9hZGFwdGVyIGlzIG5vdCBjb3JyZWN0bHkgcmVmLWNvdW50ZWQuIFdo
YXQgeW91IHN1Z2dlc3QKPj4gc2hvdWxkIHdvcmsuIEJ1dCBpdCBsb29rcyB0byBtZSB0aGUgZm9s
bG93aW5nIGlzIG1vcmUgY2xlYW5lciBzaW5jZSB0aGUKPj4gbWVtYmVycyBvZiBpZmN2Zl9hZGFw
dGVyIGFyZSBhbGwgcmVsYXRlZCB0byBQQ0kgZGV2aWNlIG5vdCB2RFBBIGl0c2VsZi4KPiBJJ3Zl
IGRvbmUgaXQgYm90aCB3YXlzIChlZyB0cG0gaXMgYXMgeW91IGRlc2NyaWJlLCBpYiBpcyB1c2lu
ZyBhbGxvYykuCj4KPiBJIHRlbmQgdG8gcHJlZmVyIHRoZSBhbGxvYyBtZXRob2QgdG9kYXksIGFs
bG93aW5nIHRoZSBkcml2ZXIgbWVtb3J5IHRvCj4gaGF2ZSBhIHByb3BlciByZWZjb3VudCBtYWtl
cyB0aGUgZHJpdmVyIHN0cnVjdHVyZSB1c2FibGUgd2l0aCBSQ1UgYW5kCj4gYWxsb3dzIHNpbXBs
ZSBzb2x1dGlvbnMgdG8gc29tZSB0cmlja3kgY2FzZXMuIEl0IGlzIGEgYml0IGhhcmQgdG8KPiBz
d2l0Y2ggdG8gdGhpcyBsYXRlci4uCj4KPj4gLSBrZWVwIHRoZSBjdXJyZW50IGxheW91dCBvZiBp
ZmN2Zl9hZGFwdGVyCj4+IC0gbWVyZ2UgdmRwYV9hbGxvY19kZXZpY2UoKSBhbmQgdmRwYV9yZWdp
c3Rlcl9kZXZpY2UoKQo+PiAtIHVzZSBkZXZyZXMgdG8gYmluZCBpZmN2Zl9hZGFwdGVyIHJlZmNu
dC9saWZjeWNsZSB0byB0aGUgdW5kZXIgUENJIGRldmljZQo+IFRoaXMgaXMgYWxtb3N0IHdoYXQg
dHBtIGRvZXMuIEtlZXAgaW4gbWluZCB0aGUgbGlmZWN5Y2xlIHdpdGggZGV2bSBpcwo+IGp1c3Qg
c2xpZ2h0bHkgcGFzdCB0aGUgZHJpdmVyIHJlbW92ZSBjYWxsLCBzbyByZW1vdmUgc3RpbGwKPiBt
dXN0IHJldm9rZSBhbGwgZXh0ZXJuYWwgcmVmZXJlbmNlcyB0byB0aGUgbWVtb3J5Lgo+Cj4gVGhl
IG1lcmdpbmcgYWxsb2MgYW5kIHJlZ2lzdGVyIHJhcmVseSB3b3JrcyBvdXQsIHRoZSByZWdpc3Rl
ciBtdXN0IGJlCj4gdGhlIHZlcnkgbGFzdCB0aGluZyBkb25lLCBhbmQgdXN1YWxseSB5b3UgbmVl
ZCB0aGUgc3Vic3lzdGVtIHBvaW50ZXIKPiB0byBkbyBwcmUtcmVnaXN0cmF0aW9uIHNldHVwIGlu
IGFueXRoaW5nIGJ1dCB0aGUgbW9zdCB0cml2aWFsIG9mCj4gc3Vic3lzdGVtcyBhbmQgZHJpdmVy
cy4KPgo+PiBJZiB3ZSBnbyBmb3IgdGhlIGNvbnRhaW5lcl9vZiBtZXRob2QsIHdlIHByb2JhYmx5
IG5lZWQKPj4KPj4gLSBhY2NlcHQgYSBzaXplIG9mIHBhcmVudCBwYXJlbnQgc3RydWN0dXJlIGlu
IHZkcGFfYWxsb2NfZGV2aWNlKCkgYW5kCj4+IG1hbmRhdGUgdmRwYV9kZXZpY2UgdG8gYmUgdGhl
IGZpcnN0IG1lbWJlciBvZiBpZmN2Zl9hZGFwdGVyCj4+IC0gd2UgbmVlZCBwcm92aWRlIGEgd2F5
IHRvIGZyZWUgcmVzb3VyY2VzIG9mIHBhcmVudCBzdHJ1Y3R1cmUgd2hlbiB3ZQo+PiBkZXN0cm95
IHZEUEEgZGV2aWNlCj4gWWVwLiBuZXRkZXYgYW5kIHJkbWEgd29yayB0aGlzIHdheSB3aXRoIGEg
ZnJlZSBtZW1vcnkgY2FsbGJhY2sgaW4gdGhlCj4gZXhpc3Rpbmcgb3BzIHN0cnVjdHVyZXMuCj4K
PiBKYXNvbgoKCk9rLCBJIGdldCB5b3VyIHBvaW50cyBub3cuIFdpbGwgZ28gZm9yIHdheSBvZiBj
b250YWluZXJfb2YgaW4gbmV4dCB2ZXJzaW9uLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
