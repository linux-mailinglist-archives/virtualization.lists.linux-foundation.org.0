Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891A225A88
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 10:55:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 384C12150A;
	Mon, 20 Jul 2020 08:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybmUq7H3JB1n; Mon, 20 Jul 2020 08:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5CF042107F;
	Mon, 20 Jul 2020 08:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33FB4C016F;
	Mon, 20 Jul 2020 08:55:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46296C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3463685EAF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Cs2hZH55Gwn
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:55:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A66C85EA5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595235334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzR9l21YOuN3ikEPzc8GrzbgrODXjbPXreiywMK7+XE=;
 b=gSS+dIRs4A+BXSTl0cT/9/SJ3+8ZLnNnPQhht/DZYdDT2wNh61QVnefTKcnVgE/bSrA7BM
 +dHmoTHbb2x+uTpTUDVLUH/KVRMF3fu4dGqpWAa9Hnsf3Fq+E47hYZQjXS4ty3bColUaC4
 FXxblusQJ1hayAb/WktIB2TfUzj5DCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-tqdoLv4dPYC4cfAHA3ofZw-1; Mon, 20 Jul 2020 04:55:31 -0400
X-MC-Unique: tqdoLv4dPYC4cfAHA3ofZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46A1C1932488;
 Mon, 20 Jul 2020 08:55:30 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD54619C4;
 Mon, 20 Jul 2020 08:55:22 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200622122546-mutt-send-email-mst@kernel.org>
 <CAJaqyWfbouY4kEXkc6sYsbdCAEk0UNsS5xjqEdHTD7bcTn40Ow@mail.gmail.com>
 <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
 <419cc689-adae-7ba4-fe22-577b3986688c@redhat.com>
 <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
 <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
 <CAJaqyWeqF-KjFnXDWXJ2M3Hw3eQeCEE2-7p1KMLmMetMTm22DQ@mail.gmail.com>
 <20200709133438-mutt-send-email-mst@kernel.org>
 <7dec8cc2-152c-83f4-aa45-8ef9c6aca56d@redhat.com>
 <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
 <20200710015615-mutt-send-email-mst@kernel.org>
 <CAJaqyWf1skGxrjuT9GLr6dtgd-433y-rCkbtStLHaAs2W2jYXA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <595d4cf3-2b15-8900-e714-f3ebd8d8ca2e@redhat.com>
Date: Mon, 20 Jul 2020 16:55:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf1skGxrjuT9GLr6dtgd-433y-rCkbtStLHaAs2W2jYXA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

