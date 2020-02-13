Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4429615C0CF
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 15:59:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2781186C4D;
	Thu, 13 Feb 2020 14:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-zaMNTeYxH7; Thu, 13 Feb 2020 14:59:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D03BF86B0B;
	Thu, 13 Feb 2020 14:59:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2961C0177;
	Thu, 13 Feb 2020 14:59:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63993C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 14:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 515A120392
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 14:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ab6fhdLbC4Ey
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 14:59:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 59D5620385
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581605947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHiRb+twyxpf3W0EcmM5/eTdbL/em0EAL1gxZi7gnIQ=;
 b=AuH9llhw3duI6klxcUQ4/wjLfSWMT3KweXIDxc6BJF5oQ0khyOPbggznS/5HMZGteeskzH
 qtJwyApCZaigPkG3i+Qzvw29WdSa8/vXu7hNDgqTazmuzioKVQHeMvCJexJz84gcuMtADP
 0BH0cOYQzLVn4nQ+O/naayfwjPwtwV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-q6vGNjygM1KilbmYGgqpcw-1; Thu, 13 Feb 2020 09:59:05 -0500
X-MC-Unique: q6vGNjygM1KilbmYGgqpcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6948EC825;
 Thu, 13 Feb 2020 14:59:02 +0000 (UTC)
Received: from [10.72.12.120] (ovpn-12-120.pek2.redhat.com [10.72.12.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 892AF9008B;
 Thu, 13 Feb 2020 14:58:46 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
Date: Thu, 13 Feb 2020 22:58:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200213134128.GV4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvMi8xMyDkuIvljYg5OjQxLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBGZWIgMTMsIDIwMjAgYXQgMTE6MzQ6MTBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPgo+
Pj4gICAgWW91IGhhdmUgZGV2LCB0eXBlIG9yCj4+PiBjbGFzcyB0byBjaG9vc2UgZnJvbS4gVHlw
ZSBpcyByYXJlbHkgdXNlZCBhbmQgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQKPj4+IGJ5IHZkcGEs
IHNvIGNsYXNzIHNlZW1zIHRoZSByaWdodCBjaG9pY2UKPj4+Cj4+PiBKYXNvbgo+PiBZZXMsIGJ1
dCBteSB1bmRlcnN0YW5kaW5nIGlzIGNsYXNzIGFuZCBidXMgYXJlIG11dHVhbGx5IGV4Y2x1c2l2
ZS4gU28gd2UKPj4gY2FuJ3QgYWRkIGEgY2xhc3MgdG8gYSBkZXZpY2Ugd2hpY2ggaXMgYWxyZWFk
eSBhdHRhY2hlZCBvbiBhIGJ1cy4KPiBXaGlsZSBJIHN1cHBvc2UgdGhlcmUgYXJlIHZhcmlhdGlv
bnMsIHR5cGljYWxseSAnY2xhc3MnIGRldmljZXMgYXJlCj4gdXNlciBmYWNpbmcgdGhpbmdzIGFu
ZCAnYnVzJyBkZXZpY2VzIGFyZSBpbnRlcm5hbCBmYWNpbmcgKGllIGxpa2UgYQo+IFBDSSBkZXZp
Y2UpCgoKVGhvdWdoIGFsbCB2RFBBIGRldmljZXMgaGF2ZSB0aGUgc2FtZSBwcm9ncmFtbWluZyBp
bnRlcmZhY2UsIGJ1dCB0aGUgCnNlbWFudGljIGlzIGRpZmZlcmVudC4gU28gaXQgbG9va3MgdG8g
bWUgdGhhdCB1c2UgYnVzIGNvbXBsaWVzIHdoYXQgCmNsYXNzLnJzdCBzYWlkOgoKIgoKRWFjaCBk
ZXZpY2UgY2xhc3MgZGVmaW5lcyBhIHNldCBvZiBzZW1hbnRpY3MgYW5kIGEgcHJvZ3JhbW1pbmcg
aW50ZXJmYWNlCnRoYXQgZGV2aWNlcyBvZiB0aGF0IGNsYXNzIGFkaGVyZSB0by4gRGV2aWNlIGRy
aXZlcnMgYXJlIHRoZQppbXBsZW1lbnRhdGlvbiBvZiB0aGF0IHByb2dyYW1taW5nIGludGVyZmFj
ZSBmb3IgYSBwYXJ0aWN1bGFyIGRldmljZSBvbgphIHBhcnRpY3VsYXIgYnVzLgoKIgoKCj4KPiBT
byB3aHkgaXMgdGhpcyB1c2luZyBhIGJ1cz8gVkRQQSBpcyBhIHVzZXIgZmFjaW5nIG9iamVjdCwg
c28gdGhlCj4gZHJpdmVyIHNob3VsZCBjcmVhdGUgYSBjbGFzcyB2aG9zdF92ZHBhIGRldmljZSBk
aXJlY3RseSwgYW5kIHRoYXQKPiBkcml2ZXIgc2hvdWxkIGxpdmUgaW4gdGhlIGRyaXZlcnMvdmhv
c3QvIGRpcmVjdG9yeS4KCgpUaGlzIGlzIGJlY2F1c2Ugd2Ugd2FudCB2RFBBIHRvIGJlIGdlbmVy
aWMgZm9yIGJlaW5nIHVzZWQgYnkgZGlmZmVyZW50IApkcml2ZXJzIHdoaWNoIGlzIG5vdCBsaW1p
dGVkIHRvIHZob3N0LXZkcGEuIEUuZyBpbiB0aGlzIHNlcmllcywgaXQgCmFsbG93cyB2RFBBIHRv
IGJlIHVzZWQgYnkga2VybmVsIHZpcnRpbyBkcml2ZXJzLiBBbmQgaW4gdGhlIGZ1dHVyZSwgd2Ug
CndpbGwgcHJvYmFibHkgaW50cm9kdWNlIG1vcmUgZHJpdmVycyBpbiB0aGUgZnV0dXJlLgoKCj4K
PiBGb3IgdGhlIFBDSSBWRiBjYXNlIHRoaXMgZHJpdmVyIHdvdWxkIGJpbmQgdG8gYSBQQ0kgZGV2
aWNlIGxpa2UKPiBldmVyeXRoaW5nIGVsc2UKPgo+IEZvciBvdXIgZnV0dXJlIFNGL0FESSBjYXNl
cyB0aGUgZHJpdmVyIHdvdWxkIGJpbmQgdG8gc29tZQo+IFNGL0FESS93aGF0ZXZlciBkZXZpY2Ug
b24gYSBidXMuCgoKQWxsIHRoZXNlIGRyaXZlciB3aWxsIHN0aWxsIGJlIGJvdW5kIHRvIHRoZWly
IG93biBidXMgKFBDSSBvciBvdGhlcikuIApBbmQgd2hhdCB0aGUgZHJpdmVyIG5lZWRzIGlzIHRv
IHByZXNlbnQgYSB2RFBBIGRldmljZSB0byB2aXJ0dWFsIHZEUEEgCmJ1cyBvbiB0b3AuCgpUaGFu
a3MKCj4KPiBJIGRvbid0IHNlZSBhIHJlYXNvbiBmb3IgVkRQQSB0byBiZSBjcmVhdGluZyBidXNz
ZXMuLgo+Cj4gSmFzb24KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