Ck9uIDIwMjAvNy8xNyDkuIrljYgxOjE2LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPiBP
biBGcmksIEp1bCAxMCwgMjAyMCBhdCA3OjU4IEFNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+PiBPbiBGcmksIEp1bCAxMCwgMjAyMCBhdCAwNzozOToyNkFNICsw
MjAwLCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPj4+Pj4gSG93IGFib3V0IHBsYXlpbmcg
d2l0aCB0aGUgYmF0Y2ggc2l6ZT8gTWFrZSBpdCBhIG1vZCBwYXJhbWV0ZXIgaW5zdGVhZAo+Pj4+
PiBvZiB0aGUgaGFyZCBjb2RlZCA2NCwgYW5kIG1lYXN1cmUgZm9yIGFsbCB2YWx1ZXMgMSB0byA2
NCAuLi4KPj4+Pgo+Pj4+IFJpZ2h0LCBhY2NvcmRpbmcgdG8gdGhlIHRlc3QgcmVzdWx0LCA2NCBz
ZWVtcyB0byBiZSB0b28gYWdncmVzc2l2ZSBpbgo+Pj4+IHRoZSBjYXNlIG9mIFRYLgo+Pj4+Cj4+
PiBHb3QgaXQsIHRoYW5rcyBib3RoIQo+PiBJbiBwYXJ0aWN1bGFyIEkgd29uZGVyIHdoZXRoZXIg
d2l0aCBiYXRjaCBzaXplIDEKPj4gd2UgZ2V0IHNhbWUgcGVyZm9ybWFuY2UgYXMgd2l0aG91dCBi
YXRjaGluZwo+PiAod291bGQgaW5kaWNhdGUgNjQgaXMgdG9vIGFnZ3Jlc3NpdmUpCj4+IG9yIG5v
dCAod291bGQgaW5kaWNhdGUgb25lIG9mIHRoZSBjb2RlIGNoYW5nZXMKPj4gYWZmZWN0cyBwZXJm
b3JtYW5jZSBpbiBhbiB1bmV4cGVjdGVkIHdheSkuCj4+Cj4+IC0tCj4+IE1TVAo+Pgo+IEhpIQo+
Cj4gVmFyeWluZyBiYXRjaF9zaXplIGFzIGRyaXZlcnMvdmhvc3QvbmV0LmM6VkhPU1RfTkVUX0JB
VENILAoKCkRpZCB5b3UgbWVhbiB2YXJ5aW5nIHRoZSB2YWx1ZSBvZiBWSE9TVF9ORVRfQkFUQ0gg
aXRzZWxmIG9yIHRoZSBudW1iZXIgCm9mIGJhdGNoZWQgZGVzY3JpcHRvcnM/CgoKPiBhbmQgdGVz
dGluZwo+IHRoZSBwcHMgYXMgcHJldmlvdXMgbWFpbCBzYXlzLiBUaGlzIG1lYW5zIHRoYXQgd2Ug
aGF2ZSBlaXRoZXIgb25seQo+IHZob3N0X25ldCBiYXRjaGluZyAoaW4gYmFzZSB0ZXN0aW5nLCBs
aWtlIHByZXZpb3VzbHkgdG8gYXBwbHkgdGhpcwo+IHBhdGNoKSBvciBib3RoIGJhdGNoaW5nIHNp
emVzIHRoZSBzYW1lLgo+Cj4gSSd2ZSBjaGVja2VkIHRoYXQgdmhvc3QgcHJvY2VzcyAoYW5kIHBr
dGdlbikgZ29lcyAxMDAlIGNwdSBhbHNvLgo+Cj4gRm9yIHR4OiBCYXRjaGluZyBkZWNyZW1lbnRz
IGFsd2F5cyB0aGUgcGVyZm9ybWFuY2UsIGluIGFsbCBjYXNlcy4gTm90Cj4gc3VyZSB3aHkgYnVm
YXBpIG1hZGUgdGhpbmdzIGJldHRlciB0aGUgbGFzdCB0aW1lLgo+Cj4gQmF0Y2hpbmcgbWFrZXMg
aW1wcm92ZW1lbnRzIHVudGlsIDY0IGJ1ZnMsIEkgc2VlIGluY3JlbWVudHMgb2YgcHBzIGJ1dCBs
aWtlIDElLgo+Cj4gRm9yIHJ4OiBCYXRjaGluZyBhbHdheXMgaW1wcm92ZXMgcGVyZm9ybWFuY2Uu
IEl0IHNlZW1zIHRoYXQgaWYgd2UKPiBiYXRjaCBsaXR0bGUsIGJ1ZmFwaSBkZWNyZWFzZXMgcGVy
Zm9ybWFuY2UsIGJ1dCBiZXlvbmQgNjQsIGJ1ZmFwaSBpcwo+IG11Y2ggYmV0dGVyLiBUaGUgYnVm
YXBpIHZlcnNpb24ga2VlcHMgaW1wcm92aW5nIHVudGlsIEkgc2V0IGEgYmF0Y2hpbmcKPiBvZiAx
MDI0LiBTbyBJIGd1ZXNzIGl0IGlzIHN1cGVyIGdvb2QgdG8gaGF2ZSBhIGJ1bmNoIG9mIGJ1ZmZl
cnMgdG8KPiByZWNlaXZlLgo+Cj4gU2luY2Ugd2l0aCB0aGlzIHRlc3QgSSBjYW5ub3QgZGlzYWJs
ZSBldmVudF9pZHggb3IgdGhpbmdzIGxpa2UgdGhhdCwKPiB3aGF0IHdvdWxkIGJlIHRoZSBuZXh0
IHN0ZXAgZm9yIHRlc3Rpbmc/Cj4KPiBUaGFua3MhCj4KPiAtLQo+IFJlc3VsdHM6Cj4gIyBCdWYg
c2l6ZTogMSwxNiwzMiw2NCwxMjgsMjU2LDUxMgo+Cj4gIyBUeAo+ICMgPT09Cj4gIyBCYXNlCj4g
MjI5MzMwNC4zMDgsMzM5NjA1Ny43NjksMzU0MDg2MC42MTUsMzYzNjA1Ni4wNzcsMzMzMjk1MC44
NDYsMzY5NDI3Ni4xNTQsMzY4OTgyMAoKCldoYXQncyB0aGUgbWVhbmluZyBvZiBidWYgc2l6ZSBp
biB0aGUgY29udGV4dCBvZiAiYmFzZSI/CgpBbmQgSSB3b25kZXIgbWF5YmUgcGVyZiBkaWZmIGNh
biBoZWxwLgoKVGhhbmtzCgoKPiAjIEJhdGNoCj4gMjI4NjcyMy44NTcsMzMwNzE5MS42NDMsMzQw
MDM0Ni41NzEsMzQ1MjUyNy43ODYsMzQ2MDc2Ni44NTcsMzQzMTA0Mi41LDM0NDA3MjIuMjg2Cj4g
IyBCYXRjaCArIEJ1ZmFwaQo+IDIyNTc5NzAuNzY5LDMxNTEyNjguMzg1LDMyNjAxNTAuNTM4LDMz
NzkzODMuODQ2LDM0MjQwMjguODQ2LDM0MzMzODQuMzA4LDMzODU2MzUuMjMxLDM0MDY1NTQuNTM4
Cj4KPiAjIFJ4Cj4gIyA9PQo+ICMgcGt0Z2VuIHJlc3VsdHMgKHBwcykKPiAxMjIzMjc1LDE2Njg4
NjgsMTcyODc5NCwxNzY5MjYxLDE4MDg1NzQsMTgzNzI1MiwxODQ2NDM2Cj4gMTQ1NjkyNCwxNzk3
OTAxLDE4MzEyMzQsMTg2ODc0NiwxODc3NTA4LDE5MzE1OTgsMTkzNjQwMgo+IDEzNjg5MjMsMTcx
OTcxNiwxNzk0MzczLDE4NjUxNzAsMTg4NDgwMywxOTE2MDIxLDE5NzUxNjAKPgo+ICMgVGVzdHBt
ZCBwcHMgcmVzdWx0cwo+IDEyMjI2OTguMTQzLDE2NzA2MDQsMTczMTA0MC42LDE3NjkyMTgsMTgx
MTIwNiwxODM5MzA4Ljc1LDE4NDg0NzguNzUKPiAxNDUwMTQwLjUsMTc5OTk4NS43NSwxODM0MDg5
Ljc1LDE4NzEyOTAsMTg4MDAwNS41LDE5MzQxNDcuMjUsMTkzOTAzNAo+IDEzNzA2MjEsMTcyMTg1
OCwxNzk2Mjg3Ljc1LDE4NjY2MTguNSwxODg1NDY2LjUsMTkxODY3MC43NSwxOTc2MTczLjUsMTk4
ODc2MC43NSwxOTc4MzE2Cj4KPiBwa3RnZW4gd2FzIHJ1biBhZ2FpbiBmb3Igcnggd2l0aCAxMDI0
IGFuZCAyMDQ4IGJ1ZiBzaXplLCBnaXZpbmcKPiAxOTg4NzYwLjc1IGFuZCAxOTc4MzE2IHBwcy4g
VGVzdHBtZCBnb2VzIHRoZSBzYW1lIHdheS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
